From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2016 00:04:36 +0100
Subject: [Buildroot] [git commit] rpm: add patches to fix bfd.h related
	build issues
Message-ID: <20161208230509.7A31C807D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0018d7d6ba436a59875328fb3f372aff1888bff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds two patches to the rpm package to fix two separate but
related build issues:

 - The first patch fixes a build that occurs when rpm is built after
   elfutils, but without binutils. In this case, dwarf.h is present, so
   rpm enables the build of a number of additional tools. But one of
   them uses bfd.h, provided by binutils, without checking for its
   existence. So the first patch fixes that by checking for bfd.h
   existence before enabling the tool.

   Fixes:

     http://autobuild.buildroot.net/results/810/810e24cab65f67d143da29c78c0f89d37a851cd7/build-end.log

 - The second patch fixes a build issue that occurs when rpm is built
   after both dwarf and binutils. In this case, bfd.h complains because
   config.h is not included. That's a weird and silly issue in bfd.h
   that the binutils developers don't want to fix, and you have to
   define PACKAGE or PACKAGE_VERSION before including bfd.h to use it
   outside of binutils.

   Fixes:

     http://autobuild.buildroot.net/results/362/362502f89631c9ba1d71906527674657ccff01ed/build-end.log

Thanks a lot to James Knight <james.knight@rockwellcollins.com> for the
initial investigation about the first issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...h-to-enable-disable-sepdebugcrcfix-buildi.patch | 55 ++++++++++++++++++++++
 ...bugcrcfix.c-fix-build-with-recent-binutil.patch | 43 +++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/package/rpm/0001-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch b/package/rpm/0001-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
new file mode 100644
index 0000000..e1fd069
--- /dev/null
+++ b/package/rpm/0001-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
@@ -0,0 +1,55 @@
+From edadcf67980764c104c25c7c1a0ba91257b89698 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 8 Dec 2016 23:33:30 +0100
+Subject: [PATCH 1/2] Detect bfd.h to enable/disable sepdebugcrcfix building
+
+tools/sepdebugcrcfix includes <bfd.h>, but this header from binutils
+is not checked in the configure script. Due to this, sepdebugcrcfix is
+attempted to be built even when <bfd.h> is not available. This commit
+addresses that by adding the appropriate configure check.
+
+This fixes the following build error:
+
+tools/sepdebugcrcfix.c:31:17: fatal error: bfd.h: No such file or directory
+compilation terminated.
+make[3]: *** [tools/sepdebugcrcfix.o] Error 1
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am  | 2 ++
+ configure.ac | 3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 863138c..d8a68f0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -168,9 +168,11 @@ elfdeps_SOURCES =	tools/elfdeps.c
+ elfdeps_LDADD =		rpmio/librpmio.la
+ elfdeps_LDADD +=	@WITH_LIBELF_LIB@ @WITH_POPT_LIB@
+ 
++if HAS_BFD_H
+ rpmlibexec_PROGRAMS +=	sepdebugcrcfix
+ sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
+ sepdebugcrcfix_LDADD =	@WITH_LIBELF_LIB@
++endif # HAS_BFD_H
+ endif
+ endif
+ 
+diff --git a/configure.ac b/configure.ac
+index c5ae701..b99ecb8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -242,6 +242,9 @@ AC_CHECK_HEADERS([dwarf.h], [
+ ])
+ AM_CONDITIONAL(LIBDWARF,[test "$WITH_LIBDWARF" = yes])
+ 
++AC_CHECK_HEADERS([bfd.h])
++AM_CONDITIONAL(HAS_BFD_H, [test "${ac_cv_header_bfd_h}" = "yes"])
++
+ #=================
+ # Check for beecrypt library if requested.
+ AC_ARG_WITH(beecrypt, [  --with-beecrypt         build with beecrypt support ],,[with_beecrypt=no])
+-- 
+2.7.4
+
diff --git a/package/rpm/0002-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch b/package/rpm/0002-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
new file mode 100644
index 0000000..bebe945
--- /dev/null
+++ b/package/rpm/0002-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
@@ -0,0 +1,43 @@
+From 65afab91444d4996a8e61d1e2d27d52e18417ef5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 8 Dec 2016 23:45:55 +0100
+Subject: [PATCH 2/2] tools/sepdebugcrcfix.c: fix build with recent binutils
+
+Moderately recent binutils versions install a <bfd.h> header that
+checks if config.h is included. While this makes sense in binutils
+itself, it does not outside. So the binutils developers have added a
+check: if PACKAGE or PACKAGE_VERSION are defined, they assume you're
+re-using bfd.h outside of binutils, and therefore including it without
+including config.h is legit.
+
+So we take the same approch as numerous users of bfd.h: fake a PACKAGE
+definition. See for example tools/perf/util/srcline.c in the Linux
+kernel source tree.
+
+This fixes the following build error:
+
+In file included from tools/sepdebugcrcfix.c:31:0:
+/home/test/autobuild/run/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/bfd.h:35:2: error: #error config.h must be included before this header
+ #error config.h must be included before this header
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tools/sepdebugcrcfix.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
+index cd7fa02..e7b480f 100644
+--- a/tools/sepdebugcrcfix.c
++++ b/tools/sepdebugcrcfix.c
+@@ -28,6 +28,8 @@
+ #include <error.h>
+ #include <libelf.h>
+ #include <gelf.h>
++/* Needed to please <bfd.h> */
++#define PACKAGE "rpm"
+ #include <bfd.h>
+ 
+ #define _(x) x
+-- 
+2.7.4
+
