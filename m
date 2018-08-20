From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:00 +0200
Subject: [Buildroot] [[PATCH v2 00/14] various improvements to package/mender
Message-ID: <20180820130914.22377-1-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series brings some improvements to the Mender package. So
far the Mender client binary was compiled properly but it was lacking some
configuration files to function properly, which this series hope to adress.

The Mender client is only part one part of integrating Mender and the other
parts (in short) are (generic & board specific):

Generic:
- eMMC disk image with correct partition layout (A & B rootfs + data part)
    - But this is board specific in Buildroot?
- Mender artifact images (mender-artifact host tool)

Board specific:
- U-boot patches
    - bootcmd, altbootcmd, BOOTCOUNT_LIMIT, BOOTCOUNT_ENV
    - persistante storage of ENV
    - redundant ENV
- fw_printenv/fw_setenv configuration file

But above are not covered in this series and will be handled separately.

This series has been tested on a custom ATSAMA5D27 based board.

Previous revisions of this series can be found here:

    http://lists.busybox.net/pipermail/buildroot/2018-August/227822.html

Changes in v2:

- Split up patches in more logical changes and the order them accordingly
  - PATCH 1-5 - "Fixes" to make the mender client work, and work being defined
    as the mender.service will start without errors.
  - PATCH 6-12 - Clean-ups and improvements
  - PATCH 13-14 - RFC status

Mirza Krak (14):
  package/mender: fix install path for identity and inventory scripts
  package/mender: provide sane values in mender.conf
  package/mender: create directory structures required by the Mender
    client
  package/mender: create directory containing Mender state script
  package/mender: symlink /var/lib/mender -> /data/mender
  package/mender: select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
  package/mender: select BR2_PACKAGE_CA_CERTIFICATES
  package/mender: remove tenant.conf
  package/mender: use inventory and identity script from upstream source
  package/mender: update legal info
  package/mender: set version in go linker
  package/mender: use MENDER_PKGDIR to access local files
  package/mender: add BR2_PACKAGE_MENDER_ARTIFACT_NAME option
  package/mender: add BR2_PACKAGE_MENDER_DEVICE_TYPE option

 package/mender/Config.in                 | 27 ++++++++++++
 package/mender/mender-device-identity    | 52 -----------------------
 package/mender/mender-inventory-hostinfo | 21 ----------
 package/mender/mender-inventory-network  | 47 ---------------------
 package/mender/mender.conf               | 20 ++++-----
 package/mender/mender.hash               | 39 ++++++++++++++++++
 package/mender/mender.mk                 | 71 +++++++++++++++++++++++++++-----
 package/mender/mender.service            |  1 -
 package/mender/tenant.conf               |  0
 9 files changed, 134 insertions(+), 144 deletions(-)
 delete mode 100644 package/mender/mender-device-identity
 delete mode 100644 package/mender/mender-inventory-hostinfo
 delete mode 100644 package/mender/mender-inventory-network
 delete mode 100644 package/mender/tenant.conf

--
2.11.0
