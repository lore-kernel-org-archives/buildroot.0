From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 11:08:15 -0300
Subject: [Buildroot] [PATCH 1/6] support/libtool: add patch for newer
	versions
Message-ID: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to support newer (>2.4.2) versions.
Adjust patch logic to check for patchlevel greater than 2 (apply new patch) or
not (apply current patch).
Some people/distributions used unreleased versions, with the string being
2.4.2.x, this packages are AUTORECONFed and have to be kept like this since
the up-to-2.4.2 patch doesn't work, neither does the from-2.4.3 version patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-autotools.mk                       |  8 ++-
 support/libtool/buildroot-libtool-v2.4.4.patch | 95 ++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 support/libtool/buildroot-libtool-v2.4.4.patch

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index ad2d1a6..b20e20e 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -62,12 +62,18 @@ define LIBTOOL_PATCH_HOOK
 	$(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
 		ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+		ltmain_patchlevel=`sed -n '/^[     ]*VERSION=/{s/^[        ]*VERSION=//;p;q;}' $$i | \
+		sed -e 's/\([0-9].[0-9].\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
 		if test $${ltmain_version} = '1.5'; then \
 			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 		elif test $${ltmain_version} = "2.2"; then\
 			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 		elif test $${ltmain_version} = "2.4"; then\
-			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			if test $${ltmain_patchlevel} -gt 2; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.4.patch; \
+			else \
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			fi \
 		fi \
 	done
 endef
diff --git a/support/libtool/buildroot-libtool-v2.4.4.patch b/support/libtool/buildroot-libtool-v2.4.4.patch
new file mode 100644
index 0000000..bcdf30c
--- /dev/null
+++ b/support/libtool/buildroot-libtool-v2.4.4.patch
@@ -0,0 +1,95 @@
+Libtool fixes for cross-compilation, many past contributors/authors.
+Update based on libtool-2.4.4, useful for 2.4.3 as well but not 2.4.2.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/ltmain.sh	2014-12-16 09:51:23.068441045 -0300
++++ b/ltmain.sh	2014-12-16 09:57:10.509430339 -0300
+@@ -2687,8 +2687,8 @@
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
+@@ -4277,8 +4277,12 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
++
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  #test "$inst_prefix_dir" = "$destdir" && \
++	  #  func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -6550,7 +6554,8 @@
+ 	;;
+       -all-static | -static | -static-libtool-libs)
+ 	case $arg in
+-	-all-static)
++	# Make -static behave like -all-static -GZ
++	-all-static | -static)
+ 	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
+ 	    func_warning "complete static linking is impossible in this configuration"
+ 	  fi
+@@ -6559,12 +6564,6 @@
+ 	  fi
+ 	  prefer_static_libs=yes
+ 	  ;;
+-	-static)
+-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+-	    dlopen_self=$dlopen_self_static
+-	  fi
+-	  prefer_static_libs=built
+-	  ;;
+ 	-static-libtool-libs)
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+@@ -6858,7 +6857,8 @@
+       prevarg=$arg
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static -GZ
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  # See comment for -static flag below, for more details.
+ 	  func_append compile_command " $link_static_flag"
+@@ -7149,7 +7149,7 @@
+ 	continue
+ 	;;
+ 
+-      -static | -static-libtool-libs)
++      -static-libtool-libs)
+ 	# The effects of -static are defined in a previous loop.
+ 	# We used to do the same as -all-static on platforms that
+ 	# didn't have a PIC flag, but the assumption that the effects
+@@ -8112,7 +8112,7 @@
+ 	  *)
+ 	    if test no = "$installed"; then
+ 	      func_append notinst_deplibs " $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -10710,6 +10710,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++	      # Replacing uninstalled with installed can easily break crosscompilation,
++	      # since the installed path is generally the wrong architecture.  -CL
++	      newdependency_libs="$newdependency_libs $deplib"
++	      continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"
-- 
2.0.4
