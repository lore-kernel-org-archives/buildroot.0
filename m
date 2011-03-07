From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:36 +0100
Subject: [Buildroot] [PATCH 3/9] Rename BR2_INET_RPC to BR2_TOOLCHAIN_HAS_RPC
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6fe2be43a4b6f50439c9e11a6da95e0247cdd99a.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_nptl_toolchain_defconfig             |    2 +-
 configs/arm_toolchain_defconfig                  |    2 +-
 package/busybox/busybox.mk                       |    2 +-
 package/lmbench/Config.in                        |    4 ++--
 package/lsof/Config.in                           |    4 ++--
 package/netkitbase/Config.in                     |    4 ++--
 package/netkittelnet/Config.in                   |    4 ++--
 package/nfs-utils/Config.in                      |    4 ++--
 package/portmap/Config.in                        |    4 ++--
 package/util-linux/Config.in                     |    4 ++--
 target/xtensa/defconfig                          |    2 +-
 toolchain/helpers.mk                             |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2        |    2 +-
 toolchain/toolchain-common.in                    |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |    4 ++--
 toolchain/toolchain-external/ext-tool.mk         |    2 +-
 toolchain/uClibc/uclibc.mk                       |    2 +-
 19 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 62870c9..d9cf6dc 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -5,7 +5,7 @@ BR2_arm926t=y
 # Toolchain options
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_TOOLCHAIN_HAS_IPV6=y
-BR2_INET_RPC=y
+BR2_TOOLCHAIN_HAS_RPC=y
 BR2_ENABLE_LOCALE=y
 BR2_USE_WCHAR=y
 BR2_PTHREADS_NATIVE=y
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 4c7b96d..436a139 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -4,7 +4,7 @@ BR2_arm=y
 # Common Toolchain Options
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_TOOLCHAIN_HAS_IPV6=y
-BR2_INET_RPC=y
+BR2_TOOLCHAIN_HAS_RPC=y
 BR2_ENABLE_LOCALE=y
 BR2_USE_WCHAR=y
 BR2_INSTALL_LIBSTDCPP=y
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7c6f28a..cf0ba34 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -73,7 +73,7 @@ endef
 endif
 
 # If RPC is enabled then enable nfs mounts
-ifeq ($(BR2_INET_RPC),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_RPC),y)
 define BUSYBOX_SET_RPC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
 endef
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c8423d1..c2f5457 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
 	# Uses pmap_set, pmap__unset, pmap_getport, etc.
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LMBENCH
 	  http://sourceforge.net/projects/lmbench/
 
 comment "lmbench requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_RPC
diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index 22b7f5e..a5e2b90 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LSOF
 	bool "lsof"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LSOF
 	  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 
 comment "lsof requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_RPC
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 725e500..c51bd27 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	help
 	  Old-style inetd.
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkitbase requires a toolchain with RPC support"
-        depends on !BR2_INET_RPC
+        depends on !BR2_TOOLCHAIN_HAS_RPC
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 058d210..09e5ae4 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_NETKITTELNET
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkittelnet requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_RPC
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index e7b0566..ac3eb0c 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  The NFS Linux kernel server.
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NFS_UTILS
 	  http://sourceforge.net/projects/nfs
 
 comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
-	depends on !BR2_INET_RPC || !BR2_TOOLCHAIN_HAS_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_RPC || !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index 1f22ab6..4d55a97 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	help
 	  The standard portmapper for RPC services.
 
 	  http://neil.brown.name/portmap/
 
 comment "portmap requires a toolchain with 'Enable RPC' selected"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_RPC
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 434dae9..f188fb1 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_UTIL-LINUX
 	bool "util-linux"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_INET_RPC
+	depends on BR2_TOOLCHAIN_HAS_RPC
 	help
 	  Various useful/essential Linux utilities.
 
@@ -11,4 +11,4 @@ config BR2_PACKAGE_UTIL-LINUX
 	  http://www.kernel.org/pub/linux/utils/util-linux/
 
 comment "util-linux requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
+	depends on !BR2_TOOLCHAIN_HAS_RPC
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index 63ec81f..b03aedc 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -78,7 +78,7 @@ BR2_GDB_VERSION="6.8"
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
-BR2_INET_RPC=y
+BR2_TOOLCHAIN_HAS_RPC=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
 
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 10b2328..6ffbc8f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -144,7 +144,7 @@ check_glibc = \
 	fi; \
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_IPV6,IPv6 support) ;\
-	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
 	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
@@ -191,7 +191,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_TOOLCHAIN_HAS_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_TOOLCHAIN_HAS_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 6e2fcc6..1ade855 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -20,7 +20,7 @@ config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_RPC
 	help
 	  Enable this option if you want your toolchain to support
 	  RPC (needed for NFS, for example).
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index c13776c..dfaa8c3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -11,7 +11,7 @@ config BR2_TOOLCHAIN_HAS_LARGEFILE
 config BR2_TOOLCHAIN_HAS_IPV6
 	bool
 
-config BR2_INET_RPC
+config BR2_TOOLCHAIN_HAS_RPC
 	bool
 
 config BR2_USE_WCHAR
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 5e724e2..530b2a4 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 	bool "eglibc"
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 	select BR2_PROGRAM_INVOCATION
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 	select BR2_PROGRAM_INVOCATION
@@ -65,7 +65,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6
 
 config BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC
 	bool "Enable RPC support"
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_RPC
 	help
 	  Enable this option if you want your toolchain to support
 	  RPC (needed for NFS, for example).
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index c6469ee..0215287 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -293,7 +293,7 @@ CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_IPV6)=.*:\# \1 is not set:;
 endif
 
 # Handle the RPC option
-ifneq ($(call qstrip,$(BR2_INET_RPC)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_HAS_RPC)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_RPC) is not set:\1=y\nUCLIBC_HAS_FULL_RPC=y\nUCLIBC_HAS_REENTRANT_RPC=y:;
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_FULL_RPC) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_REENTRANT_RPC) is not set:\1=y:;
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2fe0bc3..09115fb 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -145,7 +145,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_IPV6
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_PROGRAM_INVOCATION
@@ -190,7 +190,7 @@ config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support ?"
-	select BR2_INET_RPC
+	select BR2_TOOLCHAIN_HAS_RPC
 	help
 	  Select this option if your external toolchain supports
 	  RPC. If you don't know, leave the default value, Buildroot
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index f6249ef..e589738 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -25,7 +25,7 @@
 #  the Buildroot configuration system knows whether the toolchain
 #  supports RPC, IPv6, locales, large files, etc. Unfortunately, these
 #  things cannot be detected automatically, since the value of these
-#  options (such as BR2_INET_RPC) are needed at configuration time
+#  options (such as BR2_TOOLCHAIN_HAS_RPC) are needed at configuration time
 #  because these options are used as dependencies for other
 #  options. And at configuration time, we are not able to retrieve the
 #  external toolchain configuration.
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index a92bb58..692d43c 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -248,7 +248,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 else
 	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_INET_RPC),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_RPC),y)
 	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g' \
-- 
1.7.0.4
