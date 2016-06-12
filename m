From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:19 +0200
Subject: [Buildroot] [PATCH 14/24] core/pkg-generic: allow packages to
	declare target-finalize hooks
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <ccddad9de67016c3f3f81cf154f46b83e15ef864.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, our skeleton declares target-finalize hooks, and does so
unconditionally.

That's fine since we have a single skeleton package, and thus the hooks
it declares need not be conditional.

However, we're going to be adding more skeleton packages, one for the
custom skeleton, one for the sysv-like init systems and, eventually, one
for the systemd init system.

In that case, we will not want the sysv-like target-finalize hooks to be
applied when the init system is systemd. And the other way around, of
course. And so on for each type of skeleton...

The only soltuion we have so far is to enclose all target-finalize hooks
declarations between an ifeq-block to check that the package is enabled.
This is cumbersome to do, even more so when the hooks are themselves
conditional.

Add support in the core infra for packages to register such hooks, like
is done to register users, device tables and whatnots.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-hooks.txt | 7 +++++++
 package/pkg-generic.mk                | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 5b5bf6a..d25092a 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -77,3 +77,10 @@ others, use the following variables:
 
 * +$(SRCDIR)+: the path to the overridden source directory
 * +$(@D)+: the path to the build directory
+
+==== Target-finalize hook
+
+Packages may also register hooks in +LIBFOO_TARGET_FINALIZE_HOOKS+.
+These hooks are run after all packages are built, but before the
+filesystem images are generated. They are seldom used, and your
+package probably do not need them.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3281374..4415342 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -558,6 +558,7 @@ $(2)_PRE_INSTALL_IMAGES_HOOKS   ?=
 $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
 $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
+$(2)_TARGET_FINALIZE_HOOKS      ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -858,6 +859,7 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
-- 
2.7.4
