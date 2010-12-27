From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 27 Dec 2010 16:41:55 -0500
Subject: [Buildroot] [PATCH] toolchain: add a USE_MMU build option
Message-ID: <1293486115-19186-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages need to know whether the MMU is in play, so add a toolchain
option to expose the feature to them.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/helpers.mk          |    2 ++
 toolchain/toolchain-common.in |    7 +++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index eb9d742..db7c7f1 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -146,6 +146,7 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
+	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
 	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
 	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
 
@@ -187,6 +188,7 @@ check_uclibc = \
 		exit -1; \
 	fi; \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
+	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index bdc6e76..f53f630 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -66,6 +66,13 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
+config BR2_USE_MMU
+	bool "Enable MMU support"
+	default y
+	help
+	  If your target has a MMU, you should say Y here.  If you
+	  are unsure, just say Y.
+
 config BR2_PREFER_SOFT_FLOAT
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel
-- 
1.7.3.4
