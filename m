From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:10 +0200
Subject: [Buildroot] [PATCH 0/14 v3] freescale: update userspace packages
	(branch yem/fsl-imx)
Message-ID: <cover.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary, All!

This series updates the Freescale userland components to the latest
available (stable) versions:

 1     : bump the global freescale version
 2..5  : adapt packages to the new version
 6..9  : bump packages which version does not follow the global version
 10    : tentative patch to re-use the generic i.MX platform in
         gst-fsl-plugins
 11..14: bump a few iMX defconfigs

Although I did some changes to Gary's initial submission, I only did
mostly cosmetic changes, so the following should still apply:

    ---8<---
    Same as last time, testing has been done on a Nitrogen6x using the
    kernel patch committed previously.

    GPU test (gpu-viv-bin-mx6q):
    # cd /usr/share/examples/viv_samples/vdk/
    # ./tutorial7

    VPU test (libfslvpuwrap, libfslcodec, gst-fsl-plugins, imx-vpu):
    # VSALPHA=1 gst-launch-0.10 filesrc location=trailer_1080p_h264_mp3.avi \
                                ! avidemux ! vpudec ! mfw_isink
    ---8<---

Note however that the tree will be broken as of patch 1, since a lot of
changes are required in the different FSL packages. However, doing a
single big patch would be impractical to review, so Gary and I preferred
splitting each package change in it own patch.

Note-2: this series is not even build-tested on my side, but see above,
about Gary's tests.

Changes v2 -> v3:
  - drop patch 1, that singled out libfslvpuwrap's version, since it
    is not the only affected package; that breaks the build until all
    of patches 2..9 are all applied
  - some commit logs modified/tweaked/expanded
  - re-included the defconfig bumps
  - added the wandboard defconfig bump

Regards,
Yann E. MORIN.


The following changes since commit 82c9989691287668d30d3fd37281af7ed106b69f:

  ftop: new package (2014-06-30 13:48:54 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/fsl-imx

for you to fetch changes up to cf148e58a53cf0c55c12e211c4367363bdf1dc0f:

  defconfig/wandboard: update kernel + bootlaoder (2014-06-30 23:32:04 +0200)

----------------------------------------------------------------
Gary Bisson (12):
      freescale-imx: bump to version 3.10.17-1.0.0
      freescale-imx: update imx-lib package
      freescale-imx: change platform choice to be common
      package/gpu-viv-bin-mx6q: only available for i.MX6Q
      freescale-imx: add imx-vpu package
      libfslvpuwrap: bump to version 1.0.46
      libfslcodec: bump to version 3.0.11
      libfslparser: bump to version 3.0.11
      gst-fsl-plugins: bump to version 3.0.11
      imx6sabresd: bump kernel version to 3.10.17
      imx6sololiteevk: bump kernel version to 3.10.17
      nitrogen6x: bump kernel version to 3.10.17

Yann E. MORIN (2):
      package/gst-fsl-plugins: add default platform
      defconfig/wandboard: update kernel + bootlaoder

 board/boundarydevices/nitrogen6x/6x_bootscript     | Bin 1653 -> 3207 bytes
 configs/freescale_imx6sabresd_defconfig            |  12 +++--
 configs/freescale_imx6sololiteevk_defconfig        |  12 +++--
 configs/nitrogen6x_defconfig                       |   5 +-
 configs/wandboard_defconfig                        |   8 +--
 package/freescale-imx/Config.in                    |  48 ++++++++++++++++-
 package/freescale-imx/freescale-imx.mk             |   2 +-
 package/freescale-imx/imx-lib/Config.in            |  37 -------------
 package/freescale-imx/imx-lib/imx-lib.mk           |  24 ++-------
 package/freescale-imx/imx-vpu/Config.in            |  16 ++++++
 ...-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch |  32 +++++++++++
 ...-lib-fix-IOGetVirtMem-return-value-checks.patch |  59 +++++++++++++++++++++
 package/freescale-imx/imx-vpu/imx-vpu.mk           |  53 ++++++++++++++++++
 package/gstreamer/gst-fsl-plugins/Config.in        |   8 +++
 ...gins-0002-Fix-bashism-in-configure-script.patch |  25 ++-------
 .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |   6 +--
 ...sl-linkage-add-lrt-for-shared-memory-func.patch |   2 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  10 ++--
 package/libfslcodec/libfslcodec.mk                 |   2 +-
 package/libfslparser/libfslparser.mk               |   2 +-
 package/libfslvpuwrap/Config.in                    |   2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk             |   4 +-
 22 files changed, 262 insertions(+), 107 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu/Config.in
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
