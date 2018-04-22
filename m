From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 14:42:06 +0200
Subject: [Buildroot] [git commit] package/pcsc-lite: bump version to 1.8.23
Message-ID: <20180422124241.8FFBF886F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52c524c73380d0a9302a42c491719e9bec0e4bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream moved to https://muscle.apdu.fr/ according to
http://pcsclite.alioth.debian.org/, updated _SITE and Config.in.

Added license hash.

Added optional systemd support available since upstream commit
https://github.com/LudovicRousseau/PCSC/commit/30e10951f81b9480e788965f89d0d4d0aee909c0#diff-67e997bcfdac55191033d57a16d1408a

We need to add systemd support in this patch because omitting it will
cause an error during configure:

checking for LIBSYSTEMD... no
configure: error: install libsystemd-dev or use --disable-libsystemd

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcsc-lite/Config.in      |  2 +-
 package/pcsc-lite/pcsc-lite.hash |  3 ++-
 package/pcsc-lite/pcsc-lite.mk   | 11 +++++++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 658ebe3068..3250a463b4 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PCSC_LITE
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
-	  http://pcsclite.alioth.debian.org/
+	  https://muscle.apdu.fr/
 
 if BR2_PACKAGE_PCSC_LITE
 
diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index efd974930d..fe5ce94696 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2 pcsc-lite-1.8.22.tar.bz2
+sha256 5a27262586eff39cfd5c19aadc8891dd71c0818d3d629539bd631b958be689c9  pcsc-lite-1.8.23.tar.bz2
+sha256 2ce8f52bc5afa74f223121955e4e6328c432b16044ea535acd550435dda2b5db  COPYING
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 15c37f9ef0..0d55d4b706 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.22
+PCSC_LITE_VERSION = 1.8.23
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
-PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/4203
+PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-3-Clause
@@ -29,6 +29,13 @@ PCSC_LITE_CONF_OPTS += --disable-libusb --disable-libudev
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PCSC_LITE_CONF_OPTS += --enable-libsystemd
+PCSC_LITE_DEPENDENCIES += systemd
+else
+PCSC_LITE_CONF_OPTS += --disable-libsystemd
+endif
+
 ifeq ($(PACKAGE_PCSC_LITE_DEBUGATR),y)
 PCSC_LITE_CONF_OPTS += --enable-debugatr
 endif
