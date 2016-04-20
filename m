From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 09:11:46 +0200
Subject: [Buildroot] [PATCHv2 4/4] Add package cbootimage-configs
In-Reply-To: <57171F18.9010502@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-5-git-send-email-julian@jusst.de>
 <20160419230836.202d4cbb@free-electrons.com>
 <57171F18.9010502@jusst.de>
Message-ID: <20160420091146.736a541d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 08:18:00 +0200, Julian Scheel wrote:

> The problem with tegra-uboot-flasher-scripts is, that it does a lot more 
> than what this package does. In fact it includes build logic for all the 
> required tools (like dtc, tegrarcm, cbootimage, u-boot), which wouldn't 
> work out well in the context of buildroot. Using externally provided 
> builds isn't easily possible without major abuse of the scripts, which I 
> don't think would be merged upstream anyway.

Is this something that you can discuss with Stephen Warren? I believe
he is generally quite open to suggestions, so maybe he'll be inclined
to changing a bit the tegra-uboot-flasher-scripts to make it usable by
build systems?

> > Or maybe this thing should do less stuff, and simply provide the
> > necessary tools for a post-image script to do the job.
> 
> If in the end it's decided that this is too complicated for the package 
> makefile I'd rather create a dedicated package that handles this. So, 
> that the magic would be in done in some independently maintained script 
> and we only need a buildroot package that heads the options to that package.
> It just felt a bit like overkill for what it does in the end.

Alternatively, you could have a shell script the package directory
itself.

> > Why do you use the Avionic Design fork and not the original NVIDIA
> > repository, which you reference as the upstream in your Config.in help
> > text?
> 
> Just because our configurations are not yet merged to the upstream 
> repository. I really need to push on that, as this package really shall 
> use upstream. Although it might be wise to have the usual 
> custom-repository option like it's done for kernel and u-boot. It's not 
> that unlikely that people would have configs in custom repositories 
> which are not merged upstream.

We generally try to not add such options for too many packages, but
that remain to be discussed specifically for this package because it
indeed contains board-specific stuff.


> >> +GPT_SPEC = $(shell cat $(GPT_FILE))
> >
> > If it's just a string, why is it the path to a file rather than having
> > direcly the value in the Config.in option?
> 
> Yann asked me to move it to a file in his review of the initial patch, 
> as quoting gets rather ugly if provided as Config.in option.
> This was the previous default:
> default 
> "uuid_disk=\\$$\\{disk_uuid\\};name=rootfs,size=-,uuid=\\$$\\{rootfs_uuid\\}"
> 
> And that's just for a single partition, so it becomes really messy if 
> you add some more.

OK, makes sense indeed. Please keep the file then. Sorry for not
looking at the previous review.

> > All this U-Boot command construction seem really project-specific, and
> > I don't see why we should hardcode all that stuff in a Buildroot
> > package. Buildroot should give the tools to generate such a U-Boot
> > image, but should not hardcode so much logic IMO.
> 
> The hardcoded part of this is not really board specific. All it does, is 
> writing the bootloader to the emmc. While the tegra supports booting 
> from SPI as well, I've never seen a board doing it. So writing to the 
> emmc is what's needed on virtually any tegra based board.
> 
> In the end this uboot environment is just the tooling to generate an 
> automated flash writer, as the core tegra flashing tools do only support 
> loading images for execution, but not writing anything directly to memory.
> 
> Board specific are only the options to write a partition table and 
> automatically expose it via dfu for flashing root filesystems. I added 
> those as they appear to be rather useful to generate customized, 
> automated flashing solution for the tegra.

Hum, ok. I guess a couple of comments above this logic would be quite
useful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
