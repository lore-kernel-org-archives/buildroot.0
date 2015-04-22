From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:31 +0200
Subject: [Buildroot] [PATCH 20/30] package/matchbox: cleanup handling of
	support for compositing
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <96868b02f42ce4dfb025afa2bb0de4cbbdf6f510.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for /compositing/ requires Xcomposite, Xfixes, Xdamage and
Xrender, as can be seen in the configure.ac. And it is optional.

Fix that by removing 'select' in Config.in, and chcking all four
dependencies in the .mk.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/Config.in   |  1 -
 package/matchbox/matchbox.mk | 13 ++++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index e58aaf2..39eb616 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_MATCHBOX_LIB
 	help
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 5bd2587..be94414 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -16,12 +16,15 @@ MATCHBOX_CONF_OPTS = --enable-expat
 # Workaround bug in configure script
 MATCHBOX_CONF_ENV = expat=yes
 
-ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
-ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE)$(BR2_PACKAGE_XLIB_LIBXFIXES)$(BR2_PACKAGE_XLIB_LIBXDAMAGE)$(BR2_PACKAGE_XLIB_LIBXRENDER),yyyy)
 MATCHBOX_CONF_OPTS += --enable-composite
-MATCHBOX_DEPENDENCIES += xlib_libXcomposite
-MATCHBOX_DEPENDENCIES += xlib_libXpm
-endif
+MATCHBOX_DEPENDENCIES += \
+	xlib_libXcomposite \
+	xlib_libXfixes \
+	xlib_libXdamage \
+	xlib_libXrender
+else
+MATCHBOX_CONF_OPTS += --disable-composite
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-- 
1.9.1
