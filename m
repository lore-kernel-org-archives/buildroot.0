From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 May 2014 00:35:27 +0200
Subject: [Buildroot] [PATCH v3] toolchain-external: Fix EABIhf check
In-Reply-To: <2531b66f78bfdb046ddb.1399375540@argentina>
References: <2531b66f78bfdb046ddb.1399375540@argentina>
Message-ID: <536C06AF.2000107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/14 13:25, Thomas De Schampheleire wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> Currently the check for EABI/EABIhf toolchains looks for the
> Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds in an
> EABIhf toolchain.
> In uClibc, however, crt1.o is not compiled from c but assembly, so the
> Tag_ABI_VFP_args attribute is not added in the object file. This causes
> the EABIhf check in the external toolchain logic to fail for
> uClibc-based toolchains.
> 
> Fix by compiling a dummy .c file and trying to link the object against the
> C library. Since it is impossible to mix EABI and EABIhf code, a mismatch
> between the buildroot and toolchain ABI settings will be detected during
> this link step.
> 
> Fixes bug #6842: https://bugs.busybox.net/show_bug.cgi?id=6842
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> [ThomasDS: do full link iso readelf test, update commit message]
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v3: (ThomasDS)
>   - v2 properly recognized a uClibc EABIhf toolchain, but failed to detect a
>     mismatch with buildroot settings (detected by ThomasP). Fix by
>     performing an actual link step to detect any incompatibility.
> v2: (ThomasDS)
>   - avoid creating a temporary source file
>   - update commit message
> 
>  toolchain/helpers.mk |  18 ++++++------------
>  1 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -297,20 +297,14 @@ check_arm_abi = \
>  		echo "External toolchain uses the unsuported OABI" ; \
>  		exit 1 ; \
>  	fi ; \
> -	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
> -	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
> -		EXT_TOOLCHAIN_ABI="eabihf" ; \
> -	else \
> -		EXT_TOOLCHAIN_ABI="eabi" ; \
> -	fi ; \
> -	if [ "$(BR2_ARM_EABI)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabihf" ] ; then \
> -		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
> +	TEMP_OBJ_FILE=`mktemp --tmpdir --suffix=.o`; \
> +	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o $${TEMP_OBJ_FILE} /dev/null - 2>/dev/null; then \

 You can write directly to /dev/null instead of going through TEMP_OBJ_FILE, no?

> +		abistr_$(BR2_ARM_EABI)='EABI'; \
> +		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
> +		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \

 Nice approach! But to keep the original output, you could use:

$${abistr_y} selected, but toolchain uses $${abistr_}


 Regards,
 Arnout

>  		exit 1 ; \
>  	fi ; \
> -	if [ "$(BR2_ARM_EABIHF)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabi" ] ; then \
> -		echo "Incorrect ABI setting: EABIhf selected, but toolchain uses EABI" ; \
> -		exit 1 ; \
> -	fi
> +	rm -f $${TEMP_OBJ_FILE}
>  
>  #
>  # Check that the external toolchain supports C++
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
