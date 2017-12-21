From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 21 Dec 2017 16:01:18 -0500
Subject: [Buildroot] [PATCH 1/1] json for modern c++: new package
Message-ID: <20171221210118.11957-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A json library that aims to make json feel like a first class data type
using C++11, json for modern c++ is a easy to use, flexible, modern json
library.

Design goals include:

- Intuitive syntax. In languages such as Python, JSON feels like a first
  class data type. All the operator magic of modern C++ is used to achieve
  the same feeling in c++.

- Trivial integration. The whole code consists of a single header file
  json.hpp. That's it. No library, no subproject, no dependencies, no
  complex build system. The class is written in vanilla C++11.
  All in all, everything should require no adjustment of compiler flags or
  project settings.

- Serious testing. The class is heavily unit-tested and covers 100% of the
  code, including all exceptional behavior. Furthermore, it is checked with
  Valgrind that there are no memory leaks. To maintain high quality,
  the project is following the Core Infrastructure Initiative (CII) best
  practices.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in                                  |  1 +
 package/json-for-modern-cpp/Config.in              | 28 ++++++++++++++++++++++
 .../json-for-modern-cpp/json-for-modern-cpp.hash   |  3 +++
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 15 ++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/json-for-modern-cpp/Config.in
 create mode 100644 package/json-for-modern-cpp/json-for-modern-cpp.hash
 create mode 100644 package/json-for-modern-cpp/json-for-modern-cpp.mk

diff --git a/package/Config.in b/package/Config.in
index bd39a374f0..06b8386299 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1255,6 +1255,7 @@ menu "JSON/XML"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
 	source "package/json-c/Config.in"
+	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
 	source "package/libbson/Config.in"
diff --git a/package/json-for-modern-cpp/Config.in b/package/json-for-modern-cpp/Config.in
new file mode 100644
index 0000000000..d3f2e869a1
--- /dev/null
+++ b/package/json-for-modern-cpp/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	bool "json for modern c++"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Json for modern c++ has the following desing goals in mind:
+
+	  - Intuitive syntax. In languages such as Python, JSON feels
+	    like a first class data type. All the operator magic of
+	    modern C++ is used to achieve the same feeling in c++.
+
+	  - Trivial integration. The whole code consists of a single
+	    header file json.hpp. That's it. No library, no subproject,
+	    no dependencies, no complex build system. The class is
+	    written in vanilla C++11. All in all, everything should
+	    require no adjustment of compiler flags or project settings.
+
+	  - Serious testing. The class is heavily unit-tested and covers
+	  	100% of the code, including all exceptional behavior.
+	  	Furthermore, it is checked with Valgrind that there are no
+	  	memory leaks. To maintain high quality, the project is
+	  	following the Core Infrastructure Initiative (CII) best
+	  	practices.
+
+	  https://github.com/nlohmann/json
+
+comment "json for modern c++ needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
new file mode 100644
index 0000000000..50b6735ba1
--- /dev/null
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	837fb7f6595b176774d0d90b83f4cb03c303e94a373fb7d34ae583ae3992812d	json-v3.0.0.tar.gz
+sha256	6a6115fc4a7239a135f2dce8d33f94cb8a936b8f608ac0f6699fbac278b0dd5b	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
new file mode 100644
index 0000000000..fef6f5c758
--- /dev/null
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# json for modern c++
+#
+################################################################################
+
+JSON_FOR_MODERN_CPP_VERSION = v3.0.0
+JSON_FOR_MODERN_CPP_SOURCE=json-${JSON_FOR_MODERN_CPP_VERSION}.tar.gz
+JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
+JSON_FOR_MODERN_CPP_LICENSE = MIT
+JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
+JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
+JSON_FOR_MODERN_CPP_CONF_OPTS += -DJSON_BuildTests=OFF
+
+$(eval $(cmake-package))
-- 
2.14.3
