From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:39 +0200
Subject: [Buildroot] [RFC 2/9] package/clang: new host package
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install clang-tblgen to HOST_DIR.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in.host       |  1 +
 package/clang/Config.in.host |  8 ++++++++
 package/clang/clang.hash     |  2 ++
 package/clang/clang.mk       | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/clang/Config.in.host
 create mode 100644 package/clang/clang.hash
 create mode 100644 package/clang/clang.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index cf49950..ecbbea0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -4,6 +4,7 @@ menu "Host utilities"
 	source "package/android-tools/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
+	source "package/clang/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/clang/Config.in.host b/package/clang/Config.in.host
new file mode 100644
index 0000000..8d6c99a
--- /dev/null
+++ b/package/clang/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CLANG
+	bool "host clang"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	help
+	  Clang is a C++, Objective C and Objective C++ front-end for
+	  the LLVM compiler.
+
+	  http://llvm.org
diff --git a/package/clang/clang.hash b/package/clang/clang.hash
new file mode 100644
index 0000000..c2a9d23
--- /dev/null
+++ b/package/clang/clang.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256	61738a735852c23c3bdbe52d035488cdb2083013f384d67c1ba36fabebd8769b	cfe-4.0.1.src.tar.xz
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
new file mode 100644
index 0000000..e70afa4
--- /dev/null
+++ b/package/clang/clang.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# clang
+#
+################################################################################
+
+CLANG_VERSION = 4.0.1
+CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
+CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
+CLANG_LICENSE = NCSA
+CLANG_LICENSE_FILES = LICENSE.TXT
+
+HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
+
+CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
+
+HOST_CLANG_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF \
+	-DCLANG_INCLUDE_TESTS=OFF \
+	-DCLANG_BUILD_EXAMPLES=OFF \
+	-DCLANG_BUILD_TOOLS=ON \
+	-DCLANG_VENDOR=$(TARGET_VENDOR) \
+	-DCLANG_VENDOR_UTI="http://bugs.buildroot.net/"
+
+# For some reason clang-tblgen is not installed in HOST_DIR.
+define HOST_CLANG_COPY_CLANG_TBLGEN_TO_HOST_DIR
+	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/clang-tblgen \
+		$(HOST_DIR)/usr/bin/clang-tblgen
+endef
+HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_COPY_CLANG_TBLGEN_TO_HOST_DIR
+
+# We need to set a proper RPATH otherwise the build stop on the RPATH check:
+# *** ERROR: package host-clang installs executables without proper RPATH
+HOST_CLANG_CONF_ENV += \
+	LDFLAGS="$(HOST_LDFLAGS) -L${HOST_DIR}/usr/lib -Wl,-rpath,${HOST_DIR}/usr/lib"
+
+$(eval $(host-cmake-package))
-- 
2.9.4
