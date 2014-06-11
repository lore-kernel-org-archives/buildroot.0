From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Jun 2014 01:40:11 +0200
Subject: [Buildroot] [PATCH 4/5 RFC] package/udev: is a provider for libudev
In-Reply-To: <cover.1402529398.git.yann.morin.1998@free.fr>
References: <cover.1402529398.git.yann.morin.1998@free.fr>
Message-ID: <4fdb96551d5b735cc2c8b418917e7c8bd1208cac.1402529398.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Rather than having both eudev and systemd be providers of libudev,
any package providing a udev daemon is a provider of libudev, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/udev/Config.in | 4 ++++
 package/udev/udev.mk   | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 941a515..1aaec6f 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_HAS_UDEV
 	bool
+	select BR2_PACKAGE_HAS_LIBUDEV
 
 config BR2_PACKAGE_PROVIDES_UDEV
 	depends on BR2_PACKAGE_HAS_UDEV
 	string
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+    default "udev" if BR2_PACKAGE_HAS_UDEV
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index cc4a6e3..811951d 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,4 +4,6 @@
 #
 ################################################################################
 
+UDEV_PROVIDES = libudev
+
 $(eval $(virtual-package))
-- 
1.8.3.2
