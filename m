From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2015 16:21:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: Fix compilation error with
	musl
In-Reply-To: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428848507-2117-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
smtp_in.c: In function ?smtp_start_session?:
smtp_in.c:1976:36: error: invalid application of ?sizeof? to incomplete type ?struct options?
     EXIM_SOCKLEN_T optlen = sizeof(struct ip_options) + MAX_IPOPTLEN;

smtp_in.c misdetects the needed style for ip_options, only OPTSTYLE == 2 works.
Since musl does not provide any macro[1] to detect it we need to pretend to be
darwin in order to fix the compile bug.

In order to do so we need the generated os.h before building start, therefore
add some make subtargets to the configure step.

[1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index fcf2be5..d7c61db 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -89,6 +89,13 @@ define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
 endef
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define EXIM_PRETEND_TO_BE_DARWIN_TO_FIX_IP_OPTIONS
+	echo "#undef GLIBC_IP_OPTIONS" >> $(@D)/build-br/os.h
+	echo "#define DARWIN_IP_OPTIONS" >> $(@D)/build-br/os.h
+endef
+endif
+
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
@@ -97,6 +104,9 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(EXIM_REMOVE_LIBNSL_FROM_MAKEFILE)
+	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) configure
+	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D)/build-br config
+	$(EXIM_PRETEND_TO_BE_DARWIN_TO_FIX_IP_OPTIONS)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
-- 
1.7.10.4
