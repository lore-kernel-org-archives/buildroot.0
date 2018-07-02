From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:46 +0200
Subject: [Buildroot] [PATCH 12/50] package/busybox: invert dependency with
 systemd
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <bf058f6f4a5afd4cb83c663e6248c3a6d71ad860.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/systemd/systemd.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2e80c5fa14..94842b35da 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
 	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
 	$(if $(BR2_PACKAGE_TAR),tar) \
 	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 10e11a9277..127e6dd9d2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -18,12 +18,6 @@ SYSTEMD_DEPENDENCIES = \
 
 SYSTEMD_PROVIDES = udev
 
-# Make sure that systemd will always be built after busybox so that we have
-# a consistent init setup between two builds
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSTEMD_DEPENDENCIES += busybox
-endif
-
 SYSTEMD_CONF_OPTS += \
 	-Drootlibdir='/usr/lib' \
 	-Dblkid=true \
-- 
2.14.1
