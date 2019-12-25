From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:46:39 +0100
Subject: [Buildroot] [git commit] package/cereal: new package
Message-ID: <20191225215449.41F348E535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac713c230ad7c2b50bdfdbb9ffaa7379ec8a2c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/cereal/Config.in   | 20 ++++++++++++++++++++
 package/cereal/cereal.hash |  6 ++++++
 package/cereal/cereal.mk   | 18 ++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e72ec0d70a..7171052243 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2335,6 +2335,7 @@ F:	package/civetweb/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
+F:	package/cereal/
 F:	package/libtelnet/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
diff --git a/package/Config.in b/package/Config.in
index 44e2b9fe31..01bf385178 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1732,6 +1732,7 @@ menu "Other"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
 	source "package/cctz/Config.in"
+	source "package/cereal/Config.in"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
diff --git a/package/cereal/Config.in b/package/cereal/Config.in
new file mode 100644
index 0000000000..3ac463c4fc
--- /dev/null
+++ b/package/cereal/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_CEREAL
+	bool "cereal"
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	help
+	  cereal is a header-only C++11 serialization library.
+	  cereal takes arbitrary data types and reversibly turns them
+	  into different representations, such as compact binary
+	  encodings, XML or JSON. cereal was designed to be fast,
+	  light-weight, and easy to extend - it has no external
+	  dependencies and can be easily bundled with other code or used
+	  standalone.
+
+	  https://github.com/USCiLab/cereal
+
+comment "cereal needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/cereal/cereal.hash b/package/cereal/cereal.hash
new file mode 100644
index 0000000000..ddaf54e7b4
--- /dev/null
+++ b/package/cereal/cereal.hash
@@ -0,0 +1,6 @@
+# Locally computed
+sha256 329ea3e3130b026c03a4acc50e168e7daff4e6e661bc6a7dfec0d77b570851d5  cereal-1.3.0.tar.gz
+sha256 18fd7618c44c9fe28b5f54cd19747df3c0472ed33e8507fea571e2acf6e72f34  LICENSE
+sha256 d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
+sha256 7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
+sha256 794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
new file mode 100644
index 0000000000..3811fdf32f
--- /dev/null
+++ b/package/cereal/cereal.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# cereal
+#
+################################################################################
+
+CEREAL_VERSION = 1.3.0
+CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
+# For licensing, see also: https://github.com/USCiLab/cereal/issues/609
+CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
+CEREAL_LICENSE_FILES = LICENSE include/cereal/external/base64.hpp include/cereal/external/rapidjson/rapidjson.h include/cereal/external/rapidxml/license.txt
+CEREAL_INSTALL_STAGING = YES
+CEREAL_INSTALL_TARGET = NO
+CEREAL_CONF_OPTS = \
+	-DTHREAD_SAFE=ON \
+	-DJUST_INSTALL_CEREAL=ON
+
+$(eval $(cmake-package))
