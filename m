From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 9 Jan 2015 14:36:45 +0200
Subject: [Buildroot] [PATCH] dillo: avoid poisoned paths in configure
Message-ID: <20150109123645.GA23533@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/10f/10f7ba386a13753c942139b8bc13ca74d8932f3a/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/dillo/0002-usr-local-include.patch | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/dillo/0002-usr-local-include.patch

diff --git a/package/dillo/0002-usr-local-include.patch b/package/dillo/0002-usr-local-include.patch
new file mode 100644
index 0000000..eb27742
--- /dev/null
+++ b/package/dillo/0002-usr-local-include.patch
@@ -0,0 +1,41 @@
+Do not add (possibly poisoned) /usr/local/include and /usr/local/lib
+to gcc and ld search paths in configure.
+
+With BR2_COMPILER_PARANOID_UNSAFE_PATH enabled, poisoned paths result
+in hard errors, failing affected configure tests.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/configure
++++ b/configure
+@@ -5543,11 +5543,6 @@
+   esac
+ 
+ 
+-if test "`$CPP -v < /dev/null 2>&1 | grep '/usr/local/include' 2>&1`" = ""; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+-
+ for ac_func in gethostbyname
+ do :
+   ac_fn_c_check_func "$LINENO" "gethostbyname" "ac_cv_func_gethostbyname"
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
-- 
2.0.3
