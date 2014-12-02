From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Dec 2014 23:56:44 +0100
Subject: [Buildroot] [PATCH] package: add python-alsaaudio
Message-ID: <1417561004-27170-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-alsaaudio/Config.in             | 12 ++++++++++++
 package/python-alsaaudio/python-alsaaudio.hash |  2 ++
 package/python-alsaaudio/python-alsaaudio.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-alsaaudio/Config.in
 create mode 100644 package/python-alsaaudio/python-alsaaudio.hash
 create mode 100644 package/python-alsaaudio/python-alsaaudio.mk

diff --git a/package/Config.in b/package/Config.in
index b8fc7d1..acf7b58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endif
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
+	source "package/python-alsaaudio/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
diff --git a/package/python-alsaaudio/Config.in b/package/python-alsaaudio/Config.in
new file mode 100644
index 0000000..c9a91c9
--- /dev/null
+++ b/package/python-alsaaudio/Config.in
@@ -0,0 +1,12 @@
+comment "python-alsaaudio needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PYTHON_ALSAAUDIO
+	bool "python-alsaaudio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  The PyAlsaAudio package contains bindings for the ALSA sound
+	  API.
+
+	  http://pyalsaaudio.sourceforge.net/
diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
new file mode 100644
index 0000000..d805710
--- /dev/null
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	bbd5a9eb351def673800707f48e64680685f397e29da72ea4c9355e1a2b2a0fd  pyalsaaudio-0.7.tar.gz
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
new file mode 100644
index 0000000..e64ddb4
--- /dev/null
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-alsaaudio
+#
+################################################################################
+
+PYTHON_ALSAAUDIO_VERSION = 0.7
+PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
+PYTHON_ALSAAUDIO_SITE = http://downloads.sourceforge.net/project/pyalsaaudio
+PYTHON_ALSAAUDIO_SETUP_TYPE = distutils
+PYTHON_ALSAAUDIO_LICENSE = Python software foundation license v2
+PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
+PYTHON_ALSAAUDIO_DEPENDENCIES = alsa-lib
+
+$(eval $(python-package))
-- 
2.1.3
