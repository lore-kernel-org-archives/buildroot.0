From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Apr 2020 22:41:27 +0200
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: add patch to fix build
 issues on several architectures
In-Reply-To: <20200427054649.1666163-1-thomas.petazzoni@bootlin.com>
References: <20200427054649.1666163-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200427204127.GB11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-27 07:46 +0200, Thomas Petazzoni spake thusly:
> src/LibSupport.h has some logic to find the wordsize of the current
> architecture, using an explicit list of CPU architectures. This makes
> the build fail on a number of CPU architectures that are not
> explicitly handled.
> 
> Let's instead use the __WORDSIZE definition of the C library, which is
> guaranteed to be available for all CPU architectures.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/a235345477ea2ec3b0dd4ffed4d7667d46caec48/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-Use-__WORDSIZE-to-define-RADIX_BITS.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch
> 
> diff --git a/package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch b/package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch
> new file mode 100644
> index 0000000000..a19160f68c
> --- /dev/null
> +++ b/package/ibm-sw-tpm2/0001-Use-__WORDSIZE-to-define-RADIX_BITS.patch
> @@ -0,0 +1,44 @@
> +From 24a352fc99ebde22235b05b18615817ef7f4263c Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 26 Apr 2020 15:33:39 +0200
> +Subject: [PATCH] Use __WORDSIZE to define RADIX_BITS
> +
> +This allows to avoid having to support each CPU architecture
> +individually.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I know this upstream is on sourceforge, but could you try the extra
effort to push them this patch? ;-]

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + src/LibSupport.h | 17 +++--------------
> + 1 file changed, 3 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/LibSupport.h b/src/LibSupport.h
> +index b2e6a51..f064d20 100644
> +--- a/src/LibSupport.h
> ++++ b/src/LibSupport.h
> +@@ -64,20 +64,9 @@
> + #ifndef _LIB_SUPPORT_H_
> + #define _LIB_SUPPORT_H_
> + 
> +-#ifndef RADIX_BITS
> +-#   if defined(__x86_64__) || defined(__x86_64)				\
> +-    || defined(__amd64__) || defined(__amd64) || defined(_WIN64) || defined(_M_X64) \
> +-    || defined(_M_ARM64) || defined(__aarch64__) \
> +-    || defined(__powerpc64__) || defined(__ppc64__)
> +-#       define RADIX_BITS                      64
> +-#   elif defined(__i386__) || defined(__i386) || defined(i386)		\
> +-    || defined(_WIN32) || defined(_M_IX86)				\
> +-    || defined(_M_ARM) || defined(__arm__) || defined(__thumb__)
> +-#       define RADIX_BITS                      32
> +-#   else
> +-#       error Unable to determine RADIX_BITS from compiler environment
> +-#   endif
> +-#endif // RADIX_BITS
> ++#include <limits.h>
> ++
> ++#define RADIX_BITS __WORDSIZE
> + 
> + // These macros use the selected libraries to the proper include files.
> + #define LIB_QUOTE(_STRING_) #_STRING_
> +-- 
> +2.25.3
> +
> -- 
> 2.25.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
