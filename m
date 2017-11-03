From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Nov 2017 09:33:06 -0400
Subject: [Buildroot] [PATCH v4 1/1] libsepol: require threads
Message-ID: <20171103133306.20198-1-aduskett@gmail.com>
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
  - Added explanations for dependencies (Matt Webber)

Changes v3 -> v4:
  - Added Config.in comment in libsepol for threads. (Thomas)

 package/libsepol/Config.in       | 4 ++++
 package/semodule-utils/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index f92af52072..cfa923e452 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBSEPOL
 	bool "libsepol"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	help
 	  Libsepol is the binary policy manipulation library. It doesn't
 	  depend upon or use any of the other SELinux components.
 
 	  http://selinuxproject.org/page/Main_Page
+
+comment "libsepol needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
