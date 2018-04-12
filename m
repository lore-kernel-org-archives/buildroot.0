From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:40:23 +0200
Subject: [Buildroot] [git commit] pixiewps: new package
Message-ID: <20180412214043.C1A5F885C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af4361a67a4031d0729e87840988d374fcd35856
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pixie WPS is a C based tool to audit networks against so called "Pixie
Dust" attacks.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Thomas:
 - fix license, it's GPL-3.0+
 - use PREFIX= instead of prefix= to actually have an effect, and
   install in /usr and not /usr/local
 - remove reference to PIXIEWPS_SUBDIR, which was never defined, and
   was not needed anyway]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pixiewps/Config.in     |  7 +++++++
 package/pixiewps/pixiewps.hash |  3 +++
 package/pixiewps/pixiewps.mk   | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f52cb884db..05693d3024 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -794,6 +794,7 @@ F:	package/sdl2/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
+F:	package/pixiewps/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index 2da86057fd..ddbbcff9d8 100644
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
index 0000000000..97240f5c87
--- /dev/null
+++ b/package/pixiewps/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PIXIEWPS
+	bool "pixiewps"
+	help
+	  Pixie WPS is a C based tool to audit networks against the so
+	  called "Pixie Dust" attack.
+
+	  https://github.com/wiire-a/pixiewps/wiki
diff --git a/package/pixiewps/pixiewps.hash b/package/pixiewps/pixiewps.hash
new file mode 100644
index 0000000000..bb56630388
--- /dev/null
+++ b/package/pixiewps/pixiewps.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 d3d3cf57851e3e734fb1797aa078239ef161d1cbeffc4438497d58a425ef22a2  pixiewps-9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59.tar.gz
+sha256 ccb349b4132ed7737f25e5adebfe61f3d52dca33708df1e50352320438d1d4c2  LICENSE.md
diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
new file mode 100644
index 0000000000..95a253ab83
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
+PIXIEWPS_LICENSE = GPL-3.0+
+PIXIEWPS_LICENSE_FILES = LICENSE.md
+
+define PIXIEWPS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+define PIXIEWPS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr -C $(@D) install
+endef
+
+$(eval $(generic-package))
