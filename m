From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 21:43:45 +0100
Subject: [Buildroot] [git commit] package/rtty: new package
Message-ID: <20200322203039.D5E6884AE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1b3407042d232393528858b72e3f31ead92c682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
[Thomas:
 - add entry in DEVELOPERS file
 - add -DRTTY_SSL_SUPPORT=OFF to explicitly disable SSL support
 - fix license file name in the hash file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/rtty/Config.in |  7 +++++++
 package/rtty/rtty.hash |  2 ++
 package/rtty/rtty.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aab7d4b18a..8ea08739f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1266,6 +1266,9 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Jianhui Zhao <zhaojh329@gmail.com>
+F:	package/rtty/
+
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
 F:	configs/snps_aarch64_vdk_defconfig
diff --git a/package/Config.in b/package/Config.in
index cba756d9f1..2b903140df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2280,6 +2280,7 @@ comment "Utilities"
 	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/ranger/Config.in"
+	source "package/rtty/Config.in"
 	source "package/screen/Config.in"
 	source "package/sudo/Config.in"
 	source "package/terminology/Config.in"
diff --git a/package/rtty/Config.in b/package/rtty/Config.in
new file mode 100644
index 0000000000..badb329d3e
--- /dev/null
+++ b/package/rtty/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RTTY
+	bool "rtty"
+	select BR2_PACKAGE_LIBEV
+	help
+	  Access your device's terminal from anywhere via the web.
+
+	  https://github.com/zhaojh329/rtty
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
new file mode 100644
index 0000000000..51d4b9fd32
--- /dev/null
+++ b/package/rtty/rtty.hash
@@ -0,0 +1,2 @@
+sha256  6faafe75d82edbcfe154da5f1ffc0ddfd14dd88a2315f19aeed7f2631df96f41  rtty-7.1.2.tar.gz
+sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
new file mode 100644
index 0000000000..21ba385018
--- /dev/null
+++ b/package/rtty/rtty.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# rtty
+#
+################################################################################
+
+RTTY_VERSION = 7.1.2
+RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
+RTTY_LICENSE = MIT
+RTTY_LICENSE_FILES = LICENSE
+RTTY_DEPENDENCIES = libev
+RTTY_CONF_OPTS = -DRTTY_SSL_SUPPORT=OFF
+
+$(eval $(cmake-package))
