From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 04 Dec 2019 10:47:22 -0000
Subject: [Buildroot] [PATCH 1/7] libyang: Optional C++ bindings
In-Reply-To: <cover.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <f70195c8c44e4950257e1548b25083254362b266.1575456104.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/libyang/Config.in  | 10 ++++++++++
 package/libyang/libyang.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/libyang/Config.in b/package/libyang/Config.in
index fec1160a6f..fc598af8e1 100644
--- a/package/libyang/Config.in
+++ b/package/libyang/Config.in
@@ -10,5 +10,15 @@ config BR2_PACKAGE_LIBYANG
 
 	  https://github.com/CESNET/libyang
 
+if BR2_PACKAGE_LIBYANG
+
+config BR2_PACKAGE_LIBYANG_CPP
+	bool "Enable libyang C++ bindings"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Build the C++ wrapper around libyang.
+
+endif
+
 comment "libyang needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index cfec08cd16..87a1a4ef7c 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -21,5 +21,12 @@ HOST_LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DGEN_PYTHON_BINDINGS=OFF
 
+ifdef BR2_PACKAGE_LIBYANG_CPP
+	LIBYANG_DEPENDENCIES += host-swig
+	HOST_LIBYANG_DEPENDENCIES += host-swig
+	LIBYANG_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF
+	HOST_LIBYANG_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.21.0
