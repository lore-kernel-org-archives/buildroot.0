From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:54:49 +0100
Subject: [Buildroot] [git commit] package/jsoncpp: new package
Message-ID: <20150315175524.26506817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3201c7746d7788f07237b0411535c5ed7a7ed60e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming Kodi pctv/filmon PVR packages:

https://github.com/kodi-pvr/pvr.pctv/blob/master/CMakeLists.txt#L11
https://github.com/kodi-pvr/pvr.filmon/blob/master/CMakeLists.txt#L11

[Thomas:
  - bump to 1.6.0
  - change the license to "Public Domain or MIT"
  - wrap Config.in help text]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/jsoncpp/Config.in  |   14 ++++++++++++++
 package/jsoncpp/jsoncpp.mk |   16 ++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3d8c213..704eaac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -808,6 +808,7 @@ menu "JSON/XML"
 	source "package/jansson/Config.in"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
+	source "package/jsoncpp/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libxml2/Config.in"
diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
new file mode 100644
index 0000000..3ec02e1
--- /dev/null
+++ b/package/jsoncpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JSONCPP
+	depends on BR2_INSTALL_LIBSTDCPP
+	bool "jsoncpp"
+	help
+	  JsonCpp is a C++ library that allows manipulating JSON
+	  values, including serialization and deserialization to and
+	  from strings.  It can also preserve existing comment in
+	  unserialization/serialization steps, making it a convenient
+	  format to store user input files.
+
+	  https://github.com/open-source-parsers/jsoncpp
+
+comment "jsoncpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
new file mode 100644
index 0000000..cfd3dd9
--- /dev/null
+++ b/package/jsoncpp/jsoncpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# jsoncpp
+#
+################################################################################
+
+JSONCPP_VERSION = 1.6.0
+JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
+JSONCPP_LICENSE = Public Domain or MIT
+JSONCPP_LICENSE_FILES = LICENSE
+JSONCPP_INSTALL_STAGING = YES
+
+JSONCPP_CONF_OPTS += \
+	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF
+
+$(eval $(cmake-package))
