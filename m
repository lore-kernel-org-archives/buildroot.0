From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 20:34:48 +0200
Subject: [Buildroot] [git commit] uemacs: clear ixon termios flag at
	initialization
Message-ID: <20120503183814.2D44196C5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15744b7e15523506f52d36cac556626df9eaa204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #5144

Patch by Grant Edwards <grant.b.edwards@gmail.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    3 +-
 package/uemacs/uemacs-4.0.15-lt.03.ixon.patch |   28 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0221727..94f584f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,7 +44,7 @@
 	samba, sam-ba, sane-backends, sawman, screen, sdl_net,
 	smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
 	syslinux, sysstat, taglib, tftp-hpa, transmission, tiff,
-	tinyhttpd, udev, unionfs, usbutils, util-linux, vala,
+	tinyhttpd, udev, uemacs, unionfs, usbutils, util-linux, vala,
 	valgrind, vim, vsftpd, wipe, xdriver_xf86-video-fbdev,
 	xfsprogs, zlib,
 
@@ -62,6 +62,7 @@
 	#2353: [lua] fix build with 2010.08-rc1
 	#4880: New package lcdproc
 	#4886: New package protobuf
+	#5144: Patch to fix ixon bug in uemacs
 
 2012.02, Released February 29th, 2012:
 
diff --git a/package/uemacs/uemacs-4.0.15-lt.03.ixon.patch b/package/uemacs/uemacs-4.0.15-lt.03.ixon.patch
new file mode 100644
index 0000000..d0aaa79
--- /dev/null
+++ b/package/uemacs/uemacs-4.0.15-lt.03.ixon.patch
@@ -0,0 +1,28 @@
+[PATCH] clear ixon termios flag on initialization
+
+Otherwise ctrl-S/Q gets intercepted by the tty layer instead of
+handled by uemacs.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+diff -U8 em-4.0.15-lt-orig/posix.c em-4.0.15-lt/posix.c
+--- em-4.0.15-lt-orig/posix.c	1999-05-16 02:06:19.000000000 -0500
++++ em-4.0.15-lt/posix.c	2012-04-25 16:14:25.000000000 -0500
+@@ -45,17 +45,17 @@
+ 	/*
+ 	 * base new settings on old ones - don't change things
+ 	 * we don't know about
+ 	 */
+ 	ntermios = otermios;
+ 
+ 	/* raw CR/NL etc input handling, but keep ISTRIP if we're on a 7-bit line */
+ 	ntermios.c_iflag &= ~(IGNBRK | BRKINT | IGNPAR | PARMRK
+-			      | INPCK | INLCR | IGNCR | ICRNL);
++			      | INPCK | INLCR | IGNCR | ICRNL | IXON);
+ 
+ 	/* raw CR/NR etc output handling */
+ 	ntermios.c_oflag &= ~(OPOST | ONLCR | OLCUC | OCRNL | ONOCR | ONLRET);
+ 
+ 	/* No signal handling, no echo etc */
+ 	ntermios.c_lflag &= ~(ISIG | ICANON | XCASE | ECHO | ECHOE | ECHOK
+ 			     | ECHONL | NOFLSH | TOSTOP | ECHOCTL | ECHOPRT
+ 			     | ECHOKE | FLUSHO | PENDIN | IEXTEN);
