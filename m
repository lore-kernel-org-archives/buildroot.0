From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 24 Jul 2012 13:34:32 +0100
Subject: [Buildroot] [PATCH v2] gpsd: disallow profiling support with uClibc
	toolchain
Message-ID: <1343133272-3099-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The following problem was reported by Thomas Petazzoni.

If BR2_PACKAGE_GPSD_PROFILING is enabled with a uClibc-based toolchain, then
gpsd fails to build. See the following for details.

  http://autobuild.buildroot.org/results/be707893f4bf0e7e964d183e4a655c5bb72d1889/build-end.log
  http://autobuild.buildroot.org/results/be707893f4bf0e7e964d183e4a655c5bb72d1889/defconfig.

The issue is that uClibc lacks the necessary infrastructure to support
profiling. This patch disallows selection of the gpsd profiling feature when
a uClibc-based toolchain is selected.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Correct logic to handle all uClibc-based toolchains.

 package/gpsd/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 18e21e5..db6bec2 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -31,6 +31,10 @@ config BR2_PACKAGE_GPSD_OLDSTYLE
 
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
+	depends on !BR2_TOOLCHAIN_BUILDROOT && !BR2_TOOLCHAIN_CTNG_uClibc && !BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+
+comment "profiling support not available with uClibc-based toolchain"
+	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_CTNG_uClibc || BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 
 config BR2_PACKAGE_GPSD_NTP_SHM
 	bool "NTP time hinting support"
-- 
1.7.9.5
