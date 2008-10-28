From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 28 Oct 2008 02:51:36 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix use of pkg-config
Message-ID: <200810280251.36628.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When cross compiling, Qt sets PKG_CONFIG in its own configure script to
an empty string. That leads to not using pkg-config. To avoid that, use
the configure option -force-pkg-config. Also set environment variables
for pkg-config defined in TARGET_CONFIGURE_OPTS.
---
 package/qtopia4/qtopia4.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index c959d40..360b949 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -253,10 +253,15 @@ endif
 	
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
+# Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
+# PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
+# when cross compiling, Qt 4.4.3 is wrong here.
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
-		PATH=$(TARGET_PATH) \
+		$(TARGET_CONFIGURE_OPTS) \
+		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		./configure \
 		-verbose \
+		-force-pkg-config \
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
 		$(QTOPIA4_QCONFIG_COMMAND) \
 		$(QTOPIA4_CONFIGURE) \
-- 
1.5.6.4
