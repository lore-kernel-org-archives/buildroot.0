From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:45 +0200
Subject: [Buildroot] [PATCH v4 10/11] package/mesa3d: enable OpenCL support
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-11-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides Clover, the OpenCL 1.1 API implementation by Mesa
for AMD GPUs. It generates libOpenCL.so.

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

 package/mesa3d/Config.in | 16 ++++++++++++++++
 package/mesa3d/mesa3d.mk |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e99e737d31..bad7ac4339 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -33,6 +33,22 @@ config BR2_PACKAGE_MESA3D_LLVM
 comment "mesa3d w/ llvm needs llvm"
 	depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "mesa3d OpenCL"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_USE_WCHAR #elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_bfin #elfutils
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
index 498ad57eed..1df28c43cb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -233,4 +233,13 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
+# Clover requires libelf
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_DEPENDENCIES += clang elfutils libclc
+MESA3D_CONF_OPTS += --enable-opencl \
+	--with-clang-libdir=$(STAGING_DIR)/usr/lib
+else
+MESA3D_CONF_OPTS += --disable-opencl
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
