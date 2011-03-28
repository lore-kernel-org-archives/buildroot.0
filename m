From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Mar 2011 21:45:06 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.autotools.in: add
	libtool v2.4 support
Message-ID: <20110328194623.C0431819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f055b266f11f8b72c60cf3b46bf081aaf97f5f6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages (like avahi) are now using libtool 2.4, so extend the libtool
handling to support those as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in        |    2 +
 package/buildroot-libtool-v2.4.patch |   47 ++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/buildroot-libtool-v2.4.patch

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d445348..88a06ea 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -145,6 +145,8 @@ define LIBTOOL_PATCH_HOOK
 				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
 				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+			elif test $$$${ltmain_version} = "2.4"; then\
+				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
diff --git a/package/buildroot-libtool-v2.4.patch b/package/buildroot-libtool-v2.4.patch
new file mode 100644
index 0000000..d82d610
--- /dev/null
+++ b/package/buildroot-libtool-v2.4.patch
@@ -0,0 +1,47 @@
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -1416,8 +1416,8 @@
+ 	# was found and let the user know that the "--tag" command
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+-	  func_echo "unable to infer tagged configuration"
+-	  func_fatal_error "specify a tag with \`--tag'"
++	  func_echo "defaulting to \`CC'"
++	  func_echo "if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -2962,8 +2962,11 @@
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
+@@ -6683,7 +6686,7 @@
+ 	  *)
+ 	    if test "$installed" = no; then
+ 	      func_append notinst_deplibs " $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -9257,6 +9260,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"
-- 
1.7.3.4
