From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Sep 2020 23:41:00 +0200
Subject: [Buildroot] [PATCH 0/7 RFC] support/download: reproducible archives
 whatever tar version (branch yem/dl-git-tar-pax)
Message-ID: <cover.1601329249.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes our download backends, git and svn, to generate
reproducible archives whatever the tar version, thus removing
therequirement for a maximum tar version.

This however changes the actual format of the generated archives,
and they are different from the existing ones. So we also change the
compression to avoid collision with existign archives on s.b.o, that
need to be read by older Buildroot versions.

A huge thank to Vincent for digging up the adequate set of options
that allows generating reproducible archives. Thanks! :-)

Note that this series contains commits marked "WIP": they are separate
commits for ease of review, but they should ultimately be squashed
together of they would not be bisectable.


Regards,
Yann E. MORIN.


The following changes since commit 2e8bf36dc4421f2213f8fa6de91b2c9bf3d64e45

  package/zstd: avoid compilation during host-zstd install step (2020-09-28 22:04:15 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to a71f772a27d008b72b67b081c4a4aaaa9f83ea53

  support/dependencies: drop check for maximal tar version (2020-09-28 23:38:40 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      core/pkg-infra: prepare for alternate default source archives
      WIP: support/download: change format of archives generated from git
      WIP: boot+packages: update hash to new git-tarballs format
      WIP: support/testing: update git-hash checks with new archive format
      package/open2300: switch to github
      support/download: change format of archives generated from svn
      support/dependencies: drop check for maximal tar version

 boot/vexpress-firmware/vexpress-firmware.hash      |  2 +-
 package/18xx-ti-utils/18xx-ti-utils.hash           |  4 +-
 package/aer-inject/aer-inject.hash                 |  2 +-
 package/am33x-cm3/am33x-cm3.hash                   |  2 +-
 package/armbian-firmware/armbian-firmware.hash     |  2 +-
 package/at/at.hash                                 |  6 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash         |  4 +-
 package/brickd/brickd.hash                         |  4 +-
 package/c-capnproto/c-capnproto.hash               |  2 +-
 package/dbus-triggerd/dbus-triggerd.hash           |  2 +-
 package/dt-utils/dt-utils.hash                     |  4 +-
 package/dtv-scan-tables/dtv-scan-tables.hash       |  6 +-
 package/flashbench/flashbench.hash                 |  2 +-
 .../imx-alsa-plugins/imx-alsa-plugins.hash         |  2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |  2 +-
 package/google-breakpad/google-breakpad.hash       |  2 +-
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |  2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash      |  4 +-
 package/imx-mkimage/imx-mkimage.hash               |  4 +-
 package/kvm-unit-tests/kvm-unit-tests.hash         |  2 +-
 package/kvmtool/kvmtool.hash                       |  2 +-
 package/libbroadvoice/libbroadvoice.hash           |  4 +-
 package/libclc/libclc.hash                         |  4 +-
 package/libg7221/libg7221.hash                     |  4 +-
 package/libilbc/libilbc.hash                       |  4 +-
 package/libsilk/libsilk.hash                       |  4 +-
 package/libsvgtiny/libsvgtiny.hash                 |  4 +-
 package/libuci/libuci.hash                         |  2 +-
 package/libyuv/libyuv.hash                         |  4 +-
 package/linux-firmware/linux-firmware.hash         | 68 +++++++++++-----------
 .../linux-syscall-support.hash                     |  2 +-
 package/minicom/minicom.hash                       |  4 +-
 package/mmc-utils/mmc-utils.hash                   |  4 +-
 package/net-tools/net-tools.hash                   |  2 +-
 package/netcat-openbsd/netcat-openbsd.hash         |  4 +-
 .../netsurf-buildsystem/netsurf-buildsystem.hash   |  2 +-
 package/odhcp6c/odhcp6c.hash                       |  2 +-
 package/open2300/open2300.hash                     |  6 +-
 package/open2300/open2300.mk                       |  5 +-
 package/opkg-utils/opkg-utils.hash                 |  2 +-
 package/piglit/piglit.hash                         |  2 +-
 package/pkg-generic.mk                             |  9 ++-
 package/prelink-cross/prelink-cross.hash           |  2 +-
 package/psplash/psplash.hash                       |  4 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash       |  2 +-
 package/rcw/rcw.hash                               |  4 +-
 package/rtc-tools/rtc-tools.hash                   |  4 +-
 package/rtmpdump/rtmpdump.hash                     |  4 +-
 package/speexdsp/speexdsp.hash                     |  4 +-
 package/stm32flash/stm32flash.hash                 |  4 +-
 package/ti-sgx-demos/ti-sgx-demos.hash             |  4 +-
 package/ti-sgx-km/ti-sgx-km.hash                   |  4 +-
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash           |  4 +-
 package/ti-sgx-um/ti-sgx-um.hash                   |  4 +-
 package/trace-cmd/trace-cmd.hash                   |  6 +-
 package/tremor/tremor.hash                         |  4 +-
 package/ubus/ubus.hash                             |  2 +-
 package/uemacs/uemacs.hash                         |  4 +-
 package/uhttpd/uhttpd.hash                         |  2 +-
 package/ustream-ssl/ustream-ssl.hash               |  4 +-
 package/vboot-utils/vboot-utils.hash               |  2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash |  4 +-
 .../xdriver_xf86-video-imx-viv.hash                |  2 +-
 .../xdriver_xf86-video-intel.hash                  |  1 +
 support/dependencies/check-host-tar.sh             | 14 +----
 support/download/git                               | 20 +++++--
 support/download/svn                               | 12 ++--
 .../br2-external/git-hash/package/bad/bad.hash     |  2 +-
 .../br2-external/git-hash/package/good/good.hash   |  2 +-
 .../git-partial-sha1-branch-head.hash              |  2 +-
 .../git-partial-sha1-reachable-by-branch.hash      |  2 +-
 .../git-partial-sha1-reachable-by-tag.hash         |  2 +-
 .../git-partial-sha1-tag-itself.hash               |  2 +-
 .../git-partial-sha1-tag-points-to.hash            |  2 +-
 .../git-sha1-branch-head/git-sha1-branch-head.hash |  2 +-
 .../git-sha1-reachable-by-branch.hash              |  2 +-
 .../git-sha1-reachable-by-tag.hash                 |  2 +-
 .../git-sha1-tag-itself/git-sha1-tag-itself.hash   |  2 +-
 .../git-sha1-tag-points-to.hash                    |  2 +-
 .../git-submodule-disabled.hash                    |  2 +-
 .../git-submodule-enabled.hash                     |  2 +-
 .../git-refs/package/git-tag/git-tag.hash          |  2 +-
 .../git-wrong-content/git-wrong-content.hash       |  2 +-
 83 files changed, 181 insertions(+), 176 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
