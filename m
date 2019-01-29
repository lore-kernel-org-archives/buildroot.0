From: Joakim Bech <joakim.bech@linaro.org>
Date: Tue, 29 Jan 2019 11:26:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128170533.16555-1-joakim.bech@linaro.org>
 <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
Message-ID: <20190129102608.4k3wfli3dyomb7aa@debby>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jan 28, 2019 at 11:22:13PM +0100, Arnout Vandecappelle wrote:
>  Hi Joakim,
> 
>  Thanks for this updated patch, but you haven't taken into account the rest of
> Thomas's comments.
> 
>  I'll repeat them below for your convenience.
> 
For some reason I totally missed those, thanks for the reminder!

> 
> On 28/01/2019 18:05, Joakim Bech wrote:
> [snip]
> > +config BR2_KERNEL_HEADERS_5_00
> > +	bool "Linux 5.00.x kernel headers"
> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> 
>  Adding support for the 5.0 headers should be a separate patch. See commit
> 649883d2c9957b7a7fcf81c4475f848ad8865ca1 for an example how it was done for 4.20.
> 
So after looking a bit more into the git log of how patches where
created in the past it looks like I should create 4 patches, "pseudo git
log -4".
- toolchain-external: update Arm ARM 8.2-2019.01
- toolchain-external: update Arm AArch64-BE toolchain 8.2-2019.01
- toolchain-external: update Arm AArch64 toolchain 8.2-2019.01
- toolchain: add necessary options to support 5.0 kernel headers

>  Also, please call it 5.0 and not 5.00.
> 
Will fix.

>  And also some new comments:
> 
> [snip]
> > diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> > index cda90f7517..90e44d5c3b 100644
> > --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> > +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> > @@ -2,3 +2,8 @@
> >  md5 319ca548ff05b0ec1008988a7e5ab619 gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
> >  # locally calculated
> >  sha256 0142366da2f30feb1c366997cbdaa02286c8f1aa527c0fc177ee5ce8e77970fc gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
> 
>  Remove the existing hashes: they are no longer used since the version has
> changed. In other words, every line of this file should be updated, except for
> the # locally calculated.
> 
Will fix.

> > diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in> index 0449737889..69c2f7425e 100644
> > --- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> > +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> > @@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A + EABIhf"
> >  	depends on !BR2_STATIC_LIBS
> >  
> >  config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
> > -	bool "Arm ARM 2018.11"
> > +	bool "Arm ARM 2019.01"
> >  	depends on BR2_arm
> >  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
> >  	depends on BR2_HOSTARCH = "x86_64"
> > @@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
> >  	select BR2_TOOLCHAIN_HAS_SSP
> >  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> >  	select BR2_INSTALL_LIBSTDCPP
> > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> >  	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> >  	select BR2_TOOLCHAIN_HAS_FORTRAN
> >  	help
> 
>  The help text here also says which GDB, GCC, binutils and kernel headers
> versions it is using. Please update that to the actual versions.
> 
I cross checked with the versions mentioned in the release notes at
(scroll down):
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads and
it seems like all versions are the same as in the previous (2018.11)
release, so no need for any update. However I found some inconsistency
between arm-arm and arm-aarch64{-be}, the latter doesn't mention the
tools/versions in the help text. Do you want me to add that similar to
arm-arm?

> [snip]
> > diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > index 08a79ee4d9..48eb1ea080 100644
> > --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > @@ -123,6 +123,10 @@ choice
> >  	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
> >  	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
> >  
> > +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_00
> > +	bool "5.00.x"
> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> > +
> 
>  Note that this bit belongs to the patch that adds the 5.0 version.
> 
Will fix.

> >  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20
> >  	bool "4.20.x"
> >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> > 
> 
>  And finally, there is also an ARM aarch64-be toolchain that should be updated.
> 
Will add that also.

Final question, I can see most patches on the mailing list prefixes with
[Buildroot] [PATCH ...], i.e., I suppose that is something you want be
to do also for future patches/patch sets?

Thanks for the review, feedback and guidance.

-- 
Regards,
Joakim
