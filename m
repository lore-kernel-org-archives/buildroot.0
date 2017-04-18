From: Joeri Barbarien <joeri.barbarien@gmail.com>
Date: Tue, 18 Apr 2017 17:09:38 +0200
Subject: [Buildroot] [PATCH 1/1] spidev_test: Select version based on
	toolchain
Message-ID: <20170418150938.14088-1-joeri.barbarien@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

spidev_test has further evolved after kernel version 3.15, which
is the most recent version that could be built in this package.
This change allows to build the version of spidev_test corresponding
to the toolchain's kernel header version. In this way, when building with
a newer toolchain, we are able to benefit from the added functionality
offered by newer versions of the tool.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
---
 package/spidev_test/spidev_test.hash |  3 +++
 package/spidev_test/spidev_test.mk   | 27 ++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/spidev_test/spidev_test.hash b/package/spidev_test/spidev_test.hash
index 6871288..ab91a93 100644
--- a/package/spidev_test/spidev_test.hash
+++ b/package/spidev_test/spidev_test.hash
@@ -1,3 +1,6 @@
 # Locally calculated
 sha256 80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
 sha256 57fa6c534e0b7b4d234075e18bc89e2f3c9fc4ecc27e80f349a8057708e0de46  spidev_test.c?id=v3.15
+sha256 7af6f126248a479985a7e67238ed477c1dc20fab1453fab2f4a7e0db79d219c2  spidev_test.c?id=v4.1
+sha256 94ec2ef4c7977f82aed43952ec6f5dfe472d879590ada8707bf841c24af8cc68  spidev_test.c?id=v4.5
+sha256 b5918394f79f6ff3ceed20de063a6f7c49e20aee0d7bd91ec73c9e1ce9e4269a  spidev_test.c?id=v4.9
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 50e7a30..33bca74 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -7,12 +7,37 @@
 # v3.15+ requires SPI_TX_QUAD/SPI_RX_QUAD to build
 # Normally kernel headers can't be newer than kernel so switch based on that.
 # If you need quad-pumped spi support you need to upgrade your toolchain.
+
+
+# Build the version corresponding to the toolchain kernel headers version.
+# Note that the contents of spidev_test.c does not change between the
+# versions referenced below.
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9),y)
+SPIDEV_TEST_VERSION = v4.9
+else
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5),y)
+SPIDEV_TEST_VERSION = v4.5
+else
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1),y)
+SPIDEV_TEST_VERSION = v4.1
+else
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
 SPIDEV_TEST_VERSION = v3.15
 else
 SPIDEV_TEST_VERSION = v3.0
 endif
-SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
+endif
+endif
+endif
+
+# Location of spidev_test.c changes from v4.5 onwards.
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5),y)
+SPIDEV_TEST_PATH=tools/spi
+else
+SPIDEV_TEST_PATH=Documentation/spi
+endif
+
+SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/$(SPIDEV_TEST_PATH)
 SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
 SPIDEV_TEST_LICENSE = GPL-2.0
 
-- 
2.9.3
