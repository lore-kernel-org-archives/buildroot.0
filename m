From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 15 Nov 2019 10:47:41 +0100
Subject: [Buildroot] [PATCH/next] modem-manager: fix order of libraries when
 linking
Message-ID: <20191115094741.59903-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build failure:
  http://autobuild.buildroot.net/results/2386d296fd00fca506053d213806200f4bca80d7/build-end.log

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---

Hey Thomas,

Haven't been able to locally reproduce this build failure, not even playing with --as-needed, but I believe this patch should solve it (applicable to next branch!)
Cheers!

---
 ...test-fix-order-of-included-libraries.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/modem-manager/0001-build-test-fix-order-of-included-libraries.patch

diff --git a/package/modem-manager/0001-build-test-fix-order-of-included-libraries.patch b/package/modem-manager/0001-build-test-fix-order-of-included-libraries.patch
new file mode 100644
index 0000000000..de3918fec0
--- /dev/null
+++ b/package/modem-manager/0001-build-test-fix-order-of-included-libraries.patch
@@ -0,0 +1,40 @@
+From 64b31d64c6824e33082cd947989f060be4b87d2f Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Fri, 15 Nov 2019 09:52:39 +0100
+Subject: [PATCH] build,test: fix order of included libraries
+
+Symbols are resolved forward, so if libhelpers depends on libmm-glib,
+it needs to be specified first.
+
+(cherry picked from commit 42dab8e827d84b86d0f7253ce68748758f29aef1)
+---
+ test/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 20e2a068..ba737bc5 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -87,8 +87,8 @@ mmsmspdu_CPPFLAGS = \
+
+ mmsmspdu_LDADD = \
+ 	$(MM_LIBS) \
+-	$(top_builddir)/libmm-glib/libmm-glib.la \
+ 	$(top_builddir)/src/libhelpers.la \
++	$(top_builddir)/libmm-glib/libmm-glib.la \
+ 	$(NULL)
+
+ ################################################################################
+@@ -112,8 +112,8 @@ mmsmsmonitor_CPPFLAGS = \
+
+ mmsmsmonitor_LDADD = \
+ 	$(MM_LIBS) \
+-	$(top_builddir)/libmm-glib/libmm-glib.la \
+ 	$(top_builddir)/src/libhelpers.la \
++	$(top_builddir)/libmm-glib/libmm-glib.la \
+ 	$(NULL)
+
+ ################################################################################
+--
+2.24.0
+
--
2.24.0
