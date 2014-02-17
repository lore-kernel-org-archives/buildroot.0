From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2014 11:36:11 +0100
Subject: [Buildroot] [git commit] qtuio: correct install-target/staging when
	Qt library type is 'static'
Message-ID: <20140217103629.E5D669CA70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31d212b3e1d9539c6b2ed7aa92830fe5ff13b4f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_PACKAGE_QT_STATIC is set, qtuio will not build a .so file, but .a.
However, the custom INSTALL_TARGET_CMDS and INSTALL_STAGING_CMDS
unconditionally attempted to copy the .so file.

This commit checks the requested Qt library type and copies the right
library for each case, taking into account that the static .a file does not
need to be copied to the target directory.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qtuio/qtuio.mk |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 652dbc2..fe23230 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -51,13 +51,22 @@ define QTUIO_INSTALL_EXAMPLES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT_STATIC),y)
+QTUIO_LIBRARY = libqTUIO.a
+else
+QTUIO_LIBRARY = libqTUIO.so*
+define QTUIO_INSTALL_TARGET_LIBRARY
+	cp -dpf $(@D)/lib/$(QTUIO_LIBRARY) $(TARGET_DIR)/usr/lib
+endef
+endif
+
 define QTUIO_INSTALL_TARGET_CMDS
-	cp -dpf $(@D)/lib/libqTUIO.so* $(TARGET_DIR)/usr/lib
+	$(QTUIO_INSTALL_TARGET_LIBRARY)
 	$(QTUIO_INSTALL_EXAMPLES)
 endef
 
 define QTUIO_INSTALL_STAGING_CMDS
-	cp -dpf $(@D)/lib/libqTUIO.so* $(STAGING_DIR)/usr/lib
+	cp -dpf $(@D)/lib/$(QTUIO_LIBRARY) $(STAGING_DIR)/usr/lib
 endef
 
 $(eval $(generic-package))
