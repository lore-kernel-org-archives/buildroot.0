From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 15:29:27 +0200
Subject: [Buildroot] [git commit] Fix PROGRAM_INVOCATION handling with
	external toolchains
Message-ID: <20090731133251.9C4F477828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d880c3e5c68bea752c2a075d0ef0c64805df93f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_UCLIBC_PROGRAM_INVOCATION is a toolchain configuration option,
like BR2_INET_IPV6, BR2_INET_RPC, on which some packages
depend. Therefore, it should be handled like BR2_INET_IPV6 and
BR2_INET_RPC in order to work properly with external toolchains.

Since we move it out of toolchain/uClibc/Config.in into
toolchain/Config.in.2, we rename the option to BR2_PROGRAM_INVOCATION
(since BR2_INET_RPC and others don't have UCLIBC in their name).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/Config.in              |    4 ++--
 package/tar/Config.in                    |    4 ++--
 target/generic/Config.in                 |    4 ++--
 toolchain/Config.in.2                    |   10 ++++++++++
 toolchain/external-toolchain/ext-tool.mk |    4 +++-
 toolchain/uClibc/Config.in               |    8 --------
 toolchain/uClibc/uclibc.mk               |    2 +-
 7 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 5dfe43c..a7159cf 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
-	depends on BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
@@ -14,4 +14,4 @@ config BR2_PACKAGE_COREUTILS
 	  http://www.gnu.org/software/coreutils/
 
 comment "coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)
+	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
diff --git a/package/tar/Config.in b/package/tar/Config.in
index a257949..20529e3 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
-	depends on BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TAR
 	  http://www.gnu.org/software/tar/
 
 comment "tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)
+	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 5f5110c..5de5811 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -18,7 +18,7 @@ config BR2_TARGET_GENERIC_FIREWALL
 
 config BR2_TARGET_GENERIC_DEV_SYSTEM
 	bool "Generic development system"
-	depends on BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
 	select BR2_CCACHE
 	select BR2_PACKAGE_GDB
 	select BR2_PACKAGE_GDB_SERVER
@@ -59,7 +59,7 @@ config BR2_TARGET_GENERIC_DEV_SYSTEM
 	  Board support for a generic development system.
 
 comment "Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)
+	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
 
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Generic serial port config"
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 5df04e0..2a9ce24 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -119,6 +119,16 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 endchoice
 
+config BR2_PROGRAM_INVOCATION
+	bool "Enable 'program invocation name'"
+	help
+	  Support for the GNU-specific program_invocation_name and
+	  program_invocation_short_name strings.  Some GNU packages
+	  (like tar and coreutils) utilize these for extra useful
+	  output, but in general are not required.
+	  If you have an external binary toolchain that has been built
+	  with program invocation support then enable this option.
+
 config BR2_GCC_CROSS_CXX
 	bool
 	help
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index d441a92..568ac3a 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -115,7 +115,8 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
-	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
+	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
+	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
 
 #
 # Check the conformity of Buildroot configuration with regard to the
@@ -160,6 +161,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
 
 #
 # Check that the Buildroot configuration of the ABI matches the
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index b7678a3..d0486ab 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -68,14 +68,6 @@ config BR2_PTHREAD_DEBUG
 	help
 	  Build the thread library with debugging enabled.
 
-config BR2_UCLIBC_PROGRAM_INVOCATION
-	bool "Enable 'program invocation name'"
-	help
-	  Support for the GNU-specific program_invocation_name and
-	  program_invocation_short_name strings.  Some GNU packages
-	  (like tar and coreutils) utilize these for extra useful
-	  output, but in general are not required.
-
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
 	select BR2_PACKAGE_MAKE
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 80d7d98..de8e1d5 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -353,7 +353,7 @@ ifeq ($(BR2_USE_WCHAR),y)
 else
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_UCLIBC_PROGRAM_INVOCATION),y)
+ifeq ($(BR2_PROGRAM_INVOCATION),y)
 	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=n,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.6.3.3
