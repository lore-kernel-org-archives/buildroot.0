From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 May 2014 23:17:07 +0200
Subject: [Buildroot] [PATCHv2 07/10] busybox: allow build with musl
In-Reply-To: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1399324630-3830-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The musl C library does not yet implemented the getpwent_r() function,
needed by the Busybox password code when CONFIG_USE_BB_PWD_GRP is
disabled. So we enable it when the musl C library is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 793ffb9..150100b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -153,6 +153,15 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
+# We also need to use internal functions when using the musl C
+# library, since some of them are not yet implemented by musl.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_PWD_GRP,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_SHADOW,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_SET_INIT
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
-- 
1.9.2
