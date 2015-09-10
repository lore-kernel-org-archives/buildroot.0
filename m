From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:52:46 +0200
Subject: [Buildroot] [git commit] directfb: remove broken X.org support
Message-ID: <20150910122136.8F1F080E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=271c9c52a22cf12392e3d665353e4f6d63382797
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_XSERVER option never existed, so it was never possible
for DirectFB to pass --enable-x11. Moreover, doing this without having
at least some dependency on certain X libraries will clearly not work.

Consequently, let's remove this bogus X.org support, and disable X11
support unconditionally (until someone is interested enough to bring
this back to life).

The option was actually named BR2_PACKAGE_DIRECTFB_XSERVER but was not
used by the .mk file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in   |    4 ----
 package/directfb/directfb.mk |    9 ++-------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 3ab40f9..98acec5 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -45,10 +45,6 @@ config BR2_PACKAGE_DIRECTFB_TRACE
 	help
 	  Enable call tracing for DirectFB applications
 
-config BR2_PACKAGE_DIRECTFB_XSERVER
-	bool "build with X server backend"
-	depends on BR2_PACKAGE_XORG7
-
 config BR2_PACKAGE_DIRECTFB_UNIQUE
 	bool "enable unique window manager"
 	depends on BR2_UNIMPLEMENTED
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index da12acb..acb3e3a 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -22,7 +22,8 @@ DIRECTFB_CONF_OPTS = \
 	--disable-osx \
 	--disable-video4linux \
 	--disable-video4linux2 \
-	--without-tools
+	--without-tools \
+	--disable-x11
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DIRECTFB_CONF_OPTS += --disable-dynload
@@ -52,12 +53,6 @@ ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
 DIRECTFB_CONF_OPTS += --enable-trace
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER),y)
-DIRECTFB_CONF_OPTS += --enable-x11
-else
-DIRECTFB_CONF_OPTS += --disable-x11
-endif
-
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
 DIRECTFB_CONF_OPTS += --enable-unique
 else
