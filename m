From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 07:24:15 +0100
Subject: [Buildroot] [git commit master 1/1] midori: bump to 0.2.9 and make
	it build with directfb
Message-ID: <20101119080415.474FC8D303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3693cdb6e4e4d2e1ee264067a559cead2a553da7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/midori/midori.mk |   19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 748738e..0e27324 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libglib2, module-init-tools,
+	Updated/fixed packages: libglib2, midori, module-init-tools,
 	mtd-utils, openssh, qt, sqlite, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index ffee596..af227d4 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,19 +4,26 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.2.6
+MIDORI_VERSION = 0.2.9
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.2/
-MIDORI_INSTALL_STAGING = NO
 MIDORI_INSTALL_TARGET = YES
 
 MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2
 
+ifneq ($(BR2_PACKAGE_XORG7),y)
+define MIDORI_WITHOUT_X11
+	$(SED) "s/check_pkg ('x11')/#check_pkg ('x11')/" $(@D)/wscript
+endef
+endif
+
 define MIDORI_CONFIGURE_CMDS
-       (cd $(@D); \
-               $(TARGET_CONFIGURE_OPTS)        \
-               ./waf configure                 \
-               --prefix=/usr                   \
+	$(MIDORI_WITHOUT_X11)
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS)	\
+		./waf configure			\
+		--prefix=/usr			\
+		--disable-vala			\
        )
 endef
 
-- 
1.7.2.2
