From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 28 Feb 2008 22:43:11 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
References: <20080228134622.9A21312016F@busybox.net>
Message-ID: <00bb01c87a52$f578c9e0$0100a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Author: sjhill
> Date: 2008-02-28 05:46:22 -0800 (Thu, 28 Feb 2008)
> New Revision: 21137
> 
> Log:
> Clean up patches and applying of them.
> 
> 
> Added:
>   trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch
> 
> Removed:
>   trunk/buildroot/package/libpng/libdir-la.patch
>   trunk/buildroot/package/libpng/remove-setjmp-error.patch
> 
> Modified:
>   trunk/buildroot/package/libpng/libpng.mk
> 

Why was the "libdir-la.patch" patch removed?

Best Regards
Ulf Samuelsson



> 
> Changeset:
> Deleted: trunk/buildroot/package/libpng/libdir-la.patch
> ===================================================================
> --- trunk/buildroot/package/libpng/libdir-la.patch 2008-02-28 13:14:42 UTC (rev 21136)
> +++ trunk/buildroot/package/libpng/libdir-la.patch 2008-02-28 13:46:22 UTC (rev 21137)
> @@ -1,77 +0,0 @@
> ---- libpng-1.2.12/ltmain.sh.orig 2006-06-05 09:12:42.000000000 -0600
> -+++ libpng-1.2.12/ltmain.sh 2007-01-13 14:39:14.000000000 -0700
> -@@ -322,8 +322,9 @@
> - # line option must be used.
> - if test -z "$tagname"; then
> -   $echo "$modename: unable to infer tagged configuration"
> --   $echo "$modename: specify a tag with \`--tag'" 1>&2
> --   exit $EXIT_FAILURE
> -+   $echo "$modename: defaulting to \`CC'"
> -+   $echo "$modename: if this is not correct, specify a tag with \`--tag'"
> -+#   exit $EXIT_FAILURE
> - #        else
> - #          $echo "$modename: using $tagname tagged configuration"
> - fi
> -@@ -2453,8 +2454,14 @@
> -     absdir="$abs_ladir"
> -     libdir="$abs_ladir"
> -   else
> --     dir="$libdir"
> --     absdir="$libdir"
> -+            # Adding 'libdir' from the .la file to our library search paths
> -+            # breaks crosscompilation horribly.  We cheat here and don't add
> -+            # it, instead adding the path where we found the .la.  -CL
> -+     dir="$abs_ladir"
> -+     absdir="$abs_ladir"
> -+     libdir="$abs_ladir"
> -+     #dir="$libdir"
> -+     #absdir="$libdir"
> -   fi
> -   test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
> - else
> -@@ -2935,6 +2942,16 @@
> - esac
> - if grep "^installed=no" $deplib > /dev/null; then
> -   path="$absdir/$objdir"
> -+# This interferes with crosscompilation. -CL
> -+# else
> -+#   eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
> -+#   if test -z "$libdir"; then
> -+#     $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
> -+#     exit 1
> -+#   fi
> -+#   if test "$absdir" != "$libdir"; then
> -+#     $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
> -+#   fi
> - else
> -   eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
> -   if test -z "$libdir"; then
> -@@ -5659,6 +5676,10 @@
> -     # Replace all uninstalled libtool libraries with the installed ones
> -     newdependency_libs=
> -     for deplib in $dependency_libs; do
> -+              # Replacing uninstalled with installed can easily break crosscompilation,
> -+              # since the installed path is generally the wrong architecture.  -CL
> -+              newdependency_libs="$newdependency_libs $deplib"
> -+              continue
> -       case $deplib in
> -       *.la)
> - name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
> -@@ -6028,10 +6049,13 @@
> -   # At present, this check doesn't affect windows .dll's that
> -   # are installed into $libdir/../bin (currently, that works fine)
> -   # but it's something to keep an eye on.
> --   if test "$inst_prefix_dir" = "$destdir"; then
> --     $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
> --     exit $EXIT_FAILURE
> --   fi
> -+   #
> -+   # This breaks install into our staging area.  -PB
> -+   # 
> -+   # if test "$inst_prefix_dir" = "$destdir"; then
> -+   #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
> -+   #   exit $EXIT_FAILURE
> -+   # fi
> - 
> -   if test -n "$inst_prefix_dir"; then
> -     # Stick the inst_prefix_dir data into the link command.
> 
> Added: trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch
> ===================================================================
> --- trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch                         (rev 0)
> +++ trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch 2008-02-28 13:46:22 UTC (rev 21137)
> @@ -0,0 +1,17 @@
> +diff -ur libpng-1.2.16/pngconf.h libpng-1.2.16-patched/pngconf.h
> +--- libpng-1.2.16/pngconf.h 2007-01-31 07:22:33.000000000 -0600
> ++++ libpng-1.2.16-patched/pngconf.h 2008-02-27 17:40:23.707516659 -0600
> +@@ -310,13 +310,6 @@
> + #      define PNG_SAVE_BSD_SOURCE
> + #      undef _BSD_SOURCE
> + #    endif
> +-#    ifdef _SETJMP_H
> +-     /* If you encounter a compiler error here, see the explanation
> +-      * near the end of INSTALL.
> +-      */
> +-         __png.h__ already includes setjmp.h;
> +-         __dont__ include it again.;
> +-#    endif
> + #  endif /* __linux__ */
> + 
> +    /* include setjmp.h for error handling */
> 
> Modified: trunk/buildroot/package/libpng/libpng.mk
> ===================================================================
> --- trunk/buildroot/package/libpng/libpng.mk 2008-02-28 13:14:42 UTC (rev 21136)
> +++ trunk/buildroot/package/libpng/libpng.mk 2008-02-28 13:46:22 UTC (rev 21137)
> @@ -34,6 +34,7 @@
> 
> $(LIBPNG_DIR)/.unpacked: $(DL_DIR)/$(LIBPNG_SOURCE)
>  $(LIBPNG_CAT) $(DL_DIR)/$(LIBPNG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> + toolchain/patch-kernel.sh $(LIBPNG_DIR) package/libpng/ libpng\*.patch
>  $(CONFIG_UPDATE) $(LIBPNG_DIR)
>  touch $@
> 
> 
> Deleted: trunk/buildroot/package/libpng/remove-setjmp-error.patch
> ===================================================================
> --- trunk/buildroot/package/libpng/remove-setjmp-error.patch 2008-02-28 13:14:42 UTC (rev 21136)
> +++ trunk/buildroot/package/libpng/remove-setjmp-error.patch 2008-02-28 13:46:22 UTC (rev 21137)
> @@ -1,17 +0,0 @@
> -diff -ur libpng-1.2.16/pngconf.h libpng-1.2.16-patched/pngconf.h
> ---- libpng-1.2.16/pngconf.h 2007-01-31 07:22:33.000000000 -0600
> -+++ libpng-1.2.16-patched/pngconf.h 2008-02-27 17:40:23.707516659 -0600
> -@@ -310,13 +310,6 @@
> - #      define PNG_SAVE_BSD_SOURCE
> - #      undef _BSD_SOURCE
> - #    endif
> --#    ifdef _SETJMP_H
> --     /* If you encounter a compiler error here, see the explanation
> --      * near the end of INSTALL.
> --      */
> --         __png.h__ already includes setjmp.h;
> --         __dont__ include it again.;
> --#    endif
> - #  endif /* __linux__ */
> - 
> -    /* include setjmp.h for error handling */
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
