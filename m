From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 18 Aug 2014 22:41:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/bandwidthd: improve configure check
	for zlib and libusb.
Message-ID: <1408394513-5177-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script doesn't check for zlib, then -lz is missing during libpng
test.
The first patch add this check.

If the libpcap is linked with libusb, then the libpcap check fail because
-lusb-1.0 is missing.
Also -lpthread need to be added since libusb depends on threads support.
The second patch add -lusb-1.0 and -lpthread only if libusb is present.

Tested with and without libusb support.

Fixes:
http://autobuild.buildroot.net/results/37a/37a94e0f2d3faa0aec9c488e987cfff706fc9f3b/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Nathaniel Roach <nroach44@gmail.com>
---
 .../bandwidthd-0001-configure-add-zlib-check.patch | 33 ++++++++++++++++++++++
 ...andwidthd-0002-configure-add-libusb-check.patch | 30 ++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 package/bandwidthd/bandwidthd-0001-configure-add-zlib-check.patch
 create mode 100644 package/bandwidthd/bandwidthd-0002-configure-add-libusb-check.patch

diff --git a/package/bandwidthd/bandwidthd-0001-configure-add-zlib-check.patch b/package/bandwidthd/bandwidthd-0001-configure-add-zlib-check.patch
new file mode 100644
index 0000000..b7b4630
--- /dev/null
+++ b/package/bandwidthd/bandwidthd-0001-configure-add-zlib-check.patch
@@ -0,0 +1,33 @@
+From 9a871de08dd033c0f8bb5f35e6c628e6597efd5f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 18 Aug 2014 22:04:50 +0200
+Subject: [PATCH 1/1] configure: add zlib check
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3a2d0ba..c370350 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,10 +30,12 @@ AC_CHECK_LIB(m, pow)
+ AC_CHECK_LIB(iconv, libiconv_open)
+ 
+ # Required Libraries
+-AC_CHECK_LIB(png, png_read_info, ,[AC_MSG_ERROR([Bandwidthd requires but cannot libpng])])
+-AC_CHECK_LIB(gd, gdImageCreate, ,[AC_MSG_ERROR([Bandwidthd requires but cannot find libgd])])
++AC_CHECK_LIB(z, zlibVersion, , AC_MSG_ERROR(Bandwidthd needs libzlib to be installed)) #Needed by libpng, doing it here to be sure
++AC_CHECK_LIB(png, png_read_info, ,[AC_MSG_ERROR([Bandwidthd needs libpng to be installed])])
++AC_CHECK_LIB(gd, gdImageCreate, ,[AC_MSG_ERROR([Bandwidthd needs libgd to be installed])])
++
+ AC_CHECK_LIB(pcap, pcap_open_live, ,
+-	[AC_CHECK_LIB(wpcap, pcap_open_live, ,[AC_MSG_ERROR([Bandwidthd requires but cannot find libpcap])])])
++	[AC_CHECK_LIB(wpcap, pcap_open_live, ,[AC_MSG_ERROR([Bandwidthd needs libpcap to be installed])])])
+ 
+ #AC_CHECK_LIB(sqlite3, sqlite3_open, sqlite=true,AC_MSG_WARN([sqlite3 is recommended for storage of data but cannot be found]))
+ 
+-- 
+1.9.3
+
diff --git a/package/bandwidthd/bandwidthd-0002-configure-add-libusb-check.patch b/package/bandwidthd/bandwidthd-0002-configure-add-libusb-check.patch
new file mode 100644
index 0000000..e989393
--- /dev/null
+++ b/package/bandwidthd/bandwidthd-0002-configure-add-libusb-check.patch
@@ -0,0 +1,30 @@
+From 6be45a79405c181e3f51562fb89d8256bb97bd32 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 18 Aug 2014 22:16:12 +0200
+Subject: [PATCH 1/1] configure: add libusb check
+
+libusb is an libpcap's optional dependency.
+-lpthread need to be added since libusb depends on threads support
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c370350..45da195 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,6 +34,9 @@ AC_CHECK_LIB(z, zlibVersion, , AC_MSG_ERROR(Bandwidthd needs libzlib to be insta
+ AC_CHECK_LIB(png, png_read_info, ,[AC_MSG_ERROR([Bandwidthd needs libpng to be installed])])
+ AC_CHECK_LIB(gd, gdImageCreate, ,[AC_MSG_ERROR([Bandwidthd needs libgd to be installed])])
+ 
++# libusb is an libpcap's optional dependency
++AC_CHECK_LIB(usb-1.0, libusb_init, [LIBS="-lusb-1.0 -lpthread $LIBS"], , -lpthread)
++
+ AC_CHECK_LIB(pcap, pcap_open_live, ,
+ 	[AC_CHECK_LIB(wpcap, pcap_open_live, ,[AC_MSG_ERROR([Bandwidthd needs libpcap to be installed])])])
+ 
+-- 
+1.9.3
+
-- 
1.9.3
