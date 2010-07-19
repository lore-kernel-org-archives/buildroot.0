From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Jul 2010 16:01:28 +0200
Subject: [Buildroot] [git commit master 1/1] avahi: bump version
Message-ID: <20100719140228.BC70F82B73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e302ac83d89fd370cab96ffa30ad406dd104ec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                           |    2 +-
 package/avahi/avahi-disable-systemd-support.patch |   22 +++++++++++++++++++++
 package/avahi/avahi.mk                            |    4 ++-
 3 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 package/avahi/avahi-disable-systemd-support.patch

diff --git a/CHANGES b/CHANGES
index f30da84..59b4a6f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,7 +14,7 @@
 	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
-	Updated/fixed packages: alsa-lib, berkeleydb, bash, blackbox,
+	Updated/fixed packages: alsa-lib, avahi, berkeleydb, bash, blackbox,
 	busybox, bzip2, cdrkit, cmake, dash, dhcp, dialog, diffutils,
 	distcc, dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file, flex,
 	fontconfig, gawk, gstreamer, gzip, intltool, ipsec-tools,
diff --git a/package/avahi/avahi-disable-systemd-support.patch b/package/avahi/avahi-disable-systemd-support.patch
new file mode 100644
index 0000000..909795a
--- /dev/null
+++ b/package/avahi/avahi-disable-systemd-support.patch
@@ -0,0 +1,22 @@
+[PATCH] avahi-daemon: disable systemd support
+
+Disable systemd support as it isn't needed for BR, and uses SOCK_CLOEXEC
+which isn't available on uClibc.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ avahi-daemon/sd-daemon.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: avahi-0.6.27/avahi-daemon/sd-daemon.h
+===================================================================
+--- avahi-0.6.27.orig/avahi-daemon/sd-daemon.h
++++ avahi-0.6.27/avahi-daemon/sd-daemon.h
+@@ -66,6 +66,7 @@ extern "C" {
+ 
+   See sd-daemon(7) for more information.
+ */
++#define DISABLE_SYSTEMD /* no systemd support in BR */
+ 
+ #if __GNUC__ >= 4
+ #define _sd_printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 66e2e63..fa05de3 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -10,9 +10,10 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.23
+AVAHI_VERSION = 0.6.27
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
+AVAHI_LIBTOOL_PATCH = NO
 AVAHI_INSTALL_STAGING = YES
 AVAHI_INSTALL_TARGET = YES
 
@@ -71,6 +72,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--disable-gdbm \
 		--disable-python-dbus \
 		--disable-pygtk \
+		--disable-gtk3 \
 		--disable-mono \
 		--disable-monodoc \
 		--disable-stack-protector \
-- 
1.7.1
