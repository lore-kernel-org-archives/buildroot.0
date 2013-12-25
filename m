From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:21:55 +0100
Subject: [Buildroot] [git commit] package/cryptodev: switch to
	package-defined providers
Message-ID: <20131225172209.4488E9C14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=569b842985713d02f34367621ed7a6b6e5efdf73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptodev/Config.in    |    5 +++++
 package/cryptodev/cryptodev.mk |    9 +--------
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
