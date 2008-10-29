From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 29 Oct 2008 18:53:35 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix wrong compilation of qmake
Message-ID: <200810291853.36962.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/qtopia4/qtopia4.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index c0ced9b..9c08be9 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -257,8 +257,12 @@ endif
 # Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
 # PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
 # when cross compiling, Qt 4.4.3 is wrong here.
+# Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
+# instead of the host then.
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
+		PATH=$(TARGET_PATH) \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		./configure \
 		-verbose \
-- 
1.5.6.4
