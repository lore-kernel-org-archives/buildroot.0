From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 31 Aug 2019 23:31:12 +0530
Subject: [Buildroot] [PATCH v2 1/2] toolchain/toolchain-wrapper: explicitly
 set Build ID to none if BR2_REPRODUCIBLE
Message-ID: <20190831180113.16025-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build ID is added to binaries at link time. Building in different output
directories causes some packages to have different Build IDs, thus resulting in
non-reproducibility.

Adding "-Wl,--build-id=none" fixes this issue by disabling setting of Build ID.

Diffoscope output for Build ID issue: https://gitlab.com/snippets/1886180/raw

After this patch, build is reproducible - i.e. diffoscope does not produce any
output.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - Handle inside toolchain-wrapper.mk instead of both .mk and .c
---
 toolchain/toolchain-wrapper.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 970bde76a0..88695a5b2d 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -21,6 +21,10 @@ TOOLCHAIN_WRAPPER_OPTS = \
 	$(call qstrip,$(BR2_SSP_OPTION)) \
 	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
+endif
+
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
 TOOLCHAIN_WRAPPER_ARGS += \
-- 
2.22.0
