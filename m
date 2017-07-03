From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:46 +0200
Subject: [Buildroot] [RFC 9/9] package/mesa3d: enable openCL support
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-10-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mesa3d/Config.in | 15 +++++++++++++++
 package/mesa3d/mesa3d.mk |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 94ef767..4e7f56a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -31,6 +31,21 @@ config BR2_PACKAGE_MESA3D_LLVM
 comment "mesa3d w/ llvm needs a llvm compiler"
 	depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "mesa3d openCL"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on !BR2_bfin # elfutils
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBCLC
+
+comment "mesa3d openCL needs a uClibc or glibc toolchain w/ wchar"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on !BR2_bfin
+	depends on !BR2_USE_WCHAR \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4633bff..530a63c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -227,4 +227,13 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
+# libclc (Clover) requires libelf
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_DEPENDENCIES += clang elfutils libclc
+MESA3D_CONF_OPTS += --enable-opencl \
+	--with-clang-libdir=$(HOST_DIR)/usr/lib
+else
+MESA3D_CONF_OPTS += --disable-opencl
+endif
+
 $(eval $(autotools-package))
-- 
2.9.4
