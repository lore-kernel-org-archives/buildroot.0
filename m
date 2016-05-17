From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:19:13 +0200
Subject: [Buildroot] [PATCH v4 1/4] python/python3: use --no-run-if-empty
	xargs option
In-Reply-To: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463519956-5599-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Samuel Martin, this commit adds the option
--no-run-if-empty xargs option to the "find ... | xargs ..." logic used
in the python and python3 target-finalize hooks to remove py/pyc/pyo
files. This ensures that the command doesn't fail if there are no files
matching the pattern.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk   | 9 ++++++---
 package/python3/python3.mk | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index c96d218..4e92766 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -219,14 +219,16 @@ $(eval $(host-autotools-package))
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 define PYTHON_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty rm -f
 endef
 TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 define PYTHON_REMOVE_PYC_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | \
+		xargs -0 --no-run-if-empty rm -f
 endef
 TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
 endif
@@ -234,7 +236,8 @@ endif
 # In all cases, we don't want to keep the optimized .pyo files
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_REMOVE_PYO_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | xargs -0 --no-run-if-empty rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | \
+		xargs -0 --no-run-if-empty rm -f
 endef
 TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYO_FILES
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index fddbf1b..3089c03 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -214,14 +214,16 @@ $(eval $(host-autotools-package))
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty rm -f
 endef
 TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
 define PYTHON3_REMOVE_PYC_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | \
+		xargs -0 --no-run-if-empty rm -f
 endef
 TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PYC_FILES
 endif
@@ -231,7 +233,8 @@ endif
 # variant.
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.opt-1.pyc' -print0 -o -name '*.opt-2.pyc' -print0 | xargs -0 rm -f
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.opt-1.pyc' -print0 -o -name '*.opt-2.pyc' -print0 | \
+		xargs -0 --no-run-if-empty rm -f
 endef
 TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
 endif
-- 
2.7.4
