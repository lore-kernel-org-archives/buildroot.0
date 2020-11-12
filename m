From: Robert Hancock <robert.hancock@calian.com>
Date: Thu, 12 Nov 2020 22:27:11 +0000
Subject: [Buildroot] Proper Out-of-tree Devicetree Source
In-Reply-To: <CA+fik51jHvB4POdaGEJ+Ru2K6Yt1xmepibr3WGUaGQAYkiG55g@mail.gmail.com>
References: <CAE_FxYsuX33=WuESanaB01YkD_DU=z+Q1hYr=Tp0kiXgHGtt4Q@mail.gmail.com>
 <CA+fik51jHvB4POdaGEJ+Ru2K6Yt1xmepibr3WGUaGQAYkiG55g@mail.gmail.com>
Message-ID: <298f9cd98b159b2020a96e4473c367ba959f6cf4.camel@calian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2020-11-12 at 16:14 -0600, Brandon Maier wrote:
> On Wed, Nov 11, 2020 at 8:57 PM Garret Kelly <garret.kelly@gmail.com>
> wrote:
> > Hi buildroot!
> > I'm trying to figure out the right way to use an out-of-tree device
> > tree (for uboot, to begin with, but definitely also TF-A and
> > Linux).
> > So far, I've found that setting BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
> > results in the files named there being copied into the arch/arm/dts
> > directory in the uboot build directory. However, these files aren't
> > referenced by the arch/arm/dts/Makefile, and therefore the DTBs are
> > never built.
> 
> Same, I recently was trying to build a custom DTS with U-Boot and
> this
> is the behaviour I saw. From talking on the U-Boot IRC it doesn't
> seem
> there is an "officially" supported way to build external dts without
> manually patching the dts into the Makefile.
> 
> > I found that I could add "dtb-y=whatever.dtb" to
> > BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS, which does result in the DTS
> > getting
> > compiled, but seems a little hacky. Not that I mind.
> 
> I don't have a problem with it if it works. Otherwise U-Boot would
> need to be updated to properly support this. For example Linux
> supports this with a special dtb target[1].

In general U-Boot needs some level of board-specific support for things
like memory initialization, so I believe usually one would patch U-Boot 
to add in that support and the reference to that board's .dts files at
the same time.

Specifying a custom .dts for Linux makes more sense as the kernel build
itself can be generic, but there is not really such a thing as a
generic U-Boot build across boards unless they are very similar.

> 
> [1] 
> https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.9.8%2Fsource%2FMakefile%23L1333&amp;data=04%7C01%7Crobert.hancock%40calian.com%7C9a73abd8e5e0486aca0308d88758697e%7C23b57807562f49ad92c43bb0f07a1fdf%7C0%7C0%7C637408161089689701%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=uXsp%2FC08O1onRPwp4e%2Fb%2BXdFGFox52cAK%2Fgq57ZWKvk%3D&amp;reserved=0
> 
> > I was thinking about adding the dtb-y inclusion trick to uboot.mk,
> > but
> > I realized as I was doing this that "DTS source files" probably
> > also
> > implies .dtsi files, and so those can't be added. I suppose I could
> > filter out non-.dts files from being turned into targets, that
> > might
> > be the most ergonomic way.
> 
> This appears to be what BR2_LINUX_KERNEL_CUSTOM_DTS_PATH does[2], so
> it seems like there is at least precedent.
> 
> [2] 
> https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.busybox.net%2Fbuildroot%2Ftree%2Flinux%2Flinux.mk%3Fh%3D2020.11-rc1%23n175&amp;data=04%7C01%7Crobert.hancock%40calian.com%7C9a73abd8e5e0486aca0308d88758697e%7C23b57807562f49ad92c43bb0f07a1fdf%7C0%7C0%7C637408161089689701%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=p6TazGhd0IlFlZPFplGSijuUgcK9VlLgdhUKtKCmciI%3D&amp;reserved=0
> 
-- 
Robert Hancock
Senior Hardware Designer, Calian Advanced Technologies
www.calian.com
