From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 12:40:30 +0100
Subject: [Buildroot] [PATCH] package/connman: cleanup backtrace patch
In-Reply-To: <1450956867-15532-1-git-send-email-yann.morin.1998@free.fr>
References: <1450956867-15532-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151224124030.53999020@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, 24 Dec 2015 12:34:27 +0100, Yann E. MORIN wrote:
> connman uses execinfo.h to dump a backtrace in case of failure.
> execinfo.h is optional in uClibc, so we had a patch that conditonally
> disabled backtraces for uClibc when it was missing execinfo.h
> 
> However, musl is also entirely lacking execinfo.h.
> 
> Add a proper patch that checks for execinfo.h at ./configure time. This
> will no longer make any assumption on the C library that is being used.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/f6e/f6ee8ab3a6300f1f527f9e92b8c2ec81e63afb27/
>     http://autobuild.buildroot.org/results/96b/96b78bb644ed4ef3493782521b17e3b2113a405f/
>     ...
> 
> Note that there might be other issues with musl; this patch only fiexes

fiexes -> fixes

However, I have some comments below.


> diff --git a/package/connman/0001-conditional-backtrace.patch b/package/connman/0001-conditional-backtrace.patch
> new file mode 100644
> index 0000000..231eda2
> --- /dev/null
> +++ b/package/connman/0001-conditional-backtrace.patch
> @@ -0,0 +1,74 @@
> +commit 13cfdf6b01651b0e3d07455ed69f5c328642982e
> +Author: Yann E. MORIN <yann.morin.1998@free.fr>
> +Date:   Thu Dec 24 12:04:57 2015 +0100
> +
> +    configure: check for execinfo.h
> +    
> +    Not all toolchains have execinfo.h. For example, support for it is
> +    optional in uClibc, while it is entirely missing from musl.
> +    
> +    Add a check in configure to look for it.
> +    
> +    Since execinfo.h is /only/ used to dump a backtrace in case of failure,
> +    just do nothing when execinfo.h is missing.
> +    
> +    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Please use "git format-patch" to generate a properly Git formatted
patch. Here is seems like you have simply taken the output of "git
show".

> +diff --git a/Makefile.am b/Makefile.am
> +index fb7c74e..ef02cf5 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -210,7 +210,8 @@ AM_CFLAGS = @DBUS_CFLAGS@ @GLIB_CFLAGS@ @XTABLES_CFLAGS@ \
> + 				-DSCRIPTDIR=\""$(build_scriptdir)"\" \
> + 				-DSTORAGEDIR=\""$(storagedir)\"" \
> + 				-DVPN_STORAGEDIR=\""$(vpn_storagedir)\"" \
> +-				-DCONFIGDIR=\""$(configdir)\""
> ++				-DCONFIGDIR=\""$(configdir)\"" \
> ++				-DHAVE_BACKTRACE=$(HAVE_BACKTRACE)

This change is not needed, HAVE_EXECINFO_H will be defined in config.h.

> + 
> + if VPN
> + AM_CPPFLAGS = -I$(builddir)/include -I$(srcdir)/gdbus
> +diff --git a/configure.ac b/configure.ac
> +index b51d6b3..87701d0 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -182,6 +182,9 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
> + 		AC_MSG_ERROR(resolver library support is required))
> + ])
> + 
> ++AC_CHECK_HEADERS([execinfo.h],[HAVE_BACKTRACE=1], HAVE_BACKTRACE=0)

HAVE_BACKTRACE=1/HAVE_BACKTRACE=0 are not needed.

Just do:

AC_CHECK_HEADERS([execinfo.h])

HAVE_EXECINFO_H will automatically be defined in config.h.

> ++AC_SUBST([HAVE_BACKTRACE])

Not needed.

> ++
> + AC_CHECK_FUNC(signalfd, dummy=yes,
> + 			AC_MSG_ERROR(signalfd support is required))
> + 
> +diff --git a/src/log.c b/src/log.c
> +index a693bd0..69ab50e 100644
> +--- a/src/log.c
> ++++ b/src/log.c
> +@@ -30,7 +30,9 @@
> + #include <stdlib.h>
> + #include <string.h>
> + #include <syslog.h>
> ++#if defined(HAVE_BACKTRACE) && HAVE_BACKTRACE == 1

Use just:

#ifdef HAVE_EXECINFO_H

> + #include <execinfo.h>
> ++#endif
> + #include <dlfcn.h>
> + 
> + #include "connman.h"
> +@@ -112,6 +114,7 @@ void connman_debug(const char *format, ...)
> + 
> + static void print_backtrace(unsigned int offset)
> + {
> ++#if defined(HAVE_BACKTRACE) && HAVE_BACKTRACE == 1

Ditto.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
