From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Jun 2015 13:54:26 +0200
Subject: [Buildroot] [git commit] savedefconfig: Remove BR2_DEFCONFIG from
	saved defconfig file
Message-ID: <20150606115442.C82AF7F933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f71a621d91ec27f175fc84012962f88b1107305f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_DEFCONFIG should not be present in saved defconfig file.

The use case is:
make qemu_arm_versatile
make savedefconfig BR2_DEFCONFIG=my_custom_defconfig

BR2_DEFCONFIG is set in my_custom_defconfig with an absolute path
to qemu_arm_versatile (value present in .config) and set in
my_custom_defconfig as it is different from default mentioned in
config.in (default is BR2_DEFCONFIG from environment).

On savedefconfig recipe, simply remove BR2_DEFCONFIG from generated file

[Peter: fixup typos and use SED as noted by Arnout]
Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 43b5ba5..d3f80c4 100644
--- a/Makefile
+++ b/Makefile
@@ -777,6 +777,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
+	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 
 .PHONY: defconfig savedefconfig
 
