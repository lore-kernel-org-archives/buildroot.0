From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Feb 2013 14:23:26 +0100
Subject: [Buildroot] [git commit] lvm2: add option for application library
Message-ID: <20130203142452.3120A9A8FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=171f5d41665e8ef305e694118b5503dbb50b736e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: make mutual exclusive with dmsetup-only, drop special install / make]
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lvm2/Config.in |    7 +++++++
 package/lvm2/lvm2.mk   |    6 ++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 30af14e..374de94 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -21,5 +21,12 @@ config BR2_PACKAGE_LVM2_DMSETUP_ONLY
 	help
 	  Install dmsetup only and skip the LVM2 suite.
 
+config BR2_PACKAGE_LVM2_APP_LIBRARY
+	bool "install application library"
+	depends on BR2_PACKAGE_LVM2
+	depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
+	help
+	  Install application library (liblvm2app).
+
 comment "lvm2 requires a toolchain with LARGEFILE support"
         depends on !BR2_LARGEFILE
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f54caa4..49f135d 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -41,6 +41,12 @@ LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
 LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
 endif
 
+ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
+LVM2_CONF_OPT += --enable-applib
+else
+LVM2_CONF_OPT += --disable-applib
+endif
+
 define LVM2_UNINSTALL_STAGING_CMDS
 	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
 	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
