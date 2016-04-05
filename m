From: Jan Heylen <heyleke@gmail.com>
Date: Tue,  5 Apr 2016 21:45:20 +0200
Subject: [Buildroot] [PATCH v2 3/4] toolchain: add TARGET_LDFLAGS to
	toolchain-wrapper
In-Reply-To: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
Message-ID: <1459885521-25434-3-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

only done for ld-wrapper, LDFLAGS is still set as before for gcc
---
 toolchain/toolchain-wrapper.c  | 3 +++
 toolchain/toolchain-wrapper.mk | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 8d1739c..d6ecf84 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -94,6 +94,9 @@ static char *ld_predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
+#ifdef BR_ADDITIONAL_LDFLAGS
+	BR_ADDITIONAL_LDFLAGS
+#endif
 };
 
 static void check_unsafe_path(const char *path, int paranoid)
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index f868fad..c7cc38e 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -14,9 +14,13 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
-TOOLCHAIN_WRAPPER_OPTS = \
+TOOLCHAIN_WRAPPER_CFLAGS_OPTS = \
 	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
-TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
+TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_CFLAGS_OPTS)'
+
+TOOLCHAIN_WRAPPER_LDFLAGS_OPTS = \
+	$(foreach f,$(subst -Wl$(comma),$(empty),$(call qstrip,$(BR2_TARGET_LDFLAGS))),"$(f)"$(comma))
+TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_LDFLAGS='$(TOOLCHAIN_WRAPPER_LDFLAGS_OPTS)'
 
 ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
-- 
2.5.0
