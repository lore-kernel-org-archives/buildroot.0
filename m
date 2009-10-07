From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:30 +0200
Subject: [Buildroot] [PATCH 07/23] qt: remove PKG_CONFIG workaround
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-8-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least Qt 4.5.2 is fixed in the meantime and honors PKG_CONFIG.
So the PATH workaround is no longer needed.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e965a42..8dac3ca 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -457,16 +457,12 @@ endif
 	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
 	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
 		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
-# Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
-# PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
-# when cross compiling, Qt 4.4.3 is wrong here.
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
-# instead of the host then.
+# instead of the host then. So set PKG_CONFIG* manually.
 	(cd $(QT_TARGET_DIR); \
-		PATH=$(TARGET_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
-- 
1.6.3.3
