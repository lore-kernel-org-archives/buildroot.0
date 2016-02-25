From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 25 Feb 2016 08:22:31 -0500
Subject: [Buildroot] Incorrect kernel configuration produced from _defconfig
	file
Message-ID: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using the linux-at91 kernel (from
git://github.com/linux4sam/linux-at91.git) with a custom
linux_defconfig file that contains, among other things:

CONFIG_MODULES=y
CONFIG_USB_GADGET=y
CONFIG_USB_GADGETFS=y

When I build my kernel using buildroot, I get a .config file that has
CONFIG_USB_GADGETFS=m.

I can reproduce the steps that buildroot executes and see this problem
manually with:

echo CONFIG_MODULES=y > .config
echo CONFIG_USB_GADGET=y >> .config
echo CONFIG_USB_GADGETFS=y >> .config
yes "" | make -k ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- oldconfig
grep CONFIG_USB_GADGET .config

Is there a project specific post-kernel-configuration hook I can apply
to fix my .config file?

Does anybody know why "make oldconfig" does this?  Am I missing
another configuration item?

I suppose I could just disable modules in my kernel, which, arguably,
is the right answer for this application, but I spent 1/2 day
yesterday being confused by this, and it's time for me to reach out
for some help.

On a slightly related, but totally off-subject topic, is there a more
modern way to implement a userspace gadget device driver than using
gadgetfs?  That could be an alternative solution as well.  (We have an
existing product that communicates with a host that uses libusb.  The
embedded Linux side uses a gadgetfs user space driver.)

Thanks for all of the tips you keep feeding me.  I really appreciate
them.  Expect to see (a very minor) new package showing up from me on
this list shortly (for the Atmel WILC1000 firmware).

--wpd
