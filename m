From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Jun 2018 12:46:37 +0200
Subject: [Buildroot] [PATCH 1/1] yaml-cpp: bump to version 0.6.2
Message-ID: <20180609104637.27092-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove boost dependency (not needed since 0.6)
- Add C++11 dependency (needed since 0.6)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/yaml-cpp/Config.in     | 8 +++-----
 package/yaml-cpp/yaml-cpp.hash | 3 ++-
 package/yaml-cpp/yaml-cpp.mk   | 8 +++-----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index 6d34f4210e..e02b85df12 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -1,14 +1,12 @@
 config BR2_PACKAGE_YAML_CPP
 	bool "yaml-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
-	depends on BR2_USE_WCHAR # boost
-	select BR2_PACKAGE_BOOST
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	help
 	  yaml-cpp is a YAML parser and emitter in C++ matching
 	  the YAML 1.2 spec.
 
 	  https://github.com/jbeder/yaml-cpp
 
-comment "yaml-cpp needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "yaml-cpp needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 7d6753732c..b2c0214102 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  6fb92f6f5925e0af918ffbb90acf19b7b88706ebcd40fc186b7caa76609b6350  yaml-cpp-0.5.2.tar.gz
+sha256  e4d8560e163c3d875fd5d9e5542b5fd5bec810febdcba61481fe5fc4e6b1fd05  yaml-cpp-0.6.2.tar.gz
+sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 6a01b02a3b..d97c84a7cf 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.5.2
-YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,release-$(YAML_CPP_VERSION))
+YAML_CPP_VERSION = 0.6.2
+YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
-YAML_CPP_LICENSE_FILES = license.txt
-
-YAML_CPP_DEPENDENCIES = boost
+YAML_CPP_LICENSE_FILES = LICENSE
 
 # Disable testing and parse tools
 YAML_CPP_CONF_OPTS += -DYAML_CPP_BUILD_TOOLS=OFF
-- 
2.14.1
