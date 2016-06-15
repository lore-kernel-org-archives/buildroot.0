From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:21:33 +0200
Subject: [Buildroot] [git commit] package/systemd: Optionally disable hwdb
Message-ID: <20160615212138.9CBBD80AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42f9d9e37b8e9195e29754e383960886a9460f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default hwdb files are installed in /usr/lib/udev/hwdb.d
Currently they take about ~5MB. After first boot, systemd-hwdb tool
parses them and creates a binary in /etc/udev/hwdb.bin, which takes
another ~6.5MB.

In case of initramfs images, hwdb parsing is done every boot. This adds
about 2-3 seconds to boot time in case of rootfs on SDHC class 10
card (benchmarked with am335x board). NAND boot takes even longer.

Add config option to disable hwdb in systemd, for smaller images and
better boot performance.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 97d48c4..324e884 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -84,6 +84,17 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
+config BR2_PACKAGE_SYSTEMD_HWDB
+	bool "enable hwdb installation"
+	default y
+	help
+	  Enables hardware database installation to /usr/lib/udev/hwdb.d
+
+	  Disabling this option improves first boot time (or every boot
+	  time in case of initramfs images) and saves several MB space.
+
+	  https://www.freedesktop.org/software/systemd/man/hwdb.html
+
 config BR2_PACKAGE_SYSTEMD_BINFMT
 	bool "enable binfmt tool"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b525397..c0503ae 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -129,6 +129,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-microhttpd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
+SYSTEMD_CONF_OPTS += --enable-hwdb
+else
+SYSTEMD_CONF_OPTS += --disable-hwdb
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_BINFMT),y)
 SYSTEMD_CONF_OPTS += --enable-binfmt
 else
