From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 15 Apr 2021 18:03:54 +0300
Subject: [Buildroot] [PATCH v3 1/3] package/protozero: new package
Message-ID: <20210415150356.775904-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minimalistic protocol buffer decoder and encoder in C++.
Designed for high performance. Suitable for writing zero copy
parsers and encoders with minimal need for run-time allocation
of memory.

Low-level: this is designed to be a building block for writing
a very customized decoder for a stable protobuf schema. If your
protobuf schema is changing frequently or lazy decoding is not
critical for your application then this approach offers
no value: just use the C++ API that can be generated with
the Google Protobufs protoc program.

https://github.com/mapbox/protozero

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/protozero/Config.in      | 20 ++++++++++++++++++++
 package/protozero/protozero.hash |  4 ++++
 package/protozero/protozero.mk   | 17 +++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/protozero/Config.in
 create mode 100644 package/protozero/protozero.hash
 create mode 100644 package/protozero/protozero.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1348b8eb91..9390daa2fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1840,6 +1840,7 @@ N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
 N:	Maxim Kochetkov <fido_max@inbox.ru>
+F:	package/protozero/
 F:	package/timescaledb/
 
 N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index ea0e9edc3e..c5014faba1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1966,6 +1966,7 @@ endif
 	source "package/poco/Config.in"
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
+	source "package/protozero/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/riemann-c-client/Config.in"
diff --git a/package/protozero/Config.in b/package/protozero/Config.in
new file mode 100644
index 0000000000..f187840565
--- /dev/null
+++ b/package/protozero/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PROTOZERO
+	bool "protozero"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	help
+	  Minimalistic protocol buffer decoder and encoder in C++.
+	  Designed for high performance. Suitable for writing zero copy
+	  parsers and encoders with minimal need for run-time allocation
+	  of memory.
+	  Low-level: this is designed to be a building block for writing
+	  a very customized decoder for a stable protobuf schema. If your
+	  protobuf schema is changing frequently or lazy decoding is not
+	  critical for your application then this approach offers
+	  no value: just use the C++ API that can be generated with
+	  the Google Protobufs protoc program.
+
+	  https://github.com/mapbox/protozero
+
+comment "protozero needs a toolchain w/ C++,  gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
new file mode 100644
index 0000000000..5453e01ecf
--- /dev/null
+++ b/package/protozero/protozero.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  beffbdfab060854fd770178a8db9c028b5b6ee4a059a2fed82c46390a85f3f31  protozero-1.7.0.tar.gz
+sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
new file mode 100644
index 0000000000..e4ce1a4730
--- /dev/null
+++ b/package/protozero/protozero.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# protozero
+#
+################################################################################
+
+PROTOZERO_VERSION = 1.7.0
+PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
+PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
+PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
+PROTOZERO_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_PROTOBUF),y)
+PROTOZERO_DEPENDENCIES += protobuf
+endif
+
+$(eval $(cmake-package))
-- 
2.30.2
