From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jun 2015 13:54:23 +0200
Subject: [Buildroot] [PATCH 1/4] core/pkg-kconfig: ensure kconfig file and
	fragments exist
In-Reply-To: <cover.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <22cb4293142894b08d3103f39ceaa2351b0e357b.1433591404.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the base kconfig file has a dependency but no rule, make will
always try to rebuild targets that depend on it:

    https://www.gnu.org/software/make/manual/make.html#Force-Targets

To complexify things yet a little bit more, missing kconfig fragments
are properly caught, but since they could be bundled in the package,
they should depend on it being extracted. And then we'd have the same
issue as with the base kconfig file, above.

Furthermore, merge-config.sh does not check for the existence of the
fragments, not even the existence of the base file.

So, this patch does more than one single thing, but they are clearly all
pretty much inter-woven each with the others, and thus are done together:

  - make kconfig fragments depend on the package being patched, like the
    base kconfig file,

  - manualy check that the base and fragments do exist.

Ideally, merge-config.sh should be fixed, but it's easier to have
code in our makefiles rather than patch the linux-inherited kconfig,
which we are trying to keep as close as possible to upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index dcaed53..1d69722 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -37,16 +37,26 @@ $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 
-# The config file could be in-tree, so before depending on it the package should
-# be extracted (and patched) first
-$$($(2)_KCONFIG_FILE): | $(1)-patch
+# The config file as well as the fragments could be in-tree, so before
+# depending on them the package should be extracted (and patched) first
+$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first. We use 'make oldconfig' because this can be safely
 # done even when the package does not support defconfigs.
+#
+# merge-config.sh does not check for the existence of the fragments, not even
+# the existence of the base file, so we do it manually.
+#
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
+		if [ ! -f "$$$${f}" ]; then \
+			printf "Kconfig fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
+			exit 1; \
+		fi; \
+	done
 	support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-- 
1.9.1
