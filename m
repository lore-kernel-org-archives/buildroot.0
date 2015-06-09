From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:06:59 +0200
Subject: [Buildroot] [git commit] package/matchbox: drop useless dependencies
Message-ID: <20150609211052.BEFA77FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d890098d0510b6ae6f53be34eb48d5cbc50d8bdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib-libXft is only needed when building a 'standalone' matchbox, which
means not using matchbox-lib.

But we *are* building matchbox-lib, and we do not support the standalone
mode (and probably won't, as even upstream says it is ugly, by lack of
theming).

Similarly, xlib-libXext is only used for its 'xsync' extension, for
which support is entirely commented-out in matchbox.

So, drop the dependency on xlib-libXft, and make it explicit we're not
building either standalone modes; drop xlib-libXext.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in   |    1 -
 package/matchbox/matchbox.mk |   11 ++++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index d42b90f..0c7e5ea 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -4,7 +4,6 @@ menuconfig BR2_PACKAGE_MATCHBOX
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_MATCHBOX_LIB
 	help
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index b1f96a6..1abcfd8 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -11,15 +11,16 @@ MATCHBOX_LICENSE = GPLv2+
 MATCHBOX_LICENSE_FILES = COPYING
 
 MATCHBOX_DEPENDENCIES = matchbox-lib
-MATCHBOX_CONF_OPTS = --enable-expat --disable-gconf --disable-composite
+MATCHBOX_CONF_OPTS = \
+	--enable-expat \
+	--disable-gconf \
+	--disable-composite \
+	--disable-standalone \
+	--disable-standalone-xft
 
 # Workaround bug in configure script
 MATCHBOX_CONF_ENV = expat=yes
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-MATCHBOX_DEPENDENCIES += xlib_libXft
-endif
-
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
 MATCHBOX_CONF_OPTS += --enable-startup-notification
 MATCHBOX_DEPENDENCIES += startup-notification
