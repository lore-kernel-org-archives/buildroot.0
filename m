From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 17:06:38 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <87r63gqzm9.fsf@macbook.be.48ers.dk>
References: <20090106141628.5859776BFE@busybox.osuosl.org>
	<87r63gqzm9.fsf@macbook.be.48ers.dk>
Message-ID: <1231257998.32308.158.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 15:26 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-06 14:16:27 +0000 (Tue, 06 Jan 2009)
>  ulf> New Revision: 24697
> 
>  ulf> Log:
>  ulf> Use PROJECT-u-boot-VERSION-DATE.bin as u-boot target
>  ulf> Provide link using "u-boot.bin"
> 
> Ohh, didn't we just discuss it? I don't think this belongs in
> buildroot.
> 

I see that now, I did not read emails for an hour or so.

> If you really want it, couldn't you then do it in you
> copy-to-tftp-thingy?

I really want everything that simplifies the process of 
bringing the board up and running in the fastest possible time
and removes possible causes of errors.

?If a part of bringing up the board requires manual typing,
which can be replaced by a simple recipe in buildroot,
then I consider it to be a good candidate
for having support in buildroot.

When information is coming from the buildroot .config file,
then definitely I consider it to be ripe.
?This implies exporting relevant information from Buildroot.


---------------

I have pointed out the problem of copying stuff
to the tftpboot directory.

You have pointed out that you do not like it,
but you have not given any motivation why.
Obviously breaking the build is a good one,
but otherwise I have seen no real motivation.
Some features are not needed by everybody,
but that is not a good reason to block other
people to use this feature.

Doing it in a COPY_TO part will solve the problem
if you copy it directly, but if you 
take the BINAIRES file and send to someone
by mail, then they will have the problem,
so it is essential that the file has the 
correct file name which makes people understand
what it is.

Commercial linux companies like Timesys adopt
the same type of scheme when they deliver packages.
Using simple names like uImage and u-boot.bin
simply does not cut it in a more demanding environment.

I would not mind to replace the link to u-boot.bin
with a real file, if that is the worry.

-----------------




>  
>  ulf> +menuconfig BR2_TARGET_UBOOT_DEFAULT_ENV
>  ulf> +	bool "Generate a default environment"
>  ulf> +	default n
>  ulf> +	depends on BR2_TARGET_UBOOT
>  ulf> +	help
> 
> default n is implied, so don't add that.

OK.

> Isn't this all within the if BR2_TARGET_UBOOT section, so you don't
> need the depends?
> 
>  ulf> -	echo setenv linux $(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE).gz >> $(U_BOOT_AUTOSCRIPT)
>  ulf> +	echo setenv linux $(LINUX26_KERNEL_NAME).gz >> $(U_BOOT_AUTOSCRIPT)
> 
> Why .gz?
> 

to indicate that it is compressed.

>  ulf>  	echo setenv kernel-version $(LINUX26_VERSION) >> $(U_BOOT_AUTOSCRIPT)
>  ulf>  	echo setenv kernel-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
>  ulf>  	echo setenv hostname $(TARGET_HOSTNAME) >> $(U_BOOT_AUTOSCRIPT)
>  ulf>  	echo setenv fs-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
>  ulf> -	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
>  ulf> -	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
>  ulf> +	echo setenv rd-1 rootfs.$(ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
>  ulf> +	echo setenv rd-2 rootfs.$(ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
> 
> Why .ext2 and .jffs2? This doesn't seem very generic.

These are the two of the most used filesystems.
If a user needs to use a different file name, then
it is easy for them to do a "setenv rd-3 <filename>"
from within u-boot.

> 
> Please fix.
> 
