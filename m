From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Oct 2017 10:14:43 -0400
Subject: [Buildroot] [PATCH v3 1/1] libsepol: require threads
Message-ID: <20171025141444.18433-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsepol 2.7 now uses pthreads.h

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added thread dependency to semodule-utils (Arnout)

Changes v2 -> v3:
  - Added explinations for dependencies (Matt Webber)

 package/libsepol/Config.in       | 1 +
 package/semodule-utils/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index f92af52072..f17eb47448 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSEPOL
 	bool "libsepol"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	help
 	  Libsepol is the binary policy manipulation library. It doesn't
 	  depend upon or use any of the other SELinux components.
diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
index d9cb928c4c..38e043dc2c 100644
--- a/package/semodule-utils/Config.in
+++ b/package/semodule-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SEMODULE_UTILS
 	bool "semodule-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	select BR2_PACKAGE_LIBSEPOL
 	help
 	  semodule-utils is a package that contains tools for handling
@@ -13,3 +14,6 @@ config BR2_PACKAGE_SEMODULE_UTILS
 	  * semodule_package - Create a SELinux policy module package.
 
 	  https://github.com/SELinuxProject/selinux/wiki/Releases
+
+comment "semodule-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.13.6
