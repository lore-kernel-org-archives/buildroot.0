From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:36:59 +0200
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: re-fix build with
 uClibc-ng and older glibcs
In-Reply-To: <20200823211816.108469-1-thomas.petazzoni@bootlin.com>
References: <20200823211816.108469-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200824223659.721b1b78@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Aug 2020 23:18:15 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> In commit 26e37cef1627faa1f5ab8935482e2b2bc3465c33, we started using
> __WORDSIZE to get the size of longs on the given architecture, in
> order to support all CPU architectures.
> 
> Unfortunately, __WORDSIZE is not enabled in musl, so in
> 19bd08900448aa45b506320ad2ab912f789e6e5e, we switched to using
> LONG_BIT instead of __WORDSIZE.
> 
> However, LONG_BIT is not readily available on glibc, you need
> _XOPEN_SOURCE to be defined, which was done in
> a34e7f88f67b77066f73894dc8e42bca3c076fa6.
> 
> However, in a34e7f88f67b77066f73894dc8e42bca3c076fa6, _XOPEN_SOURCE
> was just defined, with no specific value. This caused the build to
> break again on uClibc-ng and older glibcs, because clock_gettime() and
> CLOCK_MONOTONIC were no longer defined. In both uClibc-ng and glibc,
> CLOCK_MONOTONIC is only defined if __USE_POSIX199309 is defined. It
> turns out that simply defining _XOPEN_SOURCE with no value does not
> lead to __USE_POSIX199309 being defined in uClibc-ng and old glibcs,
> while it is defined in newer glibcs.
> 
> The difference comes from the following snippet of code, which is
> present in recent enough glibc's <feature.h> but not uClibc-ng's or
> older glibc's <feature.h>:
> 
> /* If none of the ANSI/POSIX macros are defined, or if _DEFAULT_SOURCE
>    is defined, use POSIX.1-2008 (or another version depending on
>    _XOPEN_SOURCE).  */
> 
> So the fact that we are defining _DEFAULT_SOURCE makes it assume that
> we're using POSIX 2008.09, which obviously includes POSIX 1993.09.
> 
> Due to the lack of this code snippet, uClibc-ng <features.h> only
> enables:
> 
>      !defined _POSIX_SOURCE && !defined _POSIX_C_SOURCE)
> 
> but not:
> 
> So we need an _XOPEN_SOURCE level of at least 500 for POSIX 1993.09
> definitions to be available.
> 
> This is confirmed by the feature_test_macros man page, which states:
> 
>                   _XOPEN_SOURCE < 500
>                          _POSIX_C_SOURCE is defined with the value 2.
> 
>                   500 <= _XOPEN_SOURCE < 600
>                          _POSIX_C_SOURCE is defined with the value 199506L.
> 
> When this is fixed, another issue arises with older glibc toolchains
> (such as Sourcery ARM), where fd_set is no longer defined. Inded, with
> POSIX-1.2001 being enabled, we need to include <sys/select.h> to
> access the fd_set definition and friends (see man fd_set for details).
> 
> This commit was tested with two glibc toolchains (recent and old), one
> uClibc-ng toolchain and one musl toolchain.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e20f9474fc0217036faa6561df33fa983466ddfe/
>   (uClibc-ng)
> 
>   http://autobuild.buildroot.net/results/b5d944389fc96ef2c5e0608fe4ac34149e5f9739/
>   (glibc)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...01-Use-LONG_BIT-to-define-RADIX_BITS.patch | 31 ++++++++++++++-----
>  1 file changed, 23 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
