From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Apr 2016 22:44:20 +0200
Subject: [Buildroot] [git commit] valijson: new package
Message-ID: <20160414204445.4BAAE80279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21c89819a4ab852fc978c0abe5b7e287a224f37e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Valijson is a header-only JSON Schema Validation library for C++.

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
[Thomas:
 - fix license, it's BSD-2c, not BSD-3c.
 - fix propagation of boost dependencies,
   BR2_PACKAGE_BOOST_ARCH_SUPPORTS was missing.
 - remove useless blank line in Config.in
 - tweak commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/valijson/Config.in     | 20 ++++++++++++++++++++
 package/valijson/valijson.hash |  2 ++
 package/valijson/valijson.mk   | 16 ++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 72ce1ac..3ab1813 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1045,6 +1045,7 @@ menu "JSON/XML"
 	source "package/raptor/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
+	source "package/valijson/Config.in"
 	source "package/xerces/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
diff --git a/package/valijson/Config.in b/package/valijson/Config.in
new file mode 100644
index 0000000..57dad66
--- /dev/null
+++ b/package/valijson/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_VALIJSON
+	bool "valijson"
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_REGEX
+	help
+	 Valijson is a header-only JSON Schema Validation library for
+	 C++. Valijson provides a simple validation API that allows
+	 you load JSON Schemas, and validate documents loaded by one
+	 of several supported parser libraries like boost, jsoncpp,
+	 rapidjson and picoJSON.
+
+	 https://github.com/tristanpenman/valijson
+
+comment "valijson needs a toolchain w/ C++, threads, wchar  support"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
new file mode 100644
index 0000000..79b3fb7
--- /dev/null
+++ b/package/valijson/valijson.hash
@@ -0,0 +1,2 @@
+# Locally Computed:
+sha256  f2346e995bd95c6b86b0b9e9dd228fe134d529565fa86db764c48496805dd9bc  valijson-424b706f990a9eb96dfc19cc8e54f2cd6ce5e186.tar.gz
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
new file mode 100644
index 0000000..e0813b3
--- /dev/null
+++ b/package/valijson/valijson.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# valijson
+#
+################################################################################
+
+VALIJSON_VERSION = 424b706f990a9eb96dfc19cc8e54f2cd6ce5e186
+VALIJSON_SITE = $(call github,tristanpenman,valijson,$(VALIJSON_VERSION))
+VALIJSON_LICENSE = BSD-2c
+VALIJSON_LICENSE_FILES = LICENSE
+VALIJSON_INSTALL_STAGING = YES
+VALIJSON_INSTALL_TARGET = NO
+VALIJSON_DEPENDENCIES = boost
+VALIJSON_CONF_OPTS = -DINSTALL_HEADERS=TRUE
+
+$(eval $(cmake-package))
