From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 21:48:34 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/{pkg-generic,
 python, python3}: rename .py file exclusion variable to not conflict
Message-ID: <20191205210734.00C858812B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=154456c031b4e2ec4ffe1bfbd578fcfd7cc698e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes:
http://autobuild.buildroot.net/results/3b6/3b6280b0b7a9634b747db2865b21c6266007c725/

The PYTHON_KEEP_PY_FILES global variable conflicts with the per-package
<pkg>_KEEP_PY_FILES variable for the python package, causing make to
complain:

package/zlib/zlib.mk:7: *** Recursive variable 'PYTHON_KEEP_PY_FILES' references itself (eventually).  Stop.

As a workaround, rename the global variable to KEEP_PYTHON_PY_FILES so it
cannot conflict with the per-package variable.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0f5ac40374c91e44af8c3806e848f8e62c42b140)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk     | 2 +-
 package/python/python.mk   | 2 +-
 package/python3/python3.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0a3c721c9f..f9742014d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1059,7 +1059,7 @@ PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
-PYTHON_KEEP_PY_FILES += $$($(2)_KEEP_PY_FILES)
+KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/package/python/python.mk b/package/python/python.mk
index 3f9c510fde..29b9e363b1 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -263,7 +263,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' \
-		$(if $(strip $(PYTHON_KEEP_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \
+		$(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \
 		-print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f634b790ef..625c059135 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -281,7 +281,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' \
-		$(if $(strip $(PYTHON_KEEP_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \
+		$(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \
 		-print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
