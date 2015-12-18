From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 22:35:59 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/nodejs: bump version to 5.3.0
In-Reply-To: <1450394426-3349-1-git-send-email-martin@barkynet.com>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
Message-ID: <20151218213559.GF27578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-12-17 23:20 +0000, Martin Bark spake thusly:
> Replace 4.2.3 with 5.3.0.  5.3.0 is the current Stable release. See
> https://nodejs.org/en/blog/release/v5.3.0 for details on the release.
> 
> Copied 4.2.3 patched to 5.3.0 with the following exceptions:
>  - Removed 0004-fix-arm-vfpv2.patch, committed upstream and included in
>    5.3.0.  See https://github.com/nodejs/node/commit/84dea1bd0c
>  - Added 0004-Fix-va_list-not-declared.patch, fix for a new bug.  This
>    has already been fixed upstream but is not in 5.3.0
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

We've discussed yet a bit more about the nodejs versions with Thomas on
IRC.

One idea we had was that we could just get rid of the version choice
altogether form the Config.in.

Then, in the .mk, we'd set the version to 5.3.x if all conditions are
met, or use 0.10.x otherwise.

What do you think about that?

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2
>  - Updated patch set from 5.2.0 to 5.3.0
> ---
>  Config.in.legacy                                   |  9 +++++
>  package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch      | 46 ----------------------
>  ...01-Remove-dependency-on-Python-bz2-module.patch |  0
>  .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
>  ...hon-variable-instead-of-hardcoding-Python.patch |  0
>  .../5.3.0/0004-Fix-va_list-not-declared.patch      | 39 ++++++++++++++++++
>  package/nodejs/Config.in                           | 12 +++---
>  package/nodejs/nodejs.hash                         |  4 +-
>  package/nodejs/nodejs.mk                           |  2 +-
>  9 files changed, 58 insertions(+), 54 deletions(-)
>  delete mode 100644 package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch
>  rename package/nodejs/{4.2.3 => 5.3.0}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
>  rename package/nodejs/{4.2.3 => 5.3.0}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{4.2.3 => 5.3.0}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)
>  create mode 100644 package/nodejs/5.3.0/0004-Fix-va_list-not-declared.patch
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index e1ea06f..ee67720 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -186,6 +186,15 @@ config BR2_PACKAGE_INFOZIP
>  	  to avoid ambiguities with Info-Zip's UnZip which has been added
>  	  in the unzip package.
>  
> +config BR2_BR2_PACKAGE_NODEJS_4_X
> +	bool "nodejs version 4.x has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_NODEJS
> +	help
> +	  nodejs version 4.x has been removed.  As an alternative,
> +	  the latest nodejs version has been automatically selected in
> +	  your configuration.
> +
>  ###############################################################################
>  comment "Legacy options removed in 2015.11"
>  
> diff --git a/package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch b/package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch
> deleted file mode 100644
> index 7ff280b..0000000
> --- a/package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 0b07d813adcfdc13ef6a0c56f88b864eb3dc4be9 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> -Date: Tue, 8 Dec 2015 21:53:06 +0100
> -Subject: [PATCH] configure: fix arm vfpv2
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The gcc -mfpu flag for VFPv2 is 'vfp', not 'vfpv2' [1].
> -
> -Patch status: Sent upstream [2]
> -
> -[1] https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
> -[2] https://github.com/nodejs/node/pull/4202
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -[J?rg Krause: adapt to version 4.2.3]
> -Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ----
> - configure | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index d4aff36..c783bab 100755
> ---- a/configure
> -+++ b/configure
> -@@ -30,7 +30,7 @@ valid_os = ('win', 'mac', 'solaris', 'freebsd', 'openbsd', 'linux',
> - valid_arch = ('arm', 'arm64', 'ia32', 'mips', 'mipsel', 'ppc', 'ppc64', 'x32',
> -               'x64', 'x86')
> - valid_arm_float_abi = ('soft', 'softfp', 'hard')
> --valid_arm_fpu = ('vfp', 'vfpv2', 'vfpv3', 'vfpv3-d16', 'neon')
> -+valid_arm_fpu = ('vfp', 'vfpv3', 'vfpv3-d16', 'neon')
> - valid_mips_arch = ('loongson', 'r1', 'r2', 'r6', 'rx')
> - valid_mips_fpu = ('fp32', 'fp64', 'fpxx')
> - valid_mips_float_abi = ('soft', 'hard')
> -@@ -622,7 +622,7 @@ def configure_arm(o):
> -   else:
> -     arm_float_abi = 'default'
> -
> --  arm_fpu = 'vfpv2'
> -+  arm_fpu = 'vfp'
> -
> -   if is_arch_armv7():
> -     arm_fpu = 'vfpv3'
> ---
> -2.6.3
> diff --git a/package/nodejs/4.2.3/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.3.0/0001-Remove-dependency-on-Python-bz2-module.patch
> similarity index 100%
> rename from package/nodejs/4.2.3/0001-Remove-dependency-on-Python-bz2-module.patch
> rename to package/nodejs/5.3.0/0001-Remove-dependency-on-Python-bz2-module.patch
> diff --git a/package/nodejs/4.2.3/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.3.0/0002-gyp-force-link-command-to-use-CXX.patch
> similarity index 100%
> rename from package/nodejs/4.2.3/0002-gyp-force-link-command-to-use-CXX.patch
> rename to package/nodejs/5.3.0/0002-gyp-force-link-command-to-use-CXX.patch
> diff --git a/package/nodejs/4.2.3/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.3.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
> similarity index 100%
> rename from package/nodejs/4.2.3/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
> rename to package/nodejs/5.3.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
> diff --git a/package/nodejs/5.3.0/0004-Fix-va_list-not-declared.patch b/package/nodejs/5.3.0/0004-Fix-va_list-not-declared.patch
> new file mode 100644
> index 0000000..aec8e12
> --- /dev/null
> +++ b/package/nodejs/5.3.0/0004-Fix-va_list-not-declared.patch
> @@ -0,0 +1,39 @@
> +From 5b3dd2599ebde1846750aaf7c79576ad45246ffa Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Tue, 8 Dec 2015 11:41:08 +0000
> +Subject: [PATCH] Fix va_list not declared
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +When compiling with uClibc-ng the following error is seen.
> +
> +In file included from ../deps/v8/src/log-utils.cc:5:0:
> +../deps/v8/src/log-utils.h:64:39: error: ?va_list? has not been declared
> +     void AppendVA(const char* format, va_list args);
> +
> +This patch fixes the issue by adding the missing #include <cstdarg>.  Note
> +that this fix has already be included upstream, see
> +https://github.com/nodejs/node/blob/8a43a3d/deps/v8/src/log-utils.h
> +
> +Signed-off-by: Martin Bark <martin@barkynet.com>
> +---
> + deps/v8/src/log-utils.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/deps/v8/src/log-utils.h b/deps/v8/src/log-utils.h
> +index 87dab52..6714307 100644
> +--- a/deps/v8/src/log-utils.h
> ++++ b/deps/v8/src/log-utils.h
> +@@ -5,6 +5,8 @@
> + #ifndef V8_LOG_UTILS_H_
> + #define V8_LOG_UTILS_H_
> + 
> ++#include <cstdarg>
> ++
> + #include "src/allocation.h"
> + #include "src/base/platform/mutex.h"
> + #include "src/flags.h"
> +-- 
> +2.5.0
> +
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index b0f4f2b..769710c 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -37,7 +37,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  choice
>  	prompt "Node.js version"
>  	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
> -	default BR2_BR2_PACKAGE_NODEJS_4_X
> +	default BR2_PACKAGE_NODEJS_5_X
>  	help
>  	  Select the version of Node.js you wish to use.
>  
> @@ -48,14 +48,16 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
>  	bool "v0.12.9"
>  	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  
> -config BR2_BR2_PACKAGE_NODEJS_4_X
> -	bool "v4.2.3"
> +config BR2_PACKAGE_NODEJS_5_X
> +	bool "v5.3.0"
>  	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_USE_WCHAR
>  
> -comment "v4.2.3 needs a toolchain w/ gcc >= 4.8"
> +comment "v5.3.0 needs a toolchain w/ gcc >= 4.8, wchar"
>  	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on !BR2_USE_WCHAR
>  
>  endchoice
>  
> @@ -63,7 +65,7 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
>  	string
>  	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
>  	default "0.12.9"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
> -	default "4.2.3"		if BR2_BR2_PACKAGE_NODEJS_4_X
> +	default "5.3.0"		if BR2_PACKAGE_NODEJS_5_X
>  
>  menu "Module Selection"
>  
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 7d58a54..c3bdc44 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -4,5 +4,5 @@ sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0
>  # From upstream URL: http://nodejs.org/dist/v0.12.9/SHASUMS256.txt
>  sha256	35daad301191e5f8dd7e5d2fbb711d081b82d1837d59837b8ee224c256cfe5e4  node-v0.12.9.tar.gz
>  
> -# From upstream URL: http://nodejs.org/dist/v4.2.3/SHASUMS256.txt
> -sha256  9e8aef1e47b317575c421c8d10a80e6c319b26969b566d3b84e49e65a92837f4  node-v4.2.3.tar.xz
> +# From upstream URL: http://nodejs.org/dist/v5.3.0/SHASUMS256.txt
> +sha256  e5115ee78c31ac3af0f2b3553aa84fff2f49ae59bd6e01e11d78ce86c544569e  node-v5.3.0.tar.xz
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 7ede89d..af47b26 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
> -ifeq ($(BR2_BR2_PACKAGE_NODEJS_4_X),y)
> +ifeq ($(BR2_PACKAGE_NODEJS_5_X),y)
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  else
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
