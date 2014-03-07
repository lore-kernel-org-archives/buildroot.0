From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  7 Mar 2014 14:22:13 +0100
Subject: [Buildroot] [PATCH v3 2/3] cryptodev: convert to new virtual
	package management.
In-Reply-To: <1394198534-16379-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1394198534-16379-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1394198534-16379-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency check in 'cryptodev' has been updated to match the new
virtual package management.

Since this package is implemented via a choice rather than the usual
separate-package providers, BR2_PACKAGE_HAS_CRYPTODEV is always defined
when the 'cryptodev' package is selected.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cryptodev/Config.in    |    3 +++
 package/cryptodev/cryptodev.mk |    7 +++----
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index 11e6f48..08a6f3b 100644
--- a/package/cryptodev/cryptodev.mk
+++ b/package/cryptodev/cryptodev.mk
@@ -7,11 +7,10 @@
 CRYPTODEV_SOURCE =
 CRYPTODEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_CRYPTODEV))
 
+ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
 ifeq ($(CRYPTODEV_DEPENDENCIES),)
-define CRYPTODEV_CONFIGURE_CMDS
-	echo "No CRYPTODEV implementation defined. Configuration error"
-	exit 1
-endef
+$(error No CRYPTODEV implementation defined. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
-- 
1.7.9.5
