From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 25 Jul 2015 15:36:55 +0200
Subject: [Buildroot] [PATCH] package/exim: Fix compilation error with musl
Message-ID: <1437831415-6066-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes
smtp_in.c: In function ?smtp_start_session?:
smtp_in.c:1976:36: error: invalid application of ?sizeof? to incomplete type ?struct options?
     EXIM_SOCKLEN_T optlen = sizeof(struct ip_options) + MAX_IPOPTLEN;

smtp_in.c misdetects the needed style for ip_options, only OPTSTYLE == 2 works.
Since musl does not provide any macro[1] to detect it we need to pretend to be
darwin in order to fix the compile bug.

[1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Luca: simplify by using only one sed invocation]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

I'm adopting this oldish patch (https://patchwork.ozlabs.org/patch/460496/)
from Bernd. The bug it fixes is still there, and the fix is still valid. I
just simplified it according to my comments to the original patch.

Changes v1 -> v2:
 - simplify by using only one sed invocation (Luca).
---
 package/exim/exim.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index ed6a30997215..002ffd294fd8 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -80,6 +80,15 @@ define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
 endef
 endif
 
+# musl does not provide struct ip_options nor struct ip_opts (but it is
+# available with both glibc and uClibc)
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define EXIM_FIX_IP_OPTIONS_FOR_MUSL
+	$(SED) 's/#define GLIBC_IP_OPTIONS/#define DARWIN_IP_OPTIONS/' \
+		$(@D)/OS/os.h-Linux
+endef
+endif
+
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
@@ -88,6 +97,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(EXIM_REMOVE_LIBNSL_FROM_MAKEFILE)
+	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
-- 
1.9.1
