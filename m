From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Apr 2018 14:15:22 +0200
Subject: [Buildroot] [PATCH 3/3] package/pkg-generic: add check that target
 variant is defined before host variant
In-Reply-To: <cover.1525004110.git.yann.morin.1998@free.fr>
References: <cover.1525004110.git.yann.morin.1998@free.fr>
Message-ID: <f3fbc309610c9ff7df8d06ba1aad1f9369e5cdac.1525004110.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Update the documentation accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: slight rephrasing in error message, update manual]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 
-- 
2.14.1
