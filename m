From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Nov 2014 12:15:03 +0000
Subject: [Buildroot] [PATCH] toolchain/external: fix building the
	wrapper on MIPS
In-Reply-To: <1417025350-18199-1-git-send-email-yann.morin.1998@free.fr>
References: <1417025350-18199-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <547715C7.7000304@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 11/26/2014 06:09 PM, Yann E. MORIN wrote:
> Some crazy folks use MIPS machines as build machines. ;-)
> 
> On MIPS, the only acceptable hash-style is 'sysv', because the MIPS ABI
> defines that the GOT ordering to be the same as the symbols ordering,
> while GNU hash requires symbols to be sorted by their hash.
> 
> Looking at binutils' code, it seems that only MIPS suffers from that
> limitation.
> 
> Currently, we force the toolchain wrapper to be linked with both hash
> styles, which breaks on MIPS.
> 
> So, fix that but singling out MIPS, and use sysv in that case, and both
> otherwise.
> 
> Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Absolutely untested on MIPS, as I do not have any MIPS machine powerfull
> enough to do a build. Vicente will have to test it, since he is that
> crazy one using MIPS build machines! ;-)
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index da3718c..51e0af5 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -625,6 +625,15 @@ define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
>  endef
>  endif
>  
> +# We use --hash-style=both to increase the compatibility of
> +# the generated binary with older platforms, except for MIPS,
> +# where the only acceptable hash style is 'sysv'
> +ifeq ($(findstring mips,$(HOSTARCH)),mips)
> +TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE = sysv
> +else
> +TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE = both
> +endif
> +
>  # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
>  # symlinks for everything else. Skip gdb symlink when we are building our
>  # own gdb to prevent two gdb's in output/host/usr/bin.
> @@ -647,9 +656,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>  			;; \
>  		esac; \
>  	done ;
> -	# We use --hash-style=both to increase the compatibility of
> -	# the generated binary with older platforms
> -	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
> +	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) \
> +		-s -Wl,--hash-style=$(TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE) \
>  		toolchain/toolchain-external/ext-toolchain-wrapper.c \
>  		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
>  endef
> 

I have tried your patch in a MIPS box and it works like a charm :-)

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
