From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Oct 2017 21:56:49 +0200
Subject: [Buildroot] [PATCH 00/13] New DL_DIR organisation;
 git cache feature
In-Reply-To: <CAGduivzEGzqMesGqkrKtchK3gDGVa9_3iOVzYZW2RFQfzbw4iw@mail.gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170728003756.3d675656@gmx.net>
 <CAGduivzEGzqMesGqkrKtchK3gDGVa9_3iOVzYZW2RFQfzbw4iw@mail.gmail.com>
Message-ID: <20171017215649.492791d6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxime,

On Sun, 30 Jul 2017 18:32:27 +0200, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:

> Hi Peter, all
> 
> On Fri, Jul 28, 2017 at 12:37 AM, Peter Seiderer <ps.report@gmx.net> wrote:
> > Hello Maxime,
> >
> > On Tue,  4 Jul 2017 18:21:58 +0200, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
> >  
> >> Hi all,
> >>
> >> This series will progressively reorganize the DL_DIR folder, in order to
> >> hve a subdirectory for each packages.
> >> This way, we store patches into subdirectory called by the package name
> >> instead of flattly into DL_DIR.
> >> We also avoid possible conflicts between packages.
> >>
> >> Finally, this series introduce the 'git cache' feature. What it does is
> >> that it keeps a copy of the Git clone in the subdirectory of the
> >> package.
> >> This way, when you change the version of said package, instead of
> >> cloning from scratch, we only fetch the missing objects and create the
> >> tarball from that git clone.
> >>  
> >
> > Tested your patch series (hoping to speed up RPi kernel/userland/firmware
> > update which are huge git downloads) but failed with the raspberrypi3_defconfig
> > while compiling the linux kernel:
> >
> >   DTC     arch/arm/boot/dts/bcm2710-rpi-3-b.dtb
> > In file included from arch/arm/boot/dts/bcm2710.dtsi:1:0,
> >                  from arch/arm/boot/dts/bcm2710-rpi-3-b.dts:3:
> > arch/arm/boot/dts/bcm283x.dtsi:1:41: fatal error: dt-bindings/pinctrl/bcm2835.h: No such file or directory
> >  #include <dt-bindings/pinctrl/bcm2835.h>
> >                                          ^
> > compilation terminated.
> >   DTC     arch/arm/boot/dts/bcm2710-rpi-cm3.dtb
> > In file included from arch/arm/boot/dts/bcm2710.dtsi:1:0,
> >                  from arch/arm/boot/dts/bcm2710-rpi-cm3.dts:3:
> > arch/arm/boot/dts/bcm283x.dtsi:1:41: fatal error: dt-bindings/pinctrl/bcm2835.h: No such file or directory
> >  #include <dt-bindings/pinctrl/bcm2835.h>
> >                                          ^
> > compilation terminated.
> >
> >
> > This is due to wrong dt-bindings link, the failing version (with your patchset):
> >
> >         $ ls -ld build/linux-9126e25b0934bd7bd843763310ea4b34c6e139d0/arch/arm/boot/dts/include/dt-bindings
> >
> > lrwxrwxrwx 1 seiderer users 79 Jul 11 23:15 build/linux-9126e25b0934bd7bd843763310ea4b34c6e139d0/arch/arm/boot/dts/include/dt-bindings -> linux-9126e25b0934bd7bd843763310ea4b34c6e139d0./../../../../include/dt-bindings
> >
> > And from a working version (without your patchset):
> >
> >         $ ls -ld build/linux-9126e25b0934bd7bd843763310ea4b34c6e139d0/arch/arm/boot/dts/include/dt-bindings
> > lrwxrwxrwx 1 seiderer users 34 Jul 11 23:15 build/linux-9126e25b0934bd7bd843763310ea4b34c6e139d0/arch/arm/boot/dts/include/dt-bindings -> ../../../../../include/dt-bindings
> >  
> Thanks a lot for your test, made my realise I had a bug when I create
> the tarball from the git repo, I use a regex to transform './' into
> '$basename' but I forgot to put the '$' in my regex, hence the '../'
> becomming 'linux-sha1./'
> 
> It's fixed on my branch on github for now.

Any updates on this one? Mind to resend an actual version (would like to
see this feature integrated into buildroot, tired of waiting for hours
in case RaspberryPi kernel/firmware/userland git versions are updated)?

Regards,
Peter

> > Regards,
> >
> > Peter
> >
> >  
> >> It should speed up the build, especially for some use cases; drawback is
> >> that the disk usage for the DL_DIR will increase significantly. But disk
> >> space are pretty cheap, especially on build servers.
> >>
> >> Maxime Hadjinlian (12):
> >>   pkg-{download,generic}: remove source-check
> >>   download: put most of the infra in dl-wrapper
> >>   pkg-generic: make PKG_DL_DIR equal to DL_DIR
> >>   packages: use new $($PKG)_DL_DIR) variable
> >>   pkg-{download,generic}: use new $($(PKG)_DL_DIR)
> >>   support/download: make sure the download folder is created
> >>   pkg-generic: add a subdirectory to the DL_DIR
> >>   pkg-download: support new subdir for mirrors
> >>   pkg-generic: introduce _SAME_SOURCE_AS
> >>   help/manual: update help about the new $(LIBFOO_DL_DIR)
> >>   download: add flock call before dl-wrapper
> >>   download: git: introduce cache feature
> >>
> >> Yann E. MORIN (1):
> >>   core/pkg-download: change all helpers to use common options
> >>
> >>  Config.in                                          |   3 +
> >>  docs/manual/adding-packages-generic.txt            |   6 +-
> >>  package/amd-catalyst/amd-catalyst.mk               |   2 +-
> >>  package/android-tools/android-tools.mk             |   2 +-
> >>  package/angularjs/angularjs.mk                     |   2 +-
> >>  package/bootstrap/bootstrap.mk                     |   2 +-
> >>  package/cache-calibrator/cache-calibrator.mk       |   2 +-
> >>  package/cracklib/cracklib.mk                       |   2 +-
> >>  package/cryptopp/cryptopp.mk                       |   2 +-
> >>  package/devmem2/devmem2.mk                         |   2 +-
> >>  package/dhrystone/dhrystone.mk                     |   2 +-
> >>  package/doom-wad/doom-wad.mk                       |   2 +-
> >>  package/espeak/espeak.mk                           |   2 +-
> >>  package/fan-ctrl/fan-ctrl.mk                       |   2 +-
> >>  package/gcc/gcc.mk                                 |   2 +-
> >>  package/irrlicht/irrlicht.mk                       |   2 +-
> >>  package/jquery-mobile/jquery-mobile.mk             |   2 +-
> >>  package/jquery-sparkline/jquery-sparkline.mk       |   2 +-
> >>  package/jquery-ui-themes/jquery-ui-themes.mk       |   2 +-
> >>  package/jquery-ui/jquery-ui.mk                     |   2 +-
> >>  package/jquery-validation/jquery-validation.mk     |   2 +-
> >>  package/jquery/jquery.mk                           |   2 +-
> >>  package/kodi/kodi.mk                               |   6 +-
> >>  package/libfreeimage/libfreeimage.mk               |   2 +-
> >>  package/libjson/libjson.mk                         |   2 +-
> >>  package/libsoil/libsoil.mk                         |   2 +-
> >>  package/lsof/lsof.mk                               |   2 +-
> >>  package/musl-compat-headers/musl-compat-headers.mk |   2 +-
> >>  package/nmon/nmon.mk                               |   2 +-
> >>  package/nvidia-driver/nvidia-driver.mk             |   2 +-
> >>  package/openobex/openobex.mk                       |   2 +-
> >>  package/opentyrian-data/opentyrian-data.mk         |   2 +-
> >>  package/perl/perl.mk                               |   2 +-
> >>  package/pkg-download.mk                            | 216 ++++-----------------
> >>  package/pkg-generic.mk                             |  10 +-
> >>  package/python-keyring/python-keyring.mk           |   2 +-
> >>  .../python-simplegeneric/python-simplegeneric.mk   |   2 +-
> >>  package/rapidxml/rapidxml.mk                       |   2 +-
> >>  package/rpi-wifi-firmware/rpi-wifi-firmware.mk     |   2 +-
> >>  package/sam-ba/sam-ba.mk                           |   2 +-
> >>  package/spidev_test/spidev_test.mk                 |   2 +-
> >>  package/tar/tar.mk                                 |   2 +-
> >>  package/tesseract-ocr/tesseract-ocr.mk             |   2 +-
> >>  package/ti-cgt-pru/ti-cgt-pru.mk                   |   4 +-
> >>  package/ti-gfx/ti-gfx.mk                           |   4 +-
> >>  package/ts4900-fpga/ts4900-fpga.mk                 |   2 +-
> >>  package/unscd/unscd.mk                             |   2 +-
> >>  package/urg/urg.mk                                 |   2 +-
> >>  package/waf/waf.mk                                 |   2 +-
> >>  package/whetstone/whetstone.mk                     |   2 +-
> >>  package/wilc1000-firmware/wilc1000-firmware.mk     |   2 +-
> >>  package/zynq-boot-bin/zynq-boot-bin.mk             |   2 +-
> >>  support/download/bzr                               |  25 +--
> >>  support/download/check-hash                        |   2 +-
> >>  support/download/cp                                |  17 +-
> >>  support/download/cvs                               |  34 ++--
> >>  support/download/dl-wrapper                        |  62 +++---
> >>  support/download/git                               |  96 +++++----
> >>  support/download/hg                                |  25 +--
> >>  support/download/scp                               |  19 +-
> >>  support/download/svn                               |  25 +--
> >>  support/download/wget                              |  24 ++-
> >>  62 files changed, 286 insertions(+), 382 deletions(-)
> >>
> >> --
> >> 2.13.2
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot  
> >  
