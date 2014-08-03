From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 17:32:39 +0200
Subject: [Buildroot] [PATCH 1/5 v4] uclibc: fixup config before calling
	menuconfig
In-Reply-To: <cover.1407079864.git.yann.morin.1998@free.fr>
References: <cover.1407079864.git.yann.morin.1998@free.fr>
Message-ID: <ccddabc563ba8f41ebc4e59950a21f133f4eeb76.1407079864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>

The uclibc-menuconfig command is currently run based on the user-specified
config file, while the fixup of the config file is done afterwards.
However, it makes more sense to do an initial fixup _before_ running
menuconfig, so that the options presented to the user are consistent with
the final configuration.

This patch changes the dependency of the menuconfig target from .config to
.stamp_config_fixup_done to achieve this.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e7749af..80a88a4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -542,7 +542,7 @@ $(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
 
 $(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
 
-uclibc-menuconfig: $(UCLIBC_DIR)/.config
+uclibc-menuconfig: $(UCLIBC_DIR)/.stamp_config_fixup_done
 	$(MAKE) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
-- 
1.9.1
