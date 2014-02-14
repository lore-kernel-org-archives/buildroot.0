From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 15:36:34 +0100
Subject: [Buildroot] [PATCH 1/1] Use libm.so when testing external
 compiler ABI
In-Reply-To: <1392385415-19367-1-git-send-email-syntheticpp@gmx.net>
References: <1392385415-19367-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20140214153634.1377738a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

On Fri, 14 Feb 2014 14:43:35 +0100, Peter K?mmel wrote:
> crt1.o could not be used to test for eabihf because
> it does not list the tag Tag_ABI_VFP_args.
> 
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  toolchain/helpers.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index faa9d90..c41d757 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -284,8 +284,8 @@ check_arm_abi = \
>  		echo "External toolchain uses the unsuported OABI" ; \
>  		exit 1 ; \
>  	fi ; \
> -	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
> -	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
> +	EXT_TOOLCHAIN_LIBM=`LANG=C $${__CROSS_CC} -print-file-name=libm.so` ; \
> +	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_LIBM} | grep -q "Tag_ABI_VFP_args:" ; then \
>  		EXT_TOOLCHAIN_ABI="eabihf" ; \
>  	else \
>  		EXT_TOOLCHAIN_ABI="eabi" ; \

This is more or less the same patch as proposed at
https://bugs.busybox.net/show_bug.cgi?id=6842.

Originally, the reason why I had chosen to check crt1.o instead of
a .so file is because crt1.o exists even for purely static toolchains
(i.e no support for shared libraries). Even though I admit that the
likelihood of finding such toolchains for ARM is quite small, I'd like
to understand why crt1.o doesn't have the Tag_ABI_VFP_args. Is this
happening when using a Buildroot toolchain as an external toolchain? If
so, maybe it's Buildroot who actually does something wrong when
building the toolchain, because the Linaro toolchains do have
Tag_ABI_VFP_args in crt1.o :

The multilib variant compiled EABIhf:

$ arm-linux-gnueabihf-readelf -A ./arm-linux-gnueabihf/libc/usr/lib/arm-linux-gnueabihf/crt1.o | grep Tag_ABI_VFP_args
  Tag_ABI_VFP_args: VFP registers
$

The multilib variant compiled EABI:

$ arm-linux-gnueabihf-readelf -A ./arm-linux-gnueabihf/libc/usr/lib/arm-linux-gnueabi/crt1.o | grep Tag_ABI_VFP_args
$

So I'd prefer to have an understanding of why crt1.o is not EABIhf
before applying this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
