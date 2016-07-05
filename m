From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:48:48 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: allow packages to
	declare target-finalize hooks
Message-ID: <20160705135120.33BA37FAF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=624dbec7e1f971519be9a165b09c0b95a8ee282b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, packages using target finalize hooks must remember that they
need to register their hook in TARGET_FINALIZE_HOOKS
conditionally (otherwise their hook will be triggered even if the
package is disabled).

In order to avoid this potential mistake, this commit introduces a
per-package target-finalize hook variable, in which packages can
register their target-finalize hooks, with the guarantee that they will
only be triggered if the package is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 0c9c7ab..68ead3d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -572,6 +572,7 @@ $(2)_PRE_INSTALL_IMAGES_HOOKS   ?=
 $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
 $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
+$(2)_TARGET_FINALIZE_HOOKS      ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -882,6 +883,7 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
