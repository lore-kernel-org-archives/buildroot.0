From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Mar 2021 15:12:54 +0100
Subject: [Buildroot] gmp.h error compiling Linux 5.11 with Buildroot
 2021.02 default arm toolchain
In-Reply-To: <5c4c65f0-886a-e54c-16ae-ef6dc5093566@bootlin.com>
References: <a66afe8f-7f99-db2c-f966-c62dad9af5e3@bootlin.com>
 <20210324105006.18e0dfb6@windsurf.home>
 <5c4c65f0-886a-e54c-16ae-ef6dc5093566@bootlin.com>
Message-ID: <20210324151254.2cea132a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Mar 2021 14:47:28 +0100
Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:

> On 3/24/21 10:50 AM, Thomas Petazzoni wrote:
> > Do you have a Buildroot configuration that uses an internal toolchain +
> > a Linux kernel built by Buildroot, that reproduces this? Or does it
> > only happens with an external toolchain and/or when you build the
> > kernel outside of Buildroot?  
> 
> Actually, the compile job succeeds with the "omap2plus" configuration
> when the 5.11 kernel is built by Buildroot. Good guess.
> 
> What doesn't work is building the kernel outside Buildroot with (the
> Buildroot toolchain from output/host/ or the latest ARM 32 GNU toolchain).
> 
> Does this help?

It doesn't help per-se, but it's another useful data point. This whole
gmp.h is due to the gcc plugins that the kernel is building.

The gcc plugin causing issue there is built when
CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK=y in your kernel configuration.
Could you double check you have that enabled both when building the
kernel within Buildroot, and outside of Buildroot ?

To me, it seems like passing
HOSTCXXFLAGS=-I/path/to/buildroot/output/host/include when building
the kernel should get you passed the issue when building the kernel
externally.

And it probably works when Buildroot builds the kernel, because we're
passing:

        HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \

when building the kernel, so the kernel build system does invoke the
native gcc with the appropriate -I option pointing to
$(HOST_DIR)/include.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
