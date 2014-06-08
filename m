From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 18:17:05 +0200
Subject: [Buildroot] [PATCH 02/11] toolchain-external: do not pass
 TOOLCHAIN_EXTERNAL_CFLAGS for kernel headers check
In-Reply-To: <1401619668-28062-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140608161705.GF3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 12:47 +0200, Thomas Petazzoni spake thusly:
> When getting the sysroot used for the kernel headers version check,
> passing TOOLCHAIN_EXTERNAL_CFLAGS causes a problem when used with
> multilib toolchains, where only the main sysroot has the header files,
> and the other sysroots only have the libraries.
> 
> Since the kernel headers version used is normally the same for all
> sysroots, this commit solves this problem by removing the
> TOOLCHAIN_EXTERNAL_CFLAGS argument when calling
> toolchain_find_sysroot, so that it returns the main sysroot, in which
> <linux/version.h> can be found for the kernel headers version check.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I don't have a setup handy for testing this, so it's only a reviewed-by.
But I don't expect it to break anything.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 70781db..6816b3f 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -467,7 +467,7 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>  		exit 1 ; \
>  	fi ; \
>  	$(call check_kernel_headers_version,\
> -		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
> +		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
>  		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
>  	if test "$(BR2_arm)" = "y" ; then \
>  		$(call check_arm_abi,\
> -- 
> 1.9.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
