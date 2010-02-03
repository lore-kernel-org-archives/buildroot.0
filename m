From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 20:57:30 +0100
Subject: [Buildroot] [git commit master] nbd: add server patches missing
	from 6aac003
Message-ID: <20100203200134.4835E77744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=67a284d82040d03647fc0e09134cb9e6f367dacd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow these patches never got added.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    2 +-
 package/nbd/nbd-server-fix-read-eagain.patch |   21 +++++++++++++++++++++
 package/nbd/nbd-server-susv3-legacy.patch    |   11 +++++++++++
 3 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 package/nbd/nbd-server-fix-read-eagain.patch
 create mode 100644 package/nbd/nbd-server-susv3-legacy.patch

diff --git a/CHANGES b/CHANGES
index 2f914e3..c97a64b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	bind, binutils, bootutils, busybox, dbus, directfb, dnsmasq,
 	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, flex, hal,
 	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
-	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, neon,
+	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, nbd, neon,
 	netstat-nat, openvpn, pcre, php, qt, readline, rpm, sawman, sdl,
 	sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
 	usbutils, webkit, wpa_supplicant, xfsprogs, zlib
diff --git a/package/nbd/nbd-server-fix-read-eagain.patch b/package/nbd/nbd-server-fix-read-eagain.patch
new file mode 100644
index 0000000..b1f966c
--- /dev/null
+++ b/package/nbd/nbd-server-fix-read-eagain.patch
@@ -0,0 +1,21 @@
+--- nbd-2.9.11.orig/nbd-server.c
++++ nbd-2.9.11/nbd-server.c
+@@ -304,10 +304,14 @@
+ 	ssize_t res;
+ 	while (len > 0) {
+ 		DEBUG("*");
+-		if ((res = read(f, buf, len)) <= 0)
+-			err("Read failed: %m");
+-		len -= res;
+-		buf += res;
++		if ((res = read(f, buf, len)) <= 0) {
++			if(errno != EAGAIN) {
++				err("Read failed: %m");
++			}
++		} else {
++			len -= res;
++			buf += res;
++		}
+ 	}
+ }
+ 
diff --git a/package/nbd/nbd-server-susv3-legacy.patch b/package/nbd/nbd-server-susv3-legacy.patch
new file mode 100644
index 0000000..58d38e1
--- /dev/null
+++ b/package/nbd/nbd-server-susv3-legacy.patch
@@ -0,0 +1,11 @@
+--- nbd-2.9.11/nbd-server.c	2009-10-01 16:10:15.000000000 +0200
++++ nbd-2.9.11/nbd-server.c	2009-10-01 16:10:32.000000000 +0200
+@@ -264,7 +264,7 @@
+   
+   	inet_aton(opts->clientname, &client);
+ 	while (fgets(line,LINELEN,f)!=NULL) {
+-		if((tmp=index(line, '/'))) {
++		if((tmp=strchr(line, '/'))) {
+ 			if(strlen(line)<=tmp-line) {
+ 				msg4(LOG_CRIT, ERRMSG, line, opts->server->authname);
+ 				return 0;
-- 
1.6.3.3
