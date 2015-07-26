From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:42:36 +0200
Subject: [Buildroot] [git commit] racehound: fix kernel module compile
Message-ID: <20150726164314.A8FC581DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ad6ee7f36904c756a8c6792581daf83ff91f8c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- check for linux kernel >= 3.14
- add cross compile enviornment for linux kernel compile
- add additional kernel config hint (CONFIG_KALLSYMS_ALL)
- fix kernel module install path

[Thomas:
 - fix Config.in dependency logic for the comment on the kernel
   version, as noticed by Baruch.
 - minor improvements in the .mk file.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...install-path-lib-instead-of-usr-lib-prefi.patch |   26 ++++++++++++++++++++
 package/racehound/Config.in                        |    6 +++-
 package/racehound/racehound.mk                     |    8 +++++-
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch b/package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch
new file mode 100644
index 0000000..6cac55d
--- /dev/null
+++ b/package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch
@@ -0,0 +1,26 @@
+From 4f8ed39ddaf17c7dd4ddbdb88e67097f00c98173 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Jul 2015 23:11:25 +0200
+Subject: [PATCH] Fix module install path (/lib instead of /usr/lib prefix)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ cmake/modules/path_prefixes.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/modules/path_prefixes.cmake b/cmake/modules/path_prefixes.cmake
+index 3cb1fe2..9dc50a4 100644
+--- a/cmake/modules/path_prefixes.cmake
++++ b/cmake/modules/path_prefixes.cmake
+@@ -113,7 +113,7 @@ set(RH_INSTALL_PREFIX_DOC
+ # Set derivative prefixes
+ 
+ # additional, 1
+-set(RH_INSTALL_PREFIX_KMODULE "${RH_INSTALL_PREFIX_LIB}/modules/${KBUILD_VERSION_STRING}/misc")
++set(RH_INSTALL_PREFIX_KMODULE "/lib/modules/${KBUILD_VERSION_STRING}/misc")
+ # Another variant
+ #"${RH_INSTALL_PREFIX_LIB}/modules/${KBUILD_VERSION_STRING}/extra")
+ # additional, 2
+-- 
+2.1.4
+
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index f0a8565..9fac802 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RACEHOUND
 	bool "racehound"
 	select BR2_PACKAGE_ELFUTILS
 	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -18,12 +19,13 @@ config BR2_PACKAGE_RACEHOUND
 	  - CONFIG_SYSFS
 	  - CONFIG_DEBUG_FS
 	  - CONFIG_KALLSYMS
+	  - CONFIG_KALLSYMS_ALL
 	  - CONFIG_KPROBES
 
 	  https://github.com/winnukem/racehound
 
-comment "racehound needs an Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
+comment "racehound needs an Linux kernel >= 3.14 to be built"
+	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_i386 || BR2_x86_64
 
 comment "racehound needs a toolchain w/ C++, wchar, dynamic library"
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index f77e5f3..7d8d1e3 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -12,10 +12,16 @@ RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
 
 RACEHOUND_DEPENDENCIES = elfutils linux
 
+# override auto detection (uses host parameters, not cross compile
+# ready)
 RACEHOUND_CONF_OPTS += \
 	-DKERNEL_VERSION_OK=YES \
 	-DMODULE_BUILD_SUPPORTED=YES \
 	-DKERNEL_CONFIG_OK=YES \
-	-DKBUILD_BUILD_DIR=$(LINUX_DIR)
+	-DKBUILD_BUILD_DIR=$(LINUX_DIR) \
+	-DKBUILD_VERSION_STRING=$(LINUX_VERSION_PROBED)
+
+# cross compile environment for linux kernel module
+RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)
 
 $(eval $(cmake-package))
