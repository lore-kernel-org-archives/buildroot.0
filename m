From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon,  2 Mar 2020 08:49:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/lvm2: install systemd units and
 generators
Message-ID: <20200302074915.4620-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/lvm2/lvm2.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 43370b03bf..02c758ea08 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -31,6 +31,9 @@ LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 # package/readline is GPL-3.0+, so not license compatible
 LVM2_CONF_OPTS += --disable-readline
 
+LVM2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
+LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
 endif
@@ -44,8 +47,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
 LVM2_MAKE_OPTS = device-mapper
-LVM2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install_device-mapper
-LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install_device-mapper
+LVM2_INSTALL_STAGING_OPTS += install_device-mapper
+LVM2_INSTALL_TARGET_OPTS += install_device-mapper
+else
+LVM2_INSTALL_STAGING_OPTS += install
+LVM2_INSTALL_TARGET_OPTS += install
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
@@ -54,6 +60,10 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
-- 
2.17.1
