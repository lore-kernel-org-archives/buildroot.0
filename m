From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Jul 2011 11:56:53 +0200
Subject: [Buildroot] [git commit] uClibc: drop BR2_PROGRAM_INVOCATION option
Message-ID: <20110727095826.974388B4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ee9d569f9ae5da199b6e64a45d83dc6aa9c78ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the BR option and enable the configuration setting in the
uClibc defconfigs.

The BR2_PROGRAM_INVOCATION option only adds very little overhead to
uClibc, and we have a number of packages needing it, so simply always
enable it - Simplifying the kconfig logic and the number of choices
users have to make.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/coreutils/Config.in                      |    6 +++---
 package/tar/Config.in                            |    6 +++---
 package/udev/Config.in                           |    5 ++---
 package/usbutils/Config.in                       |    4 ----
 package/util-linux/Config.in                     |    5 ++---
 target/xtensa/uClibc-0.9.30.config               |    2 +-
 target/xtensa/uClibc.config                      |    2 +-
 toolchain/helpers.mk                             |    2 --
 toolchain/toolchain-buildroot/Config.in.2        |   10 ----------
 toolchain/toolchain-common.in                    |    3 ---
 toolchain/toolchain-crosstool-ng/Config.in       |   12 ------------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 -------
 toolchain/toolchain-crosstool-ng/uClibc.config   |    3 ++-
 toolchain/toolchain-external/Config.in           |   10 ----------
 toolchain/uClibc/uClibc-0.9.30.config            |    2 +-
 toolchain/uClibc/uClibc-0.9.31.config            |    4 ++--
 toolchain/uClibc/uClibc-0.9.32.config            |    4 ++--
 toolchain/uClibc/uClibc-snapshot.config          |    4 ++--
 toolchain/uClibc/uclibc.mk                       |    7 -------
 19 files changed, 21 insertions(+), 77 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index a7159cf..bfd6f26 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
-	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
@@ -13,5 +13,5 @@ config BR2_PACKAGE_COREUTILS
 
 	  http://www.gnu.org/software/coreutils/
 
-comment "coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
+comment "coreutils requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/tar/Config.in b/package/tar/Config.in
index 20529e3..427cae4 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
-	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
 
 	  http://www.gnu.org/software/tar/
 
-comment "tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
+comment "tar requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 48391e5..67fd413 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	bool "enable all extras"
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_PROGRAM_INVOCATION # usbutils
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
@@ -22,7 +21,7 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	  Enable all extras with external dependencies like
 	  libacl, libusb, libusb-compat, usbutils, hwdata
 
-comment "udev extras requires a toolchain with LARGEFILE/WCHAR/PROGRAM_INVOCATION support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
+comment "udev extras requires a toolchain with LARGEFILE + WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 endif
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index fbd712b..23004d9 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,9 +1,5 @@
-comment "usbutils requires a toolchain with PROGRAM_INVOCATION support"
-	depends on !BR2_PROGRAM_INVOCATION
-
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
-	depends on BR2_PROGRAM_INVOCATION
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b59a31a..c0e15e7 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	depends on BR2_PROGRAM_INVOCATION
 	help
 	  Various useful/essential Linux utilities.
 
@@ -119,5 +118,5 @@ config BR2_PACKAGE_UTIL_LINUX_WRITE
 
 endif
 
-comment "util-linux requires a toolchain with LARGEFILE/WCHAR/PROGRAM_INVOCATION support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
+comment "util-linux requires a toolchain with LARGEFILE + WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/target/xtensa/uClibc-0.9.30.config b/target/xtensa/uClibc-0.9.30.config
index cc6815d..5701fe4 100644
--- a/target/xtensa/uClibc-0.9.30.config
+++ b/target/xtensa/uClibc-0.9.30.config
@@ -84,7 +84,7 @@ UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV3_LEGACY_MACROS=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
 UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 UNIX98PTY_ONLY=y
diff --git a/target/xtensa/uClibc.config b/target/xtensa/uClibc.config
index 546a045..cd82fab 100644
--- a/target/xtensa/uClibc.config
+++ b/target/xtensa/uClibc.config
@@ -75,7 +75,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # UCLIBC_SUSV3_LEGACY is not set
 UCLIBC_SUSV3_LEGACY_MACROS=y
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
 UCLIBC_HAS___PROGNAME=y
 # UNIX98PTY_ONLY is not set
 ASSUME_DEVPTS=y
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 13dbebb..123720b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -148,7 +148,6 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
 	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
-	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
 
 #
 # Check the conformity of Buildroot configuration with regard to the
@@ -194,7 +193,6 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support)
 
 #
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 5df188f..e3fe337 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -41,16 +41,6 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 	  Enable this option if you want your toolchain to support
 	  localization and internationalization.
 
-config BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION
-	bool "Enable 'program invocation name' support"
-	select BR2_PROGRAM_INVOCATION
-	help
-	  Enable this option if you want your toolchain to support the
-	  GNU-specific program_invocation_name and
-	  program_invocation_short_name strings.  Some GNU packages
-	  (like tar and coreutils) utilize these for extra useful
-	  output, but in general are not required.
-
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index bbb7be6..2d11008 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -20,9 +20,6 @@ config BR2_USE_WCHAR
 config BR2_ENABLE_LOCALE
 	bool
 
-config BR2_PROGRAM_INVOCATION
-	bool
-
 config BR2_INSTALL_LIBSTDCPP
 	bool
 
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 3cac808..2d1e801 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -17,7 +17,6 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 	select BR2_INET_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
-	select BR2_PROGRAM_INVOCATION
 
 config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
@@ -26,7 +25,6 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	select BR2_INET_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
-	select BR2_PROGRAM_INVOCATION
 
 endchoice # C library
 
@@ -89,16 +87,6 @@ config BR2_TOOLCHAIN_CTNG_uClibc_LOCALE
 	  Enable this option if you want your toolchain to support
 	  localization and internationalization.
 
-config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
-	bool "Enable 'program invocation name' support"
-	select BR2_PROGRAM_INVOCATION
-	help
-	  Enable this option if you want your toolchain to support the
-	  GNU-specific program_invocation_name and
-	  program_invocation_short_name strings.  Some GNU packages
-	  (like tar and coreutils) utilize these for extra useful
-	  output, but in general are not required.
-
 endif # BR2_TOOLCHAIN_CTNG_uClibc
 
 config BR2_TOOLCHAIN_CTNG_CXX
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index ec6e188..912bb06 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -305,13 +305,6 @@ else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_RPC)=.*:\# \1 is not set:;
 endif
 
-# Handle the program_invocation_name option
-ifneq ($(call qstrip,$(BR2_PROGRAM_INVOCATION)),)
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_PROGRAM_INVOCATION_NAME) is not set:\1=y:;
-else
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_PROGRAM_INVOCATION_NAME)=y:\# \1 is not set:;
-endif
-
 # Instruct CT-NG's .config where to find the uClibc's .config
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
 
diff --git a/toolchain/toolchain-crosstool-ng/uClibc.config b/toolchain/toolchain-crosstool-ng/uClibc.config
index f1163ae..76a3427 100644
--- a/toolchain/toolchain-crosstool-ng/uClibc.config
+++ b/toolchain/toolchain-crosstool-ng/uClibc.config
@@ -109,7 +109,8 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8cd37d4..bedbb53 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -173,7 +173,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	select BR2_INET_IPV6
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
-	select BR2_PROGRAM_INVOCATION
 	select BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Toolchain for the Blackfin architecture, from
@@ -231,7 +230,6 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
-	select BR2_PROGRAM_INVOCATION
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
@@ -300,14 +298,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LOCALE
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
-config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
-	bool "Toolchain has program invocation support?"
-	select BR2_PROGRAM_INVOCATION
-	help
-	  Select this option if your external toolchain has program
-	  invocation support. If you don't know, leave the default
-	  value, Buildroot will tell you if it's correct or not.
-
 config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 	bool "Toolchain has threads support?"
 	select BR2_TOOLCHAIN_HAS_THREADS
diff --git a/toolchain/uClibc/uClibc-0.9.30.config b/toolchain/uClibc/uClibc-0.9.30.config
index 2202b9e..49ac3ef 100644
--- a/toolchain/uClibc/uClibc-0.9.30.config
+++ b/toolchain/uClibc/uClibc-0.9.30.config
@@ -82,7 +82,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
 UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 60b4628..80210c5 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -89,8 +89,8 @@ UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-# UCLIBC_HAS___PROGNAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index 5a7b52a..e9f942d 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -113,8 +113,8 @@ UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_STRICT_HEADERS is not set
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-# UCLIBC_HAS___PROGNAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 34ec0ff..bff7584 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -113,8 +113,8 @@ UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_STRICT_HEADERS is not set
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-# UCLIBC_HAS___PROGNAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 3173ef4..e74012f 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -318,13 +318,6 @@ ifeq ($(BR2_USE_WCHAR),y)
 else
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_PROGRAM_INVOCATION),y)
-	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=y,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=n,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=n,g' $(UCLIBC_DIR)/.oldconfig
-endif
 ifeq ("$(KERNEL_ARCH)","i386")
 	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
-- 
1.7.3.4
