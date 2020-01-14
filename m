From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 14 Jan 2020 21:58:00 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix powerpc altivec build
 failure
In-Reply-To: <20200114204619.82143-1-giulio.benetti@benettiengineering.com>
References: <4ef10e39-bef2-9327-ae2c-ecc9a3943e75@benettiengineering.com>
 <20200114204619.82143-1-giulio.benetti@benettiengineering.com>
Message-ID: <d32bd510-8f11-defa-0281-e59fdf47d177@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch must be called: NSS_DISABLE_ALTIVEC, not ENABLE. Going to re-send 
corrected.

Sorry for the noise.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 1/14/20 9:46 PM, Giulio Benetti wrote:
> NSS doesn't provide a way to understand if PowerPC compiler supports
> Altivec, and it would also be difficult to do with a simple Makefile.
> So add patch to disable Altivec extension with variable
> NSS_DISABLE_ALTIVEC, then pass NSS_DISABLE_ALTIVEC=1 if
> BR2_POWERPC_CPU_HAS_ALTIVEC is not 'y'.
> 
> Fixes:
> http://autobuild.buildroot.net/results/957/957cec911bcd68a18418ad02f13e7e3001521c59/
> http://autobuild.buildroot.net/results/6a1/6a1578619a477e1605fe152070f004b662f1d839/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1608151
> ---
>   ...1608151-Introduce-NSS_ENABLE_ALTIVEC.patch | 95 +++++++++++++++++++
>   package/libnss/libnss.mk                      |  5 +
>   2 files changed, 100 insertions(+)
>   create mode 100644 package/libnss/0002-Bug-1608151-Introduce-NSS_ENABLE_ALTIVEC.patch
> 
> diff --git a/package/libnss/0002-Bug-1608151-Introduce-NSS_ENABLE_ALTIVEC.patch b/package/libnss/0002-Bug-1608151-Introduce-NSS_ENABLE_ALTIVEC.patch
> new file mode 100644
> index 0000000000..e492a63d6e
> --- /dev/null
> +++ b/package/libnss/0002-Bug-1608151-Introduce-NSS_ENABLE_ALTIVEC.patch
> @@ -0,0 +1,95 @@
> +From 7ce53f890e26630d2d9677ab579281b3708c2605 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Tue, 14 Jan 2020 18:55:53 +0100
> +Subject: [PATCH] Bug 1608151 - Introduce NSS_ENABLE_ALTIVEC
> +
> +Add NSS_ENABLE_ALTIVEC environment variable to enable/disable Altivec
> +extension on PowerPC build. At the time NSS assumes that every PowerPC64
> +architecture supports Altivec but it's not true and this leads to build
> +failure.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/coreconf/config.gypi  | 1 +
> + nss/coreconf/config.mk    | 5 +++++
> + nss/lib/freebl/Makefile   | 2 ++
> + nss/lib/freebl/freebl.gyp | 2 +-
> + nss/lib/freebl/gcm.h      | 2 ++
> + 5 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/nss/coreconf/config.gypi b/nss/coreconf/config.gypi
> +index 2e6cc390e..fc113a6fc 100644
> +--- a/nss/coreconf/config.gypi
> ++++ b/nss/coreconf/config.gypi
> +@@ -102,6 +102,7 @@
> +     'disable_dbm%': 1,
> +     'disable_libpkix%': 1,
> +     'disable_werror%': 0,
> ++    'disable_altivec': 1,
> +     'mozilla_client%': 0,
> +     'comm_client%': 0,
> +     'moz_fold_libs%': 0,
> +diff --git a/nss/coreconf/config.mk b/nss/coreconf/config.mk
> +index 60a08411e..704e3fa83 100644
> +--- a/nss/coreconf/config.mk
> ++++ b/nss/coreconf/config.mk
> +@@ -196,6 +196,11 @@ DEFINES += -DPKIX_OBJECT_LEAK_TEST
> + endif
> + endif
> +
> ++# Avoid building with PowerPC's Altivec acceleration
> ++ifdef NSS_DISABLE_ALTIVEC
> ++DEFINES += -DNSS_DISABLE_ALTIVEC
> ++endif
> ++
> + # This allows all library and tools code to use the util function
> + # implementations directly from libnssutil3, rather than the wrappers
> + # in libnss3 which are present for binary compatibility only
> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index 00518d7f8..fc3e2099e 100644
> +--- a/nss/lib/freebl/Makefile
> ++++ b/nss/lib/freebl/Makefile
> +@@ -790,5 +790,7 @@ $(OBJDIR)/$(PROG_PREFIX)gcm-aarch64$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypt
> + endif
> +
> + ifeq ($(CPU_ARCH),ppc)
> ++ifndef NSS_DISABLE_ALTIVEC
> + $(OBJDIR)/$(PROG_PREFIX)gcm-ppc$(OBJ_SUFFIX): CFLAGS += -mcrypto -maltivec
> + endif
> ++endif
> +diff --git a/nss/lib/freebl/freebl.gyp b/nss/lib/freebl/freebl.gyp
> +index 5d247742d..f968c408a 100644
> +--- a/nss/lib/freebl/freebl.gyp
> ++++ b/nss/lib/freebl/freebl.gyp
> +@@ -238,7 +238,7 @@
> +             'gcm-aes-aarch64_c_lib',
> +           ],
> +         }],
> +-        [ 'target_arch=="ppc64le"', {
> ++        [ 'disable_altivec==0 and (target_arch=="ppc" or target_arch=="ppc64" or target_arch=="ppc64le")', {
> +           'dependencies': [
> +             'gcm-aes-ppc_c_lib',
> +           ],
> +diff --git a/nss/lib/freebl/gcm.h b/nss/lib/freebl/gcm.h
> +index aa4dee824..64aac56b2 100644
> +--- a/nss/lib/freebl/gcm.h
> ++++ b/nss/lib/freebl/gcm.h
> +@@ -30,6 +30,7 @@
> + #include <arm_neon.h>
> + #endif
> +
> ++#ifndef NSS_DISABLE_ALTIVEC
> + #ifdef __powerpc64__
> + #include "altivec-types.h"
> +
> +@@ -39,6 +40,7 @@
> + #undef vector
> + #undef bool
> + #endif
> ++#endif
> +
> + /*
> +  * PPC CRYPTO requires at least gcc 8 or clang. The LE check is purely
> +--
> +2.20.1
> +
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index d7d3cda86b..b9dab44c11 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -50,6 +50,11 @@ LIBNSS_BUILD_VARS = \
>   	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
>   	NSS_ENABLE_WERROR=0
>   
> +ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
> +# Disable Altivec if not supported
> +LIBNSS_BUILD_VARS += NSS_DISABLE_ALTIVEC=1
> +endif
> +
>   ifeq ($(BR2_ARCH_IS_64),y)
>   # MIPS64 n32 is treated as a 32-bit architecture by libnss.
>   # See: https://bugzilla.mozilla.org/show_bug.cgi?id=1010730
> 
