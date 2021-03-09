From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 9 Mar 2021 21:32:46 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210308222753.GE2737665@scaer>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308215541.GB2737665@scaer> <20210308231454.519fa1dc@gmx.net>
 <20210308222753.GE2737665@scaer>
Message-ID: <20210309213246.382d07b4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon, 8 Mar 2021 23:27:53 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2021-03-08 23:14 +0100, Peter Seiderer spake thusly:
> > On Mon, 8 Mar 2021 22:55:41 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > On 2021-02-16 21:11 +0100, Peter Seiderer spake thusly:
> > > > Try to be less smart (focused on the one target/one use-case),
> > > > instead reduce the rpi-firmware package to a selectable list
> > > > of (verbatim) installed firmware files.
> [--SNIP--]
> > > So, let's keep the qt5 example aside, and see what we can do. What if
> > > we'd go with the following:
> > >
> > >   - keep a single, generic config.txt in rpi-firmware, and install that,
> > >
> > >   - if BR2_aarch64=y, add arm_64bit=1
> > >
> > >   - add an option to rpi-firmware:
> > >
> > >     config BR2_PKG_RPI_FW_DTOVERLAY_LIST
> > >         string "DT overlays to load"
> > >         depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > >         help
> > >           Space-separated list of DT overlays to be loaded from config.txt.
> > >
> > >           For example, miniuart-bt on rpi0w to restore the serial console.
> > >
> > >     and if this option is not empty, construct the list of dtoverlay and
> > >     add it to config.txt.
> > >
> > >   - eventually, adapt the defconfigs with that list of dtoverlays
> >
> > ...but back to the direction of trying to being smart..., which can work for
> > 90% of the buildroot defconfig cases, but will not work for the rest of the
> > buildroot ones (one at the moment) and not for customized ones (none dtoverlay
> > extensions, multi-bootable SD-Cards, ...)...
>
> I would think quite the opposite, in fact: with an otion, it's up to the
> user to specify what DT overlays to load; this is more flexible than a
> config.txt file.

More flexible than the possibility for a custom config.txt (mind that there
are overlays with parameters and more possible options besides the overlays)?

>
> For fixup.dat and start/elf, we'd still use your changes, of course.
>
> And for arm_64bit=1 this is really a non-option: if we build for 64-bit
> then we *must* have arm_64bit=1, while if we build for 32-bit, the we
> *must not* have arm_64bit=1.
>
> The only case that this indeed does not cover, is the case where the
> user wants to pas their completely customsied config.txt that totally
> differs from ours. In that case, they can still do so with a post-build
> script that copies their config.txt over ours in BINARIES_DIR.

The part with 'override' feels a little bit ugly and would count for me as
an argument against the hard-coded logic/overlays-only approach, still
believing that sooner or later most/every beyond-buildroot-defconfig-only
user will use a hand-crafted config.txt file...

Regards,
Peter


>
> Regards,
> Yann E. MORIN.
>
