From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 6 Mar 2017 11:52:57 +1100
Subject: [Buildroot] [git commit] libsidplay2: fix build on ppc64le by
 not autoreconfiguring
In-Reply-To: <20170301215040.A63AC8225E@busybox.osuosl.org>
References: <20170301215040.A63AC8225E@busybox.osuosl.org>
Message-ID: <20170306005257.GA13970@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 01, 2017 at 10:50:36PM +0100, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=df1b6d8cb2063c7a6f961cc2319879e50b3530a3
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The libsidplay2 package build system is completely broken. It is made
> of a top-level configure script, which calls into sub-configure
> scripts in sub-directories. However, since it doesn't use the autoconf
> provided AC_CONFIG_SUBDIRS() mechanism, an "autoreconf" doesn't
> recurse into the subdirectories.
> 
> Due to this, the aclocal.m4 in the libsidplay/ subdirectory doesn't
> get re-generated when Buildroot autoreconfs the package. However,
> since we patch one of the .m4 files in this subdirectory, when build
> time comes, the package notices its aclocal.m4 is older than one of
> the .m4 file, and triggers an automatic autoreconf.
> 
> Since <pkg>_AUTORECONF = YES is enabled, this automatic autoreconf
> works fine: host-autoconf and host-automake are available.
> 
> Expect that on powerpc64le, we patch the configure script itself to
> make it recognize powerpc64le. But this patching of the configure
> script itself gets overwritten by the automatic autoreconf at the
> beginning of the build step, causing the build to fail on powerpc64le.
> 
> Switching to AC_CONFIG_SUBDIRS() would allow to fix this, but
> libsidplay2 needs to pass custom configure options to each of the
> sub-configure scripts, something that AC_CONFIG_SUBDIRS() doesn't
> support. And since libsidplay2 upstream looks completely dead, the
> incentive to fix the whole thing is very limited.
> 
> Since what's broken is the autoreconfiguration of the package, what we
> do is modify patch 0001-sidplay2-libs-2.1.1.patch to directly tweak the
> configure script (instead of the relevant .m4 file). Thanks to this,
> <pkg>_AUTORECONF = YES is no longer needed, the .m4 file is no longer
> newer than the sub-configure script, and no automatic autoreconf
> triggers at build time. This allows the package to build properly on
> powerpc64le.
> 
> While we normally don't like patching 'configure' scripts directly, in
> this case the size of the change in the configure script is very small,
> and as explained above, the incentive to fix the package properly is
> very limited.
> 
> In detail, the changes:
> 
>  * Patch 0001-sidplay2-libs-2.1.1.patch is turned into a Git-formatted
>    patch
> 
>  * The irrelevant changes to Makefile.in files, aclocal.m4, config.h.in,
>    sidint.h are removed.
> 
>  * The change to my_macros.m4 is applied directly to the corresponding
>    configure script.
> 
>  * The change to the configure.ac script regarding libdir is applied
>    directly to the corresponding configure script.
> 
>  * The change to the configure.ac script regarding "*-k*bsd*-gnu" is
>    dropped, since we don't care about kFreeBSD support.
> 
>  * LIBSIDPLAY2_AUTORECONF = YES is dropped from the .mk file.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1f6a42bfece24e09c9c7f4078d549ec5c099c89d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Works for me.
Tested-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Thanks!

Sam.

> ---
>  package/libsidplay2/0001-sidplay2-libs-2.1.1.patch | 254 ++++++---------------
>  package/libsidplay2/libsidplay2.mk                 |   1 -
>  2 files changed, 75 insertions(+), 180 deletions(-)
> 
> diff --git a/package/libsidplay2/0001-sidplay2-libs-2.1.1.patch b/package/libsidplay2/0001-sidplay2-libs-2.1.1.patch
> index 3f76644..7c6813b 100644
> --- a/package/libsidplay2/0001-sidplay2-libs-2.1.1.patch
> +++ b/package/libsidplay2/0001-sidplay2-libs-2.1.1.patch
> @@ -1,93 +1,30 @@
> -Various fixes to compile libsidplay2 with newer gcc compilers
> +From 38493fceb39ac33e12c9c69d78f5584413b479f4 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Wed, 1 Mar 2017 10:03:40 +0100
> +Subject: [PATCH] Various fixes to compile libsidplay2 with newer gcc compilers
>  
>  Downloaded from
>  http://tsubasa.googlecode.com/svn/trunk/tsubasa/sidplay2-libs/sidplay2-libs-2.1.1.diff
>  
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Thomas: adjusted to avoid the need to autoreconf, which doesn't work
> +properly on this package.]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + builders/hardsid-builder/src/hardsid-builder.cpp |  1 +
> + builders/resid-builder/src/resid-builder.cpp     |  1 +
> + builders/resid-builder/src/resid.cpp             |  1 +
> + configure                                        |  2 +-
> + libsidplay/configure                             |  5 +++--
> + libsidplay/include/sidplay/SmartPtr.h            | 28 ++++++++++++------------
> + libsidplay/include/sidplay/sidendian.h           | 18 +++++++++------
> + libsidutils/include/sidplay/utils/SidUsage.h     |  2 +-
> + 8 files changed, 33 insertions(+), 25 deletions(-)
>  
> ---- sidplay-libs-2.1.1.orig/Makefile.in
> -+++ sidplay-libs-2.1.1/Makefile.in
> -@@ -1,4 +1,4 @@
> --# Makefile.in generated by automake 1.8.4 from Makefile.am.
> -+# Makefile.in generated by automake 1.8.5 from Makefile.am.
> - # @configure_input@
> - 
> - # Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
> -@@ -253,7 +253,7 @@
> - 	fi; \
> - 	list='$(SUBDIRS)'; for subdir in $$list; do \
> - 	  if test "$$subdir" = .; then :; else \
> --	    test -f $$subdir/TAGS && \
> -+	    test ! -f $$subdir/TAGS || \
> - 	      tags="$$tags $$include_option=$$here/$$subdir/TAGS"; \
> - 	  fi; \
> - 	done; \
> -@@ -264,7 +264,7 @@
> - 	  $(AWK) '    { files[$$0] = 1; } \
> - 	       END { for (i in files) print i; }'`; \
> - 	if test -z "$(ETAGS_ARGS)$$tags$$unique"; then :; else \
> --	  test -z "$$unique" && unique=$$empty_fix; \
> -+	  test -n "$$unique" || unique=$$empty_fix; \
> - 	  $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
> - 	    $$tags $$unique; \
> - 	fi
> ---- sidplay-libs-2.1.1.orig/aclocal.m4
> -+++ sidplay-libs-2.1.1/aclocal.m4
> -@@ -1,4 +1,4 @@
> --# generated automatically by aclocal 1.8.4 -*- Autoconf -*-
> -+# generated automatically by aclocal 1.8.5 -*- Autoconf -*-
> - 
> - # Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004
> - # Free Software Foundation, Inc.
> -@@ -40,7 +40,7 @@
> - # Call AM_AUTOMAKE_VERSION so it can be traced.
> - # This function is AC_REQUIREd by AC_INIT_AUTOMAKE.
> - AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
> --	 [AM_AUTOMAKE_VERSION([1.8.4])])
> -+	 [AM_AUTOMAKE_VERSION([1.8.5])])
> - 
> - # AM_AUX_DIR_EXPAND
> - 
> ---- sidplay-libs-2.1.1.orig/builders/Makefile.in
> -+++ sidplay-libs-2.1.1/builders/Makefile.in
> -@@ -1,4 +1,4 @@
> --# Makefile.in generated by automake 1.8.4 from Makefile.am.
> -+# Makefile.in generated by automake 1.8.5 from Makefile.am.
> - # @configure_input@
> - 
> - # Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
> -@@ -130,9 +130,9 @@
> - 	      exit 1;; \
> - 	  esac; \
> - 	done; \
> --	echo ' cd $(top_srcdir) && $(AUTOMAKE) --gnu  builders/Makefile'; \
> -+	echo ' cd $(top_srcdir) && $(AUTOMAKE) --foreign  builders/Makefile'; \
> - 	cd $(top_srcdir) && \
> --	  $(AUTOMAKE) --gnu  builders/Makefile
> -+	  $(AUTOMAKE) --foreign  builders/Makefile
> - .PRECIOUS: Makefile
> - Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
> - 	@case '$?' in \
> -@@ -234,7 +234,7 @@
> - 	fi; \
> - 	list='$(SUBDIRS)'; for subdir in $$list; do \
> - 	  if test "$$subdir" = .; then :; else \
> --	    test -f $$subdir/TAGS && \
> -+	    test ! -f $$subdir/TAGS || \
> - 	      tags="$$tags $$include_option=$$here/$$subdir/TAGS"; \
> - 	  fi; \
> - 	done; \
> -@@ -245,7 +245,7 @@
> - 	  $(AWK) '    { files[$$0] = 1; } \
> - 	       END { for (i in files) print i; }'`; \
> - 	if test -z "$(ETAGS_ARGS)$$tags$$unique"; then :; else \
> --	  test -z "$$unique" && unique=$$empty_fix; \
> -+	  test -n "$$unique" || unique=$$empty_fix; \
> - 	  $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
> - 	    $$tags $$unique; \
> - 	fi
> ---- sidplay-libs-2.1.1.orig/builders/hardsid-builder/src/hardsid-builder.cpp
> -+++ sidplay-libs-2.1.1/builders/hardsid-builder/src/hardsid-builder.cpp
> +diff --git a/builders/hardsid-builder/src/hardsid-builder.cpp b/builders/hardsid-builder/src/hardsid-builder.cpp
> +index f54d0a9..9375e40 100644
> +--- a/builders/hardsid-builder/src/hardsid-builder.cpp
> ++++ b/builders/hardsid-builder/src/hardsid-builder.cpp
>  @@ -47,6 +47,7 @@
>    ***************************************************************************/
>   
> @@ -96,8 +33,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   #include "config.h"
>   
>   #ifdef HAVE_EXCEPTIONS
> ---- sidplay-libs-2.1.1.orig/builders/resid-builder/src/resid-builder.cpp
> -+++ sidplay-libs-2.1.1/builders/resid-builder/src/resid-builder.cpp
> +diff --git a/builders/resid-builder/src/resid-builder.cpp b/builders/resid-builder/src/resid-builder.cpp
> +index e6e4eaa..4c7650f 100644
> +--- a/builders/resid-builder/src/resid-builder.cpp
> ++++ b/builders/resid-builder/src/resid-builder.cpp
>  @@ -37,6 +37,7 @@
>    ***************************************************************************/
>   
> @@ -106,8 +45,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   
>   #include "config.h"
>   #ifdef HAVE_EXCEPTIONS
> ---- sidplay-libs-2.1.1.orig/builders/resid-builder/src/resid.cpp
> -+++ sidplay-libs-2.1.1/builders/resid-builder/src/resid.cpp
> +diff --git a/builders/resid-builder/src/resid.cpp b/builders/resid-builder/src/resid.cpp
> +index 8c27850..d3123c5 100644
> +--- a/builders/resid-builder/src/resid.cpp
> ++++ b/builders/resid-builder/src/resid.cpp
>  @@ -16,6 +16,7 @@
>    *                                                                         *
>    ***************************************************************************/
> @@ -116,9 +57,11 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   #include "config.h"
>   
>   #ifdef HAVE_EXCEPTIONS
> ---- sidplay-libs-2.1.1.orig/configure.ac
> -+++ sidplay-libs-2.1.1/configure.ac
> -@@ -2,7 +2,7 @@
> +diff --git a/configure b/configure
> +index 1200eaf..77948b4 100755
> +--- a/configure
> ++++ b/configure
> +@@ -1227,7 +1227,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
>   
>   #Variables
>   pwd=`pwd`
> @@ -126,19 +69,28 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  +builders='${libdir}'/
>   ac_configure_args="$ac_configure_args --disable-library-checks"
>   
> - AC_CONFIG_AUX_DIR(unix)
> -@@ -11,7 +11,7 @@
> - 
> - hardsid=false
> - case "$host" in
> --    *linux*) hardsid=true
> -+    *linux*|*-k*bsd*-gnu) hardsid=true
> -         ;;
> - esac
> - AM_CONDITIONAL(HARDSID, test x$hardsid = xtrue)
> ---- sidplay-libs-2.1.1.orig/libsidplay/include/sidplay/SmartPtr.h
> -+++ sidplay-libs-2.1.1/libsidplay/include/sidplay/SmartPtr.h
> -@@ -17,16 +17,16 @@
> + ac_aux_dir=
> +diff --git a/libsidplay/configure b/libsidplay/configure
> +index 05a8ea6..3d93956 100755
> +--- a/libsidplay/configure
> ++++ b/libsidplay/configure
> +@@ -23466,8 +23466,9 @@ _ACEOF
> + cat confdefs.h >>conftest.$ac_ext
> + cat >>conftest.$ac_ext <<_ACEOF
> + /* end confdefs.h.  */
> +-#include <fstream.h>
> +-             #include <iomanip.h>
> ++#include <fstream>
> ++             #include <iomanip>
> ++             using namespace std;
> + int
> + main ()
> + {
> +diff --git a/libsidplay/include/sidplay/SmartPtr.h b/libsidplay/include/sidplay/SmartPtr.h
> +index c0cbb1a..15efd10 100644
> +--- a/libsidplay/include/sidplay/SmartPtr.h
> ++++ b/libsidplay/include/sidplay/SmartPtr.h
> +@@ -17,16 +17,16 @@ class SmartPtrBase_sidtt
>   		doFree = bufOwner;
>   		if ( bufferLen >= 1 )
>   		{
> @@ -162,7 +114,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   		}
>   	}
>   	
> -@@ -211,16 +211,16 @@
> +@@ -211,16 +211,16 @@ class SmartPtr_sidtt : public SmartPtrBase_sidtt<T>
>   	{
>   		if ( bufferLen >= 1 )
>   		{
> @@ -186,8 +138,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   		}
>   	}
>   };
> ---- sidplay-libs-2.1.1.orig/libsidplay/include/sidplay/sidendian.h
> -+++ sidplay-libs-2.1.1/libsidplay/include/sidplay/sidendian.h
> +diff --git a/libsidplay/include/sidplay/sidendian.h b/libsidplay/include/sidplay/sidendian.h
> +index 9fa8582..6115282 100644
> +--- a/libsidplay/include/sidplay/sidendian.h
> ++++ b/libsidplay/include/sidplay/sidendian.h
>  @@ -16,6 +16,10 @@
>    ***************************************************************************/
>   /***************************************************************************
> @@ -199,7 +153,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>    *  Revision 1.5  2001/07/03 22:44:13  s_a_white
>    *  Added endian_16 to convert a 16 bit value to an array of 8s.
>    *
> -@@ -141,7 +145,7 @@
> +@@ -141,7 +145,7 @@ inline void endian_16swap8 (uint_least16_t &word)
>   // Convert high-byte and low-byte to 16-bit word.
>   inline uint_least16_t endian_16 (uint8_t hi, uint8_t lo)
>   {
> @@ -208,7 +162,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>       endian_16lo8 (word, lo);
>       endian_16hi8 (word, hi);
>       return word;
> -@@ -165,7 +169,7 @@
> +@@ -165,7 +169,7 @@ inline void endian_16 (uint8_t ptr[2], uint_least16_t word)
>   
>   inline void endian_16 (char ptr[2], uint_least16_t word)
>   {
> @@ -217,7 +171,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   }
>   
>   // Convert high-byte and low-byte to 16-bit little endian word.
> -@@ -334,7 +338,7 @@
> +@@ -334,7 +338,7 @@ inline void endian_32swap16 (uint_least32_t &dword)
>   // Swap word endian.
>   inline void endian_32swap8 (uint_least32_t &dword)
>   {
> @@ -226,7 +180,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>       lo = endian_32lo16 (dword);
>       hi = endian_32hi16 (dword);
>       endian_16swap8 (lo);
> -@@ -346,8 +350,8 @@
> +@@ -346,8 +350,8 @@ inline void endian_32swap8 (uint_least32_t &dword)
>   // Convert high-byte and low-byte to 32-bit word.
>   inline uint_least32_t endian_32 (uint8_t hihi, uint8_t hilo, uint8_t hi, uint8_t lo)
>   {
> @@ -237,7 +191,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>       endian_32lo8  (dword, lo);
>       endian_32hi8  (dword, hi);
>       endian_16lo8  (word,  hilo);
> -@@ -374,7 +378,7 @@
> +@@ -374,7 +378,7 @@ inline void endian_little32 (uint8_t ptr[4], uint_least32_t dword)
>       defined(SID_WORDS_LITTLEENDIAN)
>       *((uint_least32_t *) ptr) = dword;
>   #else
> @@ -246,7 +200,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>       ptr[0] = endian_32lo8  (dword);
>       ptr[1] = endian_32hi8  (dword);
>       word   = endian_32hi16 (dword);
> -@@ -401,7 +405,7 @@
> +@@ -401,7 +405,7 @@ inline void endian_big32 (uint8_t ptr[4], uint_least32_t dword)
>       defined(SID_WORDS_BIGENDIAN)
>       *((uint_least32_t *) ptr) = dword;
>   #else
> @@ -255,72 +209,11 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>       word   = endian_32hi16 (dword);
>       ptr[1] = endian_16lo8  (word);
>       ptr[0] = endian_16hi8  (word);
> ---- sidplay-libs-2.1.1.orig/libsidplay/unix/config.h.in
> -+++ sidplay-libs-2.1.1/libsidplay/unix/config.h.in
> -@@ -72,22 +72,22 @@
> - /* Define to the version of this package. */
> - #undef PACKAGE_VERSION
> - 
> --/* The size of a `char', as computed by sizeof. */
> -+/* The size of `char', as computed by sizeof. */
> - #undef SIZEOF_CHAR
> - 
> --/* The size of a `int', as computed by sizeof. */
> -+/* The size of `int', as computed by sizeof. */
> - #undef SIZEOF_INT
> - 
> - /* The number of bytes in type long */
> - #undef SIZEOF_LONG
> - 
> --/* The size of a `long int', as computed by sizeof. */
> -+/* The size of `long int', as computed by sizeof. */
> - #undef SIZEOF_LONG_INT
> - 
> - /* The number of bytes in type short */
> - #undef SIZEOF_SHORT
> - 
> --/* The size of a `short int', as computed by sizeof. */
> -+/* The size of `short int', as computed by sizeof. */
> - #undef SIZEOF_SHORT_INT
> - 
> - /* The number of bytes in type void* */
> ---- sidplay-libs-2.1.1.orig/libsidplay/unix/my_macros.m4
> -+++ sidplay-libs-2.1.1/libsidplay/unix/my_macros.m4
> -@@ -105,8 +105,9 @@
> -     AC_CACHE_VAL(test_cv_have_ios_openmode,
> -     [
> -         AC_TRY_COMPILE(
> --            [#include <fstream.h>
> --             #include <iomanip.h>],
> -+            [#include <fstream>
> -+             #include <iomanip>
> -+	     using namespace std;],
> -             [ios::openmode myTest = ios::in;],
> -             [test_cv_have_ios_openmode=yes],
> -             [test_cv_have_ios_openmode=no]
> ---- sidplay-libs-2.1.1.orig/libsidplay/unix/sidint.h
> -+++ sidplay-libs-2.1.1/libsidplay/unix/sidint.h
> -@@ -0,0 +1,17 @@
> -+#ifndef _UNIX_SIDINT_H
> -+#define _UNIX_SIDINT_H 1
> -+#ifndef _GENERATED_STDINT_H
> -+#define _GENERATED_STDINT_H "libsidplay 2.1.1"
> -+/* generated using a gnu compiler version gcc (Debian 4.3-20080219-1) 4.3.0 20080219 (prerelease) [gcc-4_3-branch revision 132456] Copyright (C) 2007 Free Software Foundation, Inc. This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. */
> -+
> -+#include <stdint.h>
> -+
> -+
> -+/* system headers have good uint64_t */
> -+#ifndef _HAVE_UINT64_T
> -+#define _HAVE_UINT64_T
> -+#endif
> -+
> -+  /* once */
> -+#endif
> -+#endif
> ---- sidplay-libs-2.1.1.orig/libsidutils/include/sidplay/utils/SidUsage.h
> -+++ sidplay-libs-2.1.1/libsidutils/include/sidplay/utils/SidUsage.h
> -@@ -33,7 +33,7 @@
> +diff --git a/libsidutils/include/sidplay/utils/SidUsage.h b/libsidutils/include/sidplay/utils/SidUsage.h
> +index 2afb0f3..0496eea 100755
> +--- a/libsidutils/include/sidplay/utils/SidUsage.h
> ++++ b/libsidutils/include/sidplay/utils/SidUsage.h
> +@@ -33,7 +33,7 @@ struct sid2_usage_t: public sid_usage_t
>       uint_least16_t length;  // usage scan length
>   
>       // Copy common parts of basic usage to extended usage.
> @@ -329,3 +222,6 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>       {
>           *((sid_usage_t *) this) = usage;
>           return *this;
> +-- 
> +2.7.4
> +
> diff --git a/package/libsidplay2/libsidplay2.mk b/package/libsidplay2/libsidplay2.mk
> index b294964..cf44068 100644
> --- a/package/libsidplay2/libsidplay2.mk
> +++ b/package/libsidplay2/libsidplay2.mk
> @@ -9,7 +9,6 @@ LIBSIDPLAY2_SOURCE = sidplay-libs-$(LIBSIDPLAY2_VERSION).tar.gz
>  LIBSIDPLAY2_SITE = http://downloads.sourceforge.net/project/sidplay2/sidplay2/sidplay-libs-$(LIBSIDPLAY2_VERSION)
>  LIBSIDPLAY2_LICENSE = GPLv2+
>  LIBSIDPLAY2_LICENSE_FILES = libsidplay/COPYING
> -LIBSIDPLAY2_AUTORECONF = YES
>  LIBSIDPLAY2_INSTALL_STAGING = YES
>  
>  $(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
