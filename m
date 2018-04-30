From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:43:49 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: add check that target
 variant is defined before host variant
Message-ID: <20180430154405.4F6668A4DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38860fb21fb28bc79895a7807d5b07a0395a8668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the documentation accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: slight rephrasing in error message, update manual]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 6 ++++--
 package/pkg-generic.mk                  | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 62906d92bb..7e1f246752 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -179,8 +179,10 @@ some tools to be installed on the host. If the package name is
 variables of other packages, if they depend on +libfoo+ or
 +host-libfoo+.
 
-The call to the +generic-package+ and/or +host-generic-package+ macro *must* be
-at the end of the +.mk+ file, after all variable definitions.
+The call to the +generic-package+ and/or +host-generic-package+ macro
+*must* be at the end of the +.mk+ file, after all variable definitions.
+The call to +host-generic-package+ *must* be after the call to
++generic-package+, if any.
 
 For the target package, the +generic-package+ uses the variables defined by
 the .mk file and prefixed by the uppercased package name:
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1c9dd1d734..bd47ca1964 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -646,6 +646,12 @@ $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
 
+ifeq ($$($(2)_TYPE),target)
+ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
+$$(error "Package $(1) defines host variant before target variant!")
+endif
+endif
+
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 
