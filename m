From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 18:04:28 +0100
Subject: [Buildroot] ARM cores
In-Reply-To: <87y66athl7.fsf@macbook.be.48ers.dk>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk> <20110124165711.381989cf@surf>
	<87y66athl7.fsf@macbook.be.48ers.dk>
Message-ID: <20110124180428.3bcbe29f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Jan 2011 17:03:00 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Not available? Doesn't almost all A8 implementations have NEON?

According to http://wiki.debian.org/ArmHardFloatPort, CPUs such as
Marvell Dove and Nvidia Tegra 2 are ARMv7 CPUs, but they don't have
NEON support. NEON is an extension, so it isn't necessarly part of ARM
cores.

> Do we have any packages that cannot work on !NEON arms? (E.G. where it isn't
> just an optimization)

In mplayer, we have:

ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
MPLAYER_CONF_OPTS += --enable-neon
endif

(This is code that I added, it's an approximation, since as said above,
not all ARMv7 CPUs have NEON support).

Once mplayer is compiled with --enable-neon, it will presumably not
work on !NEON arms.

Instead of having the list of gazillions ARM SoC, we could also extend
a bit our architecture-specific options:

 * Has NEON support ?
   shown only if > ARMv7 is selected

 * Floating point type (with a choice of soft-float, VFPv2, VFPv3)

 * Floating point ABI (soft, softfp, hard)

But it means that the user needs more knowledge on the details of the
ARM SoC he is using. But it's probably the only realistic solution.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
