From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 11 Feb 2020 09:09:28 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix PowerPc build failure
In-Reply-To: <20200209092629.20131-1-giulio.benetti@benettiengineering.com>
References: <20200209092629.20131-1-giulio.benetti@benettiengineering.com>
Message-ID: <5d92637c-aad1-a717-1a7c-67916b3a3cba@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/425ba828d30c2bd55ce9f4f00e67bc10d9de2867/

On 2/9/20 10:26 AM, Giulio Benetti wrote:
> NSS assumes <sys/auvx.h> is always present but that's not true, so add a
> patch to check if it exists or not.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Patch is already pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1614183
> ---
>   ...heck-if-PPC-__has_include-sys-auxv.h.patch | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
> 
> diff --git a/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch b/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
> new file mode 100644
> index 0000000000..0efe866643
> --- /dev/null
> +++ b/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
> @@ -0,0 +1,46 @@
> +From ad1025f21f00231cd464a92ed34b334897af6842 Mon Sep 17 00:00:00 2001
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
> + nss/lib/freebl/blinit.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/blinit.c b/nss/lib/freebl/blinit.c
> +index 7e8adfc64..f4fd59f5a 100644
> +--- a/nss/lib/freebl/blinit.c
> ++++ b/nss/lib/freebl/blinit.c
> +@@ -431,7 +431,8 @@ ppc_crypto_support()
> +
> + #if defined(__powerpc__)
> +
> +-#if defined(__linux__) || (defined(__FreeBSD__) && __FreeBSD__ >= 12)
> ++#if __has_include(<sys/auxv.h>) && \
> ++    (defined(__linux__) || (defined(__FreeBSD__) && __FreeBSD__ >= 12))
> + #include <sys/auxv.h>
> + #elif (defined(__FreeBSD__) && __FreeBSD__ < 12)
> + #include <sys/sysctl.h>
> +@@ -449,10 +450,14 @@ CheckPPCSupport()
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
