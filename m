From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2019 23:44:28 +0200
Subject: [Buildroot] [PATCH 1/4] package/libnss: fix build failure with
 ARM without NEON extension
In-Reply-To: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
References: <20191023102330.20842-1-giulio.benetti@benettiengineering.com>
Message-ID: <5b8cea47-a99e-cdeb-2d0c-2a69f237f691@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/10/2019 12:23, Giulio Benetti wrote:
> At the moment libnss assumes that every ARM has NEON extension but it's
> not that way. So add a patch to make it aware of it and use native
> functions in place of NEON optimized ones.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

 You forgot:

Fixes:
http://autobuild.buildroot.net/results/1342d305d1aeebef7af54a83afc094fda12421e2

> ---
> Already sent upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1590676
> ---
>  ...ix-build-if-arm-doesn-t-support-NEON.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
> 
> diff --git a/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch b/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
> new file mode 100644
> index 0000000000..e536282371
> --- /dev/null
> +++ b/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
> @@ -0,0 +1,47 @@
> +From 946bc2864b0de7b63a4ec415e42e622d591a8753 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 23 Oct 2019 11:47:03 +0200
> +Subject: [PATCH] Bug 1590676 - Fix build if arm doesn't support NEON
> +
> +At the moment NSS assumes that ARM supports NEON extension but this is
> +not true and leads to build failure on ARM without NEON extension.
> +Add check to assure USE_HW_AES is not defined if ARM without NEON
> +extension is used.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/aes-armv8.c | 3 ++-
> + nss/lib/freebl/rijndael.c  | 3 ++-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/nss/lib/freebl/aes-armv8.c b/nss/lib/freebl/aes-armv8.c
> +index 40d5e2d34..a5df53891 100644
> +--- a/nss/lib/freebl/aes-armv8.c
> ++++ b/nss/lib/freebl/aes-armv8.c

 That looks as if it is something that should be built only on armv8... Since
the build failure is in fact for an armv4, don't we have a bigger issue here?

 I believe 32-bit armv8 always has neon.

> +@@ -7,7 +7,8 @@
> + 
> + #if (defined(__clang__) ||                            \
> +      (defined(__GNUC__) && defined(__GNUC_MINOR__) && \
> +-      (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8))))
> ++      (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8))) && \
> ++      (defined(__ARM_NEON) || defined(__ARM_NEON__)))

 That parenthesis matching doesn't look right... I suppose with clang it doesn't
magically support neon, right? So there should be an additional set of
parenthesis around the defined(__clang__) ... > 8 part.


 Regards,
 Arnout

> + 
> + #ifndef __ARM_FEATURE_CRYPTO
> + #error "Compiler option is invalid"
> +diff --git a/nss/lib/freebl/rijndael.c b/nss/lib/freebl/rijndael.c
> +index 26bd58ee0..23893f419 100644
> +--- a/nss/lib/freebl/rijndael.c
> ++++ b/nss/lib/freebl/rijndael.c
> +@@ -20,7 +20,8 @@
> + #include "gcm.h"
> + #include "mpi.h"
> + 
> +-#if !defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)
> ++#if (!defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)) || \
> ++    (!defined(__ARM_NEON) && !defined(__ARM_NEON__))
> + // not test yet on big endian platform of arm
> + #undef USE_HW_AES
> + #endif
> +-- 
> +2.20.1
> +
> 
