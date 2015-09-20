From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:05:40 +0200
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version 2.4
Message-ID: <20150920130917.21D9181648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=539169dac45be1218a63d3d0cfee231b828e3b6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.4 of shairport-sync introduces new optional features (metadata,
stdout, pipe) which we enable by default. The impact on the binary size is
about 18 kB (110 kB vs 92 kB) for an ARM target.

Also add a new dependency to libconfig and install the default config script.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/Config.in         |    1 +
 package/shairport-sync/shairport-sync.mk |   11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c1d81a7..c558a64 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
 	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 881cced..dc36c0e 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,17 +4,20 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.2.4
+SHAIRPORT_SYNC_VERSION = 2.4
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
-SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libdaemon popt host-pkgconf
+SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
 
 # Touching configure.ac with the patches
 SHAIRPORT_SYNC_AUTORECONF = YES
 
-SHAIRPORT_SYNC_CONF_OPTS = --with-alsa
+SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
+	--with-metadata \
+	--with-pipe \
+	--with-stdout
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
 # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
@@ -45,6 +48,8 @@ endif
 define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/shairport-sync \
 		$(TARGET_DIR)/usr/bin/shairport-sync
+	$(INSTALL) -D -m 0644 $(@D)/scripts/shairport-sync.conf \
+		$(TARGET_DIR)/etc/shairport-sync.conf
 endef
 
 define SHAIRPORT_SYNC_INSTALL_INIT_SYSV
