From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:44:11 +0200
Subject: [Buildroot] [git commit] spidev_test: bump to version in Linux 4.10
Message-ID: <20170504204550.80EBC8285A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a497a9fd6cdb518572282b1478279f476f870fb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

spidev_test has further evolved after kernel version 3.15, which
is the most recent version that could be built in this package.
This change allows to build the latest version of spidev_test if
the toolchain's kernel header version allows it. In this way, when
building with a newer toolchain, we are able to benefit from the
added functionality offered by the newest version of the tool.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spidev_test/spidev_test.hash |  2 +-
 package/spidev_test/spidev_test.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/spidev_test/spidev_test.hash b/package/spidev_test/spidev_test.hash
index 6871288..7bc4a27 100644
--- a/package/spidev_test/spidev_test.hash
+++ b/package/spidev_test/spidev_test.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256 80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
-sha256 57fa6c534e0b7b4d234075e18bc89e2f3c9fc4ecc27e80f349a8057708e0de46  spidev_test.c?id=v3.15
+sha256 3cf76b15d9a8644f3f5cbc0387cc02a7d4a392ade39788cbc6367cce98552e2f  spidev_test.c?id=v4.10
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 50e7a30..1f34c6a 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
+# Build the latest version that is compatible with the toolchain's kernel headers
 # v3.15+ requires SPI_TX_QUAD/SPI_RX_QUAD to build
 # Normally kernel headers can't be newer than kernel so switch based on that.
 # If you need quad-pumped spi support you need to upgrade your toolchain.
+# Note that the location of spidev_test.c changes from v4.5 onwards.
+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
-SPIDEV_TEST_VERSION = v3.15
+SPIDEV_TEST_VERSION = v4.10
+SPIDEV_TEST_PATH = tools/spi
 else
 SPIDEV_TEST_VERSION = v3.0
+SPIDEV_TEST_PATH = Documentation/spi
 endif
-SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
+
+SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/$(SPIDEV_TEST_PATH)
 SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
 SPIDEV_TEST_LICENSE = GPL-2.0
 
