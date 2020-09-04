From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:52:01 +0200
Subject: [Buildroot] [git commit] package/refpolicy: allow packages to
 provide their own SELinux modules
Message-ID: <20200904123952.0633A87D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07e5d4dec16964fe2fee195d01ff275c29c0929c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow packages to have an 'selinux' subfolder containing SELinux modules
(sources) to be synced and compiled within the refpolicy, if the package
is selected.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk         | 2 ++
 package/refpolicy/refpolicy.mk | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7b6a08b016..54de03da03 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1092,6 +1092,8 @@ KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 ifneq ($$($(2)_SELINUX_MODULES),)
 PACKAGES_SELINUX_MODULES += $$($(2)_SELINUX_MODULES)
 endif
+PACKAGES_SELINUX_EXTRA_MODULES_DIRS += \
+	$$(if $$(wildcard $$($(2)_PKGDIR)/selinux),$$($(2)_PKGDIR)/selinux)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 7e469e8cdc..dc038001bd 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -41,7 +41,9 @@ ifeq ($(BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION),y)
 
 # Allow to provide out-of-tree SELinux modules in addition to the ones
 # in the refpolicy.
-REFPOLICY_EXTRA_MODULES_DIRS = $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS))
+REFPOLICY_EXTRA_MODULES_DIRS = \
+	$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)) \
+	$(PACKAGES_SELINUX_EXTRA_MODULES_DIRS)
 $(foreach dir,$(REFPOLICY_EXTRA_MODULES_DIRS),\
 	$(if $(wildcard $(dir)),,\
 		$(error BR2_REFPOLICY_EXTRA_MODULES_DIRS contains nonexistent directory $(dir))))
