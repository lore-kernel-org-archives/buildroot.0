From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:49:07 +0100
Subject: [Buildroot] [git commit] gpsd: add work-around and re-enable for
	microblaze
Message-ID: <20151122125338.5F2E481DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31a0e3fa624fd1b1439fb76ad2ba724e23ec97eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix (works around) bug #6872
https://bugs.busybox.net/show_bug.cgi?id=6872

The gpsd package was disabled due to an internal compiler error for
the microblaze architecture in the following commit:
http://git.buildroot.net/buildroot/commit/?id=d517415bcda380336f4a27bf248cef4d81791c9e

The problem is due to an specific GCC optimization flag
(-fexpensive-optimizations), so disabling it we can work around this
problem and compile gpsd for the microblaze architecture.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in        |    3 ---
 package/gpsd/gpsd.mk          |    8 +++++++-
 package/sconeserver/Config.in |    2 --
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fa8b8f6..b4008eb 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,7 +1,6 @@
 comment "gpsd needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on !BR2_microblaze
 
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
@@ -10,8 +9,6 @@ config BR2_PACKAGE_GPSD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Always tries to build a shared library
 	depends on !BR2_STATIC_LIBS
-	# triggers gcc ice
-	depends on !BR2_microblaze
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 87911c3..aa35053 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -13,6 +13,7 @@ GPSD_INSTALL_STAGING = YES
 GPSD_DEPENDENCIES = host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
+GPSD_CFLAGS = $(TARGET_CFLAGS)
 
 GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
@@ -37,6 +38,11 @@ else
 GPSD_SCONS_OPTS += libgpsmm=no
 endif
 
+# prevents from triggering GCC ICE
+ifeq ($(BR2_microblaze),y)
+GPSD_CFLAGS += -fno-expensive-optimizations
+endif
+
 # Enable or disable Qt binding
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
 GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
@@ -185,7 +191,7 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
-GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)"
+GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
 
 define GPSD_BUILD_CMDS
 	(cd $(@D); \
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index f16e683..4083aa7 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -63,7 +63,6 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
 	bool "location"
 	depends on BR2_USE_MMU # gpsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
-	depends on !BR2_microblaze # gpsd
 	depends on !BR2_STATIC_LIBS # gpsd
 	select BR2_PACKAGE_GPSD
 	help
@@ -72,7 +71,6 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
 comment "location support needs a toolchain w/ theads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBRARY
-	depends on !BR2_microblaze
 
 config BR2_PACKAGE_SCONESERVER_LETTUCE
 	bool "lettuce"
