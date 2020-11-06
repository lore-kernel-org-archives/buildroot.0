From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Nov 2020 23:54:02 +0100
Subject: [Buildroot] [git commit] Revert "Makefile: exclude BR2_DL_DIR from
 savedefconfig"
Message-ID: <20201106224520.ACAF3853AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1482ef6bb8209044372ebcaf07081524f9b486fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although BR2_DL_DIR is indeed a site-local setting, which does not
actually define the target system, we've had it in the tree for a
long time now, and people have been depending on it for a variety
of use-cases.

Furthermore, BR2_DL_DIR is far from the only such site-local setting,
BR2_CCACHE_DIR springs to mind, and in the less-obvious category, we
can also find BR2_JLEVEL, but also BR2_WGET, BR2_SVN, BR2_GIT et al.
as they may be tweaked to set the timeout, number of retries or so on
to work around stupid proxies. But of course, the most local site-local
setting is probably BR2_PACKAGE_OVERRIDE_FILE, with its default value
being explicitly just 'local.mk'.

Ideally, we would like to have a clear separation between the
configuration that actually defines the target system on one hand,
and the site-local settings that drive and control how the build is
performed, on the other hand. This is by far a much bigger endeavour
than just dropping BR2_DL_DIR from the saved defconfig.

This reverts commit 36edacce9c2c3b90f9bb11a5d2208e8edf7bbe63 (adapted
to keep the fix from 1a7873ec986c817fdd22cc2d9096d9482fee4381).

Closes: #13291

Note: thanks to Thomas; some phrasing above was borrowed from a
discussion with him.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Lance Fredrickson <lancethepants@gmail.com>
Cc: Sven Oliver Moll <buildroot@svol.li>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5dc402e73e..f9e9cfa968 100644
--- a/Makefile
+++ b/Makefile
@@ -1027,9 +1027,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
-	@$(SED) '/^BR2_DEFCONFIG=/d' \
-		-e '/^BR2_DL_DIR=/d' \
-		$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
+	@$(SED) '/^BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 
 .PHONY: defconfig savedefconfig update-defconfig
 
