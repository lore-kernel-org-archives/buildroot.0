From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 22:18:11 +0100
Subject: [Buildroot] [git commit] hidapi: fix build with toolchains lacking
	C++ support
Message-ID: <20151230211827.89F3882758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26e1b249da4f041494f131dc9d1544419b50c87b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hidapi currently doesn't build on non-C++ capable toolchains due to
hidtest being a C++ source file, even if it in facts contains only C
code. This commit adds a patch that fixes this in the hidapi source
code.

Fixes:

  http://autobuild.buildroot.org/results/6ce/6ce0a4b8c7acb857005350a57c313b493bc6e2b7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ont-use-a-C-source-file-since-it-s-pure-C.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch b/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch
new file mode 100644
index 0000000..3ea4fdb
--- /dev/null
+++ b/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch
@@ -0,0 +1,47 @@
+From 2fb04c2245167e247b95400112b5dbea12fcb206 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 30 Dec 2015 20:02:29 +0100
+Subject: [PATCH] hidtest: dont' use a C++ source file, since it's pure C
+
+This allows to build the test program with toolchains that don't have
+C++ support.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ hidtest/Makefile.am                | 6 +++---
+ hidtest/{hidtest.cpp => hidtest.c} | 0
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+ rename hidtest/{hidtest.cpp => hidtest.c} (100%)
+
+diff --git a/hidtest/Makefile.am b/hidtest/Makefile.am
+index d278644..5f52c3f 100644
+--- a/hidtest/Makefile.am
++++ b/hidtest/Makefile.am
+@@ -4,17 +4,17 @@ AM_CPPFLAGS = -I$(top_srcdir)/hidapi/
+ if OS_LINUX
+ noinst_PROGRAMS = hidtest-libusb hidtest-hidraw
+ 
+-hidtest_hidraw_SOURCES = hidtest.cpp
++hidtest_hidraw_SOURCES = hidtest.c
+ hidtest_hidraw_LDADD = $(top_builddir)/linux/libhidapi-hidraw.la
+ 
+-hidtest_libusb_SOURCES = hidtest.cpp
++hidtest_libusb_SOURCES = hidtest.c
+ hidtest_libusb_LDADD = $(top_builddir)/libusb/libhidapi-libusb.la
+ else
+ 
+ # Other OS's
+ noinst_PROGRAMS = hidtest
+ 
+-hidtest_SOURCES = hidtest.cpp
++hidtest_SOURCES = hidtest.c
+ hidtest_LDADD = $(top_builddir)/$(backend)/libhidapi.la
+ 
+ endif
+diff --git a/hidtest/hidtest.cpp b/hidtest/hidtest.c
+similarity index 100%
+rename from hidtest/hidtest.cpp
+rename to hidtest/hidtest.c
+-- 
+2.6.4
+
