From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri,  5 Jun 2020 13:59:20 -0700
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: use a shell expansion
 for sysconfigdata_name
Message-ID: <20200605205920.465052-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, GNU Make expands the Python SYSCONFIGDATA_NAME variable; however,
when building with per-package directories, this variable is not set because
the evaluation of this variable occurs before buildroot creates the
per-package directories of a given package.

There are two solutions to fix this problem:
- Add a step between "patch" and "configure," which would evaluate all of the
  variables after creating the per-package directories.

- Evaluate SYSCONFIGDATA_NAME via a shell expansion instead of GNU Make.

As the second option is more expedient, the second option is what this commit
impliments.

Remove the current PKG_PYTHON_SYSCONFIGDATA_NAME definition and replace it
with the following:

PKG_PYTHON_SYSCONFIGDATA_PATH:
  - This variable is used to make the next line easier to read.

PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] &&
basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`

  - The "-e" check ensures the path exists, as the basename command only
    evaluates strings.

  - The "|| true" is added to ensure the old behavior of returning an empty
    string if the file does not exist still works.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12941
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/pkg-python.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4bf762e662..73fe9954e7 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -20,9 +20,11 @@
 #
 ################################################################################
 
-define PKG_PYTHON_SYSCONFIGDATA_NAME
-$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
-endef
+# basename does not evaluate if a file exists, so we must check to ensure
+# the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
+# an empty string if the file does not exist.
+PKG_PYTHON_SYSCONFIGDATA_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py
+PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
 
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
-- 
2.26.2
