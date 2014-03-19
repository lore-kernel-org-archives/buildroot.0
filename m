From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Mar 2014 20:30:08 +0100
Subject: [Buildroot] [PATCH 3 of 4] qtuio: use TARGET_MAKE_ENV when running
	make and qmake
In-Reply-To: <patchbomb.1395257405@argentina>
References: <patchbomb.1395257405@argentina>
Message-ID: <90542cc669bb4125a904.1395257408@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
lines, to make sure PATH is set correctly, and to line up with the qt5
packages that do this consistently.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/qtuio/qtuio.mk |  6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -19,13 +19,13 @@ QTUIO_EXAMPLES = dials fingerpaint knobs
 ifeq ($(BR2_QTUIO_EXAMPLES),y)
 define QTUIO_CONFIGURE_EXAMPLES
 	for example in $(QTUIO_EXAMPLES) ; do \
-		(cd $(@D)/examples/$${example} && $(QT_QMAKE)) ; \
+		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) ; \
 	done
 endef
 endif
 
 define QTUIO_CONFIGURE_CMDS
-	cd $(@D)/src && $(QT_QMAKE)
+	cd $(@D)/src && $(TARGET_MAKE_ENV) $(QT_QMAKE)
 	$(QTUIO_CONFIGURE_EXAMPLES)
 endef
 
@@ -38,7 +38,7 @@ endef
 endif
 
 define QTUIO_BUILD_CMDS
-	$(MAKE) -C $(@D)/src
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
 	$(QTUIO_BUILD_EXAMPLES)
 endef
 
