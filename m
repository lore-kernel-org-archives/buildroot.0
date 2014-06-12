From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 Jun 2014 10:09:45 +0200
Subject: [Buildroot] [PATCH v3 1/1] xserver_xorg-server: Fix race condition
	when installing man pages
Message-ID: <1402560585-10801-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reproduced the bug using BR2_JLEVEL=16

Fixes race condition by disabling parallel make in man/

http://autobuild.buildroot.net/results/11e/11ece737078ca8da2fee4249432148675b4e630e/
http://autobuild.buildroot.net/results/a95/a952932b832ee3296d6c225c7a9df408ca3eef9f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: To autoreconf host-xfont_font-util is needed
v2: Patch man/Makefile.am to disable parallel make instead of removing man/
    from SUBDIRS in Makefile.am

 .../xserver_xorg-server-400-fix-man.patch           |   19 +++++++++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk      |    2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch
new file mode 100644
index 0000000..bde5ed6
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-400-fix-man.patch
@@ -0,0 +1,19 @@
+Fix race condition when installing man page
+
+Fixes
+http://autobuild.buildroot.net/results/11e/11ece737078ca8da2fee4249432148675b4e630e/
+http://autobuild.buildroot.net/results/a95/a952932b832ee3296d6c225c7a9df408ca3eef9f/
+
+Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=79396
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xorg-server-1.15.1.org/man/Makefile.am xorg-server-1.15.1/man/Makefile.am
+--- xorg-server-1.15.1.org/man/Makefile.am	2014-03-22 06:37:53.000000000 +0100
++++ xorg-server-1.15.1/man/Makefile.am	2014-05-29 09:27:48.808356591 +0200
+@@ -4,3 +4,5 @@
+ 
+ include $(top_srcdir)/manpages.am
+ appman_PRE = Xserver.man
++
++.NOTPARALLEL:
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index cae3ba0..050dee6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,6 +9,7 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
+XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
@@ -53,6 +54,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xkeyboard-config		\
 	pixman 				\
 	mcookie 			\
+	host-xfont_font-util		\
 	host-pkgconf
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
-- 
1.7.10.4
