From: Samuel MARTIN <s.martin49@gmail.com>
Date: Mon,  5 Mar 2012 22:04:21 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: enforce toolchainfile.cmake
	consistency with the actual toolchain
Message-ID: <1330981461-4377-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes the toolchainfile.cmake generated after the toolchain
generation or import and checks (depending on the backend used).

This ensures the correctness and consistency between the actual
toolchain and the toolchainfile.cmake file describing it.

This also makes the toolchainfile.cmake generated when building the
target 'cross'.

Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d508888..fbc34bc 100644
--- a/Makefile
+++ b/Makefile
@@ -362,13 +362,15 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
+BASE_TARGETS += $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+$(BASE_TARGETS): dirs
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
-- 
1.7.9.2
