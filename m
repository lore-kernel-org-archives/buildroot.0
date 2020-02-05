From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  5 Feb 2020 12:26:08 -0600
Subject: [Buildroot] [PATCH] package/rng-tools: make jitterentropy
 conditional
Message-ID: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The update of rng-tools from 5 to 6.7 introduced a change where
the jitterentropy library was enabled by default instead of
returning a special 66 return code to hangle the case of no
hwrng. This patch reverts that change and allows a user to
select when to enable the jitterentropy source. The bug
documents an issue of when a hwrng is enabled with jitterentropy
there is a longer boot time.

Fixes:
https://bugs.busybox.net/show_bug.cgi?id=12511

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rng-tools/Config.in    | 1 -
 package/rng-tools/rng-tools.mk | 9 ++++++++-
 package/rng-tools/rngd.service | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 71514260e6..ddcc221d06 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_RNG_TOOLS
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	# For rdrand & darn ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64 || BR2_powerpc64le
 	select BR2_PACKAGE_LIBSYSFS
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 274079044c..e458fbb8eb 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -8,7 +8,7 @@ RNG_TOOLS_VERSION = 6.8
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf
+RNG_TOOLS_DEPENDENCIES = libsysfs host-pkgconf
 # From git
 RNG_TOOLS_AUTORECONF = YES
 
@@ -29,6 +29,13 @@ else
 RNG_TOOLS_CONF_OPTS += --without-libgcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_JITTERENTROPY_LIBRARY),y)
+RNG_TOOLS_DEPENDENCIES += jitterentropy-library
+RNG_TOOLS_CONF_OPTS += --enable-jitterentropy
+else
+RNG_TOOLS_CONF_OPTS += --disable-jitterentropy
+endif
+
 define RNG_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/rng-tools/S21rngd \
 		$(TARGET_DIR)/etc/init.d/S21rngd
diff --git a/package/rng-tools/rngd.service b/package/rng-tools/rngd.service
index 11386d1e5d..c0bcffe59e 100644
--- a/package/rng-tools/rngd.service
+++ b/package/rng-tools/rngd.service
@@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
 
 [Service]
 ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
+SuccessExitStatus=66
 EnvironmentFile=-/etc/default/rngd
 
 [Install]
-- 
2.17.1
