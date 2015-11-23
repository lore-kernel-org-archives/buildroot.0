From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:57 +0100
Subject: [Buildroot] [PATCH 27/51] pacakge/gcc: drop custom patch command
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <6e8cc86cc0afa657c7f94d0e6fd86c741ebc6d70.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the gcc patches are not present in the package's own
directory, but shared in the common directory. So, the generic
package infra does not find thosee patches, and we apply them with
a custom-made post-patch hook.

Use symlinks so the generic packag einfra can find and apply the
patches; drop the custom patch hook; keep the conditional hook to
apply the PPC patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host             |  3 +++
 package/gcc/gcc-common.mk              | 12 ++++--------
 package/gcc/gcc-initial/4.5.4          |  1 +
 package/gcc/gcc-initial/4.7.4          |  1 +
 package/gcc/gcc-initial/4.8.5          |  1 +
 package/gcc/gcc-initial/4.9.3          |  1 +
 package/gcc/gcc-initial/5.2.0          |  1 +
 package/gcc/gcc-initial/arc-2015.06    |  1 +
 package/gcc/gcc-initial/gcc-initial.mk |  2 +-
 package/gcc/gcc/4.5.4                  |  1 +
 package/gcc/gcc/4.7.4                  |  1 +
 package/gcc/gcc/4.8.5                  |  1 +
 package/gcc/gcc/4.9.3                  |  1 +
 package/gcc/gcc/5.2.0                  |  1 +
 package/gcc/gcc/arc-2015.06            |  1 +
 package/gcc/gcc/gcc.mk                 |  2 +-
 16 files changed, 21 insertions(+), 10 deletions(-)
 create mode 120000 package/gcc/gcc-initial/4.5.4
 create mode 120000 package/gcc/gcc-initial/4.7.4
 create mode 120000 package/gcc/gcc-initial/4.8.5
 create mode 120000 package/gcc/gcc-initial/4.9.3
 create mode 120000 package/gcc/gcc-initial/5.2.0
 create mode 120000 package/gcc/gcc-initial/arc-2015.06
 create mode 120000 package/gcc/gcc/4.5.4
 create mode 120000 package/gcc/gcc/4.7.4
 create mode 120000 package/gcc/gcc/4.8.5
 create mode 120000 package/gcc/gcc/4.9.3
 create mode 120000 package/gcc/gcc/5.2.0
 create mode 120000 package/gcc/gcc/arc-2015.06

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 78eb50b..b7c0f67 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -6,6 +6,9 @@ config BR2_GCC_NEEDS_MPC
 config BR2_GCC_SUPPORTS_GRAPHITE
 	bool
 
+# NOTE! When updating the version, be sure to adapt the symlinks in
+# package/gcc/gcc-initial/ and package/gcc/gcc/ to point to the
+# corresponding patchsets.
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
diff --git a/package/gcc/gcc-common.mk b/package/gcc/gcc-common.mk
index abab6ec..73e3b72 100644
--- a/package/gcc/gcc-common.mk
+++ b/package/gcc/gcc-common.mk
@@ -8,6 +8,9 @@
 # Version, site and source
 #
 
+# NOTE! When updating the version, be sure to adapt the symlinks in
+# package/gcc/gcc-initial/ and package/gcc/gcc/ to point to the
+# corresponding patchsets.
 HOST_GCC_COMMON_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
 ifeq ($(BR2_arc),y)
@@ -35,18 +38,11 @@ endef
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_COMMON_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_COMMON_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
+	$(APPLY_PATCHES) $(@D) $($(PKG)_PKGDIR)/$(HOST_GCC_COMMON_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
 endef
 endif
 endif
 
-define HOST_GCC_COMMON_APPLY_PATCHES
-	if test -d package/gcc/$(HOST_GCC_COMMON_VERSION); then \
-	  $(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_COMMON_VERSION) \*.patch ; \
-	fi;
-	$(HOST_GCC_COMMON_APPLY_POWERPC_PATCH)
-endef
-
 HOST_GCC_COMMON_EXCLUDES = \
 	libjava/* libgo/* \
 	gcc/testsuite/* libstdc++-v3/testsuite/*
diff --git a/package/gcc/gcc-initial/4.5.4 b/package/gcc/gcc-initial/4.5.4
new file mode 120000
index 0000000..b758df2
--- /dev/null
+++ b/package/gcc/gcc-initial/4.5.4
@@ -0,0 +1 @@
+../4.5.4
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.7.4 b/package/gcc/gcc-initial/4.7.4
new file mode 120000
index 0000000..70712b0
--- /dev/null
+++ b/package/gcc/gcc-initial/4.7.4
@@ -0,0 +1 @@
+../4.7.4
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.8.5 b/package/gcc/gcc-initial/4.8.5
new file mode 120000
index 0000000..a7c371f
--- /dev/null
+++ b/package/gcc/gcc-initial/4.8.5
@@ -0,0 +1 @@
+../4.8.5
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/4.9.3 b/package/gcc/gcc-initial/4.9.3
new file mode 120000
index 0000000..f277184
--- /dev/null
+++ b/package/gcc/gcc-initial/4.9.3
@@ -0,0 +1 @@
+../4.9.3
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/5.2.0 b/package/gcc/gcc-initial/5.2.0
new file mode 120000
index 0000000..3ceece6
--- /dev/null
+++ b/package/gcc/gcc-initial/5.2.0
@@ -0,0 +1 @@
+../5.2.0
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/arc-2015.06 b/package/gcc/gcc-initial/arc-2015.06
new file mode 120000
index 0000000..4543211
--- /dev/null
+++ b/package/gcc/gcc-initial/arc-2015.06
@@ -0,0 +1 @@
+../arc-2015.06
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index cc978a2..6c7ec67 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -19,7 +19,7 @@ ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_POWERPC_PATCH
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
diff --git a/package/gcc/gcc/4.5.4 b/package/gcc/gcc/4.5.4
new file mode 120000
index 0000000..b758df2
--- /dev/null
+++ b/package/gcc/gcc/4.5.4
@@ -0,0 +1 @@
+../4.5.4
\ No newline at end of file
diff --git a/package/gcc/gcc/4.7.4 b/package/gcc/gcc/4.7.4
new file mode 120000
index 0000000..70712b0
--- /dev/null
+++ b/package/gcc/gcc/4.7.4
@@ -0,0 +1 @@
+../4.7.4
\ No newline at end of file
diff --git a/package/gcc/gcc/4.8.5 b/package/gcc/gcc/4.8.5
new file mode 120000
index 0000000..a7c371f
--- /dev/null
+++ b/package/gcc/gcc/4.8.5
@@ -0,0 +1 @@
+../4.8.5
\ No newline at end of file
diff --git a/package/gcc/gcc/4.9.3 b/package/gcc/gcc/4.9.3
new file mode 120000
index 0000000..f277184
--- /dev/null
+++ b/package/gcc/gcc/4.9.3
@@ -0,0 +1 @@
+../4.9.3
\ No newline at end of file
diff --git a/package/gcc/gcc/5.2.0 b/package/gcc/gcc/5.2.0
new file mode 120000
index 0000000..3ceece6
--- /dev/null
+++ b/package/gcc/gcc/5.2.0
@@ -0,0 +1 @@
+../5.2.0
\ No newline at end of file
diff --git a/package/gcc/gcc/arc-2015.06 b/package/gcc/gcc/arc-2015.06
new file mode 120000
index 0000000..4543211
--- /dev/null
+++ b/package/gcc/gcc/arc-2015.06
@@ -0,0 +1 @@
+../arc-2015.06
\ No newline at end of file
diff --git a/package/gcc/gcc/gcc.mk b/package/gcc/gcc/gcc.mk
index 9a9ee46..dddd361 100644
--- a/package/gcc/gcc/gcc.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -37,7 +37,7 @@ HOST_GCC_POST_LEGAL_INFO_HOOKS += HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
 
 endif
 
-HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
+HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_POWERPC_PATCH
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
-- 
1.9.1
