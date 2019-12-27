From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 18:05:43 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to HW
 PPC Crypto bug
In-Reply-To: <20191227165427.107111-1-giulio.benetti@benettiengineering.com>
References: <20191227165427.107111-1-giulio.benetti@benettiengineering.com>
Message-ID: <bd3fa69b-5429-b3ce-f1f2-3da72e53b2d5@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/27/19 5:54 PM, Giulio Benetti wrote:
> Add patch to fix how NSS check if we're on a Big Endian machine.

Fixes:
http://autobuild.buildroot.net/results/e42/e42005d1bb70b3f2741eb77242b2fd8dbf2a55d6/

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Pending here:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1606119
> ---
>   ...6119-Fix-PPC-HW-Crypto-build-failure.patch | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
> 
> diff --git a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
> new file mode 100644
> index 0000000000..0b891b5ebc
> --- /dev/null
> +++ b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
> @@ -0,0 +1,37 @@
> +From 09b3776a924736049693a118d5a8d883e8c794ca Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Fri, 27 Dec 2019 17:41:04 +0100
> +Subject: [PATCH] Bug 1606119 - Fix PPC HW Crypto build failure
> +
> +Only Big Endian Altivec functions are used, not Little Endian ones, so
> +let's change check if USE_PPC_CRYPTO by changing to IS_BIG_ENDIAN
> +instead of IS_LITTLE_ENDIAN.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/gcm.h | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/nss/lib/freebl/gcm.h b/nss/lib/freebl/gcm.h
> +index 571b9ec55..de8b51db8 100644
> +--- a/nss/lib/freebl/gcm.h
> ++++ b/nss/lib/freebl/gcm.h
> +@@ -41,12 +41,12 @@
> + #endif
> +
> + /*
> +- * PPC CRYPTO requires at least gcc 5 or clang. The LE check is purely
> +- * because it's only been tested on LE. If you're interested in BE,
> ++ * PPC CRYPTO requires at least gcc 5 or clang. The BE check is purely
> ++ * because it's only been tested on BE. If you're interested in LE,
> +  * please send a patch.
> +  */
> + #if (defined(__clang__) || (defined(__GNUC__) && __GNUC__ >= 5)) && \
> +-    defined(IS_LITTLE_ENDIAN)
> ++    defined(IS_BIG_ENDIAN)
> + #define USE_PPC_CRYPTO
> + #endif
> +
> +--
> +2.20.1
> +
> 

-- 
Giulio Benetti
Benetti Engineering sas
