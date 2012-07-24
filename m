From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 18:32:11 +0200
Subject: [Buildroot] [git commit branch/next] gpsd: disallow profiling
	support with uClibc toolchain
Message-ID: <20120802195300.5A6B796CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23c9aeccde52d30c26d92866be0b094793aba712
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The following problem was reported by Thomas Petazzoni.

If BR2_PACKAGE_GPSD_PROFILING is enabled with a uClibc-based toolchain, then
gpsd fails to build. See the following for details.

  http://autobuild.buildroot.org/results/be707893f4bf0e7e964d183e4a655c5bb72d1889/build-end.log
  http://autobuild.buildroot.org/results/be707893f4bf0e7e964d183e4a655c5bb72d1889/defconfig.

The issue is that uClibc lacks the necessary infrastructure to support
profiling. This patch disallows selection of the gpsd profiling feature when
a uClibc-based toolchain is selected.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
