From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:04:59 +0200
Subject: [Buildroot] SELinux Buildroot Additions
In-Reply-To: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
References: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
Message-ID: <20130827190459.1eb3e4d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Clayton,

On Tue, 27 Aug 2013 11:20:25 -0500, clshotwe at rockwellcollins.com wrote:

> I would like to get some feedback on adding SELinux support to Buildroot. 
> This would involve adding several packages, modifying the .mk files for 
> several packages to include SELinux support, and adding generic defconfigs 
> to use as examples.  I would like to have defconfigs for QEMU targets 
> (x86, ARM, PPC) along with a Pandaboard and another couple hardware 
> targets.  The package selection for a functional SELinux system is a 
> little complex so the example defconfigs would be nice to use as examples.
> 
> Would this be a welcomed addition to Buildroot?  I would like to submit a 
> set of patches to first add the new packages, then modify existing 
> packages, and then add in the example defconfigs one at a time.  Is this 
> the best approach to take?

Having SELinux support in Buildroot would definitely be interesting,
especially if you're using it for some projects!

Adding several packages is obviously fine. I guess you've already find
the relevant documentation on how to add new packages to Buildroot.

Modifying existing .mk files of other packages to enable SELinux
support is also perfectly fine. We'll have to see if we need a global
knob to enable/disable SELinux, or if a per-package configuration is
needed, or if the fact that a given package is enabled or disabled is a
good enough indication of whether the user wants SELinux support. I
guess we'll have to discuss this once we see your patches.

The defconfig part is probably the most problematic one. Until now, our
policy about defconfigs is that they should just build the minimal set
of things for a particular hardware platform to build: toolchain,
kernel, bootloader, and minimal rootfs with Busybox. We've refrained
from including other features in our defconfigs, because the definition
of what a good configuration is for a particular platform is very
use-case and user-dependent. Someone will want Qt, someone else will
want X.org. Someone will want Busybox, someone else will want the
full-featured Bash and Coreutils. Someone will want udev, someone else
will want mdev. Someone will want Busybox init, someone else will want
systemd. How to make a good choice, without having a proliferation of
highly specific choices, is difficult.

Regarding SELinux and defconfigs, I see three options moving forward:

 *) We've been discussing some time ago the need to have some kind of
    "demos" defconfig, mainly as part of the work done by Spenser
    Gilliland on ARM OpenGL support in Buildroot. Those would be a
    separate set of defconfig, clearly identified as "this demonstrates
    some particular feature, on some particular platform, just for the
    sake of demonstrating this feature". We however haven't decided
    where to store those configurations, how to handle them compared to
    the regular defconfigs, etc.

 *) Make the SELinux configuration in menuconfig simple enough that a
    demonstration defconfig is not needed. You're mentioning that the
    configuration to get a working SELinux system is a little bit
    complex, and that's why a demo defconfig is needed. Maybe there's
    something we can do here to make this SELinux configuration so
    simple that a demo defconfig will no longer be needed?

 *) Add some details in the Buildroot manual on how to use SELinux.
    Generally speaking, the manual could contain more details on how to
    use a particular Buildroot package or feature. SELinux could be one
    of them.

Of course, none of those options are mutually exclusive!

So, I believe we can get started with the first two steps, get an
understanding of the configuration complexity, and see what is the best
course of action for the last step.

What do you think about this?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
