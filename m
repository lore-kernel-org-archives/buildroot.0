From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 May 2017 13:24:48 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20170518111744.pto4qg53yttqe4a2@tarshish>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <20170517153353.0bd784c9@free-electrons.com>
 <20170518045754.ecwqdtj35acvzk6b@tarshish>
 <20170518091030.66a9cbee@free-electrons.com>
 <20170518111744.pto4qg53yttqe4a2@tarshish>
Message-ID: <20170518132448.3996edba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 14:17:44 +0300, Baruch Siach wrote:

> Would that be better (untested)?
> 
> diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> index e29837357a27..e15ceeb426fa 100644
> --- a/toolchain/toolchain/toolchain.mk
> +++ b/toolchain/toolchain/toolchain.mk
> @@ -21,8 +21,10 @@ TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
>  # IFF_DORMANT and IFF_ECHO, add another macro to suppress them in the
>  # kernel header, and avoid macro/enum conflict.
>  #
> +# Kernel version 3.12 introduced the libc-compat.h header.
> +#
>  # [1] http://www.openwall.com/lists/musl/2015/10/08/2
> -ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12),yy)
>  define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
>  	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
>  		$(STAGING_DIR)/usr/include/linux/libc-compat.h

Yes. The question is whether we will see those build failures due to
kernel/userspace headers conflicts. Do you remember a simple
package/scenario that triggers the problem?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
