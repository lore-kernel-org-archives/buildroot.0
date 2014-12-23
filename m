From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 23 Dec 2014 09:40:27 +0000
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <20141217172818.250714b4@free-electrons.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
 <1418828592.4132.7.camel@synopsys.com>
 <20141217161406.1f418842@free-electrons.com>
 <1418829884.4132.13.camel@synopsys.com>
 <20141217163652.3812739e@free-electrons.com>
 <1418831416.4132.19.camel@synopsys.com>
 <20141217170826.075c6d48@free-electrons.com>
 <1418833123.4132.22.camel@synopsys.com>
 <20141217172818.250714b4@free-electrons.com>
Message-ID: <1419327626.2781.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2014-12-17 at 17:28 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 17 Dec 2014 16:18:44 +0000, Alexey Brodkin wrote:
> 
> > > > Then the question is why this is not a default in Buildroot?
> > > > IMHO most of the time kernel's bootcmd has console set so explicit setup
> > > > of tty in Buildroot might be required in some corner cases only.
> > > 
> > > I agree, maybe we should make this the default. What happens on
> > > PC-style platforms? Is console= typically set to tty1 ?
> > 
> > Well from dmesg output of my Fedora 21 I see this:
> > --->---
> > [    0.000000] console [tty0] enabled
> > --->---
> > Is this what you're looking for?
> 
> I don't know if running a getty on tty0 actually works. tty0 is
> actually a "fake" device that points to the current virtual console. To
> be tested, maybe with the Qemu/x86 emulation.

I've just tried Qemu/x86 and with following config it worked like a
charm:
--->---
BR2_x86_pentiumpro=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.17.2"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
BR2_TARGET_GENERIC_GETTY_PORT="console"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.17.config"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
--->---

So then I think it's time for a patch that by default selects:
1. BR2_TARGET_GENERIC_GETTY_PORT="console"
2. BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=y

Any objections?

-Alexey
