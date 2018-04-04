From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  4 Apr 2018 18:31:23 +0200
Subject: [Buildroot] [PATCH v5 6/7] package/mesa3d: enable OpenCL support
In-Reply-To: <20180404163124.27934-1-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
Message-ID: <20180404163124.27934-7-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides Clover, the OpenCL 1.1 API implementation by Mesa
for AMD GPUs. It generates libOpenCL.so.

Add --disable-opencl-icd because int  Mesa 18 defaults to on. When
disabled, the shared library is named libOpenCL instead of libMesaOpenCL
and CL headers are installed.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---

Tested with AMD Radeon Dual (AMD SUMO + AMD CAICOS) using Gallium r600:

Piglit taken from Romain Naour's patch, setting -DPIGLIT_BUILD_CL_TESTS=ON:

http://lists.busybox.net/pipermail/buildroot/2018-February/213601.html

Results from 704 tests:
skip 94
pass 541
fail 60
crash 9 

Opencl-example (100% pass):
https://cgit.freedesktop.org/~tstellar/opencl-example/

 package/mesa3d/Config.in | 17 +++++++++++++++++
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ffe0287ac5..600f9ffdda 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -30,6 +30,23 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	select BR2_PACKAGE_LLVM
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "opencl support"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_bfin # elfutils
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBCLC
+
+comment "mesa3d OpenCL needs a uClibc or glibc toolchain w/ wchar"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on !BR2_bfin
+	depends on !BR2_USE_WCHAR \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 506f84274f..0d00b3f1b9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -230,4 +230,14 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
+# Clover requires libelf
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_DEPENDENCIES += clang elfutils libclc
+MESA3D_CONF_OPTS += --enable-opencl \
+	--disable-opencl-icd \
+	--with-clang-libdir=$(STAGING_DIR)/usr/lib
+else
+MESA3D_CONF_OPTS += --disable-opencl
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
