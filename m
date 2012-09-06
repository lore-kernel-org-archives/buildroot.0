From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Sep 2012 23:32:33 +0200
Subject: [Buildroot] [git commit] json-c: fix build when no thread support
	is available
Message-ID: <20120906213808.E873E99581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58149528d09b3342477beb3f5abce83775acdaff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/1d9a2e44da3aa627265b03763ca324c609c0c61c/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/json-c/json-c-no-reentrant.patch |   33 ++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/json-c/json-c-no-reentrant.patch b/package/json-c/json-c-no-reentrant.patch
new file mode 100644
index 0000000..a01181c
--- /dev/null
+++ b/package/json-c/json-c-no-reentrant.patch
@@ -0,0 +1,33 @@
+Do not pass -D_REENTRANT
+
+This flag is not needed to build this library, and prevents to build
+it with toolchains that don't have thread support.
+
+Since the Makefile.in change is a one-liner, we also do it in the
+patch to avoid having to autoreconfigure the package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
++AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE
+ 
+ EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc
+ 
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -219,7 +219,7 @@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
++AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE
+ EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc
+ lib_LTLIBRARIES = libjson.la
+ pkgconfigdir = $(libdir)/pkgconfig
