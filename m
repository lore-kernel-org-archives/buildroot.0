From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 31 Dec 2018 17:22:06 -0500
Subject: [Buildroot] [PATCH 1/1] json-for-modern-cpp: use include.zip
Message-ID: <20181231222206.69527-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, the json for modern c++ uses the release tarball for configuring
and installation. However; this tarball is actually 114.5Mb of unit tests, and
500Kb of actual code, which is just a header file.

When the package was initially submitted to Buildroot, json for modern c++ only
had the option of either just the header file, or the tarball. Since then,
the project has been able to break apart the header file into several, more
managable files and have included them in a "include.zip" file for each release.
This tar file is only 134K, and includes no unit tests.

This patch does the following:
- Change the package to a generic package.
- Manually unzip and install the header files to staging.
- Update the sha256 hash's for the new files.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../json-for-modern-cpp.hash                  |  6 ++---
 .../json-for-modern-cpp.mk                    | 22 +++++++++++++------
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index cff01db74c..254e513035 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256	e0b1fc6cc6ca05706cce99118a87aca5248bd9db3113e703023d23f044995c1d	json-v3.5.0.tar.gz
-sha256	7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd	LICENSE.MIT
+# From https://github.com/nlohmann/json/releases
+sha256	3564da9c5b0cf2e032f97c69baedf10ddbc98030c337d0327a215ea72259ea21	include.zip
+sha256	8e118538f66f1f13c78a215ddb7f9c1b83e835702fcd5a8586f77bb7455a1b99	json.hpp
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 86399fd60d..62971bca08 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -5,13 +5,21 @@
 ################################################################################
 
 JSON_FOR_MODERN_CPP_VERSION = v3.5.0
-JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
-JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
+JSON_FOR_MODERN_CPP_SOURCE = include.zip
+JSON_FOR_MODERN_CPP_SITE = https://github.com/nlohmann/json/releases/download/$(JSON_FOR_MODERN_CPP_VERSION)
 JSON_FOR_MODERN_CPP_LICENSE = MIT
-JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
+JSON_FOR_MODERN_CPP_LICENSE_FILES = json.hpp
 JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
-# header only library
-JSON_FOR_MODERN_CPP_INSTALL_TARGET = NO
-JSON_FOR_MODERN_CPP_CONF_OPTS = -DJSON_BuildTests=OFF
 
-$(eval $(cmake-package))
+define JSON_FOR_MODERN_CPP_EXTRACT_CMDS
+	unzip $(JSON_FOR_MODERN_CPP_DL_DIR)/$(JSON_FOR_MODERN_CPP_SOURCE) -d $(@D)
+	mv $(@D)/include/nlohmann/* $(@D)
+	rm -r $(@D)/include
+endef
+
+define JSON_FOR_MODERN_CPP_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/nlohmann
+	cp -r $(@D)/* $(STAGING_DIR)/usr/include/nlohmann
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
