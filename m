From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Oct 2016 19:47:07 +0200
Subject: [Buildroot] [PATCH] toolchain-external.mk: fix ARCH_SUBDIR for
 side-by-side sysroot toolchains
In-Reply-To: <20161027153342.27718-1-Vincent.Riera@imgtec.com>
References: <20161027153342.27718-1-Vincent.Riera@imgtec.com>
Message-ID: <20161027174707.GA3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-10-27 16:33 +0100, Vicente Olivert Riera spake thusly:
> ARCH_SUBDIR is computed based on the value of ARCH_SYSROOT_DIR and
> SYSROOT_DIR. For nested toolchains ARCH_SYSROOT_DIR is a subdir of
> SYSROOT_DIR, so a sed command like this one...
> 
>   sed -r -e "s:^${SYSROOT_DIR}(.*)/$:\1:"
> 
> ...basically removes the leading SYSROOT_DIR part from ARCH_SYSROOT_DIR.
> 
> But, for side-by-side sysroot toolchains ARCH_SYSROOT_DIR and
> SYSROOT_DIR are at the same level, so the above sed command doesn't
> make any effect. This patch detects that situation and uses an
> appropriate sed command for it.

As discussed on IRC, there was a previous patch of mine on the topic:
    https://patchwork.ozlabs.org/patch/627505/

I did not yet send v2 of that patch:
    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/ext-toolchain-fixes&id=30ab28ce467b7d7dea5e181cae69ae882f936e98

I'll send it shortly so we can compare the two and decide which is
best.

Regards,
Yann E. MORIN.

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index f7c6a19..a25c102 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -665,7 +665,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
>  		fi ; \
>  	fi ; \
> -	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> +	if [ "`dirname $${ARCH_SYSROOT_DIR}`" = "`dirname $${SYSROOT_DIR}`" ] ; then \
> +		SYSROOT_DIR_DIRNAME=`dirname $${SYSROOT_DIR}`/ ; \
> +		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR_DIRNAME}(.*)/$$:\1:"` ; \
> +	else \
> +		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> +	fi ; \
>  	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
>  	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
>  endef
> -- 
> 2.10.1
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
