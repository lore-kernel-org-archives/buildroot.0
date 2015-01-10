From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 10 Jan 2015 15:34:26 +0200
Subject: [Buildroot] [PATCH v2] dillo: remove poisoned paths from configure
Message-ID: <20150110133426.GA21767@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/10f/10f7ba386a13753c942139b8bc13ca74d8932f3a/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/dillo/0002-usr-local-include.patch | 27 +++++++++++++++++++++++++++
 package/dillo/dillo.mk                     |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 package/dillo/0002-usr-local-include.patch

diff --git a/package/dillo/0002-usr-local-include.patch b/package/dillo/0002-usr-local-include.patch
new file mode 100644
index 0000000..0c3fed2
--- /dev/null
+++ b/package/dillo/0002-usr-local-include.patch
@@ -0,0 +1,27 @@
+Do not add (possibly poisoned) /usr/local/include and /usr/local/lib
+to gcc and ld search paths in configure.
+
+With BR2_COMPILER_PARANOID_UNSAFE_PATH enabled, poisoned paths result
+in hard errors, failing affected configure tests.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,16 +57,6 @@
+ AC_TYPE_INT32_T
+ AC_TYPE_UINT32_T
+ 
+-dnl --------------------------------------
+-dnl Check whether to add /usr/local or not
+-dnl (this is somewhat a religious problem)
+-dnl --------------------------------------
+-dnl
+-if test "`$CPP -v < /dev/null 2>&1 | grep '/usr/local/include' 2>&1`" = ""; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+-
+ dnl ------------------------------------
+ dnl Check for socket libs (AIX, Solaris)
+ dnl ------------------------------------
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 9bdd56f..d2dc761 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -9,7 +9,7 @@ DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
 DILLO_SITE = http://www.dillo.org/download
 DILLO_LICENSE = GPLv3+
 DILLO_LICENSE_FILES = COPYING
-# For 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
+# configure.ac gets patched, so autoreconf is necessary
 DILLO_AUTORECONF = YES
 DILLO_DEPENDENCIES = fltk zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.0.3
