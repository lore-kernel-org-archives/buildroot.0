From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Mar 2021 22:29:42 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210309213246.382d07b4@gmx.net>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308215541.GB2737665@scaer> <20210308231454.519fa1dc@gmx.net>
 <20210308222753.GE2737665@scaer> <20210309213246.382d07b4@gmx.net>
Message-ID: <20210309212942.GP2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-09 21:32 +0100, Peter Seiderer spake thusly:
> On Mon, 8 Mar 2021 23:27:53 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-03-08 23:14 +0100, Peter Seiderer spake thusly:
> > > On Mon, 8 Mar 2021 22:55:41 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > > On 2021-02-16 21:11 +0100, Peter Seiderer spake thusly:
> > > > > Try to be less smart (focused on the one target/one use-case),
> > > > > instead reduce the rpi-firmware package to a selectable list
> > > > > of (verbatim) installed firmware files.
> > [--SNIP--]
> > > > So, let's keep the qt5 example aside, and see what we can do. What if
> > > > we'd go with the following:
> > > >
> > > >   - keep a single, generic config.txt in rpi-firmware, and install that,
> > > >
> > > >   - if BR2_aarch64=y, add arm_64bit=1
> > > >
> > > >   - add an option to rpi-firmware:
> > > >
> > > >     config BR2_PKG_RPI_FW_DTOVERLAY_LIST
> > > >         string "DT overlays to load"
> > > >         depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> > > >         help
> > > >           Space-separated list of DT overlays to be loaded from config.txt.
> > > >
> > > >           For example, miniuart-bt on rpi0w to restore the serial console.
> > > >
> > > >     and if this option is not empty, construct the list of dtoverlay and
> > > >     add it to config.txt.
> > > >
> > > >   - eventually, adapt the defconfigs with that list of dtoverlays
[--SNIP--]
> More flexible than the possibility for a custom config.txt (mind that there
> are overlays with parameters and more possible options besides the overlays)?
[--SNIP--]
> The part with 'override' feels a little bit ugly and would count for me as
> an argument against the hard-coded logic/overlays-only approach, still
> believing that sooner or later most/every beyond-buildroot-defconfig-only
> user will use a hand-crafted config.txt file...

OK, so here's my new proposal:

  - keep your BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE, which points to a
    default, basic one, not unlike the busybox default config:
        default "package/rpi-firmware/config.txt"

  - package/rpi-firmware/config.txt is just the common part of all the
    config.txt you currently had in your patch

  - rpi-firmware.mk will add arm_64bit=1 as needed, based on
    BR2_aarch64=y, because that *really* is not an option.

  - add BR2_PKG_RPI_FW_DTOVERLAY_LIST as I suggest above, which is not
    empty, will be copied as is to dtoverlay

  - change the defconfig files to just set:
    BR2_PKG_RPI_FW_DTOVERLAY_LIST="miniuart-bt"

That way, we get best of both worlds:

  - we avoid duplication of the config.txt, and we can still customise
    it a bit with just "easy stuff" that we need for our example
    defconfigs,

  - users can stil point to their custom, fine-tuned config.txt (in
    which case they will probably not set BR2_PKG_RPI_FW_DTOVERLAY_LIST)

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
