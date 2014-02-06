From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu,  6 Feb 2014 23:56:57 +0100
Subject: [Buildroot] [PATCH 2/2] gpsd: disable for microblaze arch
In-Reply-To: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1391727417-12293-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gpsd will fail on an internal compiler error for the microblaze
architecture so disabling it on that architecture.

Fixes:
  http://autobuild.buildroot.org/results/42d/42da870722f24e4202d8265597771a0449e74cfd

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/gpsd/Config.in        | 2 ++
 package/sconeserver/Config.in | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5954e77..ee47836 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,12 +1,14 @@
 comment "gpsd needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_microblaze
 
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
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
-- 
1.8.3.2
