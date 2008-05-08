From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 8 May 2008 21:58:34 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target:device/Atmellinux
References: <20080416224548.D5D8F3C617@busybox.net><d6cda7730805080743v4a298223m5ed424b4ee6c80a4@mail.gmail.com><004401c8b130$9f5fc760$dfc4af0a@Glamdring>
	<d6cda7730805081116s4c3424e0yf1e468a72888bdde@mail.gmail.com>
Message-ID: <006501c8b146$5e66c680$dfc4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> It would still be possible to do that by choosing the custom config.
>
> You might have your reasons to want names with timestaps, but for most
> of us, it's nor required or desired. Forcing your way on everyone
> isn't quite the best approach.
>

I do not force this on anyone.

The linux kernel can be built in two ways.
The traditional way, which will build uImage etc.
and the "advanced" way, which I generated to allow me to build it the way I 
see fit.

Select the traditional way, and you will get the traditional name.

I do not mind that there is an option to build it the traditional way,
but I do mind that it is implemented in such a way
that my way of doing things is no longer possible.

> As I've said before, changing the kernel name every time I build
> requires me to change u-boot, others will have to change their grub
> config, or what ever bootloader they use.
>

My U-Boot build generates an autoscript which is downloaded to the target
This allows AT91 users to configure the U-Boot environment from buildroot,
and allows them to initialize the environment with minimal typing.
- AND allows the user to figure out what is what.

You can easily change the name in the binaries dir before download
or propose a patch which will allow you to choose a simple name,
without changing the default behaviour.

config BR2_KERNEL_NAME_SIMPLE
    bool "use simple kernel name"
    default n

ifeq ($(BR2_KERNEL_NAME_SIMPLE),y)
LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)
else
LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
endif

(a little cleaned-up) would work for me, but Johns patch doesn't
because you will ALWAYS get a simple name if you choose
to build an uImage/vmlinux/zImage/bzImage.
It changes the default behaviour, and removes the possibility
to configure to default behaviour using easy options.
It is making one feature depend on another, and this restricts choice.


Best Regards
Ulf Samuelsson
