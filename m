From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:28:28 +0200
Subject: [Buildroot] [git commit] package/gli: new package
Message-ID: <20190411163700.C96FB8D411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=621433f98129b50e86c1bb8643837c6e1d5f00f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for Kodi 18.x-compatible version of kodi-screensaver-rsxs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/gli/Config.in | 10 ++++++++++
 package/gli/gli.hash  |  3 +++
 package/gli/gli.mk    | 17 +++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98d3a1db94..e2ee7cbf69 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -295,6 +295,7 @@ F:	package/freeswitch/
 F:	package/freeswitch-mod-bcg729/
 F:	package/ghostscript/
 F:	package/giflib/
+F:	package/gli/
 F:	package/glmark2/
 F:	package/hdparm/
 F:	package/jsoncpp/
diff --git a/package/Config.in b/package/Config.in
index 5f14a66b3c..eed842c67a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1657,6 +1657,7 @@ menu "Other"
 	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
+	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
diff --git a/package/gli/Config.in b/package/gli/Config.in
new file mode 100644
index 0000000000..da7ce28ba1
--- /dev/null
+++ b/package/gli/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GLI
+	bool "gli"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  OpenGL Image (GLI)
+
+	  http://gli.g-truc.net
+
+comment "gli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gli/gli.hash b/package/gli/gli.hash
new file mode 100644
index 0000000000..177358a758
--- /dev/null
+++ b/package/gli/gli.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 9374f3cf6441dac0154f7e5ae9ad9ae99f4c4a36f8eb6de23f54a1996b9f2769  gli-559cbe1ec38878e182507d331e0780fbae5baf15.tar.gz
+sha256 e26459f62353e631d18379668c82b85f9fd2fd993f2818277e4fce21e957f87a  manual.md
diff --git a/package/gli/gli.mk b/package/gli/gli.mk
new file mode 100644
index 0000000000..6a332d0e08
--- /dev/null
+++ b/package/gli/gli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# gli
+#
+################################################################################
+
+GLI_VERSION = 559cbe1ec38878e182507d331e0780fbae5baf15
+GLI_SITE = $(call github,g-truc,gli,$(GLI_VERSION))
+GLI_LICENSE = MIT
+GLI_LICENSE_FILES = manual.md
+
+# GLI is a header-only library, it only makes sense
+# to have it installed into the staging directory.
+GLI_INSTALL_STAGING = YES
+GLI_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
