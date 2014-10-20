From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Mon, 20 Oct 2014 11:11:18 -0400
Subject: [Buildroot] [PATCH v3] yaml-cpp: new package
Message-ID: <1413817878-26953-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

yaml-cpp is a YAML parser and emitter in C++ matching
the YAML 1.2 spec.

https://code.google.com/p/yaml-cpp/

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
Changes v2 -> v3:
  - added comments to explain the dependencies inherited from boost
		  (suggested by yann.morin.1998 at free.fr)
---
Changes v1 -> v2:
  - rename the commit title (suggested by
		  thomas.petazzoni at free-electrons.com)
  - change package place to Librairies > XML/JSON (suggested by
		  thomas.petazzoni at free-electrons.com)
  - change the YAML_CPP_VERSION and remove the useless YAML_CPP_SOURCE
		  (suggested by thomas.petazzoni at free-electrons.com)
---
 package/Config.in              |  1 +
 package/yaml-cpp/Config.in     | 14 ++++++++++++++
 package/yaml-cpp/yaml-cpp.hash |  5 +++++
 package/yaml-cpp/yaml-cpp.mk   | 13 +++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/yaml-cpp/Config.in
 create mode 100644 package/yaml-cpp/yaml-cpp.hash
 create mode 100644 package/yaml-cpp/yaml-cpp.mk

diff --git a/package/Config.in b/package/Config.in
index 89b46dc..7ff953e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -737,6 +737,7 @@ menu "JSON/XML"
 	source "package/tinyxml/Config.in"
 	source "package/xerces/Config.in"
 	source "package/yajl/Config.in"
+	source "package/yaml-cpp/Config.in"
 endmenu
 
 menu "Logging"
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
new file mode 100644
index 0000000..d6afdac
--- /dev/null
+++ b/package/yaml-cpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_YAML_CPP
+	bool "yaml-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	select BR2_PACKAGE_BOOST
+	help
+	  yaml-cpp is a YAML parser and emitter in C++ matching
+	  the YAML 1.2 spec.
+
+	  https://code.google.com/p/yaml-cpp/
+
+comment "yaml-cpp needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
new file mode 100644
index 0000000..391e317
--- /dev/null
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -0,0 +1,5 @@
+# hash from: https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz:
+sha1 9c5414b4090491e96d1b808fe8628b31e625fdaa  yaml-cpp-0.5.1.tar.gz
+
+# Locally calculated:
+sha256 3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06  yaml-cpp-0.5.1.tar.gz
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
new file mode 100644
index 0000000..5ebdb23
--- /dev/null
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# yaml-cpp
+#
+################################################################################
+
+YAML_CPP_VERSION = 0.5.1
+YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
+YAML_CPP_INSTALL_STAGING = YES
+YAML_CPP_LICENSE = MIT
+YAML_CPP_LICENSE_FILES = license.txt
+
+$(eval $(cmake-package))
-- 
1.8.3.4
