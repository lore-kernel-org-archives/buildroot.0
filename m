From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 22:49:00 +0100
Subject: [Buildroot] [git commit] core: allow external defconfigs to be used
Message-ID: <20131208220309.54EAA9BE91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff9d6e306032a680e9db43673d9ab57db7d1bf75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the user to store defconfigs in
$BR2_EXTERNAL/configs/. To achieve this:

 * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
   the corresponding defconfig file.

 * Updates the help target to also list external defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Tested-by: "Samuel Martin" <s.martin49@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 09bc83a..d52182e 100644
--- a/Makefile
+++ b/Makefile
@@ -741,6 +741,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
@@ -849,8 +853,15 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
+	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
+	@echo
+	@echo 'User-provided configs:'
+	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+endif
 	@echo
 	@echo 'See docs/README, or generate the Buildroot manual for further details'
 	@echo
