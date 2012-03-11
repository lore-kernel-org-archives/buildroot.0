From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 11 Mar 2012 18:04:15 +0100
Subject: [Buildroot] Added microblaze patch
In-Reply-To: <201202132237.18495.arnout@mind.be>
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <1329095038-32117-1-git-send-email-Spenser309@gmail.com>
 <201202132237.18495.arnout@mind.be>
Message-ID: <4F5CDB0F.50801@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

there has been a lot of effort regarding the microblaze integration in
the last months. But there is still some work to be done to get it into
the buildroot tree.

Obviously, there are still some issues:

* Device-tree support
* SimpleImage support
* Toolchain download from the Xilinx site (see below)
* Some more improvements/flaws
* maybe more?

I rebased the patches (not the one with dts) to the current HEAD and
tested them (see seperate mail with patches).

Alvaro's Patch to load the toolchain from Xilinx does not work for me.
http://git.xilinx.com always ends up with a timeout leaving an empty
tgz-file in the dl folder after the third try. To come further I
downloaded the tgz manually.

After doing some fixes the whole build starting from "make
Avnet_S6LX9_MicroBoard_defconfig" in an empty folder works for me.

I am really interested in getting Microblaze into the next buildroot
release, and have some (little) time to contribute.

I just fixed some of Arnout's remarks, the others seem to be related to
the DTS and SimpleImage topic:

Am 13.02.2012 22:37, schrieb Arnout Vandecappelle:
> On Monday 13 February 2012 02:03:58 Spenser Gilliland wrote:
> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/microblazeel-unknown-linux-gnu/"
>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
>  I don't think we should have defconfigs that depend on pre-extracted toolchains.
> Instead, the Xilinx toolchain should be added to the supported external toolchains
> like Sourcery.
Downloading the Xilinx toolchain seems not to work. Should we really
insist in doing this automatically, since putting a tgz into a git
archive seems
kind of foolish. I think using a previously downloaded tgz file will be
good until
we can build our own toolchain.
> +BR2_TARGET_GENERIC_HOSTNAME="Microblaze Buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Microblaze Buildroot"
>  No need to change the defaults here.
Removed these.
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/relinux/avnet_LX9MicroBoard/lx9_mmu_defconfig"
>> +BR2_LINUX_KERNEL_DTS_FILE="$(TOPDIR)/board/relinux/avnet_LX9MicroBoard/lx9_mmu.dts"
>  The $(TOPDIR)/ is redundant: the build is always executed from $(TOPDIR).
Removed these


Kind regards

Stephan


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
