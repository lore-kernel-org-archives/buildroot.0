From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:34 +0200
Subject: [Buildroot] [PATCH 12/24 v2] core/pkg-generic: add variable to skip
	skeleton dependency
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <0d8ab7f21c35de1bb1a07ac839e84bdfc525e628.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently skip the skeleton dependency by checking if the current
package is the skeleton.

We are going to introduce more skeleton-related packages, so we
need a way to exclude the skeleton dependency for those, or we'd
get a circular dependency, for the same reason we need to skip
the toolchain dependency.

Instead of checking for all the skeleton-providing packages in the core
infra, add a new package options so that packages can express they do
not need the dependency on the skeleton, like we have an option to avoid
the depednency on the toolchain. The only packages that will use that
option are probably the skeletons, so we need not document this
variable, like we did not document the option to exclude the dependency
on the toolchain.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk       | 7 +++++--
 package/skeleton/skeleton.mk | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 374d9d5..3281374 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -486,15 +486,18 @@ $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)
 
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
-# dependency
+# dependency.
+# Similarly for the skeleton.
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
+$(2)_ADD_SKELETON_DEPENDENCY	?= YES
+
 
 ifeq ($(4),host)
 $(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 ifeq ($(4),target)
-ifneq ($(1),skeleton)
+ifeq ($$($(2)_ADD_SKELETON_DEPENDENCY),YES)
 $(2)_DEPENDENCIES += skeleton
 endif
 ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index e67a477..072d217 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -12,6 +12,7 @@ SKELETON_SOURCE =
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
 # on skeleton.
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_INSTALL_STAGING = YES
-- 
2.7.4
