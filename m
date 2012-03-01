From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 20:26:37 +0100
Subject: [Buildroot] [git commit] Expand external toolchain wrapper to
	custom flags
Message-ID: <20120306223951.864E890D18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b95e436ee0c9e4638dc79766da0d17927c6641ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
