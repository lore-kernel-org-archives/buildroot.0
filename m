From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:46 -0000
Subject: [Buildroot] [git commit branch/next] libpcap: canusb support needs
	pthreads
Message-ID: <20120802195245.E40A28C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c69be6d2abe8f8e265f92494867e2c7e1519dd08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

canusb support in libpcap uses pthreads but the configure script doesn't
account for -lpthread usage so it doesn't get added into LIBS which in
turn doesn't add the appropiate entry in pcap-config, causing build
failures for programs that link to libpcap that don't use pthreads
themselves (for example tcpdump).
Also add the conditional dependency on BR2_PACKAGE_LIBUSB for canusb.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libpcap/libpcap-canusb-requires-pthread.patch  |   29 ++++++++++++++++++++
 package/libpcap/libpcap.mk                         |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)

diff --git a/package/libpcap/libpcap-canusb-requires-pthread.patch b/package/libpcap/libpcap-canusb-requires-pthread.patch
new file mode 100644
index 0000000..ed3bc1a
--- /dev/null
+++ b/package/libpcap/libpcap-canusb-requires-pthread.patch
@@ -0,0 +1,29 @@
+canusb uses pthreads, but -lpthread is never added to LIBS hence missing
+from pcap-config, causing build failures. Fix this.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libpcap-1.3.0.orig//configure libpcap-1.3.0/configure
+--- libpcap-1.3.0.orig//configure	2012-06-26 09:42:06.072155279 -0300
++++ libpcap-1.3.0/configure	2012-06-26 09:42:12.617196326 -0300
+@@ -7607,7 +7607,7 @@
+ $as_echo "#define PCAP_SUPPORT_CANUSB 1" >>confdefs.h
+ 
+ 		    CANUSB_SRC=pcap-canusb-linux.c
+-		    LIBS="-lusb-1.0 $LIBS"
++		    LIBS="-lusb-1.0 -lpthread $LIBS"
+ 		    { $as_echo "$as_me:${as_lineno-$LINENO}: canusb sniffing is supported" >&5
+ $as_echo "$as_me: canusb sniffing is supported" >&6;}
+ 
+diff -Nura libpcap-1.3.0.orig//configure.in libpcap-1.3.0/configure.in
+--- libpcap-1.3.0.orig//configure.in	2012-06-26 09:42:06.067155242 -0300
++++ libpcap-1.3.0/configure.in	2012-06-26 09:42:22.267256741 -0300
+@@ -1406,7 +1406,7 @@
+ 		[
+ 		    AC_DEFINE(PCAP_SUPPORT_CANUSB, 1, [target host supports canusb])
+ 		    CANUSB_SRC=pcap-canusb-linux.c
+-		    LIBS="-lusb-1.0 $LIBS"
++		    LIBS="-lusb-1.0 -lpthread $LIBS"
+ 		    AC_MSG_NOTICE(canusb sniffing is supported)
+ 		],
+ 		AC_MSG_NOTICE(canusb sniffing is not supported; install libusb1.0 lib devel to enable it)
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 51e1106..324ec33 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -12,7 +12,8 @@ LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
 LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
 	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
-LIBPCAP_DEPENDENCIES = zlib
+LIBPCAP_DEPENDENCIES = zlib \
+	$(if $(BR2_PACKAGE_LIBUSB),libusb)
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
