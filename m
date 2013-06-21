From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 21 Jun 2013 16:59:03 -0700
Subject: [Buildroot] [PATCH] libevent: disable building test programs
Message-ID: <1371859143-31329-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libevent test programs use fork(), function
that is not available on MMU-less architecture.

This patch prevents compiling libevent test programs
so that library can successfully build on architectures
like blackfin

Fixes:
http://autobuild.buildroot.org/results/2e0/2e0422f1042d0cb00f5bab0dc190930581ed4ef2/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 .../libevent-disable-building-test-programs.patch  |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/libevent/libevent-disable-building-test-programs.patch

diff --git a/package/libevent/libevent-disable-building-test-programs.patch b/package/libevent/libevent-disable-building-test-programs.patch
new file mode 100644
index 0000000..4b0f0d9
--- /dev/null
+++ b/package/libevent/libevent-disable-building-test-programs.patch
@@ -0,0 +1,30 @@
+From e932c8864e1bb8b6a7901d4b049a1100c4becba5 Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Fri, 21 Jun 2013 15:25:11 -0700
+Subject: [PATCH] Disable building test programs
+
+We are not really interested in building test programs.
+Moreover, these programs use fork() function that is
+not available on MMU-less architectures.
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ Makefile.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 2ebefa2..4fba1ff 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -487,7 +487,7 @@ LIBEVENT_LIBS_LA = libevent.la libevent_core.la libevent_extra.la \
+ @INSTALL_LIBEVENT_TRUE at lib_LTLIBRARIES = $(LIBEVENT_LIBS_LA)
+ @INSTALL_LIBEVENT_TRUE at pkgconfig_DATA = $(LIBEVENT_PKGCONFIG)
+ @INSTALL_LIBEVENT_FALSE at noinst_LTLIBRARIES = $(LIBEVENT_LIBS_LA)
+-SUBDIRS = . include sample test
++SUBDIRS = . include sample
+ @BUILD_WIN32_FALSE at SYS_LIBS = 
+ @BUILD_WIN32_TRUE at SYS_LIBS = -lws2_32 -lshell32 -ladvapi32
+ @BUILD_WIN32_FALSE at SYS_SRC = $(am__append_5) $(am__append_6) \
+-- 
+1.7.4.1
+
-- 
1.7.4.1
