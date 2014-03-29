From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:11:17 +0100
Subject: [Buildroot] [git commit] xorg: Bump xserver_xorg-server version to
	1.15.0
Message-ID: <20140329222157.DB53F9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70c36b8c413a505440659c91b600a374f40ff6f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove patches applied upstream
- parallel make works
- add new dependency xproto_presentproto

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server-02-cve-2013-1940.patch     |   34 -----------
 ...ut-allocate-enough-space-for-null-charact.patch |   59 --------------------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    5 +-
 4 files changed, 4 insertions(+), 95 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5f0c2d8..dfa7d10 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
deleted file mode 100644
index d85494f..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6ca03b9161d33b1d2b55a3a1a913cf88deb2343f Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@gmail.com>
-Date: Wed, 10 Apr 2013 06:09:01 +0000
-Subject: xf86: fix flush input to work with Linux evdev devices.
-
-So when we VT switch back and attempt to flush the input devices,
-we don't succeed because evdev won't return part of an event,
-since we were only asking for 4 bytes, we'd only get -EINVAL back.
-
-This could later cause events to be flushed that we shouldn't have
-gotten.
-
-This is a fix for CVE-2013-1940.
-
-Signed-off-by: Dave Airlie <airlied@redhat.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
-diff --git a/hw/xfree86/os-support/shared/posix_tty.c b/hw/xfree86/os-support/shared/posix_tty.c
-index ab3757a..4d08c1e 100644
---- a/hw/xfree86/os-support/shared/posix_tty.c
-+++ b/hw/xfree86/os-support/shared/posix_tty.c
-@@ -421,7 +421,8 @@ xf86FlushInput(int fd)
- {
-     fd_set fds;
-     struct timeval timeout;
--    char c[4];
-+    /* this needs to be big enough to flush an evdev event. */
-+    char c[256];
- 
-     DebugF("FlushingSerial\n");
-     if (tcflush(fd, TCIFLUSH) == 0)
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch
deleted file mode 100644
index d19bc46..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 09f1e5b15b769e1122f0a8d7cae0820038992312 Mon Sep 17 00:00:00 2001
-From: Julien Cristau <jcristau@debian.org>
-Date: Sun, 7 Oct 2012 18:40:35 +0200
-Subject: [PATCH] Revert "kinput: allocate enough space for null character."
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This reverts commit 531785dd746d64ef7f473a83ca73bb20e74b6fca.
-
-The above commit breaks Xephyr option parsing.  Andrzej writes:
-
-  Xephyr -retro -keybd evdev,,device=/dev/input/event2,xkbrules=evdev,xkbmodel=evdev,xkblayout=pl -mouse evdev,,device=/dev/input/event1 :3
-
-  results in:
-
-  <snip>
-  Pointer option key (device=) of value (/dev/input/event1) not assigned!
-  Kbd option key (device=) of value (/dev/input/event2) not assigned!
-  Kbd option key (xkbrules=) of value (evdev) not assigned!
-  Kbd option key (xkbmodel=) of value (evdev) not assigned!
-  Kbd option key (xkblayout=) of value (pl) not assigned!
-  <snip>
-
-  The effect of the patch is that the "key=value" pairs are parsed in such
-  a way that the key is added an "equals" sign to it and we end up with
-  keys like "device=" instead of "device". This in turn has effect on
-  KdParsePointerOptions and KdParseKbdOptions: the key does not match
-  any choice presented in the "switch" statement, and so "Pointer/Kbd
-  option key (...) of value (...) not assigned!" happens, making all
-  "key=value" options inaccessible to the user. Reverting the patch makes
-  them available again.
-
-Reference: http://bugs.debian.org/689246
-Reported-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
-Signed-off-by: Julien Cristau <jcristau@debian.org>
-Cc: Dave Airlie <airlied@redhat.com>
-Reviewed-by: S??ren Sandmann <ssp@redhat.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
- hw/kdrive/src/kinput.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/kdrive/src/kinput.c b/hw/kdrive/src/kinput.c
-index d35dcf8..b1068bb 100644
---- a/hw/kdrive/src/kinput.c
-+++ b/hw/kdrive/src/kinput.c
-@@ -1034,7 +1034,7 @@ KdGetOptions(InputOption **options, char *string)
- 
-     if (strchr(string, '=')) {
-         tam_key = (strchr(string, '=') - string);
--        key = strndup(string, tam_key + 1);
-+        key = strndup(string, tam_key);
-         if (!key)
-             goto out;
- 
--- 
-1.7.10.4
-
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 034b591..dd4e280 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.12.4
+XSERVER_XORG_SERVER_VERSION = 1.15.0
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
-XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
@@ -40,6 +39,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_glproto 			\
 	xproto_inputproto 		\
 	xproto_kbproto 			\
+	xproto_presentproto 		\
 	xproto_randrproto 		\
 	xproto_renderproto 		\
 	xproto_resourceproto 		\
@@ -100,6 +100,7 @@ XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-dri
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dri
