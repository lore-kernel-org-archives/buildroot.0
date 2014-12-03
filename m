From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 23:05:44 +0100
Subject: [Buildroot] [PATCHv2] qtuio: add error handling to for loop
Message-ID: <1417644344-3116-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove unneeded sub-shell usage in the build and installation
steps. It is kept for the configure step as it is actually useful, and
works fine because "|| exit 1" is outside the sub-shell.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v1 -> v2:
 * Remove unneeded sub-shell usage, noticed by Yann E. Morin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qtuio/qtuio.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.1.0
