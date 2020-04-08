From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:47:09 +0200
Subject: [Buildroot] [git commit] package/cegui: disable minizip support
Message-ID: <20200408193321.4AF4281455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6ea02deeaca773b633077ceb0eaf8746a5ce057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable support for minizip since cegui is not compatible
with the existing buildroot's version due to lack of
necessary header. It will be restored when upstream will
switch to the new version.

Fixes:
 - http://autobuild.buildroot.net/results/65fa719e8b2466409a12eb103a8938e1488efc0c
 - http://autobuild.buildroot.net/results/ef37a0cc16daacb7206d736c86b511c7d90eefe0

and many more.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 134b222362..434201b1f8 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -9,7 +9,8 @@ CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
+		   -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF
 CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
@@ -66,13 +67,6 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_MINIZIP),y)
-CEGUI_DEPENDENCIES += minizip
-CEGUI_CONF_OPTS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 CEGUI_DEPENDENCIES += libxml2
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
