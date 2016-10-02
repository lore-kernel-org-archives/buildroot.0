From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Oct 2016 11:09:59 +0200
Subject: [Buildroot] [PATCH 10/10] core: allow a br2-external tree to
	override a defconfig
In-Reply-To: <cover.1475399381.git.yann.morin.1998@free.fr>
References: <cover.1475399381.git.yann.morin.1998@free.fr>
Message-ID: <fbe34e72c7fbf6637344ccaa13b80a93e0336c77.1475399381.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, it is not possible for a br2-external tree to override a
defconfig bundled in Buildroot, nor is it possible to override one from
a previous br2-external tree in the stack.

However, it is interesting that a latter br2-external tree be able to
override a defconfig:

  - the ones bundled in Buildroot are minimalist, and almost always
    build a toolchain, so a br2-external tree may want to provide a
    "better" defconfig (better, in the sense "suited for the project");

  - similarly for a defconfig from a previous br2-external tree.

But we can't do that, as the rules for the defconfigs are generated in
the order the br2-external trees are specified, all after the bundled
defconfigs. Those rule are patten-matching rules, which means that the
first one to match is used, and the following ones are ignored.

Add a new utility macro, 'reverse', inspired from GMSL, that does what
it says: reverse a list of words.

Use that macro to reverse the list of br2-external trees, so that the
latters win over the formers, and even over bundled ones.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
---
 Makefile                             | 2 +-
 docs/manual/customize-outside-br.txt | 5 +++--
 support/misc/utils.mk                | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 40e6b74..67a0b5c 100644
--- a/Makefile
+++ b/Makefile
@@ -854,7 +854,7 @@ define percent_defconfig
 	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
 endef
-$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL_DIRS),$(call percent_defconfig,$(d))$(sep)))
+$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 09977e0..4c0f568 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -169,5 +169,6 @@ And then in +$(BR2_EXTERNAL_FOO_42_PATH)/package/package1+ and
 +
 .Note:
 If a defconfig file is present in more than one br2-external tree, then
-   the first one is used. It is not possible to override a defconfig
-   bundled in Buildroot.
+   the one from the last br2-external tree is used. It is thus possible
+   to override a defconfig bundled in Buildroot or another br2-external
+   tree.
diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index 990a3d1..c443193 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -46,6 +46,10 @@ endef
 $(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
 $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
 
+# Reverse the orders of words in a list. Again, inspired by the gmsl
+# 'reverse' macro.
+reverse = $(if $(1),$(call reverse,$(wordlist 2,$(words $(1)),$(1))) $(firstword $(1)))
+
 # Sanitize macro cleans up generic strings so it can be used as a filename
 # and in rules. Particularly useful for VCS version strings, that can contain
 # slashes, colons (OK in filenames but not in rules), and spaces.
-- 
2.7.4
