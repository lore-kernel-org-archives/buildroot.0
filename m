From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 15 Aug 2007 16:40:11 +0200
Subject: [Buildroot] [patch] kernel-headers: lzma causing issues
In-Reply-To: <46C2E8DB.5020309@mainstreetsoftworks.com>
References: <46C24F7F.1020203@mainstreetsoftworks.com>
	<1187165518.4942.6.camel@elrond.sweden.atmel.com>
	<46C2E8DB.5020309@mainstreetsoftworks.com>
Message-ID: <1187188811.4942.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-08-15 klockan 07:51 -0400 skrev Brad House:
> >> +config BR2_KERNEL_HEADERS_LZMA
> >> +	bool "use lzma initramfs kernel patches"
> >> +	default y
> >> +	help
> >> +	  Apply patches which allow for lzma compressed
> >> +	  initramfs filesystems.  This requires the lzma
> >> +	  program in your development environment.	
> >> +
> > 
> > Since it also breaks unless you have lzma causing headache, 
> > I think the default should be to not use the lzma patch...
> 
> ok, yeah, I'd agree with that ... I was just maintaining
> compatibility for those who are using it by defaulting to y.
> 
> > I am working on a new scheme where the target/linux and
> > toolchain/kernel-headers are integrated, but this
> > needs a lot more testing and will (as agreed with Bernhard
> > be reviewed before applied, but it seems reasonable
> > to do this as an intermediate fix.
> 
> Ah, yeah, it would definitely make sense for those to be
> integrated. It took me a minute to realize the kernel
> headers version is what determined which release of the
> kernel got built ;)

In the stuff I am working on you can choose one out of three strategies.
"tested" version (equivalent with the current kernel headers)
"std" version linux-2.6.x and (with linux-2.6.y.z option)
"experimental" version (latest stable, latest git or mm patch)

The current kernel headers will be applied automatically to 
the tested version, and can be choosen for the other versions.
You can also add board specific patches (Before kernel headers
are generated)

You can also add up to three patches located anywhere...
Ideally that should be downloadable patches.

You also have choices for which version (vmlinux, zImage, uImage,
bzImage) or freetext entry for linux target.

You can choose how to configure linux:

cp $(LINUX26_KCONFIG) .config ; make oldconfig
make <board>_defconfig
make ARCH=$(ARCH) xconfig

The Kernel headers will be built in $(STAGING_DIR) (or maybe
$(TOOL_BUILD_DIR)) but the kernel will also be extracted 
in $(PROJECT_BUILD_DIR) and built from there.
 
Best Regards
Ulf Samuelsson
