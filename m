From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Oct 2020 21:56:57 +0200
Subject: [Buildroot] [git commit] Makefile: exclude BR2_DL_DIR from
 savedefconfig
Message-ID: <20201021194536.54ABC8392A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36edacce9c2c3b90f9bb11a5d2208e8edf7bbe63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running "make savedefconfig" with BR2_DL_DIR set also saves that
variable, which is only useful in local context.

Signed-off-by: Sven Oliver Moll <buildroot@svol.li>
[yann.morin.1998 at free.fr: wrap line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 384bfe3fe9..d1d19d8f40 100644
--- a/Makefile
+++ b/Makefile
@@ -1027,7 +1027,9 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
-	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
+	@$(SED) '/BR2_DEFCONFIG=/d' \
+		-e '/BR2_DL_DIR=/d' \
+		$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 
 .PHONY: defconfig savedefconfig update-defconfig
 
