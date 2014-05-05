From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 00:16:52 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: Fix EABIhf check
In-Reply-To: <ddb1629069cddb3d19fb.1399291827@argentina>
References: <ddb1629069cddb3d19fb.1399291827@argentina>
Message-ID: <20140506001652.05e9a81a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 05 May 2014 14:10:27 +0200, Thomas De Schampheleire wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> Currently the check for EABI/EABIhf toolchains looks for the
> Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds in an
> EABIhf toolchain.
> In uClibc, however, crt1.o is not compiled from c but assembly, so the
> Tag_ABI_VFP_args attribute is not added in the object file.  This causes
> the EABIhf check in the external toolchain logic to fail for
> uClibc-based toolchains.
> 
> Fix by compiling a temporary .c file and checking for the attribute.
> 
> Fixes bug #6842: https://bugs.busybox.net/show_bug.cgi?id=6842
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> [ThomasDS: use /dev/null as input, update commit message]
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Thanks for pushing this further. Unfortunately, it doesn't work really
well. If you use an EABIhf toolchain, but select the EABI in Buildroot,
the check is not going to complain. Test for example the following
configuration:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_FPU_VFPV2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://releases.linaro.org/14.02/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y

See below for the explanation.

>  toolchain/helpers.mk |  6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -297,12 +297,14 @@ check_arm_abi = \
>  		echo "External toolchain uses the unsuported OABI" ; \
>  		exit 1 ; \
>  	fi ; \
> -	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
> -	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
> +	TEMP_OBJ_FILE=`mktemp --tmpdir --suffix=.o`; \
> +	$${__CROSS_CC} -x c -c -o $${TEMP_OBJ_FILE} /dev/null; \

The problem is that here __CROSS_CC, as passed as the first argument to
this function, is equal to:

	$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)

and TOOLCHAIN_EXTERNAL_CFLAGS contain some flags that will generate a
softfp binary because we've selected EABI+VFP in the Buildroot
configuration. I.e, we're not testing what the toolchain is natively
producing, but rather that the flags are matching the configuration...
which they are because they are actually built using the configuration.

Note that building a softfp binary with an hardfp toolchain doesn't
fail because you're doing only the compilation and not the linking in
your test.

One option would be to completely get rid of
$(TOOLCHAIN_EXTERNAL_CFLAGS). However, the flags in here are also used
to make sure we're using the right sysroot in the toolchain, in case of
multilib toolchains, and whether we're passing -mfloat-abi=soft or
-mfloat-abi=hard can have an impact on the detected sysroot. Basically,
we're making circles here.

I don't really have a good solution to offer, unfortunately :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
