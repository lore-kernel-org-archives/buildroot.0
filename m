From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 22:06:58 +0100
Subject: [Buildroot] [git commit] support/download: change format of
 archives generated from git
Message-ID: <20210110205118.E9B83815EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b95a5dc27c0d8002c00bda1c867ddea9218087e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to using the tarball helper, that can generate reproducible
archives whatever the tar version >= 1.27.

However, those archives are not identical to the previous ones generated
in the (now-broken) gnu format.

To avoid any clashing between old and new archives, and new and old
Buildroot versions, we need to name the new generated archives
differently from the existing ones.

So, we bump the git-specific format-version to -br1.

The %ci date  has been supported by git back to 1.6.0, released August
2008); it is not strictly ISO8601, but is still accepted as a PAX date
header. The strict ISO8601 placeholder, %cI, was only introduced with
2.2.0, release in November 2014, so too recent to be widely available.

As the format and the names of the archives changes, we need to update
all the hash files with the new names and hashes.

Of all the bootloaders that have a git download method, vexpress-firmware
is the only one to have a hash. Others have no hash files, or they have
explicitly set BR_NO_CHECK_HASH_FOR.

For the packages, linux-headers is the special snowflake, as the git
download is only for custom git tree, so it is excluded from the hash
verification with BR_NO_CHECK_HASH_FOR.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

    ---8<------8<------8<------8<---
    #!/bin/sh
    # Find and download all packages using git as backend.
    # Manually fix hashes for affected packages.

    # Packages that only have a host variant
    HOST_ONLY='imx-mkimage|mxsldr|netsurf-buildsystem|opkg-utils|prelink-cross|qoriq-rcw|vboot-utils'

    # Packages that have a non-git main _SOURCE, and/or which
    # have BR_NO_CHECK_HASH_FOR for the git _SOURCE
    NOT_GIT='aufs|aufs-util|xenomai|linux-headers'

    export BR2_DL_DIR=$(pwd)/temp-dl-dir

    make defconfig
    make $( git grep -l -E 'SITE_METHOD[[:space:]]*:?=[[:space:]]*git\>|_SITE[[:space:]]*:?=[[:space:]]*git:' \
                boot/vexpress-firmware/ package/ \
            |sed -r -e 's,.*/([^/]+)\.mk,\1,' \
            |sed -r -e '/^('"${NOT_GIT}"')$/d;' \
                    -e 's/^('"${HOST_ONLY}"')/host-\1/;' \
                    -e 's/$/-legal-info/;'
          )

    ---8<------8<------8<------8<---
---
 boot/vexpress-firmware/vexpress-firmware.hash      |  2 +-
 package/aer-inject/aer-inject.hash                 |  2 +-
 package/am33x-cm3/am33x-cm3.hash                   |  2 +-
 package/armbian-firmware/armbian-firmware.hash     |  2 +-
 package/at/at.hash                                 |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash       |  2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash         |  4 +--
 package/brickd/brickd.hash                         |  4 +--
 package/c-capnproto/c-capnproto.hash               |  2 +-
 package/dbus-triggerd/dbus-triggerd.hash           |  2 +-
 package/dt-utils/dt-utils.hash                     |  4 +--
 package/dtv-scan-tables/dtv-scan-tables.hash       |  6 ++---
 package/edid-decode/edid-decode.hash               |  2 +-
 package/ell/ell.hash                               |  2 +-
 package/flashbench/flashbench.hash                 |  2 +-
 package/fmc/fmc.hash                               |  2 +-
 package/fmlib/fmlib.hash                           |  2 +-
 .../imx-alsa-plugins/imx-alsa-plugins.hash         |  2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |  2 +-
 package/google-breakpad/google-breakpad.hash       |  2 +-
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |  2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash      |  2 +-
 package/imx-mkimage/imx-mkimage.hash               |  4 +--
 package/iwd/iwd.hash                               |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.hash         |  2 +-
 package/kvmtool/kvmtool.hash                       |  2 +-
 package/libbroadvoice/libbroadvoice.hash           |  4 +--
 package/libcamera/libcamera.hash                   |  2 +-
 package/libclc/libclc.hash                         |  4 +--
 package/libg7221/libg7221.hash                     |  4 +--
 package/libilbc/libilbc.hash                       |  4 +--
 package/libsilk/libsilk.hash                       |  4 +--
 package/libsvgtiny/libsvgtiny.hash                 |  4 +--
 package/libuci/libuci.hash                         |  2 +-
 package/libyuv/libyuv.hash                         |  4 +--
 package/linux-firmware/linux-firmware.hash         |  2 +-
 .../linux-syscall-support.hash                     |  2 +-
 package/minicom/minicom.hash                       |  2 +-
 package/mmc-utils/mmc-utils.hash                   |  4 +--
 package/net-tools/net-tools.hash                   |  2 +-
 package/netcat-openbsd/netcat-openbsd.hash         |  4 +--
 .../netsurf-buildsystem/netsurf-buildsystem.hash   |  2 +-
 package/odhcp6c/odhcp6c.hash                       |  2 +-
 package/open62541/open62541.hash                   |  4 +--
 package/opkg-utils/opkg-utils.hash                 |  2 +-
 package/piglit/piglit.hash                         |  2 +-
 package/pkg-download.mk                            |  4 +++
 package/prelink-cross/prelink-cross.hash           |  2 +-
 package/psplash/psplash.hash                       |  4 +--
 package/qoriq-rcw/qoriq-rcw.hash                   |  4 +--
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash       |  2 +-
 package/qt5/qt5coap/qt5coap.hash                   |  2 +-
 package/qt5/qt5knx/qt5knx.hash                     |  2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                   |  2 +-
 package/rtc-tools/rtc-tools.hash                   |  4 +--
 package/rtmpdump/rtmpdump.hash                     |  4 +--
 package/speexdsp/speexdsp.hash                     |  4 +--
 package/stm32flash/stm32flash.hash                 |  4 +--
 package/ti-sgx-demos/ti-sgx-demos.hash             |  4 +--
 package/ti-sgx-km/ti-sgx-km.hash                   |  2 +-
 package/ti-sgx-um/ti-sgx-um.hash                   |  2 +-
 package/trace-cmd/trace-cmd.hash                   |  2 +-
 package/tremor/tremor.hash                         |  4 +--
 package/ubus/ubus.hash                             |  2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash         |  2 +-
 package/uemacs/uemacs.hash                         |  4 +--
 package/uhttpd/uhttpd.hash                         |  2 +-
 package/ustream-ssl/ustream-ssl.hash               |  4 +--
 package/vboot-utils/vboot-utils.hash               |  2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash |  4 +--
 .../xdriver_xf86-video-imx-viv.hash                |  2 +-
 .../xdriver_xf86-video-intel.hash                  |  2 +-
 support/download/git                               | 31 +++++++++-------------
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
 89 files changed, 131 insertions(+), 132 deletions(-)

diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
index 40f64c7528..ac636e1512 100644
--- a/boot/vexpress-firmware/vexpress-firmware.hash
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 def599c86ab3606f7f67c0190e9b237fbc0cf934a951ffb1c5fb0c47d8a8f3d2	vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3.tar.gz
+sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-br1.tar.gz
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index ee097c873a..6259bb9054 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49a44b7a9e3983dc15fdc5bacd0e095df650296024f43f9d6c080ad54de0b07f  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41.tar.gz
+sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-br1.tar.gz
 sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index a63ba64a3c..2210e8ac69 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a722098b362f58f4dfb2a7c30afd604424d435b3d5ebe6ebf5d76ad942f796d0  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365.tar.gz
+sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-br1.tar.gz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index edbc9c8282..ceefafd97c 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  975bc377728496006f058317cccc88e2d3c4ab172ee3df08cfd085cf13221752  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e.tar.gz
+sha256  a370a6aeb30f12a17f8d47c81a4d81aa822b9408589305a4d6a67d544280520d  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e-br1.tar.gz
diff --git a/package/at/at.hash b/package/at/at.hash
index 108a2c06ff..c266f1ec1a 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9ae5761a1fb897cda3a6f14439bed33cda33c0eedfcee6866e3d2ebad67fbd2f  at-7c74fa1aece6bc6db351763dc012193d5d634b7e.tar.gz
+sha256  cf00bc31a595dcacec1fee817460c81a1e0fb046e5c0984a13ca13c0f8fb779c  at-7c74fa1aece6bc6db351763dc012193d5d634b7e-br1.tar.gz
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 1151dcc9ed..124c7a1107 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1139a469c0c097ef3b6ecfca4527ee5c8ff1cfcb16b5bd1739129c528cd53416  azure-iot-sdk-c-LTS_07_2020_Ref02.tar.gz
+sha256  61874790b66c7e120550fdffff88cb1e3cbfbfebcf324e41982f04461f8793a0  azure-iot-sdk-c-LTS_07_2020_Ref02-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 1f4f5f33b3..b1e87d7a36 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1a84dcf6557c2017ebe258502f60575e0971511c548fc88aee5ab68ca0bb268a bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  d2e3e97bb9da218f223c03b2f080c5da727224e6e4cb99979398971110dfae04  bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045-br1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index 8de57a9b82..e9be1b10b0 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256 0b79f1ccd6fa644d7ecb2e17b19f9ffbf6374702ae9ac536b2c4a0b8b2cfe160 brickd-ev3dev-stretch_1.2.1.tar.gz
+sha256  205f581103512599cb10992275da8c7207ed732e1a686600877c51b7a742de73  brickd-ev3dev-stretch_1.2.1-br1.tar.gz
 
 # Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index 75edaebf91..e215400ce5 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  88c454f4f4bad87c9b60cd739c7da5605c1085c0e92b317dd72d547bbb804279  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d.tar.gz
+sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index b7ed89abf7..956a577ca4 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3c6d865427bf1b93b16323c796ed6957ce6b2b6fd53f518b1b082d03b939102c  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09.tar.gz
+sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-br1.tar.gz
 sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 3610fe164f..e42e82578d 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 61440ab222543268923175eb5c7425076d2b8bce4c1dfc177f2eb3873449af7c  dt-utils-v2019.01.0.tar.gz
-sha256 a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
+sha256  737313719d7c04d7b9576fdc572d838c81ea22ea41a44c7646467018e67a0b97  dt-utils-v2019.01.0-br1.tar.gz
+sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index 73e0e7d19a..a57409978f 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 76cb6131df1b35ed71b0f6c87cfafc188d614cfbd9973e7832a65ba63e85c504  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256 4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
+sha256  fc65b1f85195ab3d877f7ce802dc62b8c70b3a1815fa6e6a69de19a9d354c19a  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654-br1.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 3d7e945406..65d6c71079 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  327fe14531ddebe74a730efc30209e68efbd86c11375b5576cbe23af3d691150  edid-decode-188950472c19492547e298b27f9da0d72cf826df.tar.gz
+sha256  c1a6222083c59f0499b3e43c159aee7e4c6c07d33b790d490a13fd62942fa9b5  edid-decode-188950472c19492547e298b27f9da0d72cf826df-br1.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index b93c43a49d..efd39b31db 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  3f17aaaec2ad8eb8471ff2b18cc8d1bf48e55086bd95d22f327f06fde7c1c277  ell-0.35.tar.gz
+sha256  c2b3848568c75bcf5a0e7d1f2efce4fdb2733d28226ed21c6a6542f0be05d784  ell-0.35-br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index f82d7f0eed..9906af02e5 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12e2dcb6f041ef1a303fc5bc84642ed637c24d77ed6c667a2187f21d54555731  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
+sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index d31bb5e794..fed33091cd 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4  fmc-fsl-sdk-v2.0.tar.gz
+sha256  cb896ec1fac2fe9a3a9bb8be2221b79acf5f9b75841609a681db0d9e7bec02a0  fmc-fsl-sdk-v2.0-br1.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 9143ac2c37..47460d091c 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa  fmlib-fsl-sdk-v2.0.tar.gz
+sha256  59415d346af1d22f510f2785be4c7e3606dc3181476a666e832270550f7d44a6  fmlib-fsl-sdk-v2.0-br1.tar.gz
 sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
index b0f47080ce..bb7beede9d 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  e76a71e9166fbedeaa535fd7ebc07edc30a1e87f529ab2aa733e3603d3183ed0  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  a9a5ef408a7329c2c5fa2a084ae7824afbfbebed68612bd72509488ccb0b94b3  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index c16dc7f9a9..f7d907b99d 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz
+sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-br1.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 81715ec573..09f9a0cf91 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f444233e88957c30cc2d5497ee9d72d104122ce2c25a7ef7f6be3af1b3f7353  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
+sha256  3504639ee5d7536e7f7939b80520dfcb98863e9b50673dd577d0ab2a07105acb  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6-br1.tar.gz
 sha256  f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  LICENSE
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index ec93e4e752..32a24dc2a5 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  2fc8dcbe84f3968ee31d724f8a44e078bb5338682d97e4b5ddfc4bfa2d04ab5f  gst1-interpipe-v1.1.3.tar.gz
+sha256  48ad146a57f3543b8c32985b042558bf1fe67abeac9532105ebde0b441564cba  gst1-interpipe-v1.1.3-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index 6b4d59f07e..caa9107bd8 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  24d910c2e7b4c66c804e53e9f3fc18fb61b0d3b82d8580f0fa9c2b1c563e5ab3  gst1-shark-v0.7.2.tar.gz
+sha256  b141312603af82f600981dd7231e2ecc5a42b3550fadd2450965a0a85f62cbb2  gst1-shark-v0.7.2-br1.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index e06706070d..9ef1a118e2 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 19745a7b9d06a420e7574328de65e6f5f7e82c87beed926c8f0f6bd1512afbe6  imx-mkimage-rel_imx_5.4.47_2.2.0.tar.gz
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  482d10bf59dd9ae87ae5e29305e338a35f8fa3bc4ec40c61ada232f682f2358f  imx-mkimage-rel_imx_5.4.47_2.2.0-br1.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 77a84f156e..f1ee23dc5d 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4f0007fb7594fe59baed71fb72c8390c472ff11c38b75d1f673375d4129ba5e2  iwd-1.10.tar.gz
+sha256  c3ea43eccf27bb92d4e4482ff407cdabd2d1a1e4647d646241de87f2774e9a20  iwd-1.10-br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 3458778937..ad500d04f2 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  346c543de9e953db283072e1c591cab9d0eb775f7fb1fff3d7560f38bdf6bdf2  kvm-unit-tests-kvm-unit-tests-20171020.tar.gz
+sha256  e476443cd76c8f540734e075b419638b2f200ae002986d6fc14076d410f3751e  kvm-unit-tests-kvm-unit-tests-20171020-br1.tar.gz
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index fd841c354c..8747ae1d21 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d55e4521ac040b870db015e1f075d69b89f940242d7ce5708f7d7060d62c0cc  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e.tar.gz
+sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-br1.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 6d5afa8dbe..0a22817e25 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b68c91d5af6e493c3d4fc3be04825e109a7593fe4de8c18ec75546004eeb4749  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
-sha256 2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
+sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-br1.tar.gz
+sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 41416da712..47c160e8f4 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  a7800b54584dee321874610ef70b1b7690c79d8340c5b134ea35176657681e29  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f.tar.gz
+sha256  cea2bf375b12c13945f9888119a4eeb999d7aeb550ecadcb5f919517b0b83c09  libcamera-e59713c68678f3eb6b6ebe97cabdc88c7042567f-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
index 29728fbc76..2af64bc8e8 100644
--- a/package/libclc/libclc.hash
+++ b/package/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5ea2cd2fa7fa1474d3e0580064e7a22014ef8d64dbbd7c546277fa4beb5acf86 libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060.tar.gz
-sha256 3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479 LICENSE.TXT
+sha256  54d7ae523aabf68d533011739d6c01546cae0c294442d0f44fd657c046cb707d  libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060-br1.tar.gz
+sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index 09023f9543..b2174e8b46 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 330dafa58d37a585a866167bc33f8fbe06dbcfc9a69cad43fab0b6702ebf2393  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34.tar.gz
-sha256 26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
+sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-br1.tar.gz
+sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index 81a0c4e037..5f41a99ced 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 70cd6a4f6bbe6dcebfc4293eea7b6200f883d1bf0affa1efba819d44d274e35f  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
-sha256 b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
+sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-br1.tar.gz
+sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 6042096d82..14f6676262 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 01de52aa123f7bd20e500a076046f6b30d55f8e98c4029ab424bc51c46d7083d  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
-sha256 62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
+sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-br1.tar.gz
+sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index 86096cef3b..ba4b4cae97 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 082a2e8849f05e2364a942eec51a798d637c6eca44db8c73350a038ebd1fd268  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06.tar.gz
-sha256 92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
+sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-br1.tar.gz
+sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index d4c839eb80..b808810ccf 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 bb9827863c6b7b6cf986a3de42b5716edb8a280e44b3ce39541de18062c3c00e  libuci-49ec6efbdac4819033d34f08927d795f83a3932d.tar.gz
+sha256  1ee875910bdf751807f10d44f6b6b7f9ec71c12d4c407a80bae5cb654d2ba4cc  libuci-49ec6efbdac4819033d34f08927d795f83a3932d-br1.tar.gz
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index e0d4e57e1a..4b70e63ade 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 395075bed7e048f5f7d4fe9cb9255ce0afcee3f8f093741a7af1a2b1c579d089  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0.tar.gz
-sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
+sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-br1.tar.gz
+sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 1c1f3bd116..12af68f2d3 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ba045512bb782ba8efc82651a85679684fb0fec7a7a094971031be665d6c82d6  linux-firmware-20201022.tar.gz
+sha256  f97d6d884026c5e3641909946713dcfea580c307d47830d37d42bfcc9a93870a  linux-firmware-20201022-br1.tar.gz
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 2371dffb12..3445bf1398 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e5088b81011e30b567b6bde6bb7c22ad529c4ee8890cc5e93d58b21f2c4df56a  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb.tar.gz
+sha256  498efb6915ac6e65c82c712fadd3c30f9472764114c835849e02f2c092bacd2d  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb-br1.tar.gz
 sha256  4c1fc9acc9f3867e5c81b5d5f57c52fb9a932662bd4e2e5e43b3fe95390035f5  linux_syscall_support.h
diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 970b7ad2c1..f67447212f 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e5d218d9f8f00fb9cc323f7517c49d8eb12a22d158efee513df3c50843619fb  minicom-v2.8.tar.gz
+sha256  18fa02dc32523834ed1e5dbc3d24ff3860e74fa3c6eb817f9bdf693dde3f7d4e  minicom-v2.8-br1.tar.gz
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 86c644f774..e8b2826612 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 df8876e0e671f502bb8872cecca3cc6d1055253fa314f3544d22829e129e024e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8.tar.gz
-sha256 c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
+sha256  ffc8f77233d1bd39ce4ec68835ad94aa6762624e4e96fb60102e87ba82db083e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8-br1.tar.gz
+sha256  c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
index 510cac3659..e29415b8ff 100644
--- a/package/net-tools/net-tools.hash
+++ b/package/net-tools/net-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7cfe9e73825bac9ab1a6f99d1fc7f54bfd9d33a6f62ba58d28a566905c4e86c  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b.tar.gz
+sha256  4c68ef33d97cc807fe437fa64a801355c36d638774c0c8a4342742f6bdceea78  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b-br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index cfa65ee24b..b70cae8860 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b46c11f83f66c41ad8f413e842c51a9fb2c495e9a2ed836e6ee75bc314545c30 netcat-openbsd-debian_1.195-2.tar.gz
-sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
+sha256  55e578f652cbf6ffc95f75ea3e2645ab335fab63649568bd7cdb0a6331ca87de  netcat-openbsd-debian_1.195-2-br1.tar.gz
+sha256  e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c  debian/copyright
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index 8e3bbabf05..dfdc999829 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e2d93e25623761c5de39c8c94750c982335acc1c2da4439b1a2088ecd4455c9  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555.tar.gz
+sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-br1.tar.gz
 sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 2ac4a68219..26ee711684 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e715c1408982152306c65f1c3ce7c58fb6f15fa8f9626c266819119239f32418  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374.tar.gz
+sha256  c3622120b5209d1c14d5ac92884240bf0e4f652633562355e70dbf482f6c37b4  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374-br1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index a6b3b38ec6..3da8c8f5fb 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3300149c2e9e8c1f87fe2786e25d74372a33611a0bd4c6c202c5fca347633069  open62541-1.0.tar.gz
-sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
+sha256  36273793e5247586fadaa73c0edad89be610100cbc839d1fb5f567f20c3cbc44  open62541-1.0-br1.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 471ce4c2fa..779852d9c0 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acb208fe32f93f7fc0f7fdf9f870c07e40a016bcb7fa07ada6c99503e033dafd  opkg-utils-0.4.3.tar.gz
+sha256  552c074630b6d6b39a32a35243fb34d7c5888b8a4f18118abb4daf92d0e847f2  opkg-utils-0.4.3-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 1a0011850e..923569a6f3 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0d42dc46295a6b3ecfeb379887bd78128ce7938242ae56d58d5e9b3dea8c98b6  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0.tar.gz
+sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-br1.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 118df83855..979ccfdd87 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -17,6 +17,10 @@ export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
+# Version of the format of the archives we generate in the corresponding
+# download backend:
+BR_FMT_VERSION_git = -br1
+
 DL_WRAPPER = support/download/dl-wrapper
 
 # DL_DIR may have been set already from the environment
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 3ac33ac3d0..5bd2c61082 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cb3f5d833cd74b7e90e38465c9c948b0f4138c017509cb91e391b0931063429e  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2.tar.gz
+sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-br1.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 46d5e12ceb..87fcdadd6d 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0042192bf94be4f5792d9ff6b7a2ddff77c79e51274745180d14be5815b3a0f4  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c.tar.gz
-sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
+sha256  2c1344dd8414415d80a01484b1cc29e78f99c31d5266189540e5966a7dc6e10e  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c-br1.tar.gz
+sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 88460716f9..8c7c5d1fbf 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4a9ce5bb1733239bf1b740b705df20f90802b16114e24f3fd56c08a7ba4b56c2 qoriq-rcw-LSDK-19.09.tar.gz
-sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
+sha256  33fd492448a3ea3a29ee90d03544e437e32a0d1ea64a6c0a42b569e5864d4972  qoriq-rcw-LSDK-19.09-br1.tar.gz
+sha256  a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd  LICENSE
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 1e56b4eba7..8e983f8e21 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  07fbc3f5053f55e4ef6566a15b42b74895314b48a0dfd46f0984f96f0fbb3e02  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127.tar.gz
+sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-br1.tar.gz
 sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index 54e78023dc..9c0258f45b 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  44c4782a40a29ccee3241d8cf08f368230dff5b1bed9ca0d58bc8e70c38f5003  qt5coap-5.15.2.tar.gz
+sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2-br1.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 0cb964134a..031fad5e92 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  e246de9d7c5103edd6c3b735d2ed1f13f7ff86d32cb08521abb5718538353daf  qt5knx-5.15.2.tar.gz
+sha256  932ea512aa8ceb514ac40ce1fcbebe86c306caff1a0b11320d9a36fd84bae10c  qt5knx-5.15.2-br1.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index 3ac10f78a8..f4ea6b7015 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  bd00180ed88ae890952fe7a8ad29645d4b890c7774e9a9bdcb8e83be3c5cf69d  qt5mqtt-5.15.2.tar.gz
+sha256  38f2bc1bcbdf76d30d78c86426c85f62a6c2091c997cad4b087039f795b2b406  qt5mqtt-5.15.2-br1.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index 81be1afe4e..a14dcb3e6e 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 152d8455bae5ad672e99bb91dfbed5b8b4bd8b0325146d1cf1c4d80b6e0d8a16 rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7.tar.gz
-sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a COPYING
+sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-br1.tar.gz
+sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index 6e85a58419..54dbbc35d7 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b98fceba5155c5a1ee3f26550ea94144c72d8b8c5a050c213bb55dab330ad6ff  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3.tar.gz
-sha256 03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
+sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-br1.tar.gz
+sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index 955c4c0a0c..fd9870dc58 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3f3997997f3af3e7382b44abc9d2a55db5bd8754b22e798e2d16ac309cd6474a  speexdsp-SpeexDSP-1.2.0.tar.gz
-sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  c92c7e428cb5ca11b4e6f13118ff288332f330b6fefc93cb39bf7b43b13cb1f7  speexdsp-SpeexDSP-1.2.0-br1.tar.gz
+sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 3adcb96d31..1b06a8f0f0 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 58788826b80f16f2084632299340f9a3155b326936210e5f7a58f9dbd1b18bdd stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 gpl-2.0.txt
+sha256  42b7d63f6016bd75911cbb87fe85fbc4f98adf3ceecfe6d91f7956b31d18095f  stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650-br1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 31044e9e3f..e5631c9630 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 1324115da376bc8108923c596a3c4d8df24a968395461df11e0b715764a942d4  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287.tar.gz
-sha256 052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
+sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-br1.tar.gz
+sha256  052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 2fd3b56b1e..c7030b2222 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ea70356dd0fd7f904f6d6046c4090c7d6d0126e13039db746c75bb6e666864d8  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9.tar.gz
+sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-br1.tar.gz
 sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index 8e8c5ff328..109b2e9e56 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4d293a4170e2fd28852680830dacd8f575b12037f3e15bcf599232f6ccbf6deb  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d.tar.gz
+sha256  e52c743194516fcc92d570bc5a26dfaa26d18c13d92d41640019f544ef25be3a  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-br1.tar.gz
 sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 3f17e94020..0afde6705e 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f7d591ac13ac3de004aa69fa3c2d333f620bb29ad0fec064ec215f488588b333  trace-cmd-trace-cmd-v2.9.1.tar.gz
+sha256  8bab29530cd05272dccab48c9780644758e71ed990ce65c701b9095f7beae417  trace-cmd-trace-cmd-v2.9.1-br1.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
index 89661a64cd..89d8bde84e 100644
--- a/package/tremor/tremor.hash
+++ b/package/tremor/tremor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ba94cfdf886399c550f76908285bfa9e322f24085de6f1810c2abea565c13a15  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8.tar.gz
-sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
+sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-br1.tar.gz
+sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index bda58bc30c..1fcea36851 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  93ef2612853641ca8d16d07527115c72ed03f8eaa1c727a01b069a4e814247c0  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692.tar.gz
+sha256  011566b2be426f572d397b44a7c12baa50a9b949232e5a6075eba613e1c3f7ae  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692-br1.tar.gz
 sha256  f53187f011575f6ec6c529136fd4658d67e674227c80b7b72c99b3654454ae7f  ubusd_acl.h
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index 2a73237f06..796f1dbced 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1f22e4143413550d64cbde193de388e8884eb7398cd41d3835e5d8a06a488423  uclibc-ng-test-c64d6ac77f0e745c70e76024212c72e4bbe2091a.tar.gz
+sha256  ece0cb910ce649601e4dec42572c2871c3c58cff1be5c94e8e91816dce5793ba  uclibc-ng-test-c64d6ac77f0e745c70e76024212c72e4bbe2091a-br1.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index 7dcbba926e..c8dd620b8e 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9b4a849f65edb482f59bc40f646e7cd79915b3030ea9bd825868347217db3c96  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517.tar.gz
-sha256 6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
+sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-br1.tar.gz
+sha256  6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index e8bdb0bb6b..389a0ef636 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9325c95c9bb1c51bf135700a65738884fa9cd548ff8166c8b61fdbf99825cd6d  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82.tar.gz
+sha256  5b81ebf9e419c668de4181cce7b9f5fa358cabb2a4a0d1f1a3a24190eeb21f25  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82-br1.tar.gz
 sha256  2a61a8a690e7646a4bfe4261bf77c49f47588db5fc234b3cc66809dcc0cb3985  uhttpd.h
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index ba315f88dc..60672b38b3 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 63ecc9d78ef83020a4539a89c8a3690657e7bbe7580ae02cc0e7b4267ffea5cd  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb.tar.gz
-sha256 90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
+sha256  f09474dbe4680b51cc0c6a088807102d64954764ef58c2a1e3231e3a77c4b01f  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb-br1.tar.gz
+sha256  90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index e2ddf77734..efef776caa 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d95b64b1f1de4a3ffa5c2e446d7c8e92aa197aee10de24206b2ea2deb5a8b947  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+sha256  9cdeaa2e4e1190c0cd200e1b07d394e5d24f57cc0efffdce861d5de934035bf7  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-br1.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index 7adcc86037..b0aa6b91e7 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9e3c3e8aa19e6cf59a72f235391a095d6d953c325b669d8a7815e32616c232df wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005.tar.gz
-sha256 21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37 LICENSE
+sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-br1.tar.gz
+sha256  21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37  LICENSE
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index e5d46c86f3..5873b4b11c 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  638a8aa8b64f860900d003527529689bc342d18ff5e41a9e1750884544898e67  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga-br1.tar.gz
 sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 321ae5b606..4e41bda154 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  029afa61e785f6e0fb18d2c2f1619e97af8b6f19c7fa0ba9923eea03ccf78626  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc.tar.gz
+sha256  e121871de0396caff0349d761033aa4c0618d27b1ad5d79dab6c8246d9fb50d1  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc-br1.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/support/download/git b/support/download/git
index 15d8c66e05..fa98198fe0 100755
--- a/support/download/git
+++ b/support/download/git
@@ -1,5 +1,10 @@
 #!/usr/bin/env bash
 
+# NOTE: if the output of this backend has to change (e.g. we change what gets
+# included in the archive (e.g. LFS), or we change the format of the archive
+# (e.g. tar options, compression ratio or method)), we MUST update the format
+# version in the variable BR_FMT_VERSION_git, in package/pkg-download.mk.
+
 # We want to catch any unexpected failure, and exit immediately
 set -E
 
@@ -16,6 +21,8 @@ set -E
 # Environment:
 #   GIT      : the git command to call
 
+. "${0%/*}/helpers"
+
 # Save our path and options in case we need to call ourselves again
 myname="${0}"
 declare -a OPTS=("${@}")
@@ -170,8 +177,8 @@ _git checkout -f -q "'${cset}'"
 _git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
-# %cD is RFC2822, so it's fully qualified, with TZ and all.
-date="$( _git log -1 --pretty=format:%cD )"
+# %ci is ISO 8601, so it's fully qualified, with TZ and all.
+date="$( _git log -1 --pretty=format:%ci )"
 
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
@@ -191,24 +198,12 @@ if [ ${recurse} -eq 1 ]; then
     done
 fi
 
-# Generate the archive, sort with the C locale so that it is reproducible.
+popd >/dev/null
+
+# Generate the archive.
 # We do not want the .git dir; we keep other .git files, in case they are the
 # only files in their directory.
 # The .git dir would generate non reproducible tarballs as it depends on
 # the state of the remote server. It also would generate large tarballs
 # (gigabytes for some linux trees) when a full clone took place.
-find . -not -type d \
-       -and -not -path "./.git/*" >"${output}.list"
-LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
-
-# Create GNU-format tarballs, since that's the format of the tarballs on
-# sources.buildroot.org and used in the *.hash files
-tar cf - --transform="s#^\./#${basename}/#" \
-         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
-         -T "${output}.list.sorted" >"${output}.tar"
-gzip -6 -n <"${output}.tar" >"${output}"
-
-rm -f "${output}.list"
-rm -f "${output}.list.sorted"
-
-popd >/dev/null
+mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" ".git/*"
diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index b9e1baec84..b44b1f8255 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index 9e92ab8ab9..fc3f60dafd 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  d00ae598e9e770d607621a86766030b42eaa58156cb8d482b043969da7963c23  good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index 648bcceca0..26a6b358e2 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  70b76187369e47db69dac02c5696e63b35199cd20490fa473d289dd377774613  git-partial-sha1-branch-head-68c197d0879d485f4f6c.tar.gz
+sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-br1.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index d064362e2c..ab1edc73a8 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  9db079b9e215799d59975db7b2b26671eff1932ee6cf1075296f2ace3e2cb746  git-partial-sha1-reachable-by-branch-317406308d9259e2231b.tar.gz
+sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-br1.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index 7696086690..e4a08342a9 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  f2ef9772f13a9ef9a2c7cde0795e179defb12320d1747fc8d2408748ef5844c2  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4.tar.gz
+sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-br1.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index e627caf91e..6e83e637cf 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  721143b41b8e56cfd9025833f1602e900a490627db2504e5b4907baa23e0019e  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61.tar.gz
+sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index f957a0e23c..7d538e72df 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0fbf7fe935f962ceaafcf8e0ffd25dd2a83752c3f0fd055a942a53f8c9235fa7  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d.tar.gz
+sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 3e8f76d31a..2fc4fbcb95 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  a21a2507b6d94ad484e49e3a9ae698f672a57469aab8e1779da77df7c9d4d337  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f.tar.gz
+sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-br1.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index f8d7b5dc48..38f0578fd6 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  8909e76d898e651af0bc23fae4103b87888bfe77448d71aaf1fbec3da97a3ce2  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08.tar.gz
+sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-br1.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index 0eb0ca0917..bd4673b15f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  9b20256a3058221a8e91031f11700d9945ea84e8f328fa8e42e1cb9f7a30e3b2  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59.tar.gz
+sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-br1.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index 48c1348538..c6862da75e 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  7d301c1a1054d6aee49193ca9e938f4da561ff73fb01719662865aa38bdc4361  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2.tar.gz
+sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 3dcafc2094..188cb6897b 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  c1f9f5734529a31140a71c031534460811f001b4db37d26833f386358150ab47  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023.tar.gz
+sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index 3bd0a44693..c0698e7b28 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  f9d46ff8a1a344c6c31fa4211220f3085c446abd31626232540703158276f22c  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br1.tar.gz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index 7f92c652d3..b95c51fe20 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  139a34c3c844c844dee74b6746418cfa75fbcc4205794ac8c0b3cd7d55a76792  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br1.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index 1cd0b15f27..c7ebcf0e04 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  85dcb5bcf9bed496688d0eb01c7a3ce05c5b46b984cc1e9e76a6dbefd976e6b3  git-tag-mytag.tar.gz
+sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 47b2b8b7d7..453ffc0ab2 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  04715901977503d1df650e0959f4d31d8e7b105e2ac99a2182e0652b8f13baa1  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+ sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
