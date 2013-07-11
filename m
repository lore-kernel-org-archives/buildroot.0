From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 11 Jul 2013 16:46:10 -0700
Subject: [Buildroot] [PATCH v2] fdk-aac: new package
Message-ID: <1373586370-18676-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes v2:
- Set header separator to 80 chars
- Added C++ support dependency
- Reworked dependency around supported architectures
  instead of non-supported architectures

 package/Config.in          |    1 +
 package/fdk-aac/Config.in  |   17 +++++++++++++++++
 package/fdk-aac/fdk-aac.mk |   14 ++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/fdk-aac/Config.in
 create mode 100644 package/fdk-aac/fdk-aac.mk

diff --git a/package/Config.in b/package/Config.in
index 3186bb7..76e73c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -377,6 +377,7 @@ menu "Audio/Sound"
 source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/celt051/Config.in"
+source "package/fdk-aac/Config.in"
 source "package/libao/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
new file mode 100644
index 0000000..dfc8cc4
--- /dev/null
+++ b/package/fdk-aac/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_FDK_AAC
+	bool "fdk-aac"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# These are the architectures supported by FDK AAC
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
+		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		   BR2_powerpc || BR2_sh || BR2_sh64
+
+	help
+	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
+	  is software that implements the MPEG Advanced Audio Coding ("AAC")
+	  encoding and decoding scheme for digital audio
+
+	  http://sourceforge.net/projects/opencore-amr/files/fdk-aac/
+
+comment "fdk-aac requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
new file mode 100644
index 0000000..325267a
--- /dev/null
+++ b/package/fdk-aac/fdk-aac.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# fdk-aac
+#
+################################################################################
+
+FDK_AAC_VERSION = 0.1.1
+FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
+FDK_AAC_LICENSE = fdk-aac license
+FDK_AAC_LICENSE_FILES = NOTICE
+
+FDK_AAC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.4.1
