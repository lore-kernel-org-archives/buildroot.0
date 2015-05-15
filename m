From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 20:23:50 +0200
Subject: [Buildroot] [PATCH 3/6] mosquitto: disable with broken NIOS 2
	toolchains
In-Reply-To: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431714233-24324-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mosquitto triggers the infamous _gp issue with the NIOS 2 toolchains,
so let's not allow mosquitto in such situations.

Fixes:

  http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosquitto/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
2.1.0
