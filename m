From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:35:00 +0200
Subject: [Buildroot] [PATCH 05/12] Removed libmpd-0.17.0-libdir-la.patch
In-Reply-To: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <740aa79ec9978053df4a22aca98511bb455b7698.1287833623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Banky <martin.banky@gmail.com>

Now that libmpd.mk has been converted to autotools infrastructure, the patch is
no longer needed. Autotools will automatically apply the needed patch.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libmpd/libmpd-0.17.0-libdir-la.patch           |   89 --------------------
 package/multimedia/libmpd/libmpd.mk                |    1 -
 2 files changed, 0 insertions(+), 90 deletions(-)
 delete mode 100644 package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch

diff --git a/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch b/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch
deleted file mode 100644
index 561a338..0000000
--- a/package/multimedia/libmpd/libmpd-0.17.0-libdir-la.patch
+++ /dev/null
@@ -1,89 +0,0 @@
----
- ltmain.sh |   39 +++++++++++++++++++++++++++++++++------
- 1 file changed, 33 insertions(+), 6 deletions(-)
-
-Index: libmpd-0.17.0/ltmain.sh
-===================================================================
---- libmpd-0.17.0.orig/ltmain.sh
-+++ libmpd-0.17.0/ltmain.sh
-@@ -1056,7 +1056,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  func_echo "unable to infer tagged configuration"
--	  func_fatal_error "specify a tag with \`--tag'"
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  func_fatal_error "specify a tag with \`--tag'"
- #	else
- #	  func_verbose "using $tagname tagged configuration"
- 	fi
-@@ -2025,8 +2027,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  test "$inst_prefix_dir" = "$destdir" && \
--	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
-@@ -5419,8 +5426,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -5571,7 +5584,7 @@
- 	  *)
- 	    if test "$installed" = no; then
- 	      notinst_deplibs="$notinst_deplibs $lib"
--	      need_relink=yes
-+	      need_relink=no
- 	    fi
- 	    ;;
- 	  esac
-@@ -5901,6 +5914,16 @@
- 	    # Add the search paths of all dependency libraries
- 	    for deplib in $dependency_libs; do
- 	      case $deplib in
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 	      -L*) path="$deplib" ;;
- 	      *.la)
- 	        func_dirname "$deplib" "" "."
-@@ -8059,6 +8082,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		func_basename "$deplib"
diff --git a/package/multimedia/libmpd/libmpd.mk b/package/multimedia/libmpd/libmpd.mk
index 327f61a..47a802a 100644
--- a/package/multimedia/libmpd/libmpd.mk
+++ b/package/multimedia/libmpd/libmpd.mk
@@ -7,7 +7,6 @@ LIBMPD_VERSION = 0.17.0
 LIBMPD_SOURCE = libmpd-$(LIBMPD_VERSION).tar.gz
 LIBMPD_SITE = http://download.sarine.nl/download/Programs/gmpc/$(LIBMPD_VERSION)/
 LIBMPD_INSTALL_STAGING = YES
-LIBMPD_LIBTOOL_PATCH = NO
 LIBMPD_DEPENDENCIES = libglib2
 
 $(eval $(call AUTOTARGETS,package/multimedia,libmpd))
-- 
1.7.0.4
