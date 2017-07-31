From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:46:28 +0200
Subject: [Buildroot] [git commit] package/snappy: bump version,
	switch to cmake
Message-ID: <20170731184524.3891D7F90E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d26282b3aa14cb46d378857200e74204c5ce912c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream switched to CMake, host-pkgconf is not needed anymore.

Instead of using the latest release 1.1.6 we use current git HEAD
because it contains important patches:

"Support both static and shared library CMake builds."
https://github.com/google/snappy/commit/c756f7f5d90ad7591d4f96bb0da8159634943359

"Redo CMake configuration", this commit allows to disable building
Snappy's own tests.
https://github.com/google/snappy/commit/be6dc3db83c4701e3e79694dcbfd1c3da03b91dd

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snappy/snappy.hash |  2 +-
 package/snappy/snappy.mk   | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index bb7f104..71a2500 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f50719c6dc7103d65df66882a3b4569d598eda251266463eca716928187dc12b  snappy-32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda.tar.gz
+sha256 e701cd80f1154d648c762c86140ad6873a5c9b09ed1d754e3157be8193d2c39e  snappy-be6dc3db83c4701e3e79694dcbfd1c3da03b91dd.tar.gz
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 8105559..f5df6bf 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,17 +4,12 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda
+SNAPPY_VERSION = be6dc3db83c4701e3e79694dcbfd1c3da03b91dd
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-# from git
-SNAPPY_AUTORECONF = YES
-SNAPPY_DEPENDENCIES = host-pkgconf
 SNAPPY_INSTALL_STAGING = YES
-
-# Disable tests
-SNAPPY_CONF_OPTS = --disable-gtest
+SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
 
 # libsnappy links with libstdc++. Some libstdc++/arch variants use
 # pthread symbols for internal locking if built with thread
@@ -25,4 +20,4 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 SNAPPY_CONF_OPTS += LIBS=-pthread
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
