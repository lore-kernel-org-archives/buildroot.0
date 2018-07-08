From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 systemd
Message-ID: <20180708110810.2D308863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b0e1801c860e18ae6eefc15aead9fc0ec431b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/systemd/systemd.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e504924540..9d3ea22d96 100644
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
index 04775ee778..d7031ed21d 100644
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
