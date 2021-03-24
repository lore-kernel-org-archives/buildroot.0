From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Mar 2021 17:35:14 +0100
Subject: [Buildroot] gmp.h error compiling Linux 5.11 with Buildroot
 2021.02 default arm toolchain
In-Reply-To: <3362b2dc-8262-dc8f-4055-4e86470576cc@bootlin.com>
References: <a66afe8f-7f99-db2c-f966-c62dad9af5e3@bootlin.com>
 <20210324105006.18e0dfb6@windsurf.home>
 <5c4c65f0-886a-e54c-16ae-ef6dc5093566@bootlin.com>
 <20210324151254.2cea132a@windsurf.home>
 <3362b2dc-8262-dc8f-4055-4e86470576cc@bootlin.com>
Message-ID: <20210324173514.570e6982@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Mar 2021 15:54:12 +0100
Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:

> Indeed, when compiling the kernel from outside of Buildroot is breaking,
> CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK is set,and if I disable this option,
> the kernel builds fine. The kernel built by Buildroot internally didn't
> have this flag.

Ah, in Buildroot we have committed
40e0bf4c0c36970f8e94591fdb0a5a8910bf9859 which forcibly disables the
use of gcc plugins.

There's a lengthy explanation from Yann about that. Though admittedly,
long term, this is not really a very satisfying solution.

> What was unexpected for me is that this option is set by "make
> omap2plus_defconfig" depending on your CROSS_COMPILE setting. With
> arm-linux-gnueabi-gcc package by Ubuntu, you don't have it, but you do
> have it with the Buildroot or ARM toolchain. It's because it depends on
> a test for gcc plugins (see
> https://elixir.bootlin.com/linux/latest/A/ident/CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
> and https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_GCC_PLUGINS)
> 
> >
> > To me, it seems like passing
> > HOSTCXXFLAGS=-I/path/to/buildroot/output/host/include when building
> > the kernel should get you passed the issue when building the kernel
> > externally.  
> 
> 
> Right, I confirm this works. Thanks!

Good!

> > when building the kernel, so the kernel build system does invoke the
> > native gcc with the appropriate -I option pointing to
> > $(HOST_DIR)/include.  
> 
> Good to know, thanks! Is there anything that should be changed in the
> Linux build system or in our toolchains ?

No, I don't think there's anything that can be changed here. Or perhaps
pkg-config could be used to detect which compiler flags are needed to
build gcc plugins? Doesn't seem that easy though.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
