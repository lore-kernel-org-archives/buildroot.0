From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 05 Feb 2009 21:23:52 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <873aeue676.fsf@macbook.be.48ers.dk>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
Message-ID: <1233865432.4148.6.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-02-04 klockan 13:29 +0100 skrev Peter Korsgaard:
> >>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
> 
>  Thiago> Hi,
>  Thiago>     I thought it was seattled sometime last year that kernel names
>  Thiago> would not include timestamps or any think that breaks u-boot from
>  Thiago> loading the kernel.
> 
>  Thiago>     I just had atngw100-linux-2.6.27.13-20090203.gz for a kernel name.
>  Thiago> It's already bad enough that rootfs has stupid timestamps, we don't
>  Thiago> really need kernel binaries too. If I wanted to preserve binaries, I
>  Thiago> would copy them over before building again. Whenever I type make, I
>  Thiago> expect things to be overwritten.
> 
> The rootfs timestamp is because your defconfig sets the
> BR2_ROOTFS_SUFFIX to a nonstandard value.
> 
> I had a look at target/linux/Makefile.in.advanced and see that it
> uses:
> 
> LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
> 
> whereas the normal (!advanced) Linux config uses:
> 
> LINUX26_KERNEL:=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
> 
> To me the sane thing would just be for the files to be named whatever
> the kernel names them (uImage/zImage/bzImage/..), but even if we don't
> do that we should atleast make the 2 Linux types use the same style.

> 
> We can add BR2_KERNEL_PREFIX/SUFFIX (defaulting to "") if people
> really to do something special.
> 
> Ulf, what do you say?
> 

I think that we should have a symbolic link to xImage as we do for
u-boot.bin for those that do not like the more complex filenames.
Then there is no need for a 

The purpose of having a more complex file name is to
be able to see which kernel you have and it configuration.
Also to be able to copy multiple kernels for multiple chips to a single
directory - Typically /tftpboot.

uImage really does not give you *any* information on the contents.

When testing several configurations for the same kernel,
adding some kind of revision information is important.
THat is why the date is there, a little simplistic, but
it works for me.


> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
