From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  8 Mar 2015 13:01:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/jsoncpp: new package
Message-ID: <1425816084-5764-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming Kodi pctv/filmon PVR packages:

https://github.com/kodi-pvr/pvr.pctv/blob/master/CMakeLists.txt#L11
https://github.com/kodi-pvr/pvr.filmon/blob/master/CMakeLists.txt#L11

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          |    1 +
 package/jsoncpp/Config.in  |   13 +++++++++++++
 package/jsoncpp/jsoncpp.mk |   16 ++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/jsoncpp/Config.in
 create mode 100644 package/jsoncpp/jsoncpp.mk

diff --git a/package/Config.in b/package/Config.in
index 734b85d..5b4b639 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -805,6 +805,7 @@ menu "JSON/XML"
 	source "package/jansson/Config.in"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
+	source "package/jsoncpp/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libxml2/Config.in"
diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
new file mode 100644
index 0000000..19a901e
--- /dev/null
+++ b/package/jsoncpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_JSONCPP
+	depends on BR2_INSTALL_LIBSTDCPP
+	bool "jsoncpp"
+	help
+	  JsonCpp is a C++ library that allows manipulating JSON values,
+	  including serialization and deserialization to and from strings.
+	  It can also preserve existing comment in unserialization/serialization
+	  steps, making it a convenient format to store user input files.
+
+	  https://github.com/open-source-parsers/jsoncpp
+
+comment "jsoncpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
new file mode 100644
index 0000000..e0646f5
--- /dev/null
+++ b/package/jsoncpp/jsoncpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# jsoncpp
+#
+################################################################################
+
+JSONCPP_VERSION = 1.5.4
+JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
+JSONCPP_LICENSE = MIT
+JSONCPP_LICENSE_FILES = LICENSE
+JSONCPP_INSTALL_STAGING = YES
+
+JSONCPP_CONF_OPTS += \
+	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF
+
+$(eval $(cmake-package))
-- 
1.7.10.4
