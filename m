From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 21:34:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/{python,
 python3}: add mechanism to exclude .py files from removal
In-Reply-To: <20191127203404.291090-1-thomas.petazzoni@bootlin.com>
References: <20191127203404.291090-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191127203404.291090-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
the .py removal. The mechanism is a simple global
PYTHON{,3}_KEEP_PY_FILES, that packages can append to.

This is necessary to be able to fix bug #12171.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Due to this only being needed by OpenCV for now, I didn't think it was
really needed to have a per-package variable, which then gets
collected by the generic-package infrastructure into a global
variable. We can always revisit if this gets more widely.
---
 package/python/python.mk   | 4 +++-
 package/python3/python3.mk | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 8c2b195c91..dda9898f03 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -267,7 +267,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' \
+		$(if $(PYTHON_KEEP_PY_FILES),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \
+		-print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d6fda5c274..9a42c44ee4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -285,7 +285,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' \
+		$(if $(PYTHON3_KEEP_PY_FILES),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON3_KEEP_PY_FILES)) \) ) \
+		-print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
-- 
2.23.0
