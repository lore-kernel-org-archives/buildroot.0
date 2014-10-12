From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 19:32:42 +0200
Subject: [Buildroot] [PATCH v2] libevent: Use github call & fix patch
Message-ID: <1413135162-16654-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to uses the github helper since we download a generated tarball
from the tag anyway.

We also need to uses AUTORECONF as theses releases don't contains
'configure' and such.

The patchs that was already present is updated to apply against
Makefile.am instead of Makefile.in

The seconds patchs is backported from upstream to remove the usage of
$(top_src_dirs) which makes current autotools error.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
   - Fix the added patches so they have correct SoB (Thomas Petazzoni)
   - Add SoB (Thomas Petazzoni)
   - Add comment for autoreconf (Yann E. Morin)
---
 .../0001-Disable-building-test-programs.patch      | 30 +++++++++
 .../0002-Avoid-using-top_srcdir-in-TESTS.patch     | 71 ++++++++++++++++++++++
 .../libevent-disable-building-test-programs.patch  | 30 ---------
 package/libevent/libevent.mk                       |  5 +-
 4 files changed, 104 insertions(+), 32 deletions(-)
 create mode 100644 package/libevent/0001-Disable-building-test-programs.patch
 create mode 100644 package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch
 delete mode 100644 package/libevent/libevent-disable-building-test-programs.patch

diff --git a/package/libevent/0001-Disable-building-test-programs.patch b/package/libevent/0001-Disable-building-test-programs.patch
new file mode 100644
index 0000000..eb1acfd
--- /dev/null
+++ b/package/libevent/0001-Disable-building-test-programs.patch
@@ -0,0 +1,30 @@
+From 4b5a135fa681e85eb6988a379f59f3c7a41cc48c Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Fri, 21 Jun 2013 15:25:11 -0700
+Subject: [PATCH 1/2] Disable building test programs
+
+We are not really interested in building test programs.
+Moreover, these programs use fork() function that is
+not available on MMU-less architectures.
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 42879a3..dc90359 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -126,7 +126,7 @@ else
+ noinst_LTLIBRARIES =  $(LIBEVENT_LIBS_LA)
+ endif
+ 
+-SUBDIRS = . include sample test
++SUBDIRS = . include sample
+ 
+ if BUILD_WIN32
+ 
+-- 
+2.1.1
+
diff --git a/package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch b/package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch
new file mode 100644
index 0000000..54f03cc
--- /dev/null
+++ b/package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch
@@ -0,0 +1,71 @@
+From 366165fc19e862d08ff51ee2bbbff253fc234dd1 Mon Sep 17 00:00:00 2001
+From: Nick Mathewson <nickm@torproject.org>
+Date: Fri, 8 Feb 2013 22:10:05 -0500
+Subject: [PATCH 2/2] Avoid using $(top_srcdir) in TESTS.
+
+Newer automakes don't like this.
+
+Signed-off-by: Nick Mathewson <nickm@torproject.org>
+----
+Patch backported from upstream:
+https://github.com/libevent/libevent/commit/2863c837007c9f28ae542663a6098c91e704b3ca.patch
+
+Slight modifications to test/Makefile.am
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ Makefile.am      |  4 +++-
+ test/Makefile.am | 10 +++++++++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index dc90359..c34576d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -128,6 +128,8 @@ endif
+ 
+ SUBDIRS = . include sample
+ 
++DISTCLEANFILES=
++
+ if BUILD_WIN32
+ 
+ SYS_LIBS = -lws2_32 -lshell32 -ladvapi32
+@@ -239,5 +241,5 @@ doxygen: FORCE
+ 	doxygen $(srcdir)/Doxyfile
+ FORCE:
+ 
+-DISTCLEANFILES = *~ libevent.pc ./include/event2/event-config.h
++DISTCLEANFILES += *~ libevent.pc ./include/event2/event-config.h
+ 
+diff --git a/test/Makefile.am b/test/Makefile.am
+index b10c41a..e2f4f4e 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -5,6 +5,7 @@
+ # See LICENSE for copying information.
+ 
+ AUTOMAKE_OPTIONS = foreign
++DISTCLEANFILES=
+ 
+ AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/compat -I$(top_srcdir)/include -I../include -DTINYTEST_LOCAL
+ 
+@@ -19,7 +20,14 @@ endif
+ EXTRA_PROGRAMS = regress
+ noinst_HEADERS = tinytest.h tinytest_macros.h regress.h tinytest_local.h
+ 
+-TESTS = $(top_srcdir)/test/test.sh
++# We need to copy this file, since automake doesn't want us to use top_srcdir
++# in TESTS.
++TESTS = test/test-script.sh
++
++test/test-script.sh: test/test.sh
++ cp $< $@
++
++DISTCLEANFILES += test/test-script.s
+ 
+ BUILT_SOURCES =
+ if BUILD_REGRESS
+-- 
+2.1.1
+
diff --git a/package/libevent/libevent-disable-building-test-programs.patch b/package/libevent/libevent-disable-building-test-programs.patch
deleted file mode 100644
index 4b0f0d9..0000000
--- a/package/libevent/libevent-disable-building-test-programs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e932c8864e1bb8b6a7901d4b049a1100c4becba5 Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Fri, 21 Jun 2013 15:25:11 -0700
-Subject: [PATCH] Disable building test programs
-
-We are not really interested in building test programs.
-Moreover, these programs use fork() function that is
-not available on MMU-less architectures.
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- Makefile.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 2ebefa2..4fba1ff 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -487,7 +487,7 @@ LIBEVENT_LIBS_LA = libevent.la libevent_core.la libevent_extra.la \
- @INSTALL_LIBEVENT_TRUE at lib_LTLIBRARIES = $(LIBEVENT_LIBS_LA)
- @INSTALL_LIBEVENT_TRUE at pkgconfig_DATA = $(LIBEVENT_PKGCONFIG)
- @INSTALL_LIBEVENT_FALSE at noinst_LTLIBRARIES = $(LIBEVENT_LIBS_LA)
--SUBDIRS = . include sample test
-+SUBDIRS = . include sample
- @BUILD_WIN32_FALSE at SYS_LIBS = 
- @BUILD_WIN32_TRUE at SYS_LIBS = -lws2_32 -lshell32 -ladvapi32
- @BUILD_WIN32_FALSE at SYS_SRC = $(am__append_5) $(am__append_6) \
--- 
-1.7.4.1
-
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 73be502..8d325da 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -5,11 +5,12 @@
 ################################################################################
 
 LIBEVENT_VERSION = 2.0.21
-LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
-LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
+LIBEVENT_SITE = $(call github,libevent,libevent,release-$(LIBEVENT_VERSION)-stable)
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3c, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
+# Straight from the repository, need to generate autotools files
+LIBEVENT_AUTORECONF = YES
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
-- 
2.1.1
