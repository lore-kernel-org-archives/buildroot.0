From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 15:08:10 +0200
Subject: [Buildroot] [git commit] midori: force host-python dependency for
	waf build-system
Message-ID: <20140526130845.742469CDD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ca6a6fff28ebee0c8ed3a8234f2923c4af938e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d48/d48b68dd6a43fa9a224237e8f458ca8987a3d7b4/

Similar to the recent fix to jack2 (fc8fcec306da). The waf version included
in midori (1.5.19) is not compatible with python 3.4.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/midori/midori.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index ff56e43..d55f5f1 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -14,6 +14,7 @@ MIDORI_DEPENDENCIES = \
 	host-intltool \
 	host-pkgconf \
 	host-vala \
+	host-python \
 	libgtk2 \
 	libsexy \
 	webkit \
@@ -30,18 +31,18 @@ define MIDORI_CONFIGURE_CMDS
 	$(MIDORI_WITHOUT_X11)
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-		./waf configure			\
+		$(HOST_DIR)/usr/bin/python2 ./waf configure \
 		--prefix=/usr			\
 		--disable-libnotify		\
        )
 endef
 
 define MIDORI_BUILD_CMDS
-       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
+       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define MIDORI_INSTALL_TARGET_CMDS
-       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
+       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
 endef
 
 $(eval $(generic-package))
