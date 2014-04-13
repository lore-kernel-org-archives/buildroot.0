From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 10:05:12 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: Introduce kernel
 headers sanitization
In-Reply-To: <1397338462-22573-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1397338462-22573-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140413100512.540e6923@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Sat, 12 Apr 2014 18:34:22 -0300, Ezequiel Garcia wrote:
> The Nios-II Sourcery external toolchain (the only Nios-II we currently
> support) exports broken kernel headers. In particular, these kernels should
> be exported using the "headers_install" rule which applies a set of fixes
> on the kernel headers so they are suitable for userspace usage.
> 
> In order to fix this, let's introduce a compile-time hidden option, to be
> selected by such broken toolchains, and perform the header fixes ourselves.
> The result is equivalent to apply the "headers_install" rule.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> v1 -> v2: Yann asked to replace ${STAGING_DIR} with $(STAGING_DIR)
> 
>  toolchain/toolchain-external/Config.in             |  7 +++++++
>  toolchain/toolchain-external/toolchain-external.mk | 15 +++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 3990336..9a3ab6f 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -434,6 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	select BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
>  	help
>  	  Sourcery CodeBench toolchain for the Nios-II architecture,
>  	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
> @@ -1206,4 +1207,10 @@ config BR2_BFIN_INSTALL_FLAT_SHARED
>  	  into a buildroot rootfs image built with binary format that is not
>  	  shared FLAT.
>  
> +# Some toolchains have their headers broken and need to be sanitized.
> +# Currently, this is only needed on Nios-II external Sourcery toolchain,
> +# to fix the Linux headers.
> +config BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
> +	bool

I am wondering whether this really warrants an additional hidden
Kconfig option, since the matter is purely "internal" to the external
toolchain backend. See my proposal below.

> +
>  endif # BR2_TOOLCHAIN_EXTERNAL
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 547d55d..c33ce85 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -630,6 +630,20 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>  		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
>  endef
>  
> +# This sed magic is taken from Linux headers_install.sh script.
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED),y)

Remove this test.

> +define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
> +	$(Q)$(call MESSAGE,"Sanitizing kernel headers");
> +	find $(STAGING_DIR)/usr/include/linux/ -name "*.h" | xargs sed -r -i \
> +		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
> +		-e 's/__attribute_const__([ \t]|$$)/\1/g' \
> +		-e 's@^#include <linux/compiler.h>@@' \
> +		-e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$$)/\1__attribute__((packed))\2/g' \
> +		-e 's/(^|[ \t(])(inline|asm|volatile)([ \t(]|$$)/\1__\2__\3/g' \
> +		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
> +endef

and keep TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS always defined.

Then, replace:

else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2

by:

else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS

and there you are.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
