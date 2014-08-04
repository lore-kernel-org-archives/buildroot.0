From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Aug 2014 19:24:56 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: do not rebuild kconfig
	packages again and again
In-Reply-To: <cover.1407172590.git.yann.morin.1998@free.fr>
References: <cover.1407172590.git.yann.morin.1998@free.fr>
Message-ID: <fb48537ba04cc50d1f8043e5e347dedcdd5ba671.1407172590.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a kconfig-based package executes its confiigure step, it may
overwrite it .config file. Thus, the .config file is more recent than
our stamp file .stamp_kconfig_fixup_done. On a subsequent build, out
dependency rules would kick in, and run the config fixup again, thus
kikcing in the package's configure, build and isntall steps yet once
more, that, ad libitum.

Fix that by introducing a post-configure hook that re-touches our stamp
file, so it is always more recent than the .config.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8b777f1..16cc154 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -55,6 +55,16 @@ $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
+# During their configure steps, some kconfig packages may regenerate their
+# .config file, thus making it more recent than our .stamp_kconfig_fixup_done
+# stamp file; thus, on a subsequent build, the package will be reconfigured
+# and rebuilt, re-installed, again and again...
+# Work around this by re-touching our stamp file after the configure step.
+define KCONFIG_RETOUCH_FIXUP_STAMP_HOOK
+	$$(Q)touch $$(@D)/.stamp_kconfig_fixup_done
+endef
+$(2)_POST_CONFIGURE_HOOKS += KCONFIG_RETOUCH_FIXUP_STAMP_HOOK
+
 # Configuration editors (menuconfig, ...)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-- 
1.9.1
