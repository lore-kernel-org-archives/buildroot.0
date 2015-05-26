From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:15 +0200
Subject: [Buildroot] [PATCH 20/21 RFC] docs/manual: include packages from
	BR2_EXTERNAL if set
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <11c270bce68df31b215198daf83e235e59488516.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the user is using one or more br2-external trees, add the list of
packages therein to the manual.

Note that we do re-introduce BR2_EXTERNAL (when it was removed in
[-SHA1-] (docs/manual: do not override BR2_EXTERNAL). The reason for
the removal is that BR2_EXTERNAL is no longer used as a Kconfig option.

However, BR2_EXTERNAL is now used by the gen-manual-lists.py script,
which needs it to find packages' .mk files in the br2-external trees,
not as a Kconfig option (which it is not).

So, even though that looks like a revert, that's not: the purpose is
different, and we only pass it when not empty.

In case we have no br2-external, we want to create an empty file, so
we can't just touch it, in case it was previously generated with
br2-external trees; instead, we printf an empty string in there to
ensure the file exists and is empty.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 docs/manual/appendix.txt |  5 +++++
 docs/manual/manual.mk    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 87a20bd..7ef8bbc 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -40,3 +40,8 @@ year following deprecation. For example, a symbol depending on
 +BR2_DEPRECATED_SINCE_2013_05+ can be removed from 2014.05 onwards.
 
 include::deprecated-list.txt[]
+
+// This file is generated:
+// - with the list of br2-external packages if BR2_EXTERNAL is set
+// - empty otherwise
+include::br2-external.txt[]
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index b26f912..3b4cef4 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -10,14 +10,32 @@ MANUAL_RESOURCES = $(TOPDIR)/docs/images
 # Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
 MANUAL_DEPENDENCIES += prepare-kconfig
 
+# If using one or more BR2_EXTERNAL trees, include the list of
+# packages therein, otherwise, generate an empty file
+ifeq ($(BR_EXTERNAL),)
+define MANUAL_GEN_LISTS_BR2_EXTERNAL
+	$(Q)printf "" >$(@D)/br2-external.txt
+endef
+else
+define MANUAL_GEN_LISTS_BR2_EXTERNAL
+	$(Q)( \
+		printf "== List of BR2_EXTERNAL packages\n\n"; \
+		printf "include::br2-external-package-list.txt[]\n"; \
+	) >$(@D)/br2-external.txt
+endef
+MANUAL_GEN_LISTS_ENV = BR2_EXTERNAL="$(BR_EXTERNAL)"
+endif
+
 # Our manual needs to generate lists
 define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)$(COMMON_CONFIG_ENV) \
 		BR2_DEFCONFIG="" \
+		$(MANUAL_GEN_LISTS_ENV) \
 		TOPDIR=$(TOPDIR) \
 		O=$(@D) \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
+	$(MANUAL_GEN_LISTS_BR2_EXTERNAL)
 endef
 MANUAL_POST_RSYNC_HOOKS += MANUAL_GEN_LISTS
 
-- 
1.9.1
