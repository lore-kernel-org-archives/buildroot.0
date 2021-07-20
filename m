From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:24:18 +0200
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: new package
Message-ID: <20210720195021.60B1385F3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=b4c76008fcbb7a183e19d6c6fe06f28e63b64cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add rtl8812au-aircrack-ng (alternative to rtl8821au), recommended
e.g. for Alfa cards ([1]) and as opposed to rtl8821au does not crash
in case of configured for IBSS mode and supports iw set freq command in
monitor mode.

[1] https://docs.alfa.com.tw/Support/Linux/RTL8811AU

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/rtl8812au-aircrack-ng/Config.in                | 10 ++++++++++
 .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash   |  3 +++
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 18 ++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c519a6cfbb..65ab98351e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2156,6 +2156,7 @@ F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
 F:	package/redir/
+F:	package/rtl8812au-aircrack-ng/
 F:	package/uredir/
 F:	package/wayland-utils/
 
diff --git a/package/Config.in b/package/Config.in
index e883cf3780..de9378e11c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -549,6 +549,7 @@ endmenu
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
+	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8812au-aircrack-ng/Config.in b/package/rtl8812au-aircrack-ng/Config.in
new file mode 100644
index 0000000000..70cbd15221
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/Config.in
@@ -0,0 +1,10 @@
+comment "rtl8812au-aircrack-ng needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
+	bool "rtl8812au-aircrack-ng"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8812au wifi driver (aircrack-ng repository)
+
+	  https://github.com/aircrack-ng/rtl8812au
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
new file mode 100644
index 0000000000..5503b4f22e
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2c5d8286a00273343fc10d0e16afc52e788ac73b7df57c8159e58a40707f61da  rtl8812au-aircrack-ng-b8167e66b4ac046b3b76c2c40008d84528e91594.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
new file mode 100644
index 0000000000..d42d953496
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# rtl8812au-aircrack-ng
+#
+################################################################################
+
+RTL8812AU_AIRCRACK_NG_VERSION = b8167e66b4ac046b3b76c2c40008d84528e91594
+RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
+RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
+RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
+
+RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
+	CONFIG_88XXAU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
