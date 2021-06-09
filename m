From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  9 Jun 2021 22:59:35 +0300
Subject: [Buildroot] [PATCH v2 00/28] sunxi: use mainline
 arm-trusted-firmware
Message-ID: <20210609200003.2866122-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the second revision of the patch set that updates BSP on H5/A64
sunxi boards. The following changes are suggested:

- introduce new ATF option to explicitly disable GCC stack protection
  when platform does not support it
- switch from early Allwinner ATF port to mainline ATF for all H6/A64 boards
- bump Linux kernel version
- bump U-Boot version
  -- switch to combined u-boot-sunxi-with-spl.bin image
  -- for now disable support for Allwinner SCP firmware

Note that only ATF is modified for amarula_a64_relic_defconfig. That
board uses vendor kernel from their github repo. I do not have any
idea which tag/branch is better to use.

Finally, let me re-iterate once again: I have only orangepi-zero-plus2
board at my disposal. So only this board has been tested. For all the
other boards only build tests have been completed. ATF provides only
basic support for H5/A64 and SCP firmware is disabled, so I do not
expect any surprises here. But still, any help with boot tests on
other H5/A64 sunxi boards is more than welcome.

Regards,
Sergey

v2:
- as per Heiko Thiery suggestion, bump mainline ATF version to v2.5
- cleanup commit messages: use 'mainline' instead of 'upstream'


Sergey Matyukevich (28):
  boot/arm-trusted-firmware: option to disable stack protection
  support/testing: switch TestATFAllwinner to mainline ATF
  support/testing/tests/boot/test_atf: update U-Boot in TestATFAllwinner
  configs/orangepi_zero_plus2_defconfig: switch to mainline ATF
  configs/bananapi_m64_defconfig: switch to mainline ATF
  configs/orangepi_zero_plus_defconfig: switch to mainline ATF
  configs/orangepi_pc2_defconfig: switch to mainline ATF
  configs/orangepi_prime_defconfig: switch to mainline ATF
  configs/orangepi_win_defconfig: switch to mainline ATF
  configs/friendlyarm_nanopi_a64_defconfig: switch to mainline ATF
  configs/friendlyarm_nanopi_neo2_defconfig: switch to mainline ATF
  configs/friendlyarm_nanopi_neo_plus2_defconfig: switch to mainline ATF
  configs/amarula_a64_relic_defconfig: switch to mainline ATF
  configs/olimex_a64_olinuxino_defconfig: switch to mainline ATF
  configs/pine64_defconfig: switch to mainline ATF
  configs/pine64_sopine_defconfig: switch to mainline ATF
  configs/orangepi-zero-plus2: bump BSP versions
  configs/bananapi_m64_defconfig: bump BSP versions
  configs/orangepi_zero_plus_defconfig: bump BSP versions
  configs/orangepi_pc2_defconfig: bump BSP versions
  configs/orangepi_prime_defconfig: bump BSP versions
  configs/orangepi_win_defconfig: bump BSP versions
  configs/friendlyarm_nanopi_a64_defconfig: bump BSP versions
  configs/friendlyarm_nanopi_neo2_defconfig: bump BSP versions
  configs/friendlyarm_nanopi_neo_plus2_defconfig: bump BSP versions
  configs/olimex_a64_olinuxino_defconfig: bump BSP versions
  configs/pine64_defconfig: bump BSP versions
  configs/pine64_sopine_defconfig: bump BSP versions

 board/bananapi/bananapi-m64/genimage.cfg      | 10 ++------
 board/friendlyarm/nanopi-a64/genimage.cfg     | 10 ++------
 .../friendlyarm/nanopi-neo-plus2/genimage.cfg | 10 ++------
 board/friendlyarm/nanopi-neo2/genimage.cfg    | 10 ++------
 board/olimex/a64-olinuxino/genimage.cfg       | 10 ++------
 board/orangepi/orangepi-pc2/genimage.cfg      | 10 ++------
 board/orangepi/orangepi-prime/genimage.cfg    | 10 ++------
 board/orangepi/orangepi-win/genimage.cfg      | 10 ++------
 .../orangepi/orangepi-zero-plus/genimage.cfg  | 10 ++------
 .../orangepi/orangepi-zero-plus2/genimage.cfg | 10 ++------
 board/pine64/pine64/genimage.cfg              | 10 ++------
 board/pine64/sopine/genimage.cfg              | 10 ++------
 boot/arm-trusted-firmware/Config.in           |  7 ++++++
 .../arm-trusted-firmware.mk                   |  4 ++++
 configs/amarula_a64_relic_defconfig           |  8 +++----
 configs/bananapi_m64_defconfig                | 21 ++++++++---------
 configs/friendlyarm_nanopi_a64_defconfig      | 21 ++++++++---------
 configs/friendlyarm_nanopi_neo2_defconfig     | 21 ++++++++---------
 .../friendlyarm_nanopi_neo_plus2_defconfig    | 20 ++++++++--------
 configs/olimex_a64_olinuxino_defconfig        | 21 ++++++++---------
 configs/orangepi_pc2_defconfig                | 21 ++++++++---------
 configs/orangepi_prime_defconfig              | 21 ++++++++---------
 configs/orangepi_win_defconfig                | 23 ++++++++++---------
 configs/orangepi_zero_plus2_defconfig         | 19 ++++++++-------
 configs/orangepi_zero_plus_defconfig          | 19 ++++++++-------
 configs/pine64_defconfig                      | 22 +++++++++---------
 configs/pine64_sopine_defconfig               | 21 ++++++++---------
 support/testing/tests/boot/test_atf.py        | 16 ++++++-------
 28 files changed, 168 insertions(+), 237 deletions(-)

-- 
2.31.1
