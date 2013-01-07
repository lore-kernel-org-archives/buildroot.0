From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon,  7 Jan 2013 21:43:18 +0100
Subject: [Buildroot] [PATCH v2 5/6] lvm2: Compile and install application
	library.
In-Reply-To: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1357591399-3566-6-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/lvm2/Config.in |    6 ++++++
 package/lvm2/lvm2.mk   |    8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 30af14e..bb41c0a 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -21,5 +21,11 @@ config BR2_PACKAGE_LVM2_DMSETUP_ONLY
 	help
 	  Install dmsetup only and skip the LVM2 suite.
 
+config BR2_PACKAGE_LVM2_APP_LIBRARY
+	bool "install application library"
+	depends on BR2_PACKAGE_LVM2
+	help
+	  Install application library (liblvm2app2).
+
 comment "lvm2 requires a toolchain with LARGEFILE support"
         depends on !BR2_LARGEFILE
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f54caa4..213ef65 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -21,7 +21,7 @@ LVM2_BINS = \
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
+LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig --enable-applib
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the CC passed at configure time.
@@ -41,6 +41,12 @@ LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
 LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
 endif
 
+ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
+LVM2_MAKE_OPT += liblvm
+LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+endif
+
 define LVM2_UNINSTALL_STAGING_CMDS
 	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
 	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
-- 
1.7.10.4
