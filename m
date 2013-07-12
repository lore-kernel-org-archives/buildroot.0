From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 12 Jul 2013 09:34:36 -0500
Subject: [Buildroot] [PATCH v5 1/3] powervr: add powervr virtual package
Message-ID: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sundareson, Prabindh <prabu@ti.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Sinan Akpolat <sinan@linkas.com.tr>
---
v5:
 - Fixed build issues on hard float (and non-CS toolchains)
 - added powervr virtual package
v4:
 - Fix header issue with qt.
 - Add eglimage version installation.
v3:
 - integrate reviews from thomas.
 - Add qt patch
v2:
 - Take into account reviews.
 - Simplfy init script.
 - Fix header installation.
v1:
 - Added .pc files
 - all review issues addressed
RFC v3:
 - all reviews addressed
 - added demos
 - added hard float (not runtime tested)
 - added init script
 - added SGX detection script (untested)
 - tested on beaglexm using demos
RFC v2:
 - basic working with minor issues during tests
RFC v1:
 - inital revision
---
 package/Config.in          |  1 +
 package/powervr/Config.in  |  2 ++
 package/powervr/powervr.mk | 20 ++++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/powervr/Config.in
 create mode 100644 package/powervr/powervr.mk

diff --git a/package/Config.in b/package/Config.in
index 7c24dab..6909142 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -469,6 +469,7 @@ source "package/opengl/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/poppler/Config.in"
+source "package/powervr/Config.in"
 source "package/tiff/Config.in"
 source "package/wayland/Config.in"
 source "package/webkit/Config.in"
diff --git a/package/powervr/Config.in b/package/powervr/Config.in
new file mode 100644
index 0000000..d09ce74
--- /dev/null
+++ b/package/powervr/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HAS_POWERVR
+	bool
diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
new file mode 100644
index 0000000..c6dd968
--- /dev/null
+++ b/package/powervr/powervr.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# Virtual package for PowerVR driver 
+#
+################################################################################
+
+POWERVR_SOURCE =
+
+ifeq ($(BR2_PACKAGE_TI_GFX),y)
+POWERVR_DEPENDENCIES += ti-gfx
+endif
+
+ifeq ($(POWERVR_DEPENDENCIES),)
+define POWERVR_CONFIGURE_CMDS
+	echo "No PowerVR implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
-- 
1.8.1.2
