From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 16:20:53 -0500
Subject: [Buildroot] [PATCH 3/5] toolchain/toolchain-wrapper: add BR2_SSP_*
 support
In-Reply-To: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535577655-9583-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1535577655-9583-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Migrate the stack protection flag management into the wrapper.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Makefile.in            | 8 --------
 toolchain/toolchain-wrapper.c  | 9 +++++++++
 toolchain/toolchain-wrapper.mk | 8 ++++++++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2e885bf..ed6fd0d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -146,14 +146,6 @@ TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
-ifeq ($(BR2_SSP_REGULAR),y)
-TARGET_HARDENED += -fstack-protector
-else ifeq ($(BR2_SSP_STRONG),y)
-TARGET_HARDENED += -fstack-protector-strong
-else ifeq ($(BR2_SSP_ALL),y)
-TARGET_HARDENED += -fstack-protector-all
-endif
-
 ifeq ($(BR2_RELRO_PARTIAL),y)
 TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 6bea545..7b7fe7f 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -97,6 +97,15 @@ static char *predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
+#ifdef BR_SSP_REGULAR
+	"-fstack-protector",
+#endif
+#ifdef BR_SSP_STRONG
+	"-fstack-protector-strong",
+#endif
+#ifdef BR_SSP_ALL
+	"-fstack-protector-all",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index b0e44b3..15f1a74 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -49,6 +49,14 @@ ifeq ($(BR2_RELRO_FULL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
 endif
 
+ifeq ($(BR2_SSP_REGULAR),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_REGULAR
+else ifeq ($(BR2_SSP_STRONG),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_STRONG
+else ifeq ($(BR2_SSP_ALL),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_ALL
+endif
+
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
-- 
1.9.1
