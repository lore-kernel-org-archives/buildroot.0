From: Frederik Aalund <fpa@sbtaqua.com>
Date: Fri, 16 Sep 2016 15:18:21 +0200
Subject: [Buildroot] [PATCH 2/2] python3: Using PYTHON3_PYC_ONLY created an
	incomplete python installation
Message-ID: <1474031901-20941-1-git-send-email-fpa@sbtaqua.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The PYTHON3_PYC_ONLY option did the following:
    * Compile `*.py` into `__pycache__/*.pyc` files
    * Delete `*.py` files

I've changed it to do the following:
    * Compile `*.py` into `*.pyc` files
    * Delete `*.py` files

The problem with the old behaviour is that python does *not* look into the `__pycache__` directory if the `*.py` file is missing. Python will, however, find a `*.pyc` file where the `*.py` file was supposed to be. This is by design (PEP 3147).

The change of behaviour in this patch is accomplished by passing `legacy=True` to `compileall`. I've adopted `compileall`'s command line interface for `pycompile` and used `-b` to denote `legacy=True`.

Signed-off-by: Frederik Aalund <fpa@sbtaqua.com>
---
 package/python3/python3.mk   | 4 +++-
 support/scripts/pycompile.py | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 34e1297..1b63f95 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -213,7 +213,8 @@ define PYTHON3_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
 		support/scripts/pycompile.py \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
+		$(PYTHON3_PYCOMPILE_ARGS)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
@@ -226,6 +227,7 @@ define PYTHON3_REMOVE_PY_FILES
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
+PYTHON3_PYCOMPILE_ARGS += -b
 endif
 
 # Normally, *.pyc files should not have been compiled, but just in
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index fde711a..f9dee7f 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -21,4 +21,7 @@ class ReportProblem:
 
 report_problem = ReportProblem()
 
-compileall.compile_dir(sys.argv[1], quiet=report_problem)
+# Pass along the legacy parameter
+legacy = '-b' in sys.argv
+
+compileall.compile_dir(sys.argv[1], legacy=legacy, quiet=report_problem)
-- 
2.5.0
