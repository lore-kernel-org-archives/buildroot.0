From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 May 2012 17:33:56 +0200
Subject: [Buildroot] [PATCH 1/1] gettext: fix build on !thread toolchains
In-Reply-To: <cover.1336318433.git.thomas.petazzoni@free-electrons.com>
References: <cover.1336318433.git.thomas.petazzoni@free-electrons.com>
Message-ID: <045b0f2f0b53edbc30d7f42e157488a5d18f52e8.1336318433.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the build visible at
http://autobuild.buildroot.org/results/0a14bf7c4ae145a9731118d9565e52d0bf70732d/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext-disable-tests.patch |   37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/gettext/gettext-disable-tests.patch

diff --git a/package/gettext/gettext-disable-tests.patch b/package/gettext/gettext-disable-tests.patch
new file mode 100644
index 0000000..eded261
--- /dev/null
+++ b/package/gettext/gettext-disable-tests.patch
@@ -0,0 +1,37 @@
+Disable gettext tests that require threads
+
+gettext fails to build with a toolchain with no threads support just
+because some gettext tests (that aren't used in Buildroot) require
+threads. We therefore disable the build of such tests.
+
+Since the change in Makefile.in is simple, we also make it in this
+patch, which avoids the need to autoreconf the gettext package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/gettext-tools/Makefile.am
+===================================================================
+--- a/gettext-tools/Makefile.am
++++ b/gettext-tools/Makefile.am
+@@ -20,7 +20,7 @@
+ AUTOMAKE_OPTIONS = 1.5 gnu no-dependencies
+ ACLOCAL_AMFLAGS = -I m4 -I ../gettext-runtime/m4 -I ../autoconf-lib-link/m4 -I ../m4 -I gnulib-m4 -I libgettextpo/gnulib-m4
+ 
+-SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 tests examples
++SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 examples
+ 
+ EXTRA_DIST = misc/DISCLAIM
+ MOSTLYCLEANFILES = core *.stackdump
+Index: b/gettext-tools/Makefile.in
+===================================================================
+--- a/gettext-tools/Makefile.in
++++ b/gettext-tools/Makefile.in
+@@ -484,7 +484,7 @@
+ top_srcdir = @top_srcdir@
+ AUTOMAKE_OPTIONS = 1.5 gnu no-dependencies
+ ACLOCAL_AMFLAGS = -I m4 -I ../gettext-runtime/m4 -I ../autoconf-lib-link/m4 -I ../m4 -I gnulib-m4 -I libgettextpo/gnulib-m4
+-SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 tests examples
++SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 examples
+ 
+ # Allow users to use "gnulib-tool --update".
+ 
-- 
1.7.9.5
