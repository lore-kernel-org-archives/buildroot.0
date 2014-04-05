From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:55 +0200
Subject: [Buildroot] [PATCH 18/21] package/cryptodev: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <d027408caf12bb750a68ad56ac8fa1e8c7987629.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since this package is implemented via a choice rather than the usual
separate-package providers, we only need BR2_PACKAGE_HAS_CRYPTODEV
to be always defined when the 'cryptodev' package is selected.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cryptodev/Config.in    |  3 +++
 package/cryptodev/cryptodev.mk | 12 +-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
index 0780cc7..2407e04 100644
--- a/package/cryptodev/Config.in
+++ b/package/cryptodev/Config.in
@@ -37,6 +37,9 @@ config BR2_PACKAGE_OCF_LINUX
 
 endchoice
 
+config BR2_PACKAGE_HAS_CRYPTODEV
+	def_bool y
+
 config BR2_PACKAGE_PROVIDES_CRYPTODEV
 	string
 	default "cryptodev-linux" if BR2_PACKAGE_CRYPTODEV_LINUX
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
index 11e6f48..969d1bd 100644
--- a/package/cryptodev/cryptodev.mk
+++ b/package/cryptodev/cryptodev.mk
@@ -4,14 +4,4 @@
 #
 ################################################################################
 
-CRYPTODEV_SOURCE =
-CRYPTODEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_CRYPTODEV))
-
-ifeq ($(CRYPTODEV_DEPENDENCIES),)
-define CRYPTODEV_CONFIGURE_CMDS
-	echo "No CRYPTODEV implementation defined. Configuration error"
-	exit 1
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
