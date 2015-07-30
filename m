From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jul 2015 15:27:44 +0200
Subject: [Buildroot] [PATCH] package/eudev: add libselinux dependency
Message-ID: <1438262864-6073-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable libselinux support with musl toolchains which doesn't have
struct mallinfo.

selinux-util.c: In function ?mac_selinux_init?:
selinux-util.c:70:25: error: storage size of ?before_mallinfo? isn?t known
         struct mallinfo before_mallinfo, after_mallinfo;

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/eudev/eudev.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 87bce3e..f904cdd 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -44,6 +44,15 @@ else
 EUDEV_CONF_OPTS += --disable-gudev
 endif
 
+# Disable selinux support with musl toolchains which doesn't have
+# struct mallinfo.
+ifeq ($(BR2_PACKAGE_LIBSELINUX)x$(BR2_TOOLCHAIN_USES_MUSL),yx)
+EUDEV_CONF_OPTS += --enable-selinux
+EUDEV_DEPENDENCIES += libselinux
+else
+EUDEV_CONF_OPTS += --disable-selinux
+endif
+
 define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
-- 
2.4.3
