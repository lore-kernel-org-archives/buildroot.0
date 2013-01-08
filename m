From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 09:42:40 +0100
Subject: [Buildroot] [git commit] perf: add kernel version checks
In-Reply-To: <50EBD89F.6050409@mind.be>
References: <20130107212531.5E07E9A691@busybox.osuosl.org>
 <50EBBFA8.1070503@mind.be> <20130108091534.38d07446@skate>
 <50EBD89F.6050409@mind.be>
Message-ID: <20130108094240.0a3db0e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 08 Jan 2013 09:28:15 +0100, Arnout Vandecappelle wrote:

> > And I don't think we should ask the user to tell us, through a separate
> > option, what kernel version his/her Git tree actually contains.
> >
> > Or maybe I'm missing what you're proposing here?
> 
>   I propose what you just said we shouldn't do: ask the user to tell us, 
> through a separate option, what kernel version his/her git tree actually 
> contains. Similar to the configuration of a preinstalled external toolchain.

Wouldn't that be really annoying for the user? The external toolchain
thing is already a bit annoying (but it is made a bit more reasonable
in that the pre-existing profiles already know about this).

So, what you propose is that we have something like

config BR2_LINUX_KERNEL_REAL_VERSION
	string

And then, in Xenomai:

config BR2_..._XENOMAI
	depends on BR2_arm && BR2_LINUX_KERNEL_REAL_VERSION = "3.2.1"
	depends on BR2_powerpc && BR2_LINUX_KERNEL_REAL_VERSION = "x.y.z"

I understand the idea, but I really wonder if it's reasonable to ask
the user to specify which kernel version is being built...

> > Regarding the kernel and the autobuilders, my plan was to modify the
> > autobuilders script to randomly enable the kernel build. The script of
> > course knows, per-architecture, of a known-working kernel defconfig
> > file that it would use in the Buildroot configuration.
> 
>   It will be hard to find a kernel version that is supported by all of 
> linux-fusion, igh-ethercat, owl-linux, lttng-modules and perf (and then 
> I'm leaving out Xenomai and RTAI). For my all-package build, I just 
> disabled those because it was too difficult to find a good one.

Ah, yes, indeed. This can always be handled by some special knowledge
of autobuilder script, but it isn't entirely nice. That said, the
autobuilder script already encodes some similar knowledge like: let's
not build package FOO in toolchain BAR is selected, because I know the
gcc in toolchain BAR has a bug and generates an internal compiler error
when building package FOO.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
