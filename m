From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri,  2 Jul 2021 00:00:02 +0300
Subject: [Buildroot] [PATCH 0/4] stm32mp157c-dk2: non-trusted config and bsp
 updates
Message-ID: <20210701210006.1171347-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch series introduces several updates for stm32mp157c-dk2:
- update BSP: bump Linux, U-Boot, TF-A versions
- introduce basic (non-trusted) image configuration
- remove u-boot config fragment that disables watchdog

The stm32mp157c-dk2 images with updated U-Boot have an issue: they
successully boot only once. Previously I have already attempted to
fix this problem: see
https://patchwork.ozlabs.org/project/buildroot/patch/20210130204456.793098-1-geomatsi at gmail.com/

However previous root cause analysis was not correct. Saving U-Boot
environment indeed changes 'ssbl' partition checksum. But this is
not the reason of TF-A complaints. In fact U-Boot corrupts its own
image when it saves environment at the end of 'ssbl' partition.
So it is necessary to reserve space at the end of 'ssbl' partition
for both primary and redundant U-Boot environments. For this purpose
post-build script is added that appends placeholder for environment
to U-Boot image.

Regards,
Sergey


Sergey Matyukevich (4):
  configs/stm32mp157c_dk2: bump BSP versions
  stm32mp157c_dk2: add non-trusted configuration
  stm32mp157c_dk2: remove uboot config fragment
  stm32mp157c_dk2: fix U-Boot corruption on the first boot

 DEVELOPERS                                    |  4 ++-
 .../common/stm32mp157/genimage.cfg.template   |  6 ++--
 .../common/stm32mp157/post-build.sh           | 16 +++++++++
 .../common/stm32mp157/post-image.sh           | 35 +++++++++++++++----
 .../stm32mp157c-dk2/readme.txt                |  7 +++-
 .../stm32mp157c-dk2/uboot-fragment.config     |  1 -
 configs/stm32mp157c_dk2_basic_defconfig       | 28 +++++++++++++++
 ...nfig => stm32mp157c_dk2_trusted_defconfig} | 10 +++---
 8 files changed, 89 insertions(+), 18 deletions(-)
 create mode 100755 board/stmicroelectronics/common/stm32mp157/post-build.sh
 delete mode 100644 board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config
 create mode 100644 configs/stm32mp157c_dk2_basic_defconfig
 rename configs/{stm32mp157c_dk2_defconfig => stm32mp157c_dk2_trusted_defconfig} (80%)

-- 
2.32.0
