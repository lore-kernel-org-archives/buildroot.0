From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2015 14:42:33 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain-external: add OSELAS
 2014.12.0 Cortex-M3 toolchain
In-Reply-To: <1435340002-20396-5-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1435340002-20396-5-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150627124233.GA30876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2015-06-26 14:33 -0300, Guido Mart?nez spake thusly:
> Binary toolchain based on uClibc for Cortex-M3 processor based on GCC
> 4.9.2.
> 
> This toolchain has no resolver support, thus, we don't select
> BR2_HAS_RESOLVER_SUPPORT.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
[--SNIP--]
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index 3980c62..342ce21 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -74,3 +74,7 @@ sha256 79a1a4be93e2a63acb137170e98bdfbf744bd9ca7b15b76ab512d1e0dfec834e  crossx8
>  sha256 aec4d560dc601e397fc86a9759166005afba22ad666d1a48019b5102c534ccc1  crossx86-sh4eb-linux-musl-1.1.6.tar.xz
>  sha256 68eda0795aacd4371b45a6c58c5c75e86c0c2fdf7ebc2c0b7d3752462c848260  crossx86-x86_64-linux-musl-1.1.6.tar.xz
>  sha256 6bef5ee2cdb9fa35e49ce0a270f6d7c48f3268c6f6345ad5ca0b8137982b4690  crossx86-x86_64-x32-linux-musl-1.1.6.tar.xz
> +
> +# Oselas Cortex-M3 toolchain
> +# Locally calculated
> +sha1	75e7ae45b514b10ad64ff5588770434cea755496	oselas.toolchain-2014.12.0-arm-cortexm3-uclinuxeabi-gcc-4.9.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.16-sanitized_2014.12.0_i386.deb

We prefer sha256 when locally computed.

But in this case, we do have an upstream-provided set of hashes:

    http://debian.pengutronix.de/debian/dists/sid/main/binary-i386/Packages

so we should use it (even though it is not https... :-( ):

    # From: http://debian.pengutronix.de/debian/dists/sid/main/binary-i386/Packages
    sha1    75e7ae45b514b10ad64ff5588770434cea755496  oselas.......
    sha256  1c542d3aad4e592270918d54bb02a90580902d573dc4d9b59aabfd0697220f3e  oselas.......

Otherwise, looks good.

Yet, there is also a 64-bit variant for this toolchain, so maybe we
could download the one corresponding to the user's host, like so:

    [...]
    else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412),y)
    TOOLCHAIN_EXTERNAL_SITE = http://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/
    ifeq ($(HOSTARCH),x86)
    TOOLCHAIN_EXTERNAL_SOURCE = oselas.toolchain-[...]_i386.deb
    else
    TOOLCHAIN_EXTERNAL_SOURCE = oselas.toolchain-[...]_amd64.deb
    endif
    else ifeq (...)
    [...]

And of course, no longer needed to have the option select
BR2_HOSTARCH_NEEDS_IA32_LIBS in the Config.in, since there would be a
64-bit-native variant.

(But don't forget to add the hashes for that variant, too! ;-) )

Regards,
Yann E. MORIN.

> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 22f8118..e9514c1 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -293,6 +293,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
>  TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412),y)
> +TOOLCHAIN_EXTERNAL_SITE = http://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/
> +TOOLCHAIN_EXTERNAL_SOURCE = oselas.toolchain-2014.12.0-arm-cortexm3-uclinuxeabi-gcc-4.9.2-uclibc-0.9.33.2-binutils-2.24-kernel-3.16-sanitized_2014.12.0_i386.deb
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
>  TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
> @@ -421,6 +424,13 @@ define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
>  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
>  		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>  endef
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412),y)
> +# Special handling for OSELAS toolchains
> +define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
> +	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
> +	ar fp $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) data.tar.xz | $(XZCAT) | \
> +		$(TAR) $(TAR_STRIP_COMPONENTS)=5 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> +endef
>  else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
>  # Normal handling of toolchain tarball extraction.
>  define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
> -- 
> 2.1.4
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
