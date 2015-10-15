From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 23:40:46 +0200
Subject: [Buildroot] [PATCH RFC v2] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <1443458077-864-1-git-send-email-brendanheading@gmail.com>
References: <1443458077-864-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20151015234046.614e0fd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Mon, 28 Sep 2015 17:34:37 +0100, Brendan Heading wrote:

> diff --git a/package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch b/package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch
> new file mode 100644
> index 0000000..31947a0
> --- /dev/null
> +++ b/package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch
> @@ -0,0 +1,81 @@
> +From ff055a237ef91673a031bfe9dab743b01bd93d70 Mon Sep 17 00:00:00 2001
> +From: Brendan Heading <brendanheading@gmail.com>
> +Date: Mon, 28 Sep 2015 16:14:41 +0100
> +Subject: [PATCH 1/1] Improve checking of stack-smashing support with uclibc
> +
> +Detect if uclibc has stack-smashing enabled, and fall out if it does not.
> +
> +A more comprehensive solution is to be proposed for upstream.
> +
> +Upstream-status: inappropriate

Why ?

> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +---
> + gcc/configure    | 15 +++++++++------
> + gcc/configure.ac | 15 +++++++++------
> + 2 files changed, 18 insertions(+), 12 deletions(-)
> +
> +diff --git a/gcc/configure b/gcc/configure
> +index 63cba0a..658a3e6 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -26806,17 +26806,20 @@ else
> + 	if $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC__[ 	]+([1-9][0-9]|[3-9])' \
> + 	   $target_header_dir/features.h > /dev/null; then
> + 	  gcc_cv_libc_provides_ssp=yes

What prevents uClibc from ever matching this case? Shouldn't the
__UCLIBC__ case be *before* any __GLIBC__ case ?

> ++	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
> ++	     $target_header_dir/features.h > /dev/null && \
> ++	     test -f $target_header_dir/bits/uClibc_config.h; then
> ++	      if $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
> ++	        $target_header_dir/bits/uClibc_config.h > /dev/null; then
> ++	         gcc_cv_libc_provides_ssp=yes
> ++	      else
> ++	         gcc_cv_libc_provides_ssp=no

This else close is useless, gcc_cv_libc_provides_ssp is initialized to
"no" at the beginning of this piece of code.

If you look further down below in the code, you can see:

       *-*-darwin* | *-*-freebsd*)
         AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
           [echo "no __stack_chk_fail on this target"])

Do you know why a similar check isn't used for Linux ? It really seems
to be a lot easier than to poke into the C library details, no? But
maybe it's a too drastic change.

But now that I think of it, there is probably a much, much simpler
change: use the gcc_cv_libc_provides_ssp cache variable, which we
already use during gcc-initial.

My proposal would be something like:

	http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=fix-ssp

(see the last three commits)

I am currently doing a test build of glibc, uClibc w/ SSP, uClibc w/o
SSP and musl to see how it goes. But I believe it's actually simpler
than patching gcc, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
