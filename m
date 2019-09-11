From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 11 Sep 2019 15:19:26 +0200
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 aarch64_be
In-Reply-To: <20190911131711.87498-1-giulio.benetti@micronovasrl.com>
References: <20190911131711.87498-1-giulio.benetti@micronovasrl.com>
Message-ID: <16b3c530-7dbf-eee0-2c57-8b5f2824b0d3@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry,

I've forgot to add:

Fixes:
http://autobuild.buildroot.net/results/bfd29593bb6c53d3e9e2d02d2ed6bea360d99c00

Il 11/09/2019 15:17, Giulio Benetti ha scritto:
> In libnss there is a bug leading to build failure due to double declared
> functions. This is due to 2 different #ifdef statements treating the
> same function-set.
> 
> Add patch to fix this by making the 2 #ifdef statements equal.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Already sent upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1580126
> ---
>   ...build-failure-on-aarch64_be-while-bu.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
> 
> diff --git a/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch b/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
> new file mode 100644
> index 0000000000..10a4876bc1
> --- /dev/null
> +++ b/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
> @@ -0,0 +1,35 @@
> +From 6b3819159949ed7fc099e588e2e0669407135121 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Tue, 10 Sep 2019 11:29:02 +0200
> +Subject: [PATCH] Bug 1580126 - Fix build failure on aarch64_be while building
> + freebl/gcm
> +
> +Build failure is caused by different #ifdef conditions in gcm.c and
> +gcm-aarch64.c that leads to double declaration of the same gcm_*
> +functions.
> +
> +Fix #ifdef condition in gcm-aarch64.c making it the same as the one in
> +gcm.c.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/gcm-aarch64.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/gcm-aarch64.c b/nss/lib/freebl/gcm-aarch64.c
> +index 65ea9fb5f..3f3c046d7 100644
> +--- a/nss/lib/freebl/gcm-aarch64.c
> ++++ b/nss/lib/freebl/gcm-aarch64.c
> +@@ -9,7 +9,8 @@
> + #include "secerr.h"
> +
> + /* old gcc doesn't support some poly64x2_t intrinsic */
> +-#if defined(__clang__) || (defined(__GNUC__) && __GNUC__ > 6)
> ++#if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
> ++    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> +
> + #include <arm_neon.h>
> +
> +--
> +2.17.1
> +
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
