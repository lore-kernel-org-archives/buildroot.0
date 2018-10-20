From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 12:51:21 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: add BR2_SSP_*
 support
Message-ID: <20181020113218.621C883AB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f10822d151085bcbfecd0ecf2542ac5f5623fd9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate the stack protection flag management into the wrapper.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in            | 8 --------
 toolchain/toolchain-wrapper.c  | 9 +++++++++
 toolchain/toolchain-wrapper.mk | 8 ++++++++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index cd2148270a..dc0eecf1d5 100644
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
index c73a0cc079..e9c5cd9d32 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -98,6 +98,15 @@ static char *predef_args[] = {
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
index 99d303975c..613f5f6c56 100644
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
