From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Jun 2014 21:12:25 +0200
Subject: [Buildroot] [PATCH 2 of 6 v4] infra: add comment describing
 single/double dollar-sign rules
In-Reply-To: <patchbomb.1402513943@localhost>
References: <patchbomb.1402513943@localhost>
Message-ID: <686857abb0b9b3661353.1402513945@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the rules with respect to variable and function references and the need
for single or double dollar signs are not trivial, add a comment in
pkg-generic.mk describing them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
v4: no changes
v3: expand exception for pkgdir and pkgname
v2: clarify exception for pkgdir and pkgname

 package/pkg-generic.mk |  23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff -r fab6ccc0da4b -r 686857abb0b9 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Thu May 08 21:53:48 2014 +0200
+++ b/package/pkg-generic.mk	Sat May 10 10:04:45 2014 +0200
@@ -269,6 +269,29 @@
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
 #  argument 4 is the type (target or host)
+#
+# Note about variable and function references: inside all blocks that are
+# evaluated with $(eval), which includes all 'inner-xxx-package' blocks,
+# specific rules apply with respect to variable and function references.
+# - Numbered variables (parameters to the block) can be referenced with a single
+#   dollar sign: $(1), $(2), $(3), etc.
+# - pkgdir and pkgname should be referenced with a single dollar sign too. These
+#   functions rely on 'the most recently parsed makefile' which is supposed to
+#   be the package .mk file. If we defer the evaluation of these functions using
+#   double dollar signs, then they may be evaluated too late, when other
+#   makefiles have already been parsed. One specific case is when $$(pkgdir) is
+#   assigned to a variable using deferred evaluation with '=' and this variable
+#   is used in a target rule outside the eval'ed inner block. In this case, the
+#   pkgdir will be that of the last makefile parsed by buildroot, which is not
+#   the expected value. This mechanism is for example used for the TARGET_PATCH
+#   rule.
+# - All other variables should be referenced with a double dollar sign:
+#   $$(TARGET_DIR), $$($(2)_VERSION), etc. Also all make functions should be
+#   referenced with a double dollar sign: $$(subst), $$(call), $$(filter-out),
+#   etc. This rule ensures that these variables and functions are only expanded
+#   during the $(eval) step, and not earlier. Otherwise, unintuitive and
+#   undesired behavior occurs with respect to these variables and functions.
+#
 ################################################################################
 
 define inner-generic-package
