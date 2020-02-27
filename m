From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Feb 2020 12:03:53 +0100
Subject: [Buildroot] [PATCH v2] package/libnss: fix PowerPc build failure
In-Reply-To: <20200227110240.14937-1-giulio.benetti@benettiengineering.com>
References: <20200227110240.14937-1-giulio.benetti@benettiengineering.com>
Message-ID: <096bcafe-6a08-0c94-24bf-b379bdbfd51f@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, forgot to add to commit log:

Fixes:
http://autobuild.buildroot.net/results/425ba828d30c2bd55ce9f4f00e67bc10d9de2867/

On 2/27/20 12:02 PM, Giulio Benetti wrote:
> NSS assumes <sys/auvx.h> is always present but that's not true, so add a
> patch to check if it exists or not.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * improve patch according to upstream:
>    https://bugzilla.mozilla.org/show_bug.cgi?id=1614183
> ---
>   ...heck-if-PPC-__has_include-sys-auxv.h.patch | 51 +++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
> 
> diff --git a/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch b/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
> new file mode 100644
> index 0000000000..1325387760
> --- /dev/null
> +++ b/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
> @@ -0,0 +1,51 @@
> +From d9c7cbb3660d8a2da9ce42e4d1b58642a256a91a Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 9 Feb 2020 10:15:16 +0100
> +Subject: [PATCH] Bug 1614183 - Check if PPC __has_include(<sys/auxv.h>)
> +
> +Some build environment doesn't provide <sys/auxv.h> and this causes
> +build failure, so let's check if that header exists by using
> +__has_include() helper.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/blinit.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/nss/lib/freebl/blinit.c b/nss/lib/freebl/blinit.c
> +index 7e8adfc64..d4921aaee 100644
> +--- a/nss/lib/freebl/blinit.c
> ++++ b/nss/lib/freebl/blinit.c
> +@@ -431,8 +431,14 @@ ppc_crypto_support()
> +
> + #if defined(__powerpc__)
> +
> ++#ifndef __has_include
> ++#define __has_include(x) 0
> ++#endif
> ++
> + #if defined(__linux__) || (defined(__FreeBSD__) && __FreeBSD__ >= 12)
> ++#if __has_include(<sys/auxv.h>)
> + #include <sys/auxv.h>
> ++#endif
> + #elif (defined(__FreeBSD__) && __FreeBSD__ < 12)
> + #include <sys/sysctl.h>
> + #endif
> +@@ -449,10 +455,14 @@ CheckPPCSupport()
> +
> +     unsigned long hwcaps = 0;
> + #if defined(__linux__)
> ++#if __has_include(<sys/auxv.h>)
> +     hwcaps = getauxval(AT_HWCAP2);
> ++#endif
> + #elif defined(__FreeBSD__)
> + #if __FreeBSD__ >= 12
> ++#if __has_include(<sys/auxv.h>)
> +     elf_aux_info(AT_HWCAP2, &hwcaps, sizeof(hwcaps));
> ++#endif
> + #else
> +     size_t len = sizeof(hwcaps);
> +     sysctlbyname("hw.cpu_features2", &hwcaps, &len, NULL, 0);
> +--
> +2.20.1
> +
> 

-- 
Giulio Benetti
Benetti Engineering sas
