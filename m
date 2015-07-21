From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Jul 2015 22:23:54 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: do not override @D
Message-ID: <1437510234-19303-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we override @D for the kconfig configurators, so the fixup
commands can use $(@D); otherwise @D would be simply '.' because it is
not a real file in the package build dir.

However, this breaks the soon-to-be-introduced linux-backports package,
which needs to have a dependency on the linux package to be configured.

The underlying reason is that @D is an automatic variable that is always
set by make to the directory part of the target of the rule. However,
automatic variables loose their "automatic" property when they are
manually set.

Furthermore, a variable that is defined for a rule is inherited by all
dependencies of that rule, so our manually-set @D is inherited all the
way down the dependency chain of linux-backports, down to the linux' own
.config rule, which is thus run with @D pointing to linux-backports'
build dir, not linux'.

Fix that by using a "static pattern rule", redirecting the configurators
to an intermediate stamp-like file which path is in the package build
dir, so we get a valid @D from the onset, without having to manually
fiddle with it.

Thanks to Arnout for suggesting that in the first place. Sorry I did
reject it as "too complex" when it was in fact the best solution.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-kconfig.mk | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 3e17a70..7b3d359 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -104,15 +104,16 @@ endif
 # that is clean wrt. our requirements.
 #
 # Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
-# fake it for the configurators (otherwise it is set to just '.', i.e.
-# the current directory where make is run, which happens to be in
-# $(TOPDIR), because the target of the rule is not an actual file, so
-# does not have any path component).
+# need to have a valid @D set. But, because the configurators rules are
+# not real files and do not contain the path to the package build dir,
+# @D would be just '.' in this case. So, we use an intermediate rule
+# with a stamp-like file wihch path is in the package build dir, so we
+# end up having a valid @D.
 #
-$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
-$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
+$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
+$$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
+		$$($(2)_KCONFIG_OPTS) $$(*)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
 	$$(call $(2)_FIXUP_DOT_CONFIG)
@@ -169,6 +170,7 @@ endif # package enabled
 	$(1)-update-defconfig \
 	$(1)-savedefconfig \
 	$(1)-check-configuration-done \
+	$$($(2)_DIR)/.kconfig_editor_% \
 	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
 
 endef # inner-kconfig-package
-- 
1.9.1
