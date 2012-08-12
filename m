From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2012 17:18:22 +0200
Subject: [Buildroot] [PATCH 04/20] toolchain-external: improve glibc
	support to test availability of RPC
In-Reply-To: <80f89c34315be739c52935f1b0606dc5531e6eb3.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <80f89c34315be739c52935f1b0606dc5531e6eb3.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201208121718.23105.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Saturday 11 August 2012 19:40:36 Thomas Petazzoni wrote:
> Basically, the BR2_TOOLCHAIN_EXTERNAL_GLIBC option no longer
> unconditionally selects BR2_TOOLCHAIN_HAS_NATIVE_RPC since there are
> glibc toolchains that don't have RPC support. All the predefined
> toolchain profiles are updated to take into account this change: for
> the moment, all glibc toolchains that have pre-defined toolchains have
> RPC support, but further patches in the series add pre-defined glibc
> toolchains that don't have RPC support. In the case of custom glibc
> toolchains, a question is asked to the user so that he can say whether
> the external glibc toolchain has RPC support or not. The validity of
> this configuration option is checked by the new
> check_glibc_rpc_feature function in helpers.mk.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk                   |   27 ++++++++++++++++++-----
>  toolchain/toolchain-external/Config.in |   37 ++++++++++++++++++++++++--------
>  2 files changed, 50 insertions(+), 14 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 462cd87..7036552 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -172,9 +172,10 @@ create_lib64_symlinks = \
>  	(cd $(STAGING_DIR)/usr ; ln -s lib lib64)
>  
>  #
> -# Check the availability of a particular glibc feature. We assume that
> -# all Buildroot toolchain options are supported by glibc, so we just
> -# check that they are enabled.
> +# Check the availability of a particular glibc feature. This function
> +# is used to check toolchain options that are always supported by
> +# glibc, so we simply check that the corresponding option is properly
> +# enabled.
>  #
>  # $1: Buildroot option name
>  # $2: feature description
> @@ -186,6 +187,22 @@ check_glibc_feature = \
>  	fi
>  
>  #
> +# Check the availability of RPC support in a glibc toolchain
> +#
> +# $1: sysroot directory
> +#
> +check_glibc_rpc_feature = \
> +	IS_IN_LIBC=`test -f $(1)/usr/include/rpc/rpc.h && echo y` ; \
> +	if [ x$(BR2_TOOLCHAIN_EXTERNAL_INET_RPC) != x"y" -a x$${IS_IN_LIBC} = x"y" ] ; then \

Why use the 'x' char, and why not simply quote everything (same number of chars,
yet easier to read, IMHO):
	if [ "$(BR2_TOOLCHAIN_EXTERNAL_INET_RPC)" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \

And so on below (and in other patches, too).

> +		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
> +		exit 1 ; \
> +	fi ; \
> +	if [ x$(BR2_TOOLCHAIN_EXTERNAL_INET_RPC) = x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \
> +		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
> +		exit 1 ; \
> +	fi
> +
> +#
>  # Check the correctness of a glibc external toolchain configuration.
>  #  1. Check that the C library selected in Buildroot matches the one
>  #     of the external toolchain
> @@ -202,10 +219,10 @@ check_glibc = \
>  	fi; \
>  	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
>  	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
> -	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_NATIVE_RPC,RPC support) ;\
>  	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
>  	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
> -	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
> +	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
> +	$(call check_glibc_rpc_feature,$${SYSROOT_DIR})

This change is the reason why I always finish all lines with a backslash,
even the last line. Thus, adding or removing a sunlge line is obvious, while
here I add to double-check the wchar line, and why it was -/+.

[--SNIP--]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
