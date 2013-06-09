From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 20:32:40 +0200
Subject: [Buildroot] [git commit] libpcap: fix build failure related to
	libnl3
Message-ID: <20130609190557.654AC9AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=205643a3454fee967bd7fbc8e1668f6d18a83ce3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libpcap detects that libnl3 is available, it hardcodes the fact
of using -I/usr/include/libnl3, which is completely wrong in
cross-compilation.

This commit fixes that, by removing this hardcoded include path, and
by passing an appropriate -I option from libpcap.mk.

The original issue has been reported upstream at
https://github.com/the-tcpdump-group/libpcap/issues/305.

Fixes:

  http://autobuild.buildroot.net/results/b65/b6585bf2985a188e797e5a6b71a35c461421e3b4/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libpcap-remove-libnl-include-path.patch        |   16 ++++++++++++++++
 package/libpcap/libpcap.mk                         |   19 +++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/package/libpcap/libpcap-remove-libnl-include-path.patch b/package/libpcap/libpcap-remove-libnl-include-path.patch
new file mode 100644
index 0000000..7b7106b
--- /dev/null
+++ b/package/libpcap/libpcap-remove-libnl-include-path.patch
@@ -0,0 +1,16 @@
+Remove hardcoded path to libnl3 include directory
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -445,7 +445,6 @@
+ 			AC_DEFINE(HAVE_LIBNL_3_x,1,[if libnl exists and is version 3.x])
+ 			AC_DEFINE(HAVE_LIBNL_NLE,1,[libnl has NLE_FAILURE])
+ 			AC_DEFINE(HAVE_LIBNL_SOCKETS,1,[libnl has new-style socket api])
+-			V_INCLS="$V_INCLS -I/usr/include/libnl3"
+ 			have_any_nl="yes"
+ 		])
+ 
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index bbbecdc..ec4d346 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -9,10 +9,14 @@ LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
-LIBPCAP_DEPENDENCIES = zlib host-flex host-bison \
-	$(if $(BR2_PACKAGE_LIBNL),libnl)
+LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
+
+# We're patching configure.in
+LIBPCAP_AUTORECONF = YES
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
-		ac_cv_header_linux_wireless_h=yes # configure misdetects this
+		ac_cv_header_linux_wireless_h=yes \
+		CFLAGS="$(LIBPCAP_CFLAGS)"
+LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
@@ -23,9 +27,16 @@ else
 LIBPCAP_CONF_OPT += --disable-canusb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+LIBPCAP_DEPENDENCIES += libnl
+LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
+else
+LIBPCAP_CONF_OPT += --without-libnl
+endif
+
 # microblaze needs -fPIC instead of -fpic
 ifeq ($(BR2_microblaze),y)
-LIBPCAP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
+LIBPCAP_CFLAGS += -fPIC
 endif
 
 $(eval $(autotools-package))
