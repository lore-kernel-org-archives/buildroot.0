From: Will Wagner <will_wagner@carallon.com>
Date: Mon,  5 Dec 2011 18:08:15 +0000
Subject: [Buildroot] [PATCH 1/4] Allow user to pick uClibc version when
	using ct-ng
In-Reply-To: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1323108498-2398-2-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 toolchain/toolchain-crosstool-ng/Config.in       |   14 ++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 +++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 2d1e801..e774caf 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -50,6 +50,20 @@ if BR2_TOOLCHAIN_CTNG_uClibc
 
 comment "Toolchain Options"
 
+choice
+	prompt "uClibc C library Version"
+	default BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+	help
+	  Select the version of uClibc you wish to use.
+
+	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+		bool "uClibc 0.9.30.x"
+
+	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
+		bool "uClibc 0.9.32.x"
+
+endchoice
+
 config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
 	bool "Enable large file (files > 2 GB) support"
 	select BR2_LARGEFILE
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 3a205dd..192c6ff 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -267,6 +267,13 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 # uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
+# Set version
+ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),y)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V)(.+)=y$$:\# \1\2 is not set\n\1_0_9_32=y:;
+else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),y)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V)(.+)=y$$:\# \1\2 is not set\n\1_0_9_30_3=y:;
+endif
+
 # Handle the locales option
 ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
-- 
1.7.2.5
