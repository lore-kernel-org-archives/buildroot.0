From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Thu, 12 Apr 2018 15:18:51 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: new package
Message-ID: <1523539131-9053-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pixie WPS is a C based tool to audit networks
against so called "Pixie Dust" attacks.

Generic C package, easy to cross-compile,
build tests passed for the 7 default toolchains.

Sorry my previous submission was somehow corrupted.
Tested on RPI1 & RPI3.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pixiewps/Config.in     |  7 +++++++
 package/pixiewps/pixiewps.hash |  3 +++
 package/pixiewps/pixiewps.mk   | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/pixiewps/Config.in
 create mode 100644 package/pixiewps/pixiewps.hash
 create mode 100644 package/pixiewps/pixiewps.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 00cbaef..054ed09 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -794,6 +794,7 @@ F:	package/sdl2/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
+F:	package/pixiewps/
 
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
diff --git a/package/Config.in b/package/Config.in
index e48d0b4..132372c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1809,6 +1809,7 @@ endif
 	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
+	source "package/pixiewps/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/pixiewps/Config.in b/package/pixiewps/Config.in
new file mode 100644
index 0000000..d0b9b99
--- /dev/null
+++ b/package/pixiewps/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PIXIEWPS
+	bool "pixiewps"
+	help
+	  Pixie WPS is a C based tool to audit networks
+	  against the so called "Pixie Dust" attack.
+
+	  https://github.com/wiire-a/pixiewps/wiki
diff --git a/package/pixiewps/pixiewps.hash b/package/pixiewps/pixiewps.hash
new file mode 100644
index 0000000..bb56630
--- /dev/null
+++ b/package/pixiewps/pixiewps.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 d3d3cf57851e3e734fb1797aa078239ef161d1cbeffc4438497d58a425ef22a2  pixiewps-9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59.tar.gz
+sha256 ccb349b4132ed7737f25e5adebfe61f3d52dca33708df1e50352320438d1d4c2  LICENSE.md
diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
new file mode 100644
index 0000000..746fa71
--- /dev/null
+++ b/package/pixiewps/pixiewps.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# pixiewps
+#
+################################################################################
+
+PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
+PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
+PIXIEWPS_LICENSE = GPL-2.0+
+PIXIEWPS_LICENSE_FILES = LICENSE.md
+
+define PIXIEWPS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+define PIXIEWPS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		prefix=/usr -C $(@D)/$(PIXIEWPS_SUBDIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
