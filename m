From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:37:52 +0100
Subject: [Buildroot] [git commit] package/glmark2: make it a waf-package
Message-ID: <20161202225223.2C2D1800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=680d6177d0260ff937065a28b6e4ac398ad491a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Spenser Gilliland <spenser@gillilanding.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glmark2/glmark2.mk | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 2f662fe..e35e36a 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -8,7 +8,7 @@ GLMARK2_VERSION = fa71af2dfab711fac87b9504b6fc9862f44bf72a
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPLv3+ SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
-GLMARK2_DEPENDENCIES = host-pkgconf host-python jpeg libpng \
+GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
 	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
 	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
 	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
@@ -45,20 +45,4 @@ GLMARK2_CONF_OPTS += \
 	--prefix=/usr \
 	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
 
-define GLMARK2_CONFIGURE_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(GLMARK2_CONF_ENV) \
-		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
-	)
-endef
-
-define GLMARK2_BUILD_CMDS
-	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf
-endef
-
-define GLMARK2_INSTALL_TARGET_CMDS
-	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf install --destdir=$(TARGET_DIR)
-endef
-
-$(eval $(generic-package))
+$(eval $(waf-package))
