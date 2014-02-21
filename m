From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Feb 2014 12:13:06 +0100
Subject: [Buildroot] [PATCH] gpsd: disallow NMEA2000 CAN driver on AVR32
Message-ID: <1392981186-16080-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AVR32 is using uClibc 0.9.31, which lacks some CAN related definitions
that prevent the gpsd nmea2000 driver from building.

The rest of gpsd, with all options and drivers enabled, builds fine on
AVR32.

Fixes:

  http://autobuild.buildroot.org/results/ee2/ee2ec848e893f08fa80caf99a67e68b73b6400e8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 00a8a13..fbbf7a9 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -174,6 +174,9 @@ config BR2_PACKAGE_GPSD_NMEA2000
 	bool "NMEA2000"
 	select BR2_PACKAGE_GPSD_NAVCOM
 	select BR2_PACKAGE_GPSD_AIVDM
+	# uClibc 0.9.31, used on AVR32, does not have the necessary
+	# CAN definitions.
+	depends on !BR2_avr32
 	help
 	  NMEA2000/CAN support
 
-- 
1.8.3.2
