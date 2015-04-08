From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:29:58 +0200
Subject: [Buildroot] [git commit] infra/pkg-kconfig: don't require a kconfig
	file for disabled packages
Message-ID: <20150408203006.C72A2819AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b85bdae04dfc1e4235a206de60b3743a243510dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a package is not enabled, we need not check that it provides
a .config/defconfig file.

So far, all our pkg-kconfig packages unconditionally set their
_KCONFIG_FILE, even to an empty value. But some packages (e.g.
at91bootstrap3) wanted to set it only when enabled, and broke.

So, only do the check when the package is enabled.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 04ac37d..fd9f19d 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -36,11 +36,6 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
-# FOO_KCONFIG_FILE is required
-ifndef $(2)_KCONFIG_FILE
-$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
-endif
-
 # The config file could be in-tree, so before depending on it the package should
 # be extracted (and patched) first
 $$($(2)_KCONFIG_FILE): | $(1)-patch
@@ -72,6 +67,11 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # already called above, so we can effectively use this variable.
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
+# FOO_KCONFIG_FILE is required
+ifndef $(2)_KCONFIG_FILE
+$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
+endif
+
 # Configuration editors (menuconfig, ...)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
