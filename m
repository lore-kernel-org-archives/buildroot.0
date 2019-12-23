From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 23 Dec 2019 15:26:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/cereal: new package
Message-ID: <20191223142605.29188-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/cereal/Config.in   | 20 ++++++++++++++++++++
 package/cereal/cereal.hash |  3 +++
 package/cereal/cereal.mk   | 17 +++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/cereal/Config.in
 create mode 100644 package/cereal/cereal.hash
 create mode 100644 package/cereal/cereal.mk

NOTE: cereal is bundling external packages like rapidjson and rapidxml.
The LICENSE file only declares the license for cereal. I opened an issue for
that [1], not sure what you want to do meanwhile in CEREAL_LICENSE.
[1] https://github.com/USCiLab/cereal/issues/609

diff --git a/DEVELOPERS b/DEVELOPERS
index d9b4864b9f..a48af96961 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2325,6 +2325,7 @@ F:	package/civetweb/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
+F:	package/cereal/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
diff --git a/package/Config.in b/package/Config.in
index f304a8fbd3..5fb969da8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
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
index 0000000000..0dd598ff12
--- /dev/null
+++ b/package/cereal/cereal.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 329ea3e3130b026c03a4acc50e168e7daff4e6e661bc6a7dfec0d77b570851d5  cereal-1.3.0.tar.gz
+sha256 18fd7618c44c9fe28b5f54cd19747df3c0472ed33e8507fea571e2acf6e72f34  LICENSE
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
new file mode 100644
index 0000000000..991eee76a2
--- /dev/null
+++ b/package/cereal/cereal.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cereal
+#
+################################################################################
+
+CEREAL_VERSION = 1.3.0
+CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
+CEREAL_LICENSE = BSD-3-Clause
+CEREAL_LICENSE_FILES = LICENSE
+CEREAL_INSTALL_STAGING = YES
+CEREAL_INSTALL_TARGET = NO
+CEREAL_CONF_OPTS = \
+	-DTHREAD_SAFE=ON \
+	-DJUST_INSTALL_CEREAL=ON
+
+$(eval $(cmake-package))
-- 
2.23.0
