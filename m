From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:33:39 +0100
Subject: [Buildroot] bug when doing clean kernel build?
In-Reply-To: <AANLkTikJiXF-w3baF2POeVr5Zh_sGUkdS+UQCQFmzb4g@mail.gmail.com>
References: <AANLkTikJiXF-w3baF2POeVr5Zh_sGUkdS+UQCQFmzb4g@mail.gmail.com>
Message-ID: <20110124173339.73bd5711@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kyle,

On Mon, 17 Jan 2011 13:01:09 -0800
Kyle Hayes <kyle@greenmonitor.com> wrote:

> I'm trying to repeat my problems with openssh segfaulting and to do
> that I'm trying to build with make xconfig; make clean; make.
> However, when I do this, I see that the Linux kernel, 2.6.37, is made
> with Pentium Pro selected and I explicitly selected i486 in the
> Buildroot config.  I can go in after the make finishes and reconfigure
> the kernel again to get the right processor type.  Is this expected
> behavior?

We do not adjust the CPU selection at the kernel configuration level
according to the CPU selection at the Buildroot level. There is not
necessarly a 1:1 mapping between the two option sets, and it would
require a large amount of boring and unmaintainable code. So we leave
it to the user to provide a kernel configuration that matches the CPU
type being used.

When given a kernel defconfig file, or a kernel configuration file, the
only two configuration modifications that Buildroot does are :

 * Adjust the ARM EABI options according to the ABI selected at
   Buildroot level. This is specific to the ARM architecture.

 * Adjust the initramfs options in case the initramfs filesystem type
   has been choosen.

Other than those two, the defconfig or the configuration file are used
as is.

Generally speaking, it's hardly doable to make sure automatically that
the Buildroot configuration matches the kernel configuration, and do
that properly. You're talking about the CPU selection, but we could
also say that if the user selected the "iptables" userspace package,
then we should also enable Netfilter in the kernel, if the user
selected the "i2c-tools" userspace package, then we should also enable
I2C support (but which drivers ?). As this is not possible, we leave it
to the user to provide a correct configuration.

Buildroot does not do everything automagically. It only automates the
build procedure, but leaves the work of configuring the system to the
system developer.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
