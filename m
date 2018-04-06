From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:24:30 +0200
Subject: [Buildroot] [git commit] mesa3d: properly propagate the
 dependencies of BR2_PACKAGE_LLVM
Message-ID: <20180406193104.18C7286897@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e841af11085a55b4785b2b67e8509f5fa0987e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We cannot simply select BR2_PACKAGE_LLVM, we need to take into account
all its dependencies. BR2_PACKAGE_LLVM_ARCH_SUPPORTS was already taken
into account, but not the other dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <a class="moz-txt-link-rfc2396E" href="mailto:thomas.petazzoni@bootlin.com">&lt;thomas.petazzoni at bootlin.com&gt;</a></pre>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ffe0287ac5..8f347ffe0c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -28,8 +28,22 @@ if BR2_PACKAGE_MESA3D
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	select BR2_PACKAGE_LLVM
 
+comment "llvm support needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "llvm support needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
