From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 17 Sep 2018 14:06:39 -0500
Subject: [Buildroot] [PATCH v6 2/4] toolchain/toolchain-wrapper: add
 BR2_SSP_* support
In-Reply-To: <1537211201-35917-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537211201-35917-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537211201-35917-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Migrate the stack protection flag management into the wrapper.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes

v2 -> v6
 - Rebased, nothing functional

v1 -> v2
 - None.
---
 package/Makefile.in            | 8 --------
 toolchain/toolchain-wrapper.c  | 9 +++++++++
 toolchain/toolchain-wrapper.mk | 8 ++++++++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index cd21482..dc0eecf 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -143,14 +143,6 @@ endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
-ifeq ($(BR2_SSP_REGULAR),y)
-TARGET_HARDENED += -fstack-protector
-else ifeq ($(BR2_SSP_STRONG),y)
-TARGET_HARDENED += -fstack-protector-strong
-else ifeq ($(BR2_SSP_ALL),y)
-TARGET_HARDENED += -fstack-protector-all
-endif
-
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index b607ecf..ff4e0e5 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -99,6 +99,15 @@ static char *predef_args[] = {
 	"-EB",
 #endif
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
index 99d3039..613f5f6 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -51,6 +51,14 @@ else ifeq ($(BR2_RELRO_FULL),y)
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
