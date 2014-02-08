From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:53:41 +0100
Subject: [Buildroot] [git commit] gpsd: disable for microblaze arch
Message-ID: <20140208215953.2C5619C81A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d517415bcda380336f4a27bf248cef4d81791c9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gpsd will fail on an internal compiler error for the microblaze
architecture so disabling it on that architecture.

Fixes:
  http://autobuild.buildroot.org/results/42d/42da870722f24e4202d8265597771a0449e74cfd

[Peter: add comment explaining why]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in        |    3 +++
 package/sconeserver/Config.in |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5954e77..00a8a13 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,12 +1,15 @@
 comment "gpsd needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_microblaze
 
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# triggers gcc ice
+	depends on !BR2_microblaze
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 1dc41d2..ccb9c00 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -67,6 +67,7 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
 	bool "location"
 	depends on BR2_USE_MMU # gpsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
+	depends on !BR2_microblaze # gpsd
 	select BR2_PACKAGE_GPSD
 	help
 	  Location module for Sconeserver
