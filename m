From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:43:02 +0200
Subject: [Buildroot] [git commit] package/kodi-inputstream-rtmp: new package
Message-ID: <20170722203912.E4173818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c894267a627981dd01a7be18a8ca4bc8aacd0f06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the new package by the legacy option for easier update.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: use SPDX license code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                         |  1 +
 package/kodi-inputstream-rtmp/Config.in                  |  7 +++++++
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash |  2 ++
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 13 +++++++++++++
 package/kodi/Config.in                                   |  4 ++++
 5 files changed, 27 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index d801573..d2e6325 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -423,6 +423,7 @@ config BR2_PACKAGE_OPENOCD_FT2XXX
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "kodi rtmp has been removed"
 	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
 	help
 	  Internal rtmp support was removed from Kodi.
 
diff --git a/package/kodi-inputstream-rtmp/Config.in b/package/kodi-inputstream-rtmp/Config.in
new file mode 100644
index 0000000..c40bff2
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
+	bool "kodi-inputstream-rtmp"
+	select BR2_PACKAGE_RTMPDUMP
+	help
+	  RTMP input stream add-on for Kodi
+
+	  https://github.com/notspiff/inputstream.rtmp
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
new file mode 100644
index 0000000..f5a82d2
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-v1.0.4.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
new file mode 100644
index 0000000..80c4bcc
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-inputstream-rtmp
+#
+################################################################################
+
+KODI_INPUTSTREAM_RTMP_VERSION = v1.0.4
+KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
+KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
+KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
+KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 545b394..39355a7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -299,6 +299,10 @@ menu "Peripheral addons"
 	source "package/kodi-peripheral-xarcade/Config.in"
 endmenu
 
+menu "Inputstream addons"
+	source "package/kodi-inputstream-rtmp/Config.in"
+endmenu
+
 menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
