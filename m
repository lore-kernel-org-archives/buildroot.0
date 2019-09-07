From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:23 +0200
Subject: [Buildroot] [PATCH v2 08/12] package/clang: add a host entry for
 clang
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-9-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to allow Buildroot's user to select clang
as cross-compiler we need first an option to select
host-clang package in menuconfig.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/Config.in.host       |  1 +
 package/clang/Config.in.host | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/clang/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 93822304e9..182e175a78 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ menu "Host utilities"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
+	source "package/clang/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
diff --git a/package/clang/Config.in.host b/package/clang/Config.in.host
new file mode 100644
index 0000000000..ca5d7ba678
--- /dev/null
+++ b/package/clang/Config.in.host
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_HOST_CLANG
+	bool "clang cross-compiler"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # std::wstring
+	help
+	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
+	  for the LLVM compiler.
+
+	  This option install the clang cross-compiler and it's
+	  libraires. It doesn't mean that's used by Buildroot
+	  infra to build packages.
+
+	  http://clang.llvm.org
-- 
2.21.0
