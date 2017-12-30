From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:21:53 +0100
Subject: [Buildroot] [git commit] json-for-modern-cpp: new package
Message-ID: <20171230212226.18F2183545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b0a90d4f13e14495d7e9670ed661d430273dff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A json library that aims to make json feel like a first class data
type using C++11, json for modern c++ is a easy to use, flexible,
modern json library.

Design goals include:

- Intuitive syntax. In languages such as Python, JSON feels like a
  first class data type. All the operator magic of modern C++ is used
  to achieve the same feeling in c++.

- Trivial integration. The whole code consists of a single header file
  json.hpp. That's it. No library, no subproject, no dependencies, no
  complex build system. The class is written in vanilla C++11.  All in
  all, everything should require no adjustment of compiler flags or
  project settings.

- Serious testing. The class is heavily unit-tested and covers 100% of
  the code, including all exceptional behavior. Furthermore, it is
  checked with Valgrind that there are no memory leaks. To maintain
  high quality, the project is following the Core Infrastructure
  Initiative (CII) best practices.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas:
 - use "json-for-modern-cpp" everywhere as the name of the package
 - add <pkg>_INSTALL_TARGET = NO since it's a header only library]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/json-for-modern-cpp/Config.in              | 29 ++++++++++++++++++++++
 .../json-for-modern-cpp/json-for-modern-cpp.hash   |  3 +++
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 17 +++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd6d8d8..d3f3f05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/gstreamer1/gst1-plugins-ugly/
 F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
+F:	package/json-for-modern-cpp/
 F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
diff --git a/package/Config.in b/package/Config.in
index be72d36..a343503 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1256,6 +1256,7 @@ menu "JSON/XML"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
 	source "package/json-c/Config.in"
+	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
 	source "package/libbson/Config.in"
diff --git a/package/json-for-modern-cpp/Config.in b/package/json-for-modern-cpp/Config.in
new file mode 100644
index 0000000..b045cba
--- /dev/null
+++ b/package/json-for-modern-cpp/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	bool "json-for-modern-cpp"
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
+	    header file json.hpp. That's it. No library, no
+	    subproject, no dependencies, no complex build system. The
+	    class is written in vanilla C++11. All in all, everything
+	    should require no adjustment of compiler flags or project
+	    settings.
+
+	  - Serious testing. The class is heavily unit-tested and
+	    covers 100% of the code, including all exceptional
+	    behavior.  Furthermore, it is checked with Valgrind that
+	    there are no memory leaks. To maintain high quality, the
+	    project is following the Core Infrastructure Initiative
+	    (CII) best practices.
+
+	  https://github.com/nlohmann/json
+
+comment "json-for-modern-cpp needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
new file mode 100644
index 0000000..7f394aa
--- /dev/null
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	402464cd6d50c81bb6a683d07c537e5a8c4684fd1186826d3aa1385ce6adac13	json-v3.0.1.tar.gz
+sha256	6a6115fc4a7239a135f2dce8d33f94cb8a936b8f608ac0f6699fbac278b0dd5b	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
new file mode 100644
index 0000000..6413d62
--- /dev/null
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# json-for-modern-cpp
+#
+################################################################################
+
+JSON_FOR_MODERN_CPP_VERSION = v3.0.1
+JSON_FOR_MODERN_CPP_SOURCE = json-${JSON_FOR_MODERN_CPP_VERSION}.tar.gz
+JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
+JSON_FOR_MODERN_CPP_LICENSE = MIT
+JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
+JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
+# header only library
+JSON_FOR_MODERN_CPP_INSTALL_TARGET = NO
+JSON_FOR_MODERN_CPP_CONF_OPTS = -DJSON_BuildTests=OFF
+
+$(eval $(cmake-package))
