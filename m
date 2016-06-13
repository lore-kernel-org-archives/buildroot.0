From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Jun 2016 21:28:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: Fix pthread
	detection on bfin and arc
Message-ID: <1465846126-19316-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/593/593b5050473a83a9ddcada9de39f8f14ab38d554/
http://autobuild.buildroot.net/results/ff0/ff058a378b91740b5b399f32a6b375fbc3c8df06/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/0001-pthread-reentrant.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libmicrohttpd/0001-pthread-reentrant.patch

diff --git a/package/libmicrohttpd/0001-pthread-reentrant.patch b/package/libmicrohttpd/0001-pthread-reentrant.patch
new file mode 100644
index 0000000..4f576fa
--- /dev/null
+++ b/package/libmicrohttpd/0001-pthread-reentrant.patch
@@ -0,0 +1,31 @@
+Fix pthread detection
+
+The latest version bump included an update to m4/ax_pthread.m4 from
+GNU autoconf which changed the way configure looks for pthread support.
+
+On Linux the macro _REENTRANT is now being searched for:
+https://github.com/peti/autoconf-archive/commit/39683064bbccb4008f239262cb681a970bf53603#diff-851a07ee321dc42003ac94cf4a9628faR211
+which fails at least on arc and blackfin.
+
+Before the autoconf update _REENTRANT was not searched on Linux:
+https://github.com/peti/autoconf-archive/commit/39683064bbccb4008f239262cb681a970bf53603#diff-851a07ee321dc42003ac94cf4a9628faL273
+
+This patch removes the check for the Linux platform by patching the
+configure script directly to avoid an autoreconf run.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Problem reported upstream:
+ https://savannah.gnu.org/patch/?8186#comment24)
+
+diff -uNr libmicrohttpd-0.9.50.org/configure libmicrohttpd-0.9.50/configure
+--- libmicrohttpd-0.9.50.org/configure	2016-06-02 10:03:29.000000000 +0200
++++ libmicrohttpd-0.9.50/configure	2016-06-13 21:11:36.688144929 +0200
+@@ -13761,7 +13761,7 @@
+ # correctly enabled
+ 
+ case $host_os in
+-        darwin* | hpux* | linux* | osf* | solaris*)
++        darwin* | hpux* | osf* | solaris*)
+         ax_pthread_check_macro="_REENTRANT"
+         ;;
+ 
-- 
2.8.1
