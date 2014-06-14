From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:10:01 +0200
Subject: [Buildroot] [git commit] infra: add comment describing
	single/double dollar-sign rules
Message-ID: <20140614171145.9F17399EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7742d073a434b07a72cdef5bf0eb81572e6c3a8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the rules with respect to variable and function references and the need
for single or double dollar signs are not trivial, add a comment in
pkg-generic.mk describing them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3821d33..457d873 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -269,6 +269,29 @@ endef
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
