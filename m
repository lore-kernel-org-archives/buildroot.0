From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 17:08:46 +0100
Subject: [Buildroot] [git commit] qtuio: use TARGET_MAKE_ENV when running
	make and qmake
Message-ID: <20140326160936.811799C2A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=245ede6df02fa907a7ffcce060583b17196d1415
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
lines, to make sure PATH is set correctly, and to line up with the qt5
packages that do this consistently.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qtuio/qtuio.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index fe23230..02927a4 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -19,13 +19,13 @@ QTUIO_EXAMPLES = dials fingerpaint knobs pinchzoom
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
 
