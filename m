From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] imx-kobs: bump version to 5.4
Message-ID: <20160615204852.0E93780809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3fdb61486903b8d7aff234d2ad9342cdd7ddd02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Check raw mode flag for backward compatbility
- Fix membership name in bch geometry structure.
- Fix the previous implementation that may ruin the BBM
- Adapt raw page accesses to match the new raw_read/write implementation

The old raw access implementation (in GPMI driver) was considering that
data and OOB data were separated in their respective regions (the data
area and the OOB area of the page), which is not true.
They are actually interleaved this way:

METADATA + ((DATA + ECCBYTES) * N)

The new raw access implementation (in the GPMI driver) is hiding this
weird
layout to MTD users by exposing a more common layout:

DATA + METADATA + (N * ECCBYTES)

Here METADATA + (N * ECCBYTES) are exposed as if they were stored in the
OOB area.

Unfortunately kobs-ng rely on this weird layout when accessing the NAND
in raw mode.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/a7545b1

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 3 +--
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 09d42ed..b942bd3 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1,2 +1 @@
-# locally computed
-sha256	45f729fc2b49556f1ca9df778f52bf5cc749cfe53664c8206daab29991c5f6c1  imx-kobs-5.3.tar.gz
+sha256	85171b46068ac47c42fedb8104167bf9afd33dd9527ed127e1ca2eb29d7a86bf  imx-kobs-5.4.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index cc4721f..b80d5bd 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = 5.3
+IMX_KOBS_VERSION = 5.4
 IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
 IMX_KOBS_LICENSE = GPLv2+
 IMX_KOBS_LICENSE_FILES = COPYING
