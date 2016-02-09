From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 22:43:46 +0100
Subject: [Buildroot] [PATCH v2] valgrind: fix musl compile
In-Reply-To: <1455051210-20712-1-git-send-email-ps.report@gmx.net>
References: <1455051210-20712-1-git-send-email-ps.report@gmx.net>
Message-ID: <56BA5D92.2090005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-02-16 21:53, Peter Seiderer wrote:
> Add musl libc detection (based on suggestions by Romain Naour and
> Arnout Vandecappelle) and add some tweaks for musl support (based
> on OpenWRT patch [1]).
> 
> Fixes ([2]):
>   checking the glibc version... unsupported version
>   configure: error: Valgrind requires glibc version 2.2 or later
> 
> Patch suggested upstream (see [3]).
> 
> [1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
> [2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837
> [3] https://bugs.kde.org/show_bug.cgi?id=359202
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add proper musl libc detection (suggested by Romain Naour and
>     Arnout Vandecappelle)
[snip]
> ++     musl)
> ++	AC_MSG_RESULT(Musl)
> ++	AC_DEFINE([MUSL_LIBC], 1, [Define to 1 if you're using Musl libc])
> ++	# no DEFAULT_SUPP file yet for musl libc.
> ++	;;
> +      2.0|2.1|*)
> + 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
> + 	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
> +-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
> ++	AC_MSG_ERROR([musl libc, Darwin libc, Bionic libc or Solaris libc])

 Actuallly, uClibc was already supported as well :-)

> + 	;;
> + esac
> + 
> +diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
> +index 2ea7a7a..e49c832 100644
> +--- a/coregrind/vg_preloaded.c
> ++++ b/coregrind/vg_preloaded.c
> +@@ -56,7 +56,7 @@
> + void VG_NOTIFY_ON_LOAD(freeres)( void );
> + void VG_NOTIFY_ON_LOAD(freeres)( void )
> + {
> +-#  if !defined(__UCLIBC__) \
> ++#  if !defined(__UCLIBC__) && defined(__GLIBC__) \

 Adding defined(__GLIBC__) effectively excludes android (bionic), doesn't it?

> +       && !defined(VGPV_arm_linux_android) \
> +       && !defined(VGPV_x86_linux_android) \
> +       && !defined(VGPV_mips32_linux_android) \
> +diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
> +index bac00d7..b8cd97e 100644
> +--- a/include/pub_tool_redir.h
> ++++ b/include/pub_tool_redir.h
> +@@ -242,8 +242,11 @@
> + /* --- Soname of the standard C library. --- */
> + 
> + #if defined(VGO_linux) || defined(VGO_solaris)
> ++# if defined(__GLIBC__) || defined(__UCLIBC__)

 AFAICS, on solaris neither of these is defined, so that's probably not good
either. I guess it's better to revert the condition and check on musl instead.

> + #  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
> +-
> ++#else
> ++#  define  VG_Z_LIBC_SONAME  libcZdZa              // libc.*
> ++#endif
> + #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
> + #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
> + 
> +@@ -274,7 +277,11 @@
> + /* --- Soname of the pthreads library. --- */
> + 
> + #if defined(VGO_linux)
> ++# if defined(__GLIBC__) || defined(__UCLIBC__)

 Same here.



 Regards,
 Arnout


> + #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
> ++#else
> ++#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
> ++#endif
> + #elif defined(VGO_darwin)
> + #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
> + #elif defined(VGO_solaris)
> +-- 
> +2.1.4
> +
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index 5849b49..46ba13e 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -12,6 +12,9 @@ VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
>  VALGRIND_CONF_OPTS = --disable-ubsan
>  VALGRIND_INSTALL_STAGING = YES
>  
> +# patch 0004-Fixes-for-musl-libc.patch touching configure.ac
> +VALGRIND_AUTORECONF = YES
> +
>  ifeq ($(BR2_GCC_ENABLE_TLS),y)
>  VALGRIND_CONF_OPTS += --enable-tls
>  else
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
