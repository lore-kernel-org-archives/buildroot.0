From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Nov 2012 10:16:23 -0800
Subject: [Buildroot] [git commit] lcdproc: fix autobuild errors
Message-ID: <20121126181913.0B857971BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bdbe9abb90de0262832d5d545f239fa41fb0e91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autobuilders are falling over building lcdproc, with failures like the
following.

  http://autobuild.buildroot.net/results/622b7da10be751c725ba25eb40102269790b4b03/build-end.log

As Thomas Petazzoni has pointed out, the compile command lines incorrectly
contain host header and library search paths, such as the following.

  -I/home/peko/scratch/host/usr/include/freetype2
  -L/home/peko/scratch/host/usr/lib -lfreetype

This patch changes the lcdproc package to pass the freetype installation
prefixes on the configure command line.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lcdproc/lcdproc.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 2a80289..fe88f46 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -10,7 +10,9 @@ LCDPROC_LICENSE = GPLv2+
 LCDPROC_LICENSE_FILES = COPYING
 LCDPROC_MAKE = $(MAKE1)
 
-LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
+LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS) \
+	--with-ft-prefix="$(STAGING_DIR)/usr" \
+	--with-ft-exec-prefix="$(STAGING_DIR)/usr"
 
 ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
 LCDPROC_CONF_OPT += --enable-lcdproc-menus
