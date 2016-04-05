From: Jan Heylen <heyleke@gmail.com>
Date: Tue,  5 Apr 2016 21:45:19 +0200
Subject: [Buildroot] [PATCH v2 2/4] toolchain: add option to specify ld
	emulation
In-Reply-To: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
Message-ID: <1459885521-25434-2-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, such as MIPS, the linker supports several 'ld
emulation', and depending on which flavor of the architecture you're
building for, one should be passing the proper -m <something> option
to ld, otherwise ld defaults to the default emulation, which may not
necessarily be compatible with the object files that are being
linked.

Add this new option to the ld toolchain-wrapper.

Based upon patch from Thomas Petazzoni:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942
---
 arch/Config.in                 | 3 +++
 toolchain/toolchain-wrapper.c  | 3 +++
 toolchain/toolchain-wrapper.mk | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 3f1453f..3b022fe 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -265,6 +265,9 @@ config BR2_GCC_TARGET_CPU
 config BR2_GCC_TARGET_CPU_REVISION
 	string
 
+config BR2_LD_TARGET_EMULATION
+	string
+
 # The value of this option will be passed as --with-fpu=<value> when
 # building gcc (internal backend) or -mfpu=<value> in the toolchain
 # wrapper (external toolchain)
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index ec069da..8d1739c 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -82,6 +82,9 @@ static char *gcc_predef_args[] = {
 
 static char *ld_predef_args[] = {
 	path,
+#ifdef BR_LD_EMULATION
+	"-m", BR_LD_EMULATION,
+#endif
 #ifdef BR_BINFMT_FLAT
 	"-elf2flt",
 #endif
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..f868fad 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -30,6 +30,11 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+LD_TARGET_EMULATION_ = $(call qstrip,$(BR2_LD_TARGET_EMULATION))
+ifneq ($(LD_TARGET_EMULATION_),)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_LD_EMULATION='"$(LD_TARGET_EMULATION_)"'
+endif
+
 # For simplicity, build directly into the install location
 define TOOLCHAIN_BUILD_WRAPPER
 	$(Q)mkdir -p $(HOST_DIR)/usr/bin
-- 
2.5.0
