From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Oct 2017 09:48:06 -0400
Subject: [Buildroot] [PATCH v2 1/1] libsepol: require threads
Message-ID: <20171024134806.16755-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsepol 2.7 now uses pthreads.h

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - Added thread dependency to semodule-utils (Arnout)

 package/libsepol/Config.in       | 1 +
 package/semodule-utils/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index f92af52072..83141e8b98 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSEPOL
 	bool "libsepol"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libsepol is the binary policy manipulation library. It doesn't
 	  depend upon or use any of the other SELinux components.
diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
index d9cb928c4c..995157baa1 100644
--- a/package/semodule-utils/Config.in
+++ b/package/semodule-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SEMODULE_UTILS
 	bool "semodule-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
