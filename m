From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 22:34:44 -0500
Subject: [Buildroot] [PATCH v2 4/5] toolchain/toolchain-wrapper: add
 BR2_FORTIFY_SOURCE_* support
In-Reply-To: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1535600085-31526-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Migrate the fortify flag management into the wrapper.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Makefile.in            | 6 ------
 toolchain/toolchain-wrapper.c  | 6 ++++++
 toolchain/toolchain-wrapper.mk | 6 ++++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ed6fd0d..d1f9789 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -155,12 +155,6 @@ TARGET_HARDENED += $(TARGET_CFLAGS_RELRO_FULL)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO_FULL) -DBR_SET_PIE
 endif
 
-ifeq ($(BR2_FORTIFY_SOURCE_1),y)
-TARGET_HARDENED += -D_FORTIFY_SOURCE=1
-else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
-TARGET_HARDENED += -D_FORTIFY_SOURCE=2
-endif
-
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 6c5ea1a..a2d5f1d 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -106,6 +106,12 @@ static char *predef_args[] = {
 #ifdef BR_SSP_ALL
 	"-fstack-protector-all",
 #endif
+#ifdef BR_FORTIFY_SOURCE_1
+	"-D_FORTIFY_SOURCE=1",
+#endif
+#ifdef BR_FORTIFY_SOURCE_2
+	"-D_FORTIFY_SOURCE=2",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 15f1a74..8b8db8b 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -57,6 +57,12 @@ else ifeq ($(BR2_SSP_ALL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_ALL
 endif
 
+ifeq ($(BR2_FORTIFY_SOURCE_1),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_FORTIFY_SOURCE_1
+else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_FORTIFY_SOURCE_2
+endif
+
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
-- 
1.9.1
