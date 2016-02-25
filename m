From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 17:04:43 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
 _defconfig file
In-Reply-To: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
Message-ID: <20160225170443.2e6208f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 08:22:31 -0500, Patrick Doyle wrote:
> I am using the linux-at91 kernel (from
> git://github.com/linux4sam/linux-at91.git) with a custom
> linux_defconfig file that contains, among other things:
> 
> CONFIG_MODULES=y
> CONFIG_USB_GADGET=y
> CONFIG_USB_GADGETFS=y
> 
> When I build my kernel using buildroot, I get a .config file that has
> CONFIG_USB_GADGETFS=m.
> 
> I can reproduce the steps that buildroot executes and see this problem
> manually with:
> 
> echo CONFIG_MODULES=y > .config
> echo CONFIG_USB_GADGET=y >> .config
> echo CONFIG_USB_GADGETFS=y >> .config
> yes "" | make -k ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- oldconfig

This is due to this command, which doesn't do completely the right
thing.

The CONFIG_USB_GADGETFS option is somewhat odd, in that it is part of a
choice...endchoice block that itself is a tristate option.

If you use olddefconfig instead of the yes "" | ... oldconfig hack,
then it works fine.

See:

$ cat defconfig 
CONFIG_MODULES=y
CONFIG_USB_GADGET=y
CONFIG_USB_GADGETFS=y
$ cat defconfig > .config
$ make ARCH=arm olddefconfig
  GEN     ./Makefile
scripts/kconfig/conf  --olddefconfig Kconfig
#
# configuration written to .config
#
$ grep GADGETFS .config
CONFIG_USB_GADGETFS=y

But:

$ cat defconfig > .config
$ yes "" | make ARCH=arm oldconfig
$ grep GADGETFS .config
CONFIG_USB_GADGETFS=m

> Does anybody know why "make oldconfig" does this?  Am I missing
> another configuration item?

From "oldconfig" point of view, the default value for the tristate
mentioned above is "M":

  USB Gadget Drivers [M/y/?] (NEW)

And therefore the yes "" | make oldconfig hack enables this "USB Gadget
Drivers" option as a module. But since this option has no name, we
cannot set it in the defconfig file.

I've Cc'ed Yann on this aspect, and also my colleague Alex who already
saw this problem in the past IIRC.

> On a slightly related, but totally off-subject topic, is there a more
> modern way to implement a userspace gadget device driver than using
> gadgetfs?  That could be an alternative solution as well.  (We have an
> existing product that communicates with a host that uses libusb.  The
> embedded Linux side uses a gadgetfs user space driver.)

Look at functionfs:

config USB_CONFIGFS_F_FS
        bool "Function filesystem (FunctionFS)"
        depends on USB_CONFIGFS
        select USB_F_FS
        help
          The Function Filesystem (FunctionFS) lets one create USB
          composite functions in user space in the same way GadgetFS
          lets one create USB gadgets in user space.  This allows creation
          of composite gadgets such that some of the functions are
          implemented in kernel space (for instance Ethernet, serial or
          mass storage) and other are implemented in user space.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
