From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:13:58 +0200
Subject: [Buildroot] [git commit] mosquitto: disable with broken NIOS 2
	toolchains
Message-ID: <20150516131759.D15B681768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=749dcfe8a89e7082f51670567510adccd326aba3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mosquitto triggers the infamous _gp issue with the NIOS 2 toolchains,
so let's not allow mosquitto in such situations.

Fixes:

  http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 50937d0..4053c62 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # builds .so
+	# Triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	help
 	  Mosquitto is an open source message broker that implements
 	  the MQ Telemetry Transport protocol versions 3.1 and
@@ -16,3 +19,5 @@ config BR2_PACKAGE_MOSQUITTO
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
