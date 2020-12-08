From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  8 Dec 2020 15:53:38 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: add jitterentropy library
 option
Message-ID: <20201208145338.29199-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add a menu entry to enable/disable jitterentropy library. Make it
enabled by default to preserve the old behavior.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/rng-tools/Config.in    | 12 +++++++++++-
 package/rng-tools/rng-tools.mk |  9 ++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 25b41f40d6..67e3d4185b 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RNG_TOOLS
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -13,6 +12,17 @@ config BR2_PACKAGE_RNG_TOOLS
 
 if BR2_PACKAGE_RNG_TOOLS
 
+config BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY
+	bool "Jitterentropy Library support"
+	default y
+	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
+	help
+	  Enable Jitterentropy Library support.
+
+	  The Jitter RNG provides a noise source using the CPU
+	  execution timing jitter. It does not depend on any
+	  system resource other than a high-resolution time stamp.
+
 config BR2_PACKAGE_RNG_TOOLS_NISTBEACON
 	bool "NIST Entropy Beacon support"
 	select BR2_PACKAGE_JANSSON
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 3baddb98ee..8a971de5e9 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -8,7 +8,7 @@ RNG_TOOLS_VERSION = 6.10
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf openssl
+RNG_TOOLS_DEPENDENCIES = libsysfs host-pkgconf openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
 
@@ -28,6 +28,13 @@ else
 RNG_TOOLS_CONF_OPTS += --without-rtlsdr
 endif
 
+ifeq ($(BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY),y)
+RNG_TOOLS_DEPENDENCIES += jitterentropy-library
+RNG_TOOLS_CONF_OPTS += --enable-jitterentropy
+else
+RNG_TOOLS_CONF_OPTS += --disable-jitterentropy
+endif
+
 ifeq ($(BR2_PACKAGE_RNG_TOOLS_NISTBEACON),y)
 RNG_TOOLS_DEPENDENCIES += jansson libcurl libxml2
 RNG_TOOLS_CONF_OPTS += --with-nistbeacon
-- 
2.17.0
