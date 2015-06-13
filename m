From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 18:46:34 +0200
Subject: [Buildroot] [PATCH 2/5 v2] core/pkg-kconfig: ensure kconfig base
	and fragment files exist
In-Reply-To: <cover.1434213146.git.yann.morin.1998@free.fr>
References: <cover.1434213146.git.yann.morin.1998@free.fr>
Message-ID: <c62cd258d1a61c26c6f04c70ed17be453c67c15c.1434213146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though we do have a dependency chain back to each of the kconfig
base and fragment files:

    $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)

we can't rely on it to ensure they are all present, because they all have
this rule:

    $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch

but since this rule has no prerequisite (only build-order, but that does
not count in this case) and no recipe, make will believe each missing
file to be a PHONY target, and will always run targets that depend on
it:
    https://www.gnu.org/software/make/manual/make.html#Force-Targets

So, that means a missing kconfig base or fragment file would always
cause the rule to generate .config to be run at each invocation, which
in turn would cause a rebuild of the kernel, which is clearly not what
we want.

Since this is expected make behaviour, we can well end up with a missing
Kconfig base or fragment. To avoid continuously rebuilding the kernel in
that case, we must check those files exist by ourselves, and error out
if any one of them is missing.

One would expect we check for them right in their dependency rule, like
so:

    $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
        [ -f $(@) ] || {echo Missing $(@) >&2; exit 1; }

but that does not work, as only the first target is tested for. That
check msut be turned into a loop explicitly testing all files, like so:

    $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
        for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
            [ -f $(@) ] || {echo Missing $$$${f} >&2; exit 1; }; \
        done

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - split dependency and check in two patches  (Thomas)
  - check right after the package has been extracted+patched, not at
    the moment we want to build .config
---
 package/pkg-kconfig.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index e65c6f9..e441548 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -38,8 +38,24 @@ $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 
 # The config file as well as the fragments could be in-tree, so before
-# depending on them the package should be extracted (and patched) first
+# depending on them the package should be extracted (and patched) first.
+#
+# Since those files only have a order-only dependency, make would treat
+# any missing one as a "force" target:
+#   https://www.gnu.org/software/make/manual/make.html#Force-Targets
+# and would forcibly any rule that depend on those files, causing a
+# rebuild of the kernel each time make is called.
+#
+# So, we provide a recipe that checks all of those files exist, to
+# overcome that standard make behaviour.
+#
 $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
+	for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
+		if [ ! -f "$$$${f}" ]; then \
+			printf "Kconfig fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
+			exit 1; \
+		fi; \
+	done
 
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
-- 
1.9.1
