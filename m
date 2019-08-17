From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Aug 2019 20:40:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: fix static build with
 libidn
Message-ID: <20190817184058.11058-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/45a/45a94a494eb2b719ac338d2e734753b11a4a0144/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../ghostscript/0003-pkgconfig-libidn.patch   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/ghostscript/0003-pkgconfig-libidn.patch

diff --git a/package/ghostscript/0003-pkgconfig-libidn.patch b/package/ghostscript/0003-pkgconfig-libidn.patch
new file mode 100644
index 0000000000..baa8d27626
--- /dev/null
+++ b/package/ghostscript/0003-pkgconfig-libidn.patch
@@ -0,0 +1,23 @@
+fix static build with libidn
+
+Patch sent upstream as RFC:
+https://bugs.ghostscript.com/show_bug.cgi?id=701439
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ghostscript-9.27.orig/configure.ac ghostscript-9.27/configure.ac
+--- ghostscript-9.27.orig/configure.ac	2019-04-04 09:43:14.000000000 +0200
++++ ghostscript-9.27/configure.ac	2019-08-17 20:25:30.386869619 +0200
+@@ -804,7 +804,11 @@
+ UTF8DEVS=''
+ if test x$with_libidn != xno; then
+   HAVE_LIBIDN=-DHAVE_LIBIDN
+-  LIBS="$LIBS -lidn"
++  if test "x$BUILD_PKGCONFIG" != x; then
++    LIBS="$LIBS `$BUILD_PKGCONFIG --libs libidn`"
++  else
++    LIBS="$LIBS -lidn"
++  fi
+ 
+   if test x$found_iconv != xno; then
+     UTF8DEVS='$(PSD)utf8.dev'
-- 
2.20.1
