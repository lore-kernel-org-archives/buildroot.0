From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 16 Feb 2011 00:41:42 +0100
Subject: [Buildroot] [PATCH] toolchain/ct-ng: use program_invocation_name
	option from BR config
Message-ID: <1297813302-8293-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index d066e98..8db8eac 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -301,6 +301,13 @@ else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_RPC)=.*:\# \1 is not set:;
 endif
 
+# Handle the program_invocation_name option
+ifneq ($(call qstrip,$(BR2_PROGRAM_INVOCATION)),)
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_PROGRAM_INVOCATION_NAME) is not set:\1=y:;
+else
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_PROGRAM_INVOCATION_NAME)=y:\# \1 is not set:;
+endif
+
 # Instruct CT-NG's .config where to find the uClibc's .config
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
 
-- 
1.7.2.3
