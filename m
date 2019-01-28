From: Joakim Bech <joakim.bech@linaro.org>
Date: Mon, 28 Jan 2019 15:35:07 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: update AArch32/AArch64
 toolchain to 8-2-2019.01
In-Reply-To: <20190128150834.206739d5@windsurf>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128140206.25948-1-joakim.bech@linaro.org>
 <20190128150834.206739d5@windsurf>
Message-ID: <20190128143507.GA31160@guppy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 28, 2019 at 03:08:34PM +0100, Thomas Petazzoni wrote:
> Hello Joakim,
> 
> Thanks for your contribution!
> 
Thanks! This is my first time ever sending a patch to Buildroot and
admittedly I'm not very well versed with all details in Buildroot, so
pardon my ignorance here and I appreciate the guidance I get.

> On Mon, 28 Jan 2019 15:02:06 +0100
> Joakim Bech <joakim.bech@linaro.org> wrote:
> 
> >  package/linux-headers/Config.in.host                         | 4 ++++
> >  toolchain/Config.in                                          | 5 +++++
> 
> Introducing support for 5.0 kernel headers should be part of a separate
> patch.
> 
> >  .../toolchain-external-arm-aarch64/Config.in                 | 4 ++--
> >  .../toolchain-external/toolchain-external-arm-arm/Config.in  | 4 ++--
> >  .../toolchain-external-custom/Config.in.options              | 4 ++++
> >  5 files changed, 17 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> > index a6055e75b9..fd0cef8b21 100644
> > --- a/package/linux-headers/Config.in.host
> > +++ b/package/linux-headers/Config.in.host
> > @@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_4_20
> >  	bool "Linux 4.20.x kernel headers"
> >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> >  
> > +config BR2_KERNEL_HEADERS_5_00
> 
> Use BR2_KERNEL_HEADERS_5_0 instead.
> 
> > +	bool "Linux 5.00.x kernel headers"
> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> > +
> >  config BR2_KERNEL_HEADERS_VERSION
> >  	bool "Manually specified Linux version"
> >  	help
> > diff --git a/toolchain/Config.in b/toolchain/Config.in
> > index baf192c936..fd197f2407 100644
> > --- a/toolchain/Config.in
> > +++ b/toolchain/Config.in
> > @@ -374,10 +374,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> >  	bool
> >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> >  
> > +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> > +	bool
> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> > +
> >  # This order guarantees that the highest version is set, as kconfig
> >  # stops affecting a value on the first matching default.
> >  config BR2_TOOLCHAIN_HEADERS_AT_LEAST
> >  	string
> > +	default "5.00" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> >  	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> >  	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> >  	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
> 
> > diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> > index fbb5e025e8..279cb88f31 100644
> > --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> > +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> > @@ -1,5 +1,5 @@
> >  config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
> > -	bool "Arm AArch64 2018.11"
> > +	bool "Arm AArch64 2019.01"
> 
> I don't see how this can be sufficient to update the toolchain version.
> Surely the .mk and .hash files need to be changed as well.
> 
Chapter 17.3 and 17.4 is about this in the documentation, right?

For hash files, are you referring to these:

$ find -name "*.hash" | grep gcc
./package/gcc/gcc-initial/gcc-initial.hash
./package/gcc/gcc.hash
./package/gcc/gcc-final/gcc-final.hash

I.e. add a line to each of them stating the source and the hash of the
tarball itself? Only use SHA-512 I suppose? The documentation lists both
SHA1 and SHA-256.

Btw, what is the difference between the three (initial, ..., final)?


Regarding the makefiles, same there?

$ find -name "*.mk" | grep gcc
./package/gcc/gcc.mk
./package/gcc/gcc-initial/gcc-initial.mk
./package/gcc/gcc-final/gcc-final.mk

After looking at those it's not directly clear what I'm supposed to
update there.

-- 
Regards,
Joakim
