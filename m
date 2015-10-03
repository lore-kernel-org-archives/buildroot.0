From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 19:05:40 +0100
Subject: [Buildroot] [PATCH RFC v2] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <1443458077-864-1-git-send-email-brendanheading@gmail.com>
References: <1443458077-864-1-git-send-email-brendanheading@gmail.com>
Message-ID: <561018F4.3050000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-09-15 17:34, Brendan Heading wrote:
> Fixes:
> http://autobuild.buildroot.net/results/123/123a5b3f72ba8c1a4aa1cea5b7b846a04fd4e923/
> http://autobuild.buildroot.net/results/38c/38cfa4e7249a8770b06dbd392acba79303d3f9bc/
> 
> .. and others.
> 
> Improve GCC's checking of stack smashing support, by moving the check for
> uclibc further up, and splitting the condition there so that stack smashing
> support is tested in any case where uclibc is detected.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> v1 -> v2 : improved following comments from Arnout :
> - reworked the conditional statement instead of adding a separate case
> statement. This is a bit less intrusive.
> - formatting etc. improvements
> - still only fixing 4.7.4 - once we've got it right I'll port the patch
> to the other versions
> 
> Patch V1 - this initial version only fixes 4.7.4 - wanted to check that
> we are heading the right way before I fix all the other versions.
> 
> Note that I manually modified configure, rather than regenerating it from
> configure.ac.
> 
> Original plan was to reverse the order of the existing __GLIBC_MINOR__ and
> uclibc check. However, the uclibc check falls through if it does not
> detect uclibc, so I figure it better to add the separate case statement.
> ---
>  ...ing-of-stack-smashing-support-with-uclibc.patch | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch
> 
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
> ++	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
> ++	     $target_header_dir/features.h > /dev/null && \
> ++	     test -f $target_header_dir/bits/uClibc_config.h; then
> ++	      if $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
> ++	        $target_header_dir/bits/uClibc_config.h > /dev/null; then
> ++	         gcc_cv_libc_provides_ssp=yes
> ++	      else
> ++	         gcc_cv_libc_provides_ssp=no
> ++	      fi

 This looks OK to me. However, I would wait a bit to see what upstream says, if
they have a better solution we can use it for the old versions as well.

 OTOH, this fixes an autobuilder failure so perhaps it's better to commit
quickly and fix up later if needed.

 Regards,
 Arnout

> + 	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC__[ 	]+2' \
> + 	     $target_header_dir/features.h > /dev/null \
> + 	     && $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC_MINOR__[ 	]+([1-9][0-9]|[4-9])' \
> + 	     $target_header_dir/features.h > /dev/null; then
> + 	  gcc_cv_libc_provides_ssp=yes
> +-	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
> +-	     $target_header_dir/features.h > /dev/null && \
> +-	     test -f $target_header_dir/bits/uClibc_config.h && \
> +-	     $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
> +-	     $target_header_dir/bits/uClibc_config.h > /dev/null; then
> +-	  gcc_cv_libc_provides_ssp=yes
> + 	fi
> +       # all versions of Bionic support stack protector
> +       elif test -f $target_header_dir/sys/cdefs.h \
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index ea1c147..7282ea4 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -4681,17 +4681,20 @@ AC_CACHE_CHECK(__stack_chk_fail in target C library,
> + 	if $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC__[ 	]+([1-9][0-9]|[3-9])' \
> + 	   $target_header_dir/features.h > /dev/null; then
> + 	  gcc_cv_libc_provides_ssp=yes
> ++	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
> ++	     $target_header_dir/features.h > /dev/null && \
> ++	     test -f $target_header_dir/bits/uClibc_config.h; then
> ++	      if $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
> ++	        $target_header_dir/bits/uClibc_config.h > /dev/null; then
> ++	         gcc_cv_libc_provides_ssp=yes
> ++	      else
> ++	         gcc_cv_libc_provides_ssp=no
> ++	      fi
> + 	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC__[ 	]+2' \
> + 	     $target_header_dir/features.h > /dev/null \
> + 	     && $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC_MINOR__[ 	]+([1-9][0-9]|[4-9])' \
> + 	     $target_header_dir/features.h > /dev/null; then
> + 	  gcc_cv_libc_provides_ssp=yes
> +-	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
> +-	     $target_header_dir/features.h > /dev/null && \
> +-	     test -f $target_header_dir/bits/uClibc_config.h && \
> +-	     $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
> +-	     $target_header_dir/bits/uClibc_config.h > /dev/null; then
> +-	  gcc_cv_libc_provides_ssp=yes
> + 	fi
> +       # all versions of Bionic support stack protector
> +       elif test -f $target_header_dir/sys/cdefs.h \
> +-- 
> +2.4.3
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
