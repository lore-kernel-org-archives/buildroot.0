From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 16:13:12 +0200
Subject: [Buildroot] [PATCH] json-c: fix build when no thread support is
	available
In-Reply-To: <1345903992-27961-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1345903992-27961-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1345903992-27961-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/1d9a2e44da3aa627265b03763ca324c609c0c61c/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/json-c/json-c-no-reentrant.patch |   33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/json-c/json-c-no-reentrant.patch

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
-- 
1.7.9.5
