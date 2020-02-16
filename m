From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Feb 2020 21:02:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/gensio: add libgensio.pc
Message-ID: <20200216200242.1414766-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/0002-Add-libgensio.pc.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/gensio/0002-Add-libgensio.pc.patch

diff --git a/package/gensio/0002-Add-libgensio.pc.patch b/package/gensio/0002-Add-libgensio.pc.patch
new file mode 100644
index 0000000000..61bba89580
--- /dev/null
+++ b/package/gensio/0002-Add-libgensio.pc.patch
@@ -0,0 +1,73 @@
+From 4ac29c3d2c33b084214b05c568c68cfe4980939b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 12 Feb 2020 08:49:34 +0100
+Subject: [PATCH] Add libgensio.pc
+
+gensio can optionally depends on openssl so add libgensio.pc to allow
+packages (such as ser2net) that link statically with gensio to use
+pkg-config to retrieve those static dependencies
+
+For example, this will avoid the following build failure on ser2net:
+
+checking gensio/gensio.h usability... yes
+checking gensio/gensio.h presence... yes
+checking for gensio/gensio.h... yes
+checking for str_to_gensio in -lgensio... no
+configure: error: libgensio won't link, please install gensio dev package
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f15cf961ddaf849987afce01ede0e3d1e77a0fc0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cminyard/gensio/pull/12]
+---
+ configure.ac        |  1 +
+ lib/Makefile.am     |  5 +++++
+ lib/libgensio.pc.in | 10 ++++++++++
+ 3 files changed, 16 insertions(+)
+ create mode 100644 lib/libgensio.pc.in
+
+diff --git a/configure.ac b/configure.ac
+index 2f0221e..8cc8eff 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -267,6 +267,7 @@ if test "x$enable_internal_trace" != xno; then
+ fi
+ 
+ AC_OUTPUT([Makefile
++	lib/libgensio.pc
+ 	lib/Makefile
+ 	include/Makefile
+ 	include/gensio/Makefile
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index aacc618..d39b889 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -25,3 +25,8 @@ libgensio_la_SOURCES = \
+ libgensio_la_LDFLAGS = $(OPENSSL_LIBS)
+ 
+ EXTRA_DIST = README.rst
++
++# This variable must have 'exec' in its name, in order to be installed
++# by 'install-exec' target (instead of default 'install-data')
++pkgconfigexecdir = $(libdir)/pkgconfig
++pkgconfigexec_DATA = libgensio.pc
+diff --git a/lib/libgensio.pc.in b/lib/libgensio.pc.in
+new file mode 100644
+index 0000000..23451a3
+--- /dev/null
++++ b/lib/libgensio.pc.in
+@@ -0,0 +1,10 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: libgensio
++Description: A library to abstract stream I/O like serial port, TCP, telnet, UDP, SSL, IPMI SOL, etc. 
++Version: @VERSION@
++Libs: -L${libdir} -lgensio
++Libs.private: @OPENSSL_LIBS@
+-- 
+2.24.1
+
-- 
2.24.1
