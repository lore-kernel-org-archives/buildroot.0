From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:24:17 +0100
Subject: [Buildroot] [PATCH v5 13/19] infra-libtool: correctly prefix
 $libdir with $STAGING_DIR
In-Reply-To: <1482241596-31688-14-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-14-git-send-email-jezz@sysmic.org>
Message-ID: <85115e4c-e95c-af08-492a-cc69a2ebae1b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> Until now Builroot patched libtool in order to ignore `$libdir' provided by .la
                                                                             ^the
> file. It used the path where it found the .la instead of `$libdir'. However,
> since v1.5 libtool correctly prepend sysroot to `$libdir' as we can see a few
                                      ^s the
> lines below patched lines:
             ^the
> 
>   func_append newdependency_libs " ${lt_sysroot:+=}$libdir/$name"
> 
> (in fact, this line just prepend '=', and '=' is substituted later)
                                  ^s
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)


 Regards,
 Arnout

> ---
>  support/libtool/buildroot-libtool-v1.5.patch   | 32 ++------------------------
>  support/libtool/buildroot-libtool-v2.2.patch   | 30 +-----------------------
>  support/libtool/buildroot-libtool-v2.4.4.patch | 11 ---------
>  support/libtool/buildroot-libtool-v2.4.patch   | 11 ---------
>  4 files changed, 3 insertions(+), 81 deletions(-)
> 
> diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
> index cdd9c5a..609006a 100644
> --- a/support/libtool/buildroot-libtool-v1.5.patch
> +++ b/support/libtool/buildroot-libtool-v1.5.patch
> @@ -34,24 +34,7 @@
>   	if test -n "$link_static_flag"; then
>   	  compile_command="$compile_command $link_static_flag"
>   	  finalize_command="$finalize_command $link_static_flag"
> -@@ -2146,8 +2153,14 @@
> - 	    absdir="$abs_ladir"
> - 	    libdir="$abs_ladir"
> - 	  else
> --	    dir="$libdir"
> --	    absdir="$libdir"
> -+            # Adding 'libdir' from the .la file to our library search paths
> -+            # breaks crosscompilation horribly.  We cheat here and don't add
> -+            # it, instead adding the path where we found the .la.  -CL
> -+	    dir="$abs_ladir"
> -+	    absdir="$abs_ladir"
> -+	    libdir="$abs_ladir"
> -+	    #dir="$libdir"
> -+	    #absdir="$libdir"
> - 	  fi
> - 	else
> - 	  dir="$ladir/$objdir"
> -@@ -2272,7 +2285,7 @@
> +@@ -2272,7 +2279,7 @@
>   	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
>   	  if test "$installed" = no; then
>   	    notinst_deplibs="$notinst_deplibs $lib"
> @@ -60,18 +43,7 @@
>   	  fi
>   	  # This is a shared library
>   
> -@@ -5169,6 +5182,10 @@
> - 	    # Replace all uninstalled libtool libraries with the installed ones
> - 	    newdependency_libs=
> - 	    for deplib in $dependency_libs; do
> -+              # Replacing uninstalled with installed can easily break crosscompilation,
> -+              # since the installed path is generally the wrong architecture.  -CL
> -+              newdependency_libs="$newdependency_libs $deplib"
> -+              continue
> - 	      case $deplib in
> - 	      *.la)
> - 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
> -@@ -5487,10 +5504,13 @@
> +@@ -5487,10 +5494,13 @@
>   	  # At present, this check doesn't affect windows .dll's that
>   	  # are installed into $libdir/../bin (currently, that works fine)
>   	  # but it's something to keep an eye on.
> diff --git a/support/libtool/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
> index 8bb7826..3af0604 100644
> --- a/support/libtool/buildroot-libtool-v2.2.patch
> +++ b/support/libtool/buildroot-libtool-v2.2.patch
> @@ -67,24 +67,7 @@
>   	# The effects of -static are defined in a previous loop.
>   	# We used to do the same as -all-static on platforms that
>   	# didn't have a PIC flag, but the assumption that the effects
> -@@ -5739,8 +5738,14 @@
> - 	    absdir="$abs_ladir"
> - 	    libdir="$abs_ladir"
> - 	  else
> --	    dir="$libdir"
> --	    absdir="$libdir"
> -+            # Adding 'libdir' from the .la file to our library search paths
> -+            # breaks crosscompilation horribly.  We cheat here and don't add
> -+            # it, instead adding the path where we found the .la.  -CL
> -+	    dir="$abs_ladir"
> -+	    absdir="$abs_ladir"
> -+	    libdir="$abs_ladir"
> -+	    #dir="$libdir"
> -+	    #absdir="$libdir"
> - 	  fi
> - 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
> - 	else
> -@@ -5891,7 +5896,7 @@
> +@@ -5891,7 +5890,7 @@
>   	  *)
>   	    if test "$installed" = no; then
>   	      notinst_deplibs="$notinst_deplibs $lib"
> @@ -93,14 +76,3 @@
>   	    fi
>   	    ;;
>   	  esac
> -@@ -8373,6 +8378,10 @@
> - 	    # Replace all uninstalled libtool libraries with the installed ones
> - 	    newdependency_libs=
> - 	    for deplib in $dependency_libs; do
> -+              # Replacing uninstalled with installed can easily break crosscompilation,
> -+              # since the installed path is generally the wrong architecture.  -CL
> -+              newdependency_libs="$newdependency_libs $deplib"
> -+              continue
> - 	      case $deplib in
> - 	      *.la)
> - 		func_basename "$deplib"
> diff --git a/support/libtool/buildroot-libtool-v2.4.4.patch b/support/libtool/buildroot-libtool-v2.4.4.patch
> index bcdf30c..d71669b 100644
> --- a/support/libtool/buildroot-libtool-v2.4.4.patch
> +++ b/support/libtool/buildroot-libtool-v2.4.4.patch
> @@ -82,14 +82,3 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>   	    fi
>   	    ;;
>   	  esac
> -@@ -10710,6 +10710,10 @@
> - 	    # Replace all uninstalled libtool libraries with the installed ones
> - 	    newdependency_libs=
> - 	    for deplib in $dependency_libs; do
> -+	      # Replacing uninstalled with installed can easily break crosscompilation,
> -+	      # since the installed path is generally the wrong architecture.  -CL
> -+	      newdependency_libs="$newdependency_libs $deplib"
> -+	      continue
> - 	      case $deplib in
> - 	      *.la)
> - 		func_basename "$deplib"
> diff --git a/support/libtool/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
> index f610b1b..bf40c94 100644
> --- a/support/libtool/buildroot-libtool-v2.4.patch
> +++ b/support/libtool/buildroot-libtool-v2.4.patch
> @@ -76,14 +76,3 @@
>   	    fi
>   	    ;;
>   	  esac
> -@@ -9275,6 +9274,10 @@
> - 	    # Replace all uninstalled libtool libraries with the installed ones
> - 	    newdependency_libs=
> - 	    for deplib in $dependency_libs; do
> -+              # Replacing uninstalled with installed can easily break crosscompilation,
> -+              # since the installed path is generally the wrong architecture.  -CL
> -+              newdependency_libs="$newdependency_libs $deplib"
> -+              continue
> - 	      case $deplib in
> - 	      *.la)
> - 		func_basename "$deplib"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
