From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:27:53 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210308231454.519fa1dc@gmx.net>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308215541.GB2737665@scaer> <20210308231454.519fa1dc@gmx.net>
Message-ID: <20210308222753.GE2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-08 23:14 +0100, Peter Seiderer spake thusly:
> On Mon, 8 Mar 2021 22:55:41 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-02-16 21:11 +0100, Peter Seiderer spake thusly:
> > > Try to be less smart (focused on the one target/one use-case),
> > > instead reduce the rpi-firmware package to a selectable list
> > > of (verbatim) installed firmware files.
[--SNIP--]
> > So, let's keep the qt5 example aside, and see what we can do. What if
> > we'd go with the following:
> >
> >   - keep a single, generic config.txt in rpi-firmware, and install that,
> >
> >   - if BR2_aarch64=y, add arm_64bit=1
> >
> >   - add an option to rpi-firmware:
> >
> >     config BR2_PKG_RPI_FW_DTOVERLAY_LIST
> >         string "DT overlays to load"
> >         depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> >         help
> >           Space-separated list of DT overlays to be loaded from config.txt.
> >
> >           For example, miniuart-bt on rpi0w to restore the serial console.
> >
> >     and if this option is not empty, construct the list of dtoverlay and
> >     add it to config.txt.
> >
> >   - eventually, adapt the defconfigs with that list of dtoverlays
> 
> ...but back to the direction of trying to being smart..., which can work for
> 90% of the buildroot defconfig cases, but will not work for the rest of the
> buildroot ones (one at the moment) and not for customized ones (none dtoverlay
> extensions, multi-bootable SD-Cards, ...)...

I would think quite the opposite, in fact: with an otion, it's up to the
user to specify what DT overlays to load; this is more flexible than a
config.txt file.

For fixup.dat and start/elf, we'd still use your changes, of course.

And for arm_64bit=1 this is really a non-option: if we build for 64-bit
then we *must* have arm_64bit=1, while if we build for 32-bit, the we
*must not* have arm_64bit=1.

The only case that this indeed does not cover, is the case where the
user wants to pas their completely customsied config.txt that totally
differs from ours. In that case, they can still do so with a post-build
script that copies their config.txt over ours in BINARIES_DIR.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
