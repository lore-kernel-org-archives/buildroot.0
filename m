From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 09:20:58 +0200
Subject: [Buildroot] [PATCH v2] package/libzip: add patch from upstream
 to fix build
In-Reply-To: <20200904141839.29071-1-paul@crapouillou.net>
References: <20200904141839.29071-1-paul@crapouillou.net>
Message-ID: <20200905072058.GS14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, Al,

On 2020-09-04 16:18 +0200, Paul Cercueil spake thusly:
> Cherry-pick a patch from upstream project that fixes the build when used
> with a uClibc based toolchain.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to master, thanks.

Note that I was a bit puzzled like Thomas, but your defconfig hinted at
the cause: yours is using libressl, while I guess Thomas only tested
with openssl.

And indeed, here's an even simpler defconfig that exhibit the issue:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE=y
    BR2_PACKAGE_LIBZIP=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_LIBRESSL=y

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
> 
> Notes:
>     v2: Update commit URL
> 
>  .../0002-Include-limits.h-for-INT_MAX.patch   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/libzip/0002-Include-limits.h-for-INT_MAX.patch
> 
> diff --git a/package/libzip/0002-Include-limits.h-for-INT_MAX.patch b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
> new file mode 100644
> index 0000000000..c488f05289
> --- /dev/null
> +++ b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
> @@ -0,0 +1,27 @@
> +From fd89e242d16128dedef08f47d99ae56aa19b0591 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?=C3=98rjan=20Malde?= <red@foxi.me>
> +Date: Wed, 15 Jul 2020 12:16:16 +0200
> +Subject: [PATCH] Include limits.h for INT_MAX
> +
> +[Retrieved from:
> +https://github.com/nih-at/libzip/commit/fd89e242d16128dedef08f47d99ae56aa19b0591]
> +Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> +---
> + lib/zip_crypto_openssl.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/zip_crypto_openssl.c b/lib/zip_crypto_openssl.c
> +index 1cb00479..60f92758 100644
> +--- a/lib/zip_crypto_openssl.c
> ++++ b/lib/zip_crypto_openssl.c
> +@@ -38,6 +38,7 @@
> + #include "zip_crypto.h"
> + 
> + #include <openssl/rand.h>
> ++#include <limits.h>
> + 
> + #if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
> + #define USE_OPENSSL_1_0_API
> +-- 
> +2.28.0
> +
> -- 
> 2.28.0
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
