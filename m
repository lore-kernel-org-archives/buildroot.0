From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 17:45:13 +0100
Subject: [Buildroot] [PATCH 10/10] toolchain/crosstool-NG: use RPC option
In-Reply-To: <1290876313-15131-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1290876313-15131-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1290876313-15131-11-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Push the RPC option down to uClibc config

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 8630cb9..a05c40a 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -252,6 +252,15 @@ else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_IPV6)=.*:\# \1 is not set:;
 endif
 
+# Handle the RPC option
+ifneq ($(call qstrip,$(BR2_INET_RPC)),)
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_RPC) is not set:\1=y\nUCLIBC_HAS_FULL_RPC=y\nUCLIBC_HAS_REENTRANT_RPC=y:;
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_FULL_RPC) is not set:\1=y:;
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_REENTRANT_RPC) is not set:\1=y:;
+else
+CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_RPC)=.*:\# \1 is not set:;
+endif
+
 # Instruct CT-NG's .config where to find the uClibc's .config
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
 
-- 
1.7.1
