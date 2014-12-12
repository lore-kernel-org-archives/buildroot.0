From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Dec 2014 22:27:48 +0100
Subject: [Buildroot] [PATCH] package/nettle: fix shared-only build
Message-ID: <1418419668-13558-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changeset f1d3e09 (Build shared libraries only as the default) broke the
nettle package.

nettle really wants to statically link its tools, examples and testsuite
against its own libraries. But for a shared-only build, static libraries
are not even built, so the build breaks when trying to link any of them.

Fix that in two ways:

  - the proper way, by using whatever libraries are available, with a
    preference toward using shared libraries;

  - disabling both examples and testsuite since we do not need them.

Fixes numerous build failures:
    http://autobuild.buildroot.net/results/e93/e93da743c5b84b1bb6274aeee3fe3b52962c560c/
    http://autobuild.buildroot.net/results/51d/51d0138ff39c45603315dcedf1f654c18604e1a8/
    http://autobuild.buildroot.net/results/521/521d979658e402103f1a18fcfeab3f9705f0c000/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/nettle/0001-fix-shared-only-build.patch    | 75 ++++++++++++++++++++++
 .../nettle/0002-disable-testsuite-examples.patch   | 20 ++++++
 2 files changed, 95 insertions(+)
 create mode 100644 package/nettle/0001-fix-shared-only-build.patch
 create mode 100644 package/nettle/0002-disable-testsuite-examples.patch

diff --git a/package/nettle/0001-fix-shared-only-build.patch b/package/nettle/0001-fix-shared-only-build.patch
new file mode 100644
index 0000000..3c9b186
--- /dev/null
+++ b/package/nettle/0001-fix-shared-only-build.patch
@@ -0,0 +1,75 @@
+static/shared: use available libraries when linking our tools/examples/testsuite
+
+For a shared-only build, static libraries do not exist, so the build fails as
+soon as we try to link either of our tools, examples or testsuite utils.
+
+Use whatever libraries are available, with a preference toward using shared
+libraries.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN nettle-2.7.1.orig/config.make.in nettle-2.7.1/config.make.in
+--- nettle-2.7.1.orig/config.make.in	2013-05-28 16:21:53.000000000 +0200
++++ nettle-2.7.1/config.make.in	2014-12-12 19:56:07.031292752 +0100
+@@ -30,6 +30,8 @@
+ PACKAGE_VERSION = @PACKAGE_VERSION@
+ 
+ SHLIBCFLAGS = @SHLIBCFLAGS@
++ at IF_STATIC@LIBS_EXT = .a
++ at IF_SHARED@LIBS_EXT = .so
+ 
+ LIBNETTLE_MAJOR = @LIBNETTLE_MAJOR@
+ LIBNETTLE_MINOR = @LIBNETTLE_MINOR@
+diff -durN nettle-2.7.1.orig/tools/Makefile.in nettle-2.7.1/tools/Makefile.in
+--- nettle-2.7.1.orig/tools/Makefile.in	2013-05-28 16:21:54.000000000 +0200
++++ nettle-2.7.1/tools/Makefile.in	2014-12-12 19:57:12.499805574 +0100
+@@ -34,19 +34,19 @@
+ DISTFILES = $(SOURCES) Makefile.in input.h misc.h output.h parse.h
+ 
+ sexp_conv_OBJS = $(sexp_conv_SOURCES:.c=.$(OBJEXT)) $(getopt_OBJS)
+-sexp-conv$(EXEEXT): $(sexp_conv_OBJS) ../libnettle.a
++sexp-conv$(EXEEXT): $(sexp_conv_OBJS) ../libnettle$(LIBS_EXT)
+ 	$(LINK) $(sexp_conv_OBJS) -lnettle $(LIBS) -o $@
+ 
+-nettle-lfib-stream$(EXEEXT): nettle-lfib-stream.$(OBJEXT) ../libnettle.a
++nettle-lfib-stream$(EXEEXT): nettle-lfib-stream.$(OBJEXT) ../libnettle$(LIBS_EXT)
+ 	$(LINK) nettle-lfib-stream.$(OBJEXT) -lnettle $(LIBS) -o $@
+ 
+ pkcs1_conv_OBJS = $(pkcs1_conv_SOURCES:.c=.$(OBJEXT)) $(getopt_OBJS)
+-pkcs1-conv$(EXEEXT): $(pkcs1_conv_OBJS) ../libnettle.a ../libhogweed.a
++pkcs1-conv$(EXEEXT): $(pkcs1_conv_OBJS) ../libnettle$(LIBS_EXT) ../libhogweed$(LIBS_EXT)
+ 	$(LINK) $(pkcs1_conv_OBJS) -lhogweed -lnettle $(LIBS) -o $@
+ 
+ # FIXME: Avoid linking with gmp
+ nettle_hash_OBJS = $(nettle_hash_SOURCES:.c=.$(OBJEXT)) $(getopt_OBJS)
+-nettle-hash$(EXEEXT): $(nettle_hash_OBJS) ../libnettle.a
++nettle-hash$(EXEEXT): $(nettle_hash_OBJS) ../libnettle$(LIBS_EXT)
+ 	$(LINK) $(nettle_hash_OBJS) -lnettle $(LIBS) -o $@
+ 
+ 
+diff -durN nettle-2.7.1.orig/examples/Makefile.in nettle-2.7.1/examples/Makefile.in
+--- nettle-2.7.1.orig/examples/Makefile.in	2013-05-28 16:21:54.000000000 +0200
++++ nettle-2.7.1/examples/Makefile.in	2014-12-12 21:54:48.286251022 +0100
+@@ -117,8 +117,8 @@
+ 	-lhogweed -lnettle $(BENCH_LIBS) $(LIBS) $(OPENSSL_LIBFLAGS) \
+ 	-o hogweed-benchmark$(EXEEXT)
+ 
+-$(TARGETS) : io.$(OBJEXT) ../libnettle.a
+-$(HOGWEED_TARGETS): ../libhogweed.a
++$(TARGETS) : io.$(OBJEXT) ../libnettle$(LIBS_EXT)
++$(HOGWEED_TARGETS): ../libhogweed$(LIBS_EXT)
+ 
+ check: $(TS_ALL)
+ 	LD_LIBRARY_PATH=../.lib PATH="../.lib:$$PATH" srcdir="$(srcdir)" \
+diff -durN nettle-2.7.1.orig/testsuite/Makefile.in nettle-2.7.1/testsuite/Makefile.in
+--- nettle-2.7.1.orig/testsuite/Makefile.in	2013-05-28 16:21:54.000000000 +0200
++++ nettle-2.7.1/testsuite/Makefile.in	2014-12-12 21:55:30.414814549 +0100
+@@ -96,7 +96,7 @@
+ include $(srcdir)/.test-rules.make
+ 
+ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \
+-	../libnettle.a @IF_HOGWEED@ ../libhogweed.a
++	../libnettle$(LIBS_EXT) @IF_HOGWEED@ ../libhogweed$(LIBS_EXT)
+ 
+ # For use as, e.g.,
+ #
diff --git a/package/nettle/0002-disable-testsuite-examples.patch b/package/nettle/0002-disable-testsuite-examples.patch
new file mode 100644
index 0000000..82d97d5
--- /dev/null
+++ b/package/nettle/0002-disable-testsuite-examples.patch
@@ -0,0 +1,20 @@
+Makefile: disable testsuite and example
+
+We do not need them in the context of Buildroot.
+
+Also, they break for a shared-only build (but it's fixed in patch 0001).
+
+Signed-off-by:  "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN nettle-2.7.1.orig/Makefile.in nettle-2.7.1/Makefile.in
+--- nettle-2.7.1.orig/Makefile.in	2013-05-28 16:21:54.000000000 +0200
++++ nettle-2.7.1/Makefile.in	2014-12-12 19:57:12.499805574 +0100
+@@ -16,7 +16,7 @@
+ 
+ OPT_ASM_SOURCES = @OPT_ASM_SOURCES@
+ 
+-SUBDIRS = tools testsuite examples
++SUBDIRS = tools
+ 
+ include config.make
+ 
-- 
1.9.1
