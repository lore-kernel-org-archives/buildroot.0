From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:42:11 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/jq: needs threads
Message-ID: <20200722114339.DFB0482AF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b85b1e03c5f4bfda78e441a8c5278cce46e16533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

threads is a strong requirement since
https://github.com/stedolan/jq/commit/cf4b48c7ba30cb30e116b523cff036ea481459f6

Fixes:
 - http://autobuild.buildroot.org/results/b871cc175655c2d6aa5f184d891b994a0ebd9902

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 826587fa4834ed8da03682df605d1ba51d4b7675)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/Config.in     | 4 ++++
 package/sysdig/Config.in | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/jq/Config.in b/package/jq/Config.in
index 321cbe8b51..5edb5d0989 100644
--- a/package/jq/Config.in
+++ b/package/jq/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_JQ
 	bool "jq"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  jq is like sed for JSON data - you can use it to slice and
 	  filter and map and transform structured data with the same
 	  ease that sed, awk, grep and friends let you play with text.
 
 	  http://stedolan.github.io/jq/
+
+comment "jq needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 0a1b3f8935..ee53b4fa20 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS # jq
 	depends on !BR2_STATIC_LIBS # luajit, elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
@@ -25,8 +26,9 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
+comment "sysdig needs a glibc or uclibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
