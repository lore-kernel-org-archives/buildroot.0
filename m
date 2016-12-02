From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:38:22 +0100
Subject: [Buildroot] [git commit] package/norm: make it a waf-package
Message-ID: <20161202225223.667D081E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c98a030bc976a01c82aab4f6a5ae63d4d85b6ac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/norm/norm.mk | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/package/norm/norm.mk b/package/norm/norm.mk
index e1b3a5f..8af76f8 100644
--- a/package/norm/norm.mk
+++ b/package/norm/norm.mk
@@ -15,32 +15,10 @@ ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 NORM_DEPENDENCIES += libnetfilter_queue
 endif
 
-define NORM_CONFIGURE_CMDS
-	cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		./waf configure --prefix=/usr
-endef
-
-define NORM_BUILD_CMDS
-	cd $(@D); \
-		$(TARGET_MAKE_ENV) \
-		./waf build
-endef
-
 # install target doesn't install headers unfortunately...
-define NORM_INSTALL_STAGING_CMDS
-	cd $(@D); \
-		$(TARGET_MAKE_ENV) \
-		DESTDIR=$(STAGING_DIR) \
-		./waf install
+define NORM_INSTALL_HEADERS
 	cp -f $(@D)/include/norm* $(STAGING_DIR)/usr/include
 endef
+NORM_POST_INSTALL_STAGING_HOOKS += NORM_INSTALL_HEADERS
 
-define NORM_INSTALL_TARGET_CMDS
-	cd $(@D); \
-		$(TARGET_MAKE_ENV) \
-		DESTDIR=$(TARGET_DIR) \
-		./waf install
-endef
-
-$(eval $(generic-package))
+$(eval $(waf-package))
