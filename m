From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Apr 2013 20:04:16 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: bump to version
	1.12.4 and add security patch
Message-ID: <20130427180801.AE6B69B887@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9978b3ed84b24d5fe69e7497a8f708bb5e1e0b32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 1.12.4 and add a security patch for CVE-2013-1940.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...> xserver_xorg-server-01-aarch64-support.patch} |    0
 .../xserver_xorg-server-02-cve-2013-1940.patch     |   34 ++++++++++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 3 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-aarch64-support.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-aarch64-support.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-aarch64-support.patch
rename to package/x11r7/xserver_xorg-server/xserver_xorg-server-01-aarch64-support.patch
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
new file mode 100644
index 0000000..d85494f
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
@@ -0,0 +1,34 @@
+From 6ca03b9161d33b1d2b55a3a1a913cf88deb2343f Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@gmail.com>
+Date: Wed, 10 Apr 2013 06:09:01 +0000
+Subject: xf86: fix flush input to work with Linux evdev devices.
+
+So when we VT switch back and attempt to flush the input devices,
+we don't succeed because evdev won't return part of an event,
+since we were only asking for 4 bytes, we'd only get -EINVAL back.
+
+This could later cause events to be flushed that we shouldn't have
+gotten.
+
+This is a fix for CVE-2013-1940.
+
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+diff --git a/hw/xfree86/os-support/shared/posix_tty.c b/hw/xfree86/os-support/shared/posix_tty.c
+index ab3757a..4d08c1e 100644
+--- a/hw/xfree86/os-support/shared/posix_tty.c
++++ b/hw/xfree86/os-support/shared/posix_tty.c
+@@ -421,7 +421,8 @@ xf86FlushInput(int fd)
+ {
+     fd_set fds;
+     struct timeval timeout;
+-    char c[4];
++    /* this needs to be big enough to flush an evdev event. */
++    char c[256];
+ 
+     DebugF("FlushingSerial\n");
+     if (tcflush(fd, TCIFLUSH) == 0)
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f0b19aa..1c51456 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.12.2
+XSERVER_XORG_SERVER_VERSION = 1.12.4
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
