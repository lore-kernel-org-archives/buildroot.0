From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 21:48:41 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/{pkg-generic,
 python, python3}: add mechanism to exclude .py files from removal
Message-ID: <20191205210557.3DEC6880F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85272eab040fda886ed2859259d9f1679385185c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y, we force remove all .py files
from the system, as they have all been byte-compiled into their .pyc
variants.

However, it turns out that some packages (e.g: OpenCV) do some funky
things with a few .py files: they pass them through Python's
execfile() facility, which only works with .py files and not .pyc
files. It is used by OpenCV for example to read two small
configuration files.

In order to support such use cases, this commit introduces a very
simple mechanism by which packages can exclude some path patterns from
the .py removal: a per-package <pkg>_KEEP_PY_FILES variable that is
collected into a global PYTHON_KEEP_PY_FILES variable, then used by
the python/python3 target-finalize hooks.

This variable is intentionally not documented, this is really a hack
that we ideally would like to see go away, and we'd rather not see its
usage spread too much.

This is necessary to be able to fix bug #12171.

[Peter: check if PYTHON_KEEP_PY_FILES contains non-white space]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 56f3ed3fc1e1bee560e06b57237bd3d4af0def22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk     | 1 +
 package/python/python.mk   | 4 +++-
 package/python3/python3.mk | 4 +++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cd8434e94d..f2442dc637 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1043,6 +1043,7 @@ PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
+PYTHON_KEEP_PY_FILES += $$($(2)_KEEP_PY_FILES)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/package/python/python.mk b/package/python/python.mk
index 4b82cdcce3..3f9c510fde 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -262,7 +262,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' \
+		$(if $(strip $(PYTHON_KEEP_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \
+		-print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8d042954df..f634b790ef 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -280,7 +280,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' \
+		$(if $(strip $(PYTHON_KEEP_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \
+		-print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
