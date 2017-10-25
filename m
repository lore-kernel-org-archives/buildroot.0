From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:09:50 +0200
Subject: [Buildroot] [PATCH v2 00/13] New DL_DIR organisation;
	git cache feature
Message-ID: <20171025201003.16105-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Jul 2017 18:21:58 +0200, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:

> Hi all,
> 
> This series will progressively reorganize the DL_DIR folder, in order to
> hve a subdirectory for each packages.
> This way, we store patches into subdirectory called by the package name
> instead of flattly into DL_DIR.
> We also avoid possible conflicts between packages.
> 
> Finally, this series introduce the 'git cache' feature. What it does is
> that it keeps a copy of the Git clone in the subdirectory of the
> package.
> This way, when you change the version of said package, instead of
> cloning from scratch, we only fetch the missing objects and create the
> tarball from that git clone.
>  

Updated version from https://github.com/maximeh/buildroot/commits/git_cache
with added change log for v2.

Maxime Hadjinlian (12):
  pkg-{download,generic}: remove source-check
  download: put most of the infra in dl-wrapper
  packages: use new $($PKG)_DL_DIR) variable
  pkg-{download,generic}: use new $($(PKG)_DL_DIR)
  support/download: make sure the download folder is created
  pkg-generic: add a subdirectory to the DL_DIR
  pkg-download: support new subdir for mirrors
  pkg-generic: introduce _SAME_SOURCE_AS
  help/manual: update help about the new $(LIBFOO_DL_DIR)
  download: add flock call before dl-wrapper
  download: git: introduce cache feature
  WIP: support package with '-'

Yann E. MORIN (1):
  core/pkg-download: change all helpers to use common options

 Config.in                                          |   3 +
 Makefile                                           |   7 +-
 docs/manual/adding-packages-generic.txt            |   6 +-
 package/amd-catalyst/amd-catalyst.mk               |   2 +-
 package/android-tools/android-tools.mk             |   2 +-
 package/angularjs/angularjs.mk                     |   2 +-
 package/bootstrap/bootstrap.mk                     |   2 +-
 package/cache-calibrator/cache-calibrator.mk       |   2 +-
 package/cracklib/cracklib.mk                       |   2 +-
 package/cryptopp/cryptopp.mk                       |   2 +-
 package/devmem2/devmem2.mk                         |   2 +-
 package/dhrystone/dhrystone.mk                     |   2 +-
 package/doom-wad/doom-wad.mk                       |   2 +-
 package/espeak/espeak.mk                           |   2 +-
 package/fan-ctrl/fan-ctrl.mk                       |   2 +-
 package/gcc/gcc.mk                                 |   2 +-
 package/irrlicht/irrlicht.mk                       |   2 +-
 package/jquery-mobile/jquery-mobile.mk             |   2 +-
 package/jquery-sparkline/jquery-sparkline.mk       |   2 +-
 package/jquery-ui-themes/jquery-ui-themes.mk       |   2 +-
 package/jquery-ui/jquery-ui.mk                     |   2 +-
 package/jquery-validation/jquery-validation.mk     |   2 +-
 package/jquery/jquery.mk                           |   2 +-
 package/libfreeimage/libfreeimage.mk               |   2 +-
 package/libjson/libjson.mk                         |   2 +-
 package/libsoil/libsoil.mk                         |   2 +-
 package/lsof/lsof.mk                               |   2 +-
 package/musl-compat-headers/musl-compat-headers.mk |   2 +-
 package/nmon/nmon.mk                               |   2 +-
 package/nvidia-driver/nvidia-driver.mk             |   2 +-
 package/openobex/openobex.mk                       |   6 +
 package/opentyrian-data/opentyrian-data.mk         |   2 +-
 package/perl/perl.mk                               |   2 +-
 package/pkg-download.mk                            | 216 ++++-----------------
 package/pkg-generic.mk                             |  20 +-
 package/python-keyring/python-keyring.mk           |   2 +-
 .../python-simplegeneric/python-simplegeneric.mk   |   2 +-
 package/rapidxml/rapidxml.mk                       |   2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk     |   2 +-
 package/sam-ba/sam-ba.mk                           |   2 +-
 package/spidev_test/spidev_test.mk                 |   2 +-
 package/tar/tar.mk                                 |   2 +-
 package/tesseract-ocr/tesseract-ocr.mk             |   2 +-
 package/ti-cgt-pru/ti-cgt-pru.mk                   |   4 +-
 package/ti-gfx/ti-gfx.mk                           |   4 +-
 package/ts4900-fpga/ts4900-fpga.mk                 |   2 +-
 package/unscd/unscd.mk                             |   2 +-
 package/urg/urg.mk                                 |   4 +-
 package/waf/waf.mk                                 |   2 +-
 package/whetstone/whetstone.mk                     |   2 +-
 package/wilc1000-firmware/wilc1000-firmware.mk     |   2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk             |   2 +-
 support/download/bzr                               |  28 +--
 support/download/cvs                               |  37 ++--
 support/download/dl-wrapper                        | 110 +++++++----
 support/download/{cp => file}                      |  22 ++-
 support/download/git                               |  99 ++++++----
 support/download/hg                                |  28 +--
 support/download/scp                               |  20 +-
 support/download/svn                               |  28 +--
 support/download/wget                              |  28 ++-
 61 files changed, 345 insertions(+), 411 deletions(-)
 rename support/download/{cp => file} (57%)

-- 
2.14.2
