From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Dec 2012 18:13:05 -0800
Subject: [Buildroot] [git commit] {rand,
	allyes}packageconfig: ensure legacy test options don't get enabled
Message-ID: <20121202022805.3BDB89711C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a46d4bf1fe81dc60aca8795d9e2c69a9c252e37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The legacy BR2_PACKAGE_* options in Config.in.legacy are not supposed to
be user selectable, so {rand,allyes}packageconfig shouldn't enable them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index d3f9b40..b394fd5 100644
--- a/Makefile
+++ b/Makefile
@@ -619,6 +619,9 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --randconfig $(CONFIG_CONFIG_IN)
@@ -627,6 +630,9 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allyesconfig $(CONFIG_CONFIG_IN)
