From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:45 +0100
Subject: [Buildroot] [PATCH 05/16] Expand external toolchain wrapper to
	custom flags
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4d82d25fb84a14bacb50249e1f9554a28e60cbdc.1327772176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_TARGET_OPTIMIZATION flags were not used by the external
toolchain wrapper, which broke the multilib selection logic of
multilib external toolchains. It also simplifies the compilation of
external programs since all flags are properly passed automatically by
the toolchain wrapper.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk           |    8 ++++++++
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index eb8ed4f..dde6f22 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -150,6 +150,14 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
 
+ifneq ($(BR2_TARGET_OPTIMIZATION),)
+TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+# We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
+# flag is a separate argument when used in execv() by the external
+# toolchain wrapper.
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
+endif
+
 ifeq ($(BR2_SOFT_FLOAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index cc404f3..719f13b 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -40,6 +40,9 @@ static char *predef_args[] = {
 #ifdef BR_VFPFLOAT
 	"-mfpu=vfp",
 #endif /* BR_VFPFLOAT */
+#ifdef BR_ADDITIONAL_CFLAGS
+	BR_ADDITIONAL_CFLAGS
+#endif
 };
 
 static const char *get_basename(const char *name)
-- 
1.7.4.1
