From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jul 2013 19:04:26 +0200
Subject: [Buildroot] [PATCHv2 2/4] toolchain: check ARM EABI vs. EABIhf
 for external toolchains
In-Reply-To: <1374048801-7666-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374048801-7666-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1374048801-7666-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130717170426.GB3385@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-17 10:13 +0200, Thomas Petazzoni spake thusly:
> Following the introduction of the support of EABIhf as a second ARM
> ABI, it is important to check whether the external toolchain provided
> by the user actually uses the ABI that has been selected in the
> Buildroot configuration. This commit introduces such a check by
> looking at the 'Tag_ABI_VFP_args' tag of the architecture-specific
> section of the ELF headers. This assumes that ELF is the binary format
> used on ARM, which may not be the case on ARM noMMU systems (they use
> the FLAT binary format), but Buildroot doesn't have support for such
> systems at the moment.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk                     | 15 +++++++++++++++
>  toolchain/toolchain-external/ext-tool.mk |  5 ++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 94fe015..a8dab90 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -279,10 +279,25 @@ check_uclibc = \
>  #
>  check_arm_abi = \
>  	__CROSS_CC=$(strip $1) ; \
> +	__CROSS_READELF=$(strip $2) ; \
>  	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
>  	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
>  		echo "External toolchain uses the unsuported OABI" ; \
>  		exit 1 ; \
> +	fi ; \
> +	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
> +	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
> +		EXT_TOOLCHAIN_ABI="eabihf" ; \
> +	else \
> +		EXT_TOOLCHAIN_ABI="eabi" ; \
> +	fi ; \
> +	if [ "$(BR2_ARM_EABI)" = "y" -a $${EXT_TOOLCHAIN_ABI} = "eabihf" ] ; then \
	                                ^^^^^^^^^^^^^^^^^^^^^
Obviously, EXT_TOOLCHAIN_ABI can't be empty, but for consistecy, it
would be better to quote it, too.

> +		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
> +		exit 1 ; \
> +	fi ; \
> +	if [ "$(BR2_ARM_EABIHF)" = "y" -a $${EXT_TOOLCHAIN_ABI} = "eabi" ] ; then \
	                                  ^^^^^^^^^^^^^^^^^^^^^
Ditto.

Otherwise:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
