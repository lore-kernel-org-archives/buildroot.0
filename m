From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 4 Jul 2016 23:37:32 +0200
Subject: [Buildroot] [PATCH 1/2 v2] spidermonkey185: New package.
In-Reply-To: <1465483576-28267-2-git-send-email-nicolas.cavallari@green-communications.fr>
References: <20160520162929.04ca1b1b@free-electrons.com>
 <1465483576-28267-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1465483576-28267-2-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <CAGduivxXrJYZRt28=TOTbtBcZ4yd5jYO1NkTV1M8fMgCbni-_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas, all,

Thanks for your patch, I look forward to have spidermonkey, because we
can then update polkit, which is a long standing issue for me.
My comments are inline.

Some of your patches did not apply on the sources, I would recommend
that you  extract the sources, then move the directory somehere and do
a 'git init' then 'git add . && git commit -m "init"' and work in that
directory, when you are finished you can use 'git format-patch HEAD~n'
and collect your patch in a mailbox format.

Don't forget to add your SoB to the patches.

I have marked your two patches as "Changes Requested", you only have
to resend your patches when they are amended (of course you don't have
to agree on all the comments, feel free to discuss).

On Thu, Jun 9, 2016 at 4:46 PM, Nicolas Cavallari
<nicolas.cavallari@green-communications.fr> wrote:
> This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
> It is rather unmaintained, but some software still depend on it,
> such as couchdb.
>
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> v1 -> v2:
> * Moved package to Libraries/Other
> * Tried to make the package reconfigurable, but stopped when the patch
>   grew even larger than previous patches.  Instead, simplified the patch
>   to not force a specific arm version, to make the configure patch smaller.
> * Added patches to fix DESTDIR being embedded in the symlink and
>   remove the leftover nspr dependency.
> * Added comment on why we define symbols for the host compiler.
> * Added upstream patches to fix problems on various architectures,
>   taking inspiration for the patches that Debian uses.
> * Disabled the JIT on sparc64 because that does not compile.
> * Added host-perl and host-python, because they are used to build.
> * Changed license as per Arnout suggestion
>
>  package/Config.in                                  |   1 +
>  ...01-remove-unused-pkgconfg-nspr-dependency.patch |  18 +
>  .../0002-make-shlib-synlink-relative.patch         |  21 +
>  .../spidermonkey185/0003-remove-forced-armv5.patch |  40 ++
>  .../0004-regenerate-configure.patch                | 470 +++++++++++++++++++++
>  ...val_layout-on-64-bit-big-endian-platforms.patch |  90 ++++
>  ...tatic-assert-fix-strict-aliasing-warnings.patch |  93 ++++
>  ...heFlush-support-error-on-exotic-platforms.patch |  33 ++
>  package/spidermonkey185/Config.in                  |  14 +
>  package/spidermonkey185/spidermonkey185.hash       |   2 +
>  package/spidermonkey185/spidermonkey185.mk         |  33 ++
>  11 files changed, 815 insertions(+)
>  create mode 100644 package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>  create mode 100644 package/spidermonkey185/0002-make-shlib-synlink-relative.patch
>  create mode 100644 package/spidermonkey185/0003-remove-forced-armv5.patch
>  create mode 100644 package/spidermonkey185/0004-regenerate-configure.patch
>  create mode 100644 package/spidermonkey185/0005-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
>  create mode 100644 package/spidermonkey185/0006-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
>  create mode 100644 package/spidermonkey185/0007-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
>  create mode 100644 package/spidermonkey185/Config.in
>  create mode 100644 package/spidermonkey185/spidermonkey185.hash
>  create mode 100644 package/spidermonkey185/spidermonkey185.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ae74f17..4729b63 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1284,6 +1284,7 @@ endif
>         source "package/protobuf-c/Config.in"
>         source "package/qhull/Config.in"
>         source "package/qlibc/Config.in"
> +       source "package/spidermonkey185/Config.in"
>         source "package/startup-notification/Config.in"
>         source "package/tz/Config.in"
>         source "package/tzdata/Config.in"
> diff --git a/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
> new file mode 100644
> index 0000000..cef1aae
> --- /dev/null
> +++ b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
> @@ -0,0 +1,18 @@
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +Remove the dependency on nspr.
> +
> +This dependency was removed when spidermonkey was extracted from the
> +mozilla code base.  This is probably a left-over, since it is not used.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +--- spidermonkey185-1.0.0/js/src/mozjs185.pc.in        2016-05-23 13:41:28.430466213 +0200
> ++++ spidermonkey185-1.0.0/js/src/mozjs185.pc.in        2016-05-23 13:42:00.727558977 +0200
> +@@ -5,6 +5,5 @@
> + Name: SpiderMonkey 1.8.5
> + Description: The Mozilla library for JavaScript 1.8.5
> + Version: %MOZILLA_VERSION%
> +-Requires: nspr >= 4.7
> + Libs: -L${libdir} -lmozjs185
> + Cflags: -I${includedir}/js
> diff --git a/package/spidermonkey185/0002-make-shlib-synlink-relative.patch b/package/spidermonkey185/0002-make-shlib-synlink-relative.patch
> new file mode 100644
> index 0000000..c6bdce9

When I quickly grepped through the source, you can still find:
js/jsd/jsd_xpc.h:47:#include "nspr.h"

Won't that cause trouble ? Since we have libnspr, why don't we add the
dependencies and be done with it ?

> --- /dev/null
> +++ b/package/spidermonkey185/0002-make-shlib-synlink-relative.patch
> @@ -0,0 +1,21 @@
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +Fix the creation of the shared library symbolic links.
> +
> +Do not create absolute symbolic links that references DESTDIR.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +--- spidermonkey185-1.0.0/js/src/Makefile.in   2016-05-23 13:49:39.535010860 +0200
> ++++ spidermonkey185-1.0.0/js/src/Makefile.in   2016-05-23 13:50:06.555917036 +0200
> +@@ -888,8 +888,8 @@
> + ifeq (,$(HOST_BIN_SUFFIX))
> +       mv -f $(SHLIB_ANY_VER) $(SHLIB_EXACT_VER)
> +       @[ ! -h $(SHLIB_ABI_VER) ] || rm -f $(SHLIB_ABI_VER)
> +-      ln -s $(SHLIB_EXACT_VER) $(SHLIB_ABI_VER)
> +-      ln -s $(SHLIB_ABI_VER) $(SHLIB_ANY_VER)
> ++      ln -s $(notdir $(SHLIB_EXACT_VER)) $(SHLIB_ABI_VER)
> ++      ln -s $(notdir $(SHLIB_ABI_VER)) $(SHLIB_ANY_VER)
> + endif
> + endif
> + ifneq (,$(IMPORT_LIBRARY))
> diff --git a/package/spidermonkey185/0003-remove-forced-armv5.patch b/package/spidermonkey185/0003-remove-forced-armv5.patch
> new file mode 100644
> index 0000000..f68bc92
> --- /dev/null
> +++ b/package/spidermonkey185/0003-remove-forced-armv5.patch
> @@ -0,0 +1,40 @@
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +Do not force an ARM variant.
> +
> +Buildroot already passes the correct CFLAGS.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +--- spidermonkey185-1.0.0/js/src/configure.in  2016-05-23 17:10:59.166657848 +0200
> ++++ spidermonkey185-1.0.0/js/src/configure.in  2016-05-23 17:11:21.987444482 +0200
> +@@ -4654,12 +4654,6 @@
> + dnl ========================================================
> + MOZ_ARG_HEADER(Individual module options)
> +
> +-dnl Setup default CPU arch for arm target
> +-case "$target_cpu" in
> +-  arm*)
> +-    MOZ_ARM_ARCH=armv7
> +-  ;;
> +-esac
> + dnl ========================================================
> + dnl = Enable building the Thumb2 instruction set
> + dnl ========================================================
> +@@ -4714,16 +4708,6 @@
> +       AC_MSG_ERROR([--with-cpu-arch=armv7 is not supported for non-ARM CPU architectures])
> +     ;;
> +   esac
> +-else
> +-  case "$target_cpu" in
> +-    arm*)
> +-      if test "$GNU_CC"; then
> +-        CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -msoft-float"
> +-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -msoft-float"
> +-        ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork -msoft-float"
> +-      fi
> +-      ;;
> +-  esac
> + fi
> +
> + AC_SUBST(MOZ_THUMB2)
Can't you patch the configure straight away so we don't have the ugly
patch that rewrite the configure script ?
> diff --git a/package/spidermonkey185/0004-regenerate-configure.patch b/package/spidermonkey185/0004-regenerate-configure.patch
> new file mode 100644
> index 0000000..dc2bdc7
> --- /dev/null
> +++ b/package/spidermonkey185/0004-regenerate-configure.patch
> @@ -0,0 +1,470 @@
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +Use the antique autoconf2.13 to regenerate the configure script.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +
> +--- spidermonkey185-1.0.0/js/src/configure     2016-05-25 11:26:19.392163540 +0200
> ++++ spidermonkey185-1.0.0/js/src/configure     2016-05-25 11:26:28.704477125 +0200
> +@@ -13264,11 +13264,6 @@
> +
> + # Individual module options
> +
> +-case "$target_cpu" in
> +-  arm*)
> +-    MOZ_ARM_ARCH=armv7
> +-  ;;
> +-esac
> + # Check whether --enable-thumb2 or --disable-thumb2 was given.
> + if test "${enable_thumb2+set}" = set; then
> +   enableval="$enable_thumb2"
> +@@ -13337,16 +13332,6 @@
> +       { echo "configure: error: --with-cpu-arch=armv7 is not supported for non-ARM CPU architectures" 1>&2; exit 1; }
> +     ;;
> +   esac
> +-else
> +-  case "$target_cpu" in
> +-    arm*)
> +-      if test "$GNU_CC"; then
> +-        CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -msoft-float"
> +-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -msoft-float"
> +-        ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork -msoft-float"
> +-      fi
> +-      ;;
> +-  esac
> + fi
> +
> +
> +@@ -13389,18 +13374,18 @@
> +
> + if test -n "$MOZ_DEBUG"; then
> +     echo $ac_n "checking for valid debug flags""... $ac_c" 1>&6
> +-echo "configure:13393: checking for valid debug flags" >&5
> ++echo "configure:13378: checking for valid debug flags" >&5
> +     _SAVE_CFLAGS=$CFLAGS
> +     CFLAGS="$CFLAGS $MOZ_DEBUG_FLAGS"
> +     cat > conftest.$ac_ext <<EOF
> +-#line 13397 "configure"
> ++#line 13382 "configure"
> + #include "confdefs.h"
> + #include <stdio.h>
> + int main() {
> + printf("Hello World\n");
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:13404: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:13389: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +   _results=yes
> + else
> +@@ -13441,18 +13426,18 @@
> + if test "$COMPILE_ENVIRONMENT"; then
> + if test -n "$MOZ_OPTIMIZE"; then
> +     echo $ac_n "checking for valid optimization flags""... $ac_c" 1>&6
> +-echo "configure:13445: checking for valid optimization flags" >&5
> ++echo "configure:13430: checking for valid optimization flags" >&5
> +     _SAVE_CFLAGS=$CFLAGS
> +     CFLAGS="$CFLAGS $MOZ_OPTIMIZE_FLAGS"
> +     cat > conftest.$ac_ext <<EOF
> +-#line 13449 "configure"
> ++#line 13434 "configure"
> + #include "confdefs.h"
> + #include <stdio.h>
> + int main() {
> + printf("Hello World\n");
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:13456: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:13441: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +   _results=yes
> + else
> +@@ -13581,7 +13566,7 @@
> +     fi
> +   else
> +     echo $ac_n "checking size of int *""... $ac_c" 1>&6
> +-echo "configure:13585: checking size of int *" >&5
> ++echo "configure:13570: checking size of int *" >&5
> + if eval "test \"`echo '$''{'ac_cv_sizeof_int_p'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +@@ -13589,9 +13574,10 @@
> +   ac_cv_sizeof_int_p=4
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 13593 "configure"
> ++#line 13578 "configure"
> + #include "confdefs.h"
> + #include <stdio.h>
> ++#include <sys/types.h>
> + main()
> + {
> +   FILE *f=fopen("conftestval", "w");
> +@@ -13600,7 +13586,7 @@
> +   exit(0);
> + }
> + EOF
> +-if { (eval echo configure:13604: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
> ++if { (eval echo configure:13590: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
> + then
> +   ac_cv_sizeof_int_p=`cat conftestval`
> + else
> +@@ -13847,17 +13833,17 @@
> + if test -n "$MOZ_VALGRIND"; then
> +     ac_safe=`echo "valgrind/valgrind.h" | sed 'y%./+-%__p_%'`
> + echo $ac_n "checking for valgrind/valgrind.h""... $ac_c" 1>&6
> +-echo "configure:13851: checking for valgrind/valgrind.h" >&5
> ++echo "configure:13837: checking for valgrind/valgrind.h" >&5
> + if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 13856 "configure"
> ++#line 13842 "configure"
> + #include "confdefs.h"
> + #include <valgrind/valgrind.h>
> + EOF
> + ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
> +-{ (eval echo configure:13861: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
> ++{ (eval echo configure:13847: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
> + ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
> + if test -z "$ac_err"; then
> +   rm -rf conftest*
> +@@ -14012,7 +13998,7 @@
> + # Extract the first word of "$ac_prog", so it can be a program name with args.
> + set dummy $ac_prog; ac_word=$2
> + echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
> +-echo "configure:14016: checking for $ac_word" >&5
> ++echo "configure:14002: checking for $ac_word" >&5
> + if eval "test \"`echo '$''{'ac_cv_path_CCACHE'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +@@ -14163,12 +14149,12 @@
> +     for ac_func in __cxa_demangle
> + do
> + echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
> +-echo "configure:14167: checking for $ac_func" >&5
> ++echo "configure:14153: checking for $ac_func" >&5
> + if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 14172 "configure"
> ++#line 14158 "configure"
> + #include "confdefs.h"
> + /* System header to define __stub macros and hopefully few prototypes,
> +     which can conflict with char $ac_func(); below.  */
> +@@ -14194,7 +14180,7 @@
> +
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14198: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> ++if { (eval echo configure:14184: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   rm -rf conftest*
> +   eval "ac_cv_func_$ac_func=yes"
> + else
> +@@ -14242,17 +14228,17 @@
> + if test "$HAVE_GCC3_ABI" -a -z "$SKIP_LIBRARY_CHECKS"; then
> +     ac_safe=`echo "unwind.h" | sed 'y%./+-%__p_%'`
> + echo $ac_n "checking for unwind.h""... $ac_c" 1>&6
> +-echo "configure:14246: checking for unwind.h" >&5
> ++echo "configure:14232: checking for unwind.h" >&5
> + if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 14251 "configure"
> ++#line 14237 "configure"
> + #include "confdefs.h"
> + #include <unwind.h>
> + EOF
> + ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
> +-{ (eval echo configure:14256: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
> ++{ (eval echo configure:14242: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
> + ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
> + if test -z "$ac_err"; then
> +   rm -rf conftest*
> +@@ -14271,12 +14257,12 @@
> +   for ac_func in _Unwind_Backtrace
> + do
> + echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
> +-echo "configure:14275: checking for $ac_func" >&5
> ++echo "configure:14261: checking for $ac_func" >&5
> + if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 14280 "configure"
> ++#line 14266 "configure"
> + #include "confdefs.h"
> + /* System header to define __stub macros and hopefully few prototypes,
> +     which can conflict with char $ac_func(); below.  */
> +@@ -14299,7 +14285,7 @@
> +
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14303: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> ++if { (eval echo configure:14289: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   rm -rf conftest*
> +   eval "ac_cv_func_$ac_func=yes"
> + else
> +@@ -14348,7 +14334,7 @@
> + # Compiler Options
> +
> + echo $ac_n "checking for gcc -pipe support""... $ac_c" 1>&6
> +-echo "configure:14352: checking for gcc -pipe support" >&5
> ++echo "configure:14338: checking for gcc -pipe support" >&5
> + if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
> +     echo '#include <stdio.h>' > dummy-hello.c
> +     echo 'int main() { printf("Hello World\n"); exit(0); }' >> dummy-hello.c
> +@@ -14363,14 +14349,14 @@
> +         _SAVE_CFLAGS=$CFLAGS
> +         CFLAGS="$CFLAGS -pipe"
> +         cat > conftest.$ac_ext <<EOF
> +-#line 14367 "configure"
> ++#line 14353 "configure"
> + #include "confdefs.h"
> +  #include <stdio.h>
> + int main() {
> + printf("Hello World\n");
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14374: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:14360: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +   _res_gcc_pipe="yes"
> + else
> +@@ -14415,16 +14401,16 @@
> + CFLAGS="$CFLAGS -fprofile-generate -fprofile-correction"
> +
> + echo $ac_n "checking whether C compiler supports -fprofile-generate""... $ac_c" 1>&6
> +-echo "configure:14419: checking whether C compiler supports -fprofile-generate" >&5
> ++echo "configure:14405: checking whether C compiler supports -fprofile-generate" >&5
> + cat > conftest.$ac_ext <<EOF
> +-#line 14421 "configure"
> ++#line 14407 "configure"
> + #include "confdefs.h"
> +
> + int main() {
> + return 0;
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14428: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:14414: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +    PROFILE_GEN_CFLAGS="-fprofile-generate"
> +                  result="yes"
> +@@ -14488,16 +14474,16 @@
> +     _SAVE_CXXFLAGS=$CXXFLAGS
> +     CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS} ${_COMPILER_PREFIX}-pedantic ${_COMPILER_PREFIX}-Wno-long-long"
> +     echo $ac_n "checking whether C++ compiler has -pedantic long long bug""... $ac_c" 1>&6
> +-echo "configure:14492: checking whether C++ compiler has -pedantic long long bug" >&5
> ++echo "configure:14478: checking whether C++ compiler has -pedantic long long bug" >&5
> +     cat > conftest.$ac_ext <<EOF
> +-#line 14494 "configure"
> ++#line 14480 "configure"
> + #include "confdefs.h"
> + $configure_static_assert_macros
> + int main() {
> + CONFIGURE_STATIC_ASSERT(sizeof(long long) == 8)
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14501: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:14487: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +   result="no"
> + else
> +@@ -14522,12 +14508,12 @@
> + fi
> +
> + echo $ac_n "checking for correct temporary object destruction order""... $ac_c" 1>&6
> +-echo "configure:14526: checking for correct temporary object destruction order" >&5
> ++echo "configure:14512: checking for correct temporary object destruction order" >&5
> + if test "$cross_compiling" = yes; then
> +   result="maybe"
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 14531 "configure"
> ++#line 14517 "configure"
> + #include "confdefs.h"
> + #ifdef __cplusplus
> + extern "C" void exit(int);
> +@@ -14550,7 +14536,7 @@
> +              }
> +
> + EOF
> +-if { (eval echo configure:14554: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
> ++if { (eval echo configure:14540: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
> + then
> +   result="yes"
> + else
> +@@ -14571,12 +14557,12 @@
> + _SAVE_CXXFLAGS=$CXXFLAGS
> + CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS}"
> + echo $ac_n "checking for correct overload resolution with const and templates""... $ac_c" 1>&6
> +-echo "configure:14575: checking for correct overload resolution with const and templates" >&5
> ++echo "configure:14561: checking for correct overload resolution with const and templates" >&5
> + if eval "test \"`echo '$''{'ac_nscap_nonconst_opeq_bug'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 14580 "configure"
> ++#line 14566 "configure"
> + #include "confdefs.h"
> +
> +                       template <class T>
> +@@ -14606,7 +14592,7 @@
> +
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14610: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:14596: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +   ac_nscap_nonconst_opeq_bug="no"
> + else
> +@@ -14629,19 +14615,19 @@
> + fi
> +
> + echo $ac_n "checking for tm_zone tm_gmtoff in struct tm""... $ac_c" 1>&6
> +-echo "configure:14633: checking for tm_zone tm_gmtoff in struct tm" >&5
> ++echo "configure:14619: checking for tm_zone tm_gmtoff in struct tm" >&5
> + if eval "test \"`echo '$''{'ac_cv_struct_tm_zone_tm_gmtoff'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 14638 "configure"
> ++#line 14624 "configure"
> + #include "confdefs.h"
> + #include <time.h>
> + int main() {
> + struct tm tm; tm.tm_zone = 0; tm.tm_gmtoff = 1;
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14645: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:14631: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   rm -rf conftest*
> +   ac_cv_struct_tm_zone_tm_gmtoff="yes"
> + else
> +@@ -14855,7 +14841,7 @@
> + if test -z "$SKIP_LIBRARY_CHECKS" -a -z "$NO_EDITLINE"; then
> +   if test -n "$JS_WANT_READLINE"; then
> +     echo $ac_n "checking for readline in -lreadline""... $ac_c" 1>&6
> +-echo "configure:14859: checking for readline in -lreadline" >&5
> ++echo "configure:14845: checking for readline in -lreadline" >&5
> + ac_lib_var=`echo readline'_'readline | sed 'y%./+-%__p_%'`
> + if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> +@@ -14863,7 +14849,7 @@
> +   ac_save_LIBS="$LIBS"
> + LIBS="-lreadline  $LIBS"
> + cat > conftest.$ac_ext <<EOF
> +-#line 14867 "configure"
> ++#line 14853 "configure"
> + #include "confdefs.h"
> + /* Override any gcc2 internal prototype to avoid an error.  */
> + /* We use char because int might match the return type of a gcc2
> +@@ -14874,7 +14860,7 @@
> + readline()
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:14878: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> ++if { (eval echo configure:14864: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   rm -rf conftest*
> +   eval "ac_cv_lib_$ac_lib_var=yes"
> + else
> +@@ -15123,9 +15109,9 @@
> + fi
> +
> + echo $ac_n "checking for posix_fallocate""... $ac_c" 1>&6
> +-echo "configure:15127: checking for posix_fallocate" >&5
> ++echo "configure:15113: checking for posix_fallocate" >&5
> + cat > conftest.$ac_ext <<EOF
> +-#line 15129 "configure"
> ++#line 15115 "configure"
> + #include "confdefs.h"
> + #define _XOPEN_SOURCE 600
> +   #include <fcntl.h>
> +@@ -15133,7 +15119,7 @@
> + posix_fallocate(0, 0, 0);
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:15137: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> ++if { (eval echo configure:15123: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   rm -rf conftest*
> +   ac_cv___posix_fallocate=true
> + else
> +@@ -15159,7 +15145,7 @@
> +                 _SAVE_CFLAGS=$CFLAGS
> +     CFLAGS="$CFLAGS $XCFLAGS"
> +     cat > conftest.$ac_ext <<EOF
> +-#line 15163 "configure"
> ++#line 15149 "configure"
> + #include "confdefs.h"
> +
> +         #include <stdio.h>
> +@@ -15177,7 +15163,7 @@
> +
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:15181: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> ++if { (eval echo configure:15167: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
> +   :
> + else
> +   echo "configure: failed program was:" >&5
> +@@ -15278,12 +15264,12 @@
> + for ac_func in setlocale
> + do
> + echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
> +-echo "configure:15282: checking for $ac_func" >&5
> ++echo "configure:15268: checking for $ac_func" >&5
> + if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 15287 "configure"
> ++#line 15273 "configure"
> + #include "confdefs.h"
> + /* System header to define __stub macros and hopefully few prototypes,
> +     which can conflict with char $ac_func(); below.  */
> +@@ -15306,7 +15292,7 @@
> +
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:15310: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> ++if { (eval echo configure:15296: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   rm -rf conftest*
> +   eval "ac_cv_func_$ac_func=yes"
> + else
> +@@ -15333,12 +15319,12 @@
> + for ac_func in localeconv
> + do
> + echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
> +-echo "configure:15337: checking for $ac_func" >&5
> ++echo "configure:15323: checking for $ac_func" >&5
> + if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
> +   echo $ac_n "(cached) $ac_c" 1>&6
> + else
> +   cat > conftest.$ac_ext <<EOF
> +-#line 15342 "configure"
> ++#line 15328 "configure"
> + #include "confdefs.h"
> + /* System header to define __stub macros and hopefully few prototypes,
> +     which can conflict with char $ac_func(); below.  */
> +@@ -15361,7 +15347,7 @@
> +
> + ; return 0; }
> + EOF
> +-if { (eval echo configure:15365: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> ++if { (eval echo configure:15351: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
> +   rm -rf conftest*
> +   eval "ac_cv_func_$ac_func=yes"
> + else
> +@@ -16291,7 +16277,7 @@
> +       fi
> +     fi
> +
> +-    cd $ac_popdir
> ++    cd "$ac_popdir"
> +   done
> + fi
> +
> diff --git a/package/spidermonkey185/0005-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch b/package/spidermonkey185/0005-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
> new file mode 100644
> index 0000000..69662b5
> --- /dev/null
> +++ b/package/spidermonkey185/0005-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
> @@ -0,0 +1,90 @@
> +
> +# HG changeset patch
> +# User Luke Wagner <luke@mozilla.com>
> +# Date 1312494575 25200
> +# Node ID 1d186a5f3a96e938a253726ac48ecaf00e80c712
> +# Parent  cd0106ceb8ce337636875ef7b1f0d143cb33b7a4
> +Bug 674522 - Fix jsval_layout on 64-bit big-endian platforms (r=waldo)
> +
> +[nicolas.cavallari at green-communications.fr: refresh patch]
> +
> +diff --git a/js/src/jsval.h b/js/src/jsval.h
> +--- a/js/src/jsval.h
> ++++ b/js/src/jsval.h
> +@@ -301,17 +301,16 @@ typedef union jsval_layout
> +         JSValueTag         tag : 17;
> +     } debugView;
> + #endif
> +     struct {
> +         union {
> +             int32          i32;
> +             uint32         u32;
> +             JSWhyMagic     why;
> +-            jsuword        word;
> +         } payload;
> +     } s;
> +     double asDouble;
> +     void *asPtr;
> + } jsval_layout;
> + # endif  /* JS_BITS_PER_WORD */
> + #else   /* defined(IS_LITTLE_ENDIAN) */
> + # if JS_BITS_PER_WORD == 32
> +@@ -338,28 +337,31 @@ typedef union jsval_layout
> + typedef union jsval_layout
> + {
> +     uint64 asBits;
> +     struct {
> +         JSValueTag         tag : 17;
> +         uint64             payload47 : 47;
> +     } debugView;
> +     struct {
> ++        uint32             padding;
> +         union {
> +             int32          i32;
> +             uint32         u32;
> +             JSWhyMagic     why;
> +         } payload;
> +     } s;
> +     double asDouble;
> +     void *asPtr;
> + } jsval_layout;
> + # endif /* JS_BITS_PER_WORD */
> + #endif  /* defined(IS_LITTLE_ENDIAN) */
> +
> ++JS_STATIC_ASSERT(sizeof(jsval_layout) == 8);
> ++
> + #if JS_BITS_PER_WORD == 32
> +
> + /*
> +  * N.B. GCC, in some but not all cases, chooses to emit signed comparison of
> +  * JSValueTag even though its underlying type has been forced to be uint32.
> +  * Thus, all comparisons should explicitly cast operands to uint32.
> +  */
> +
> +diff --git a/js/src/jsvalue.h b/js/src/jsvalue.h
> +--- a/js/src/jsvalue.h
> ++++ b/js/src/jsvalue.h
> +@@ -724,17 +724,21 @@ class Value
> +     }
> +
> +     JS_ALWAYS_INLINE
> +     void *toUnmarkedPtr() const {
> +         return data.asPtr;
> +     }
> +
> +     const jsuword *payloadWord() const {
> +-        return &data.s.payload.word;
> ++#if JS_BITS_PER_WORD == 32
> ++        return reinterpret_cast<const jsuword *>(&data.s.payload.word);
> ++#elif JS_BITS_PER_WORD == 64
> ++        return reinterpret_cast<const jsuword *>(&data.asBits);
> ++#endif
> +     }
> +
> +   private:
> +     void staticAssertions() {
> +         JS_STATIC_ASSERT(sizeof(JSValueType) == 1);
> +         JS_STATIC_ASSERT(sizeof(JSValueTag) == 4);
> +         JS_STATIC_ASSERT(sizeof(JSBool) == 4);
> +         JS_STATIC_ASSERT(sizeof(JSWhyMagic) <= 4);
> +
> diff --git a/package/spidermonkey185/0006-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch b/package/spidermonkey185/0006-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
> new file mode 100644
> index 0000000..3ebc0bb
> --- /dev/null
> +++ b/package/spidermonkey185/0006-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
> @@ -0,0 +1,93 @@
> +
> +# HG changeset patch
> +# User Luke Wagner <luke@mozilla.com>
> +# Date 1312825636 25200
> +# Node ID 6f2c0dbb88d338df44a624041f8808c9de0a9a9b
> +# Parent  e605ebcd59845fca46a52555eb1b18e70bb3a37d
> +Bug 674522 - Remove bad static assert; fix strict-aliasing warnings (rs=waldo)
> +
> +[nicolas.cavallari at green-communications.fr: refresh patch]
> +
> +diff --git a/js/src/jsval.h b/js/src/jsval.h
> +--- a/js/src/jsval.h
> ++++ b/js/src/jsval.h
> +@@ -305,16 +305,17 @@ typedef union jsval_layout
> +         union {
> +             int32          i32;
> +             uint32         u32;
> +             JSWhyMagic     why;
> +         } payload;
> +     } s;
> +     double asDouble;
> +     void *asPtr;
> ++    jsuword asWord;
> + } jsval_layout;
> + # endif  /* JS_BITS_PER_WORD */
> + #else   /* defined(IS_LITTLE_ENDIAN) */
> + # if JS_BITS_PER_WORD == 32
> + typedef union jsval_layout
> + {
> +     uint64 asBits;
> +     struct {
> +@@ -346,16 +347,17 @@ typedef union jsval_layout
> +         union {
> +             int32          i32;
> +             uint32         u32;
> +             JSWhyMagic     why;
> +         } payload;
> +     } s;
> +     double asDouble;
> +     void *asPtr;
> ++    jsuword asWord;
> + } jsval_layout;
> + # endif /* JS_BITS_PER_WORD */
> + #endif  /* defined(IS_LITTLE_ENDIAN) */
> +
> + JS_STATIC_ASSERT(sizeof(jsval_layout) == 8);
> +
> + #if JS_BITS_PER_WORD == 32
> +
> +diff --git a/js/src/jsvalue.h b/js/src/jsvalue.h
> +--- a/js/src/jsvalue.h
> ++++ b/js/src/jsvalue.h
> +@@ -286,17 +286,16 @@ static JS_ALWAYS_INLINE JSValueTag
> + JSVAL_EXTRACT_NON_DOUBLE_TAG_IMPL(jsval_layout l)
> + {
> +     uint64 tag = l.asBits >> JSVAL_TAG_SHIFT;
> +     JS_ASSERT(tag > JSVAL_TAG_MAX_DOUBLE);
> +     return (JSValueTag)tag;
> + }
> +
> + #ifdef __cplusplus
> +-JS_STATIC_ASSERT(offsetof(jsval_layout, s.payload) == 0);
> + JS_STATIC_ASSERT((JSVAL_TYPE_NONFUNOBJ & 0xF) == JSVAL_TYPE_OBJECT);
> + JS_STATIC_ASSERT((JSVAL_TYPE_FUNOBJ & 0xF) == JSVAL_TYPE_OBJECT);
> + #endif
> +
> + static JS_ALWAYS_INLINE jsval_layout
> + BOX_NON_DOUBLE_JSVAL(JSValueType type, uint64 *slot)
> + {
> +     /* N.B. for 32-bit payloads, the high 32 bits of the slot are trash. */
> +@@ -725,19 +724,19 @@ class Value
> +
> +     JS_ALWAYS_INLINE
> +     void *toUnmarkedPtr() const {
> +         return data.asPtr;
> +     }
> +
> +     const jsuword *payloadWord() const {
> + #if JS_BITS_PER_WORD == 32
> +-        return reinterpret_cast<const jsuword *>(&data.s.payload.word);
> ++        return &data.s.payload.word;
> + #elif JS_BITS_PER_WORD == 64
> +-        return reinterpret_cast<const jsuword *>(&data.asBits);
> ++        return &data.asWord;
> + #endif
> +     }
> +
> +   private:
> +     void staticAssertions() {
> +         JS_STATIC_ASSERT(sizeof(JSValueType) == 1);
> +         JS_STATIC_ASSERT(sizeof(JSValueTag) == 4);
> +         JS_STATIC_ASSERT(sizeof(JSBool) == 4);
> +
> diff --git a/package/spidermonkey185/0007-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch b/package/spidermonkey185/0007-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
> new file mode 100644
> index 0000000..165f802
> --- /dev/null
> +++ b/package/spidermonkey185/0007-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
> @@ -0,0 +1,33 @@
> +
> +# HG changeset patch
> +# User Mike Hommey <mh+mozilla@glandium.org>
> +# Date 1303461188 -7200
> +# Node ID 59771590e9203d48ef8cbcd7eaf2f8ae45dbb1c1
> +# Parent  c4b82ec27d6d6e1c02ef0abb3b6e805bfdd092ec
> +Bug 638056 - Avoid "The cacheFlush support is missing on this platform" error on exotic platforms. r=cdleary
> +
> +[nicolas.cavallari at green-communications.fr: refresh patch]
> +
> +diff --git a/js/src/Makefile.in b/js/src/Makefile.in
> +--- a/js/src/Makefile.in
> ++++ b/js/src/Makefile.in
> +@@ -377,17 +377,17 @@ CPPSRCS +=       checks.cc \
> +               platform.cc \
> +               utils.cc \
> +               $(NONE)
> +
> + #
> + # END enclude sources for V8 dtoa
> + #############################################
> +
> +-ifeq (,$(filter-out powerpc sparc,$(TARGET_CPU)))
> ++ifeq (,$(filter arm %86 x86_64,$(TARGET_CPU)))
> +
> + VPATH +=      $(srcdir)/assembler \
> +               $(srcdir)/assembler/wtf \
> +               $(srcdir)/yarr/pcre \
> +               $(NULL)
> +
> + CPPSRCS +=    pcre_compile.cpp \
> +                 pcre_exec.cpp \
> +
> diff --git a/package/spidermonkey185/Config.in b/package/spidermonkey185/Config.in
> new file mode 100644
> index 0000000..ed7331f
> --- /dev/null
> +++ b/package/spidermonkey185/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_SPIDERMONKEY185
> +       bool "spidermonkey (1.8.5)"
> +       depends on BR2_USE_MMU # fork in executable tools.
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         SpiderMonkey is Mozilla's JavaScript engine written in C/C++. It is
> +         used in various Mozilla products, including Firefox.
> +
> +         This is the old 1.8.5 branch, used in Firefox 4.
> +
> +comment "Spider monkey (1.8.5) need a toolchain with C++, threads"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/spidermonkey185/spidermonkey185.hash b/package/spidermonkey185/spidermonkey185.hash
> new file mode 100644
> index 0000000..bd651d7
> --- /dev/null
> +++ b/package/spidermonkey185/spidermonkey185.hash
> @@ -0,0 +1,2 @@
> +# Locally generated.
> +sha256 5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687        js185-1.0.0.tar.gz
> diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
> new file mode 100644
> index 0000000..1ccc274
> --- /dev/null
> +++ b/package/spidermonkey185/spidermonkey185.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# Spidermonkey (1.8.5)
> +#
> +################################################################################
> +
> +SPIDERMONKEY185_VERSION = 1.0.0
> +SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
> +SPIDERMONKEY185_SOURCE = js185-${SPIDERMONKEY185_VERSION}.tar.gz
> +
> +SPIDERMONKEY185_INSTALL_STAGING = YES
> +
> +SPIDERMONKEY185_DEPENDENCIES = host-python host-perl
> +
> +SPIDERMONKEY185_LICENSE = MPLv1.1 or GPLv2.0+ or LGPLv2.1+
> +
> +SPIDERMONKEY185_SUBDIR = js/src
Don't put empty lines between all these lines. I would put the SUBDIR
option right below the SOURCE option.
> +
> +# This define is used by jscpucfg.cpp which is normally used to runtime-detect
> +# the system endianess.
> +SPIDERMONKEY185_CONF_ENV = \
> +       HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN"
> +
> +# Mozilla mixes up target, host and build.  See the comment in configure.in
> +# around line 360.  Also, nanojit fails to build on sparc64 with
> +# #error "unknown nanojit architecture", so disable the JIT.
> +SPIDERMONKEY185_CONF_OPTS = \
> +               --target=$(GNU_TARGET_NAME) \
> +               --build=$(GNU_TARGET_NAME) \
> +               --host=$(GNU_HOST_NAME) \
> +               $(if $(BR2_sparc64),--disable-tracejit)
In your patch, there's two tab here so the indent is off.
> +
> +$(eval $(autotools-package))
> --
> 2.8.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
