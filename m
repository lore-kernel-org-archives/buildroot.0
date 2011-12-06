From: Will Wagner <will_wagner@carallon.com>
Date: Tue,  6 Dec 2011 12:17:17 +0000
Subject: [Buildroot] [PATCH v2 1/4] Allow user to pick uClibc version when
	using ct-ng
In-Reply-To: <1323173840-8837-1-git-send-email-will_wagner@carallon.com>
References: <1323173840-8837-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1323173840-8837-2-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/Config.in       |   15 +++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 +++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 2d1e801..9329959 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -50,6 +50,21 @@ if BR2_TOOLCHAIN_CTNG_uClibc
 
 comment "Toolchain Options"
 
+choice
+	prompt "uClibc C library Version"
+	default BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+	help
+	  Select the version of uClibc you wish to use.
+
+	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+		depends on BR2_DEPRECATED
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
index 3a205dd..080128d 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -267,6 +267,13 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 # uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
+# Set version
+ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),y)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V_)(.+)=y$$:\# \1\2 is not set\n\10_9_32=y:;
+else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),y)
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V_)(.+)=y$$:\# \1\2 is not set\n\10_9_30_3=y:;
+endif
+
 # Handle the locales option
 ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
-- 
1.7.2.5
