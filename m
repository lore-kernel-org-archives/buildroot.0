From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Feb 2015 22:30:06 +0100
Subject: [Buildroot] [PATCH v2] package/libsrtp: fix static build with
	openssl
Message-ID: <1424986206-9552-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsrp forget to link with zlib for static build when openssl
support is requested.

The issue was reported upstream by Vicente Olivert Riera:
https://github.com/cisco/libsrtp/issues/97

Backport upstream patch for the upcoming libsrtp 1.5.2.
Since the libsrtp package already use AUTORECONF, apply only
the changes for configure.in.

Fixes:
http://autobuild.buildroot.net/results/a71/a71d85a5bb9af2ee82a8e61054025bceb03dbdeb/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
v2: revove the part of the patch for configure file (Baruch Siach)
---
 ...checks-for-libz-and-libdl-when-OpenSSL-is.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch

diff --git a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
new file mode 100644
index 0000000..acb2c9a
--- /dev/null
+++ b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
@@ -0,0 +1,33 @@
+From 3107a0161bf30f7e3e0c356c3d040d99634fbf5b Mon Sep 17 00:00:00 2001
+From: jfigus <foleyj@cisco.com>
+Date: Thu, 26 Feb 2015 12:25:08 -0500
+Subject: [PATCH] A autoconf checks for libz and libdl when OpenSSL is enabled
+ to allow for static linking of OpenSSL (via CFLAGS=-static).
+
+[Romain:
+  Drop the configure part of the patch since Buildroot
+  use AUTORECONF in libsrtp.mk]
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.in | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index ee30daf..71df46b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -147,6 +147,10 @@ if test "$enable_openssl" = "yes"; then
+    LDFLAGS="$LDFLAGS $(pkg-config --libs openssl)";
+    CFLAGS="$CFLAGS $(pkg-config --cflags openssl)";
+ 
++   AC_CHECK_LIB([dl], [dlopen], [],
++             [AC_MSG_FAILURE([can't find libdl])])
++   AC_CHECK_LIB([z], [inflate], [],
++             [AC_MSG_FAILURE([can't find libz])])
+    AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
+              [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
+    AC_CHECK_LIB([crypto], [EVP_aes_128_ctr], [],
+-- 
+1.9.3
+
-- 
1.9.3
