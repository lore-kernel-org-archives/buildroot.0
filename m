From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:39:01 +0100
Subject: [Buildroot] [git commit branch/next] toolchain: introduce a
	toolchain knob for NPTL
Message-ID: <20140222224511.668469B2E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c64f948d2c7c2aaf61b8a45880eb9715b6cc9bb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As our architecture support expands to a number of architectures that
do not implement NPTL threading, and the number of packages that
depend on NPTL specific features, it has become necessary to be able
to know whether the toolchain has NPTL support or not.

This commit adds a new BR2_TOOLCHAIN_HAS_THREADS_NPTL hidden Config.in
option that allows packages to know whether NPTL is available or not.

This hidden option is:

 * Automatically enabled when glibc/eglibc or musl toolchains are
   used, either internal or external.

 * Automatically enabled when an internal uClibc toolchain with NPTL
   support is configured. It is left disabled otherwise for internal
   uClibc toolchains.

 * Configured according to a visible Config.in option for custom
   external uClibc toolchains.

[Peter: factor _EXTERNAL_HAS_THREADS in single if as suggested by Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in               |    1 +
 toolchain/Config.in                    |    2 ++
 toolchain/helpers.mk                   |    1 +
 toolchain/toolchain-common.in          |    3 +++
 toolchain/toolchain-external/Config.in |   15 ++++++++++++++-
 5 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 860e410..2b93660 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -124,6 +124,7 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on !BR2_arc
 		depends on !BR2_avr32
 		depends on !BR2_bfin
diff --git a/toolchain/Config.in b/toolchain/Config.in
index bbfd367..44f3ac6 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_SSP
 
@@ -23,6 +24,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 choice
 	prompt "Toolchain type"
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index faa9d90..892ab4b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -268,6 +268,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
 	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS_NATIVE__,BR2_TOOLCHAIN_HAS_THREADS_NPTL,$${UCLIBC_CONFIG_FILE},NPTL thread support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_SSP__,BR2_TOOLCHAIN_HAS_SSP,$${UCLIBC_CONFIG_FILE},Stack Smashing Protection support)
 
 #
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 8435a65..c4e3890 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -29,6 +29,9 @@ config BR2_TOOLCHAIN_HAS_THREADS
 config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	bool
 
+config BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	bool
+
 config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	bool
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f02f89b..90bcc3b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -996,9 +996,10 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+if BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+
 config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 	bool "Toolchain has threads debugging support?"
-	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	default y
 	help
@@ -1006,6 +1007,18 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 	  debugging support. If you don't know, leave the default
 	  value, Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
+	bool "Toolchain has NPTL threads support?"
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	default y
+	help
+	  Select this option if your external toolchain uses the NPTL
+	  (Native Posix Thread Library) implementation of Posix
+	  threads. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+endif # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
+
 config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	bool "Toolchain has SSP support?"
 	select BR2_TOOLCHAIN_HAS_SSP
