From: Martin Banky <martin.banky@gmail.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] Added the ability to patch
	ltmain.sh based on version
Message-ID: <20101029181141.E22AB8D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=83af822f7b28169b096d592027e97c55cc83eb27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two versions of ltmain.sh in use in the buildroot system, 1.5.x and
2.2.x. buildroot-libtool.patch would only patch 1.5.x, which meant that for
2.2.x, a separate patch for the affected package had to be maintained. Modified
Makefile.autotools.in to check the version of ltmain.sh and apply the correct
patch.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in                      |   23 +++++--
 ...-libtool.patch => buildroot-libtool-v1.5.patch} |    0
 ...-libtool.patch => buildroot-libtool-v2.2.patch} |   77 +++++++++-----------
 3 files changed, 53 insertions(+), 47 deletions(-)
 copy package/{buildroot-libtool.patch => buildroot-libtool-v1.5.patch} (100%)
 rename package/{buildroot-libtool.patch => buildroot-libtool-v2.2.patch} (51%)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 589079b..87c3092 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -139,10 +139,16 @@ $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 #
 define LIBTOOL_PATCH_HOOK
 	@$(call MESSAGE,"Patching libtool")
-	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" -a \
-	"$$($$(PKG)_AUTORECONF)" != "YES"; then \
-	for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-		toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool.patch; \
+	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
+		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
+		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
+			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+			if test $$$${ltmain_version} = '1.5'; then \
+				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
+			elif test $$$${ltmain_version} = "2.2"; then\
+				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+			fi \
 		done \
 	fi
 endef
@@ -158,9 +164,14 @@ endif
 define AUTORECONF_HOOK
 	@$(call MESSAGE,"Autoreconfiguring")
 	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
-	$(Q)if test "$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | sed 's/\([0-9].[0-9]*\).*/\1/'`; \
+			if test $$$${ltmain_version} = "1.5"; then \
+				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
+			elif test $$$${ltmain_version} = "2.2"; then\
+				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+			fi \
 		done \
 	fi
 endef
diff --git a/package/buildroot-libtool.patch b/package/buildroot-libtool-v1.5.patch
similarity index 100%
copy from package/buildroot-libtool.patch
copy to package/buildroot-libtool-v1.5.patch
diff --git a/package/buildroot-libtool.patch b/package/buildroot-libtool-v2.2.patch
similarity index 51%
rename from package/buildroot-libtool.patch
rename to package/buildroot-libtool-v2.2.patch
index 57a7c58..0df00ae 100644
--- a/package/buildroot-libtool.patch
+++ b/package/buildroot-libtool-v2.2.patch
@@ -1,18 +1,31 @@
---- a/ltmain.sh	2006-03-11 13:49:04.000000000 -0500
-+++ b/ltmain.sh	2008-04-30 09:55:28.000000000 -0400
-@@ -273,8 +273,9 @@ func_infer_tag ()
+--- a/ltmain.sh	2009-11-16 06:23:18.000000000 -0700
++++ b/ltmain.sh	2010-09-18 20:25:06.000000000 -0700
+@@ -1048,8 +1048,8 @@ func_infer_tag ()
+ 	# was found and let the user know that the "--tag" command
  	# line option must be used.
  	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
+-	  func_echo "unable to infer tagged configuration"
+-	  func_fatal_error "specify a tag with \`--tag'"
++	  func_echo "defaulting to \`CC'"
++	  func_echo "if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -2407,8 +2408,14 @@ EOF
+@@ -2018,8 +2018,11 @@ func_mode_install ()
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  # test "$inst_prefix_dir" = "$destdir" && \
++	  #   func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -5412,8 +5415,14 @@ func_mode_link ()
  	    absdir="$abs_ladir"
  	    libdir="$abs_ladir"
  	  else
@@ -29,16 +42,16 @@
  	  fi
  	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
  	else
-@@ -2545,7 +2552,7 @@ EOF
- 	   { test "$use_static_libs" = no || test -z "$old_library"; }; then
- 	  if test "$installed" = no; then
- 	    notinst_deplibs="$notinst_deplibs $lib"
--	    need_relink=yes
-+	    need_relink=no
- 	  fi
- 	  # This is a shared library
- 
-@@ -5606,6 +5623,10 @@ fi\
+@@ -5564,7 +5573,7 @@ func_mode_link ()
+ 	  *)
+ 	    if test "$installed" = no; then
+ 	      notinst_deplibs="$notinst_deplibs $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -8052,6 +8061,10 @@ EOF
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
  	    for deplib in $dependency_libs; do
@@ -48,22 +61,4 @@
 +              continue
  	      case $deplib in
  	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5927,10 +5948,13 @@ relink_command=\"$relink_command\""
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
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
+ 		func_basename "$deplib"
-- 
1.7.1
