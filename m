From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:35:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/kismet: fix build with gcc >= 9
In-Reply-To: <20200824182121.1929324-1-fontaine.fabrice@gmail.com>
References: <20200824182121.1929324-1-fontaine.fabrice@gmail.com>
Message-ID: <20200826233530.455941a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 20:21:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Adding -std=c++11 fix the build and can be removed as soon as kismet is
> bumped to latest version as the offending code has been removed. It
> should be noted that kismet builds fine with gcc 8 so it remains unclear
> why this build failure is raised only with gcc >= 9 (build failure
> confirmed with gcc 9 and 10)

Meh, this looks weird :/

bits/socket.h defines the field like this:

#if __glibc_c99_flexarr_available
    __extension__ unsigned char __cmsg_data __flexarr; /* Ancillary data.  */
#endif

and __glibc_c99_flexarr_available is defined as follows:

/* Support for flexible arrays.
   Headers that should use flexible arrays only if they're "real"
   (e.g. only if they won't affect sizeof()) should test
   #if __glibc_c99_flexarr_available.  */
#if defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L
# define __flexarr      []
# define __glibc_c99_flexarr_available 1
#elif __GNUC_PREREQ (2,97)
/* GCC 2.97 supports C99 flexible array members as an extension,
   even when in C89 mode or compiling C++ (any version).  */
# define __flexarr      []
# define __glibc_c99_flexarr_available 1
#elif defined __GNUC__
/* Pre-2.97 GCC did not support C99 flexible arrays but did have
   an equivalent extension with slightly different notation.  */
# define __flexarr      [0]
# define __glibc_c99_flexarr_available 1
#else
/* Some other non-C99 compiler.  Approximate with [1].  */
# define __flexarr      [1]
# define __glibc_c99_flexarr_available 0
#endif

Some it's really unclear how -std=c++11 can fix the issue.

Could you have a look at which of those #if case we fall into in the
different cases (between gcc 8.x and gcc 9.x, with/without -std=c++11) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
