From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat,  4 Apr 2020 18:51:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/cegui: disable xerces support
In-Reply-To: <20200404165101.34931-1-b.bilas@grinn-global.com>
References: <20200404165101.34931-1-b.bilas@grinn-global.com>
Message-ID: <20200404165101.34931-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable temporarily xerces's support due to used char16_t type
which is not supported in the currently used cegui version (0-8-7)
due to forced c++03 standard.

Fixes:
 - http://autobuild.buildroot.net/results/ea04be78b31b3409801597fc0ebe04627742c0c8
 - http://autobuild.buildroot.net/results/7de3a07c304e3939ec9fd164328d004a5a9bba6d
 - http://autobuild.buildroot.net/results/472b4e8438c9100e06e401296f0417a463e5fcf1

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/cegui/cegui.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 9a15511816..89b662f153 100644
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
-- 
2.26.0
