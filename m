From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Jul 2014 16:12:26 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix race condition
	when installing man pages, 2nd try
Message-ID: <1404569546-12346-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Should fix the still present bug:
http://autobuild.buildroot.net/results/045/04514bc9a8d1aad8ddd7af4f0fd8c16edd2e89a9/
http://autobuild.buildroot.net/results/1f2/1f25f744771fbb5124dca4563d79ea92cbfd72a3/

This patch reverts my previous attempt to fix this hard-to-catch race condition
http://git.buildroot.net/buildroot/commit/package/x11r7/xserver_xorg-server?id=e244eb12dfc50bb56167d5fdaef3aac52b0ff6a3

and removes make target install-data from _INSTALL_STAGING_OPT, which was
introduced in 2008:
http://git.buildroot.net/buildroot/commit/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk?id=d4e56ff4dc8a0528550eb8503956bdcddb2fe516

Comparing the content of STAGING_DIR with and without "make install-data" showed
no difference so I assume that is it no longer necessary to explicitly call this
make target as the normal install target takes care of everything.

The race condition occurs because "make install" and "make install-data" both
install usr/share/man/man1/Xserver.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xserver_xorg-server-400-fix-man.patch           |   19 -------------------
 .../xserver_xorg-server/xserver_xorg-server.mk      |    3 ---
 2 files changed, 22 deletions(-)
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch
deleted file mode 100644
index bde5ed6..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix race condition when installing man page
-
-Fixes
-http://autobuild.buildroot.net/results/11e/11ece737078ca8da2fee4249432148675b4e630e/
-http://autobuild.buildroot.net/results/a95/a952932b832ee3296d6c225c7a9df408ca3eef9f/
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=79396
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xorg-server-1.15.1.org/man/Makefile.am xorg-server-1.15.1/man/Makefile.am
---- xorg-server-1.15.1.org/man/Makefile.am	2014-03-22 06:37:53.000000000 +0100
-+++ xorg-server-1.15.1/man/Makefile.am	2014-05-29 09:27:48.808356591 +0200
-@@ -4,3 +4,5 @@
- 
- include $(top_srcdir)/manpages.am
- appman_PRE = Xserver.man
-+
-+.NOTPARALLEL:
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2471c71..779c46d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,9 +9,7 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
-XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xutil_util-macros 		\
 	xlib_libXfont 			\
@@ -54,7 +52,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xkeyboard-config		\
 	pixman 				\
 	mcookie 			\
-	host-xfont_font-util		\
 	host-pkgconf
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
-- 
1.7.10.4
