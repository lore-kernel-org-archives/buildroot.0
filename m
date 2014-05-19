From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 02:34:01 +0000
Subject: [Buildroot] [buildroot][PATCH] Add isl package. This includes the
	correct URL for the library. This libary is used by needed by
	components that support the GCC graphite optimisations.
Message-ID: <BLU436-SMTP237E88398270F116F85CAABA8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Thomas <scjthm@live.com>
---
 package/Config.in                 |  1 +
 package/isl/Config.in             |  7 +++++++
 package/isl/isl-000-libtool.patch | 28 ++++++++++++++++++++++++++++
 package/isl/isl.mk                | 17 +++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/isl/Config.in
 create mode 100644 package/isl/isl-000-libtool.patch
 create mode 100644 package/isl/isl.mk

diff --git a/package/Config.in b/package/Config.in
index 07fd166..2e71210 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -778,6 +778,7 @@ source "package/fftw/Config.in"
 source "package/flann/Config.in"
 source "package/glibmm/Config.in"
 source "package/gmp/Config.in"
+source "package/isl/Config.in"
 source "package/gsl/Config.in"
 source "package/gtest/Config.in"
 source "package/libargtable2/Config.in"
diff --git a/package/isl/Config.in b/package/isl/Config.in
new file mode 100644
index 0000000..bc2a3ef
--- /dev/null
+++ b/package/isl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ISL
+	bool "isl"
+	select BR2_PACKAGE_GMP
+	help
+	  Library for manipulating sets and relations of integer points bounded by linear constraints.
+
+	  http://freecode.com/projects/isl
diff --git a/package/isl/isl-000-libtool.patch b/package/isl/isl-000-libtool.patch
new file mode 100644
index 0000000..319c45a
--- /dev/null
+++ b/package/isl/isl-000-libtool.patch
@@ -0,0 +1,28 @@
+--- a/ltmain.sh	2014-04-23 23:52:39.104640815 +0000
++++ b/ltmain.sh	2014-04-23 23:56:59.818000038 +0000
+@@ -2583,8 +2583,8 @@
+ 	# was found and let the user know that the "--tag" command
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+-	  func_echo "unable to infer tagged configuration"
+-	  func_fatal_error "specify a tag with '--tag'"
++	  func_echo "defaulting to \`CC'"
++	  func_echo "if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -4172,8 +4172,12 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
++	  #
++	 # This breaks install into our staging area.  -PB
++	 #
++	 # test "$inst_prefix_dir" = "$destdir" && \
++	 #   func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
++
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
new file mode 100644
index 0000000..614cae1
--- /dev/null
+++ b/package/isl/isl.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# isl
+#
+################################################################################
+
+ISL_VERSION = 0.13
+ISL_SITE = http://isl.gforge.inria.fr/
+ISL_LICENSE = MIT
+ISL_LICENSE_FILES = MIT
+ISL_INSTALL_STAGING = YES
+ISL_DEPENDENCIES = gmp
+
+ISL_LIBTOOL_PATCH = NO
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.3
