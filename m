From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:42 +0200
Subject: [Buildroot] [RFC 5/9] package/clang: enable target variant
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/clang/clang.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index e70afa4..2a82165 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -12,7 +12,10 @@ CLANG_LICENSE_FILES = LICENSE.TXT
 
 HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
 
+CLANG_DEPENDENCIES = host-clang host-llvm host-libxml2 llvm
+
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
+CLANG_INSTALL_STAGING = YES
 
 HOST_CLANG_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF \
 	-DCLANG_INCLUDE_TESTS=OFF \
@@ -21,6 +24,20 @@ HOST_CLANG_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF \
 	-DCLANG_VENDOR=$(TARGET_VENDOR) \
 	-DCLANG_VENDOR_UTI="http://bugs.buildroot.net/"
 
+CLANG_CONF_ENV += LLVM_CONFIG=$(STAGING_DIR)/usr/bin/llvm-config
+
+# Needs build_tools to provide clangSema etc...
+CLANG_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF \
+	-DCLANG_INCLUDE_TESTS=OFF \
+	-DCLANG_BUILD_EXAMPLES=OFF \
+	-DCLANG_BUILD_TOOLS=ON \
+	-DCLANG_INCLUDE_TESTS=OFF \
+	-DCLANG_TABLEGEN=$(HOST_DIR)/usr/bin/clang-tblgen \
+	-DCLANG_VENDOR=$(TARGET_VENDOR) \
+	-DCLANG_VENDOR_UTI="http://bugs.buildroot.net/" \
+	-DLLVM_CONFIG=$(STAGING_DIR)/usr/bin/llvm-config \
+	-DLLVM_TABLEGEN_EXE=$(HOST_DIR)/usr/bin/llvm-tblgen
+
 # For some reason clang-tblgen is not installed in HOST_DIR.
 define HOST_CLANG_COPY_CLANG_TBLGEN_TO_HOST_DIR
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/clang-tblgen \
@@ -33,4 +50,8 @@ HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_COPY_CLANG_TBLGEN_TO_HOST_DIR
 HOST_CLANG_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -L${HOST_DIR}/usr/lib -Wl,-rpath,${HOST_DIR}/usr/lib"
 
+CLANG_CONF_ENV += \
+	LDFLAGS="$(LDFLAGS) -L${STAGING_DIR}/usr/lib -Wl,-rpath,${STAGING_DIR}/usr/lib"
+
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.9.4
