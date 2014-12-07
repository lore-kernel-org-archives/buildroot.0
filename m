From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:53:57 +0100
Subject: [Buildroot] [git commit] qtuio: add error handling to for loop
Message-ID: <20141207205511.F410380100@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abed1cec06ca6fbb14c28f5407cbc513ac29c39a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove unneeded sub-shell usage in the build and installation
steps. It is kept for the configure step as it is actually useful, and
works fine because "|| exit 1" is outside the sub-shell.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qtuio/qtuio.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 9925f84..5fa10a7 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -19,7 +19,7 @@ QTUIO_EXAMPLES = dials fingerpaint knobs pinchzoom
 ifeq ($(BR2_QTUIO_EXAMPLES),y)
 define QTUIO_CONFIGURE_EXAMPLES
 	for example in $(QTUIO_EXAMPLES) ; do \
-		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) ; \
+		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) || exit 1; \
 	done
 endef
 endif
@@ -32,7 +32,7 @@ endef
 ifeq ($(BR2_QTUIO_EXAMPLES),y)
 define QTUIO_BUILD_EXAMPLES
 	for example in $(QTUIO_EXAMPLES) ; do \
-		($(MAKE) -C $(@D)/examples/$${example}) ; \
+		$(MAKE) -C $(@D)/examples/$${example} || exit 1; \
 	done
 endef
 endif
@@ -46,7 +46,7 @@ endef
 ifeq ($(BR2_QTUIO_EXAMPLES),y)
 define QTUIO_INSTALL_EXAMPLES
 	for example in $(QTUIO_EXAMPLES) ; do \
-		($(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example}) ; \
+		$(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example} || exit 1 ; \
 	done
 endef
 endif
