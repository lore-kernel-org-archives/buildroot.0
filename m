From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Nov 2011 14:26:52 +0100
Subject: [Buildroot] [git commit] gdb: fix kconfig dependency handling with
	!BR_TOOLCHAIN_BUILDROOT
Message-ID: <20111124134059.5A2918F66D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5931db0de902d2da434fbf682d4177e3b3c7e31b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of GDB need pthread debugging support if threads are
enabled, which is always the case for glibc but is a configure option
for uClibc.

We have solved this for internal toolchains by selecting the
BR2_PTHREAD_DEBUG option from the GDB selection if needed, but as this
option isn't available when ctng/external toolchains are used, mconf
prints ugly warnings and the build may fail if an external uClibc
toolchain without pthread debugging support is used.

Fix it by introducing 2 more hidden config options:
 - BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 - BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED

The first tells us if the toolchain HAS pthreads debugging support,
and is checked by check_uclibc_feature in helper.mk for external uClibc
based toolchains.

The second tells us if the toolchain is ABLE TO provide pthreads debugging
support if threads are enabled, either because it's an internal toolchain
where we can force enable it or an external glibc/eglibc toolchain or
uClibc with the option enabled.

Crosstool-ng forcibly enables this support, so those will always work.
The preconfigured uClibc-based toolchains we have also all enable it.

Finally, show a comment if this isn't the case so the (external toolchain)
user knows why. This is placed outside the choice option, as menuconfig
has a bug where it doesn't show choice selections which only contain
comments.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in                    |    2 ++
 toolchain/gdb/Config.in                |   16 ++++++++++++----
 toolchain/helpers.mk                   |    3 ++-
 toolchain/toolchain-common.in          |    8 ++++++++
 toolchain/toolchain-external/Config.in |   14 ++++++++++++++
 5 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5ff2a91..2f4709a 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -11,6 +11,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -22,6 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
 	  ( http://ymorin.is-a-geek.org/projects/crosstool )
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 2a2844a..9868580 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -52,25 +52,33 @@ choice
 		bool "gdb 7.0.1"
 		depends on !BR2_bfin
 		depends on BR2_DEPRECATED
-		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
 	config BR2_GDB_VERSION_7_1
 		bool "gdb 7.1"
 		depends on !BR2_bfin
-		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
 	config BR2_GDB_VERSION_7_2
 		bool "gdb 7.2.x"
 		depends on !BR2_bfin
-		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
 	config BR2_GDB_VERSION_7_3
 		bool "gdb 7.3.x"
 		depends on !BR2_bfin
-		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
 endchoice
 
+comment "gdb 7.x support needs pthread debug support in toolchain"
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+
 config BR2_GDB_VERSION
 	string
 	default "6.6a"     if BR2_GDB_VERSION_6_6
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 96919d4..65cc998 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -195,7 +195,8 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support)
+	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
+	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support)
 
 #
 # Check that the Buildroot configuration of the ABI matches the
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2d11008..56ac85f 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -26,6 +26,14 @@ config BR2_INSTALL_LIBSTDCPP
 config BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
+config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+	bool
+
+config BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+	default y if !BR2_TOOLCHAIN_HAS_THREADS
+	bool
+
 config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	bool
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 678babd..eadfe50 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -175,6 +175,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
@@ -191,6 +192,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
@@ -224,6 +226,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -285,6 +288,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -361,6 +365,16 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
+	bool "Toolchain has threads debugging support?"
+	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	default y
+	help
+	  Select this option if your external toolchain has thread
+	  debugging support. If you don't know, leave the default
+	  value, Buildroot will tell you if it's correct or not.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CXX
