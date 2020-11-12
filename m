From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 12 Nov 2020 16:14:40 -0600
Subject: [Buildroot] Proper Out-of-tree Devicetree Source
In-Reply-To: <CAE_FxYsuX33=WuESanaB01YkD_DU=z+Q1hYr=Tp0kiXgHGtt4Q@mail.gmail.com>
References: <CAE_FxYsuX33=WuESanaB01YkD_DU=z+Q1hYr=Tp0kiXgHGtt4Q@mail.gmail.com>
Message-ID: <CA+fik51jHvB4POdaGEJ+Ru2K6Yt1xmepibr3WGUaGQAYkiG55g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 11, 2020 at 8:57 PM Garret Kelly <garret.kelly@gmail.com> wrote:
>
> Hi buildroot!
> I'm trying to figure out the right way to use an out-of-tree device
> tree (for uboot, to begin with, but definitely also TF-A and Linux).
> So far, I've found that setting BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
> results in the files named there being copied into the arch/arm/dts
> directory in the uboot build directory. However, these files aren't
> referenced by the arch/arm/dts/Makefile, and therefore the DTBs are
> never built.

Same, I recently was trying to build a custom DTS with U-Boot and this
is the behaviour I saw. From talking on the U-Boot IRC it doesn't seem
there is an "officially" supported way to build external dts without
manually patching the dts into the Makefile.

> I found that I could add "dtb-y=whatever.dtb" to
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS, which does result in the DTS getting
> compiled, but seems a little hacky. Not that I mind.

I don't have a problem with it if it works. Otherwise U-Boot would
need to be updated to properly support this. For example Linux
supports this with a special dtb target[1].

[1] https://elixir.bootlin.com/linux/v5.9.8/source/Makefile#L1333

> I was thinking about adding the dtb-y inclusion trick to uboot.mk, but
> I realized as I was doing this that "DTS source files" probably also
> implies .dtsi files, and so those can't be added. I suppose I could
> filter out non-.dts files from being turned into targets, that might
> be the most ergonomic way.

This appears to be what BR2_LINUX_KERNEL_CUSTOM_DTS_PATH does[2], so
it seems like there is at least precedent.

[2] https://git.busybox.net/buildroot/tree/linux/linux.mk?h=2020.11-rc1#n175

- Brandon Maier
