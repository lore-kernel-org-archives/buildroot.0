From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 16:11:53 +0100
Subject: [Buildroot] [git commit] package/hostapd: use correct include path
	for libnl-3.0
Message-ID: <20141220151204.1E23A7FA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e787c333e4649d28dc9c00f9b87fb39b4892bcd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependancy on host-pkgconf.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reported-by: J??rg Krause <jkrause@posteo.de>
Cc: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-use-correct-include-path-for-libnl-3.0.patch |   26 ++++++++++++++++++++
 package/hostapd/hostapd.mk                         |    2 +-
 2 files changed, 27 insertions(+), 1 deletions(-)

diff --git a/package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch b/package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch
new file mode 100644
index 0000000..6ed0eed
--- /dev/null
+++ b/package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch
@@ -0,0 +1,26 @@
+From 4426de35f0e5dd5b0152474ce6a885b73de60656 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 16 Dec 2014 23:50:33 +0100
+Subject: [PATCH 2/2] use correct include path for libnl-3.0
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/drivers/drivers.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
+index cdb913e..e9fc83c 100644
+--- a/src/drivers/drivers.mak
++++ b/src/drivers/drivers.mak
+@@ -35,7 +35,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20 `pkg-config --cflags libnl-3.0`
+ ifdef CONFIG_LIBNL3_ROUTE
+   DRV_LIBS += -lnl-route-3
+   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
+-- 
+1.9.3
+
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index d4a5304..72305fa 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -8,7 +8,7 @@ HOSTAPD_VERSION = 2.3
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
-HOSTAPD_DEPENDENCIES = libnl
+HOSTAPD_DEPENDENCIES = host-pkgconf libnl
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 HOSTAPD_LICENSE = GPLv2/BSD-3c
 HOSTAPD_LICENSE_FILES = README
