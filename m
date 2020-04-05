From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:27:45 +0200
Subject: [Buildroot] [git commit] package/cegui: disable xerces support
Message-ID: <20200405141401.1DDB38B8CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=689b9c1a7cf54b82e0a886bf71fda53731cf634c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable temporarily xerces's support due to used char16_t type
which is not supported in the currently used cegui version (0-8-7)
due to forced c++03 standard.

Fixes:
 - http://autobuild.buildroot.net/results/ea04be78b31b3409801597fc0ebe04627742c0c8
 - http://autobuild.buildroot.net/results/7de3a07c304e3939ec9fd164328d004a5a9bba6d
 - http://autobuild.buildroot.net/results/472b4e8438c9100e06e401296f0417a463e5fcf1

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 259e3e3735..134b222362 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -9,6 +9,7 @@ CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF
 CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
@@ -72,13 +73,6 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_XERCES),y)
-CEGUI_DEPENDENCIES += xerces
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 CEGUI_DEPENDENCIES += libxml2
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
