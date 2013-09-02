From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:36 +0200
Subject: [Buildroot] [PATCHv2 10/14] toolchain: refactor Stack Smashing
	Protection support
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit refactors how Stack Smashing Protection support is handled
in Buildroot:

 *) It turns the BR2_TOOLCHAIN_BUILDROOT_USE_SSP option into an option
    that only enables the SSP support in uClibc, when using the internal
    toolchain backend.

 *) It adds an hidden BR2_TOOLCHAIN_HAS_SSP option that gets enabled
    when the toolchain has SSP support. Here we have the usual dance:
    glibc/eglibc in internal/external backend always select this
    option, in the case of uClibc/internal, it gets selected when
    BR2_TOOLCHAIN_BUILDROOT_USE_SSP is enabled, in the case of
    uClibc/external, there is a new configuration option that the user
    must select (or not) depending on whether the toolchain has SSP
    support.

 *) It adds a new options BR2_ENABLE_SSP in the "Build options" menu,
    to enable the usage of SSP support, by adding
    -fstack-protector-all to the CFLAGS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                 | 17 +++++++++++++++++
 package/Makefile.in                       |  2 +-
 package/psmisc/psmisc.mk                  |  4 ++--
 package/uclibc/Config.in                  | 10 ++++++++++
 toolchain/Config.in                       |  1 +
 toolchain/helpers.mk                      |  3 ++-
 toolchain/toolchain-buildroot/Config.in.2 |  9 ---------
 toolchain/toolchain-common.in             |  3 +++
 toolchain/toolchain-external/Config.in    |  9 +++++++++
 9 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
index cb246a4..8046d6e 100644
--- a/Config.in
+++ b/Config.in
@@ -398,6 +398,23 @@ config BR2_OPTIMIZE_S
 
 endchoice
 
+config BR2_ENABLE_SSP
+	bool "build code with Stack Smashing Protection"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Enable stack smashing protection support using GCCs
+	  -fstack-protector-all option.
+
+	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+          for details.
+
+	  Note that this requires the toolchain to have SSP
+	  support. This is always the case for glibc and eglibc
+	  toolchain, but is optional in uClibc toolchains.
+
+comment "enabling Stack Smashing Protection requires support in the toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_SSP
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index 0b1c33a..3eaa2b2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -129,7 +129,7 @@ TARGET_CFLAGS += -msep-data
 TARGET_CXXFLAGS += -msep-data
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
+ifeq ($(BR2_ENABLE_SSP),y)
 TARGET_CFLAGS += -fstack-protector-all
 TARGET_CXXFLAGS += -fstack-protector-all
 endif
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 1340ee6..c18ba94 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -10,8 +10,8 @@ PSMISC_LICENSE = GPLv2
 PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
-# Don't force -fstack-protector
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+# Don't force -fstack-protector when SSP is not available in toolchain
 PSMISC_CONF_OPT = --disable-harden-flags
 endif
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 037ca01..eeb3b83 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -130,6 +130,16 @@ config BR2_PTHREAD_DEBUG
 	help
 	  Build the thread library with debugging enabled.
 
+config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
+	bool "Enable stack protection support"
+	select BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Enable stack smashing protection support using GCCs
+	  -fstack-protector-all option in uClibc.
+
+	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  for details.
+
 config BR2_UCLIBC_INSTALL_UTILS
 	bool "Compile and install uClibc utilities"
 	depends on !BR2_bfin
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 64cdf81..da9cd68 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -18,6 +18,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
 
 config BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 44b6018..0e270ee 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -258,7 +258,8 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
-	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support)
+	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_SSP__,BR2_TOOLCHAIN_HAS_SSP,$${UCLIBC_CONFIG_FILE},Stack Smashing Protection support)
 
 #
 # Check that the Buildroot configuration of the ABI matches the
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 1371c31..df26079 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -4,15 +4,6 @@ if BR2_TOOLCHAIN_BUILDROOT
 
 comment "Toolchain Options"
 
-config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
-	bool "Enable stack protection support"
-	help
-	  Enable stack smashing protection support using GCCs
-	  -fstack-protector-all option.
-
-	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
-	  for details.
-
 source "package/elf2flt/Config.in.host"
 
 endif
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index dc3bd2a..1085fb3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -32,6 +32,9 @@ config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	bool
 
+config BR2_TOOLCHAIN_HAS_SSP
+	bool
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ad1f203..11edc98 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -921,6 +921,15 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 	  debugging support. If you don't know, leave the default
 	  value, Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
+	bool "Toolchain has SSP support?"
+	select BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Selection this option if your external toolchain has Stack
+	  Smashing Protection support enabled. If you don't know,
+	  leave the default value, Buildroot will tell you if it's
+	  correct or not.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
-- 
1.8.1.2
