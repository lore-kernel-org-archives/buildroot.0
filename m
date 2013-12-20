From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:27:59 +0100
Subject: [Buildroot] [PATCH 7/7] package/cryptodev: switch to
	package-defined providers
In-Reply-To: <cover.1387578401.git.yann.morin.1998@free.fr>
References: <cover.1387578401.git.yann.morin.1998@free.fr>
Message-ID: <de12afe6412691eab4a049309636aa6bd627dd60.1387578401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cryptodev/Config.in    | 5 +++++
 package/cryptodev/cryptodev.mk | 9 +--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
index d7b7754..0780cc7 100644
--- a/package/cryptodev/Config.in
+++ b/package/cryptodev/Config.in
@@ -37,4 +37,9 @@ config BR2_PACKAGE_OCF_LINUX
 
 endchoice
 
+config BR2_PACKAGE_PROVIDES_CRYPTODEV
+	string
+	default "cryptodev-linux" if BR2_PACKAGE_CRYPTODEV_LINUX
+	default "ocf-linux"       if BR2_PACKAGE_OCF_LINUX
+
 endif
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
index ad5adf0..11e6f48 100644
--- a/package/cryptodev/cryptodev.mk
+++ b/package/cryptodev/cryptodev.mk
@@ -5,14 +5,7 @@
 ################################################################################
 
 CRYPTODEV_SOURCE =
-
-ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-CRYPTODEV_DEPENDENCIES += cryptodev-linux
-endif
-
-ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-CRYPTODEV_DEPENDENCIES += ocf-linux
-endif
+CRYPTODEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_CRYPTODEV))
 
 ifeq ($(CRYPTODEV_DEPENDENCIES),)
 define CRYPTODEV_CONFIGURE_CMDS
-- 
1.8.1.2
