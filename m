From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:38 +0200
Subject: [Buildroot] [PATCH 13/15] package/refpolicy: allow packages to
 provide their own SELinux modules
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-14-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow packages to have an 'selinux' subfolder containing SELinux modules
(sources) to be synced and compiled within the refpolicy, if the package
is selected.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/pkg-generic.mk         | 2 ++
 package/refpolicy/refpolicy.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 71d6357836f0..e52456b1ca5d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1091,6 +1091,8 @@ KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 ifneq ($$($(2)_SELINUX_MODULES),)
 PACKAGES_SELINUX_MODULES += $$($(2)_SELINUX_MODULES)
 endif
+PACKAGES_SELINUX_EXTRA_MODULES_DIRS += \
+	$$(if $$(wildcard $$($(2)_PKGDIR)/selinux),$$($(2)_PKGDIR)/selinux)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 74d2733f7d10..51ac71075fb8 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -63,7 +63,7 @@ REFPOLICY_MODULES = \
 
 # Allow to provide out-of-tree SELinux modules in addition to the ones in the
 # refpolicy.
-REFPOLICY_EXTRA_MODULES = $(BR2_REFPOLICY_EXTRA_MODULES_DIRS)
+REFPOLICY_EXTRA_MODULES = $(BR2_REFPOLICY_EXTRA_MODULES_DIRS) $(PACKAGES_SELINUX_EXTRA_MODULES_DIRS)
 $(foreach dir,$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)),\
 	$(if $(wildcard $(dir)),,\
 		$(error BR2_REFPOLICY_EXTRA_MODULES_DIRS contains nonexistent directory $(dir))))
-- 
2.26.2
