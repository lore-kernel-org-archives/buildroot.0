From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:43 +0100
Subject: [Buildroot] [PATCH 03/10] kconfig infra: make
	update-config/defconfig handling symmetrical
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <a853a72effde3f2934c2efdd34692a7b221011e2.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Replace a 'cp --preserve' with a 'touch --reference' so that the code
for foo-update-config and foo-update-defconfig is symmetrical to ease
maintainability and increase clarity.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index db56b7a..f76c7a7 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -78,8 +78,11 @@ $(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 		$$($(2)_KCONFIG_OPTS) savedefconfig
 
 # Target to copy back the configuration to the source configuration file
+# Even though we could use 'cp --preserve-timestamps' here, the separate
+# cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	cp --preserve=timestamps -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
 # Note: make sure the timestamp of the stored configuration is not newer than
 # the .config to avoid a useless rebuild. Note that, contrary to
-- 
1.9.1
