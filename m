From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:38 +0200
Subject: [Buildroot] [PATCH 21/32 v2] package/matchbox: forcibly disable
	support for compositing
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <0d1d2ce6fb4d67396ee1f6031ac62e13880c3bef.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with the experimental support for compositing is broken:

    /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gnueabihf-gcc
    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
    -Os -o matchbox-window-manager main.o wm.o base_client.o main_client.o
    toolbar_client.o toolbar_client_alt.o dockbar_client.o dialog_client.o
    select_client.o desktop_client.o ewmh.o misc.o client_common.o keys.o
    list.o stack.o composite-engine.o session.o mbtheme.o xml.o
    -lmb -lX11
    -L/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
    -lXext -lXcomposite -lXdamage -lXfixes -lXrender
    -L/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
    -lX11 -lexpat
    -L/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
    -lXfixes
    composite-engine.o: In function `gaussian':
    /home/ymorin/dev/buildroot/O/build/matchbox-1.2/src/composite-engine.c:65:
    undefined reference to `exp'

That's because it forgets to link with -lm.

However, adding "MATCHBOX_CONF_ENV = -lm" does not solve the issue, as
it still does not link with -lm at all.

Furthermore, the package does not autoreconf, since it is missing the
gconf m4 macros, and Buildroot does not have a package for gconf, hence
we can not even patch Makefile.am and autoreconf.

Patching Makefile.in (in addition to .am) could be a solution, but
support for compositing is explicitly marked as being experimental.

So, just forcibly disable it altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - simply drop support for compositing without trying to first fix it
    (Arnout)
---
 package/matchbox/Config.in   |  1 -
 package/matchbox/matchbox.mk | 10 +---------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 344635c..d850a39 100644
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
index 0899208..43f6b4b 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -11,19 +11,11 @@ MATCHBOX_LICENSE = GPLv2+
 MATCHBOX_LICENSE_FILES = COPYING
 
 MATCHBOX_DEPENDENCIES = matchbox-lib
-MATCHBOX_CONF_OPTS = --enable-expat --disable-gconf
+MATCHBOX_CONF_OPTS = --enable-expat --disable-gconf --disable-composite
 
 # Workaround bug in configure script
 MATCHBOX_CONF_ENV = expat=yes
 
-ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
-ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-MATCHBOX_CONF_OPTS += --enable-composite
-MATCHBOX_DEPENDENCIES += xlib_libXcomposite
-MATCHBOX_DEPENDENCIES += xlib_libXpm
-endif
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
 MATCHBOX_DEPENDENCIES += xlib_libXft
 endif
-- 
1.9.1
