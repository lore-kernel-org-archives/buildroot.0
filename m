From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 11:30:02 +0100
Subject: [Buildroot] [git commit] package/libpcap: bump to version 1.9.0
Message-ID: <20190204102844.EBF8881517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68c95c6ea5c6366bc977c382fadf45c8a2f433a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Disable Endace DAG card support as libdag is not available in
  buildroot
- Add upstream patch to fix build on musl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Tested-by: Yann E . MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x.c-add-missing-limits.h-for-musl-systems.patch | 26 ++++++++++++++++++++++
 package/libpcap/libpcap.hash                       |  2 +-
 package/libpcap/libpcap.mk                         |  4 ++--
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch b/package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch
new file mode 100644
index 0000000000..aabaef3383
--- /dev/null
+++ b/package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch
@@ -0,0 +1,26 @@
+From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
+From: maxice8 <thinkabit.ukim@gmail.com>
+Date: Sun, 22 Jul 2018 18:54:17 -0300
+Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
+
+fix compilation on musl libc systems like Void Linux and Alpine.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/the-tcpdump-group/libpcap/commit/aafa3512b7b742f5e66a5543e41974cc5e7eebfa]
+---
+ pcap-usb-linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
+index 6f8adf65e..b92c05ea1 100644
+--- a/pcap-usb-linux.c
++++ b/pcap-usb-linux.c
+@@ -50,6 +50,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <string.h>
+ #include <dirent.h>
+ #include <byteswap.h>
diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index f8bc1bcfef..19ce2adbe1 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e	libpcap-1.8.1.tar.gz
+sha256	2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019	libpcap-1.9.0.tar.gz
 
 # Hash for license file:
 sha256	8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd	LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 8cc444e7af..126087220b 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.8.1
+LIBPCAP_VERSION = 1.9.0
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
@@ -15,7 +15,7 @@ LIBPCAP_CONF_ENV = \
 	ac_cv_header_linux_wireless_h=yes \
 	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
-LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux
+LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
