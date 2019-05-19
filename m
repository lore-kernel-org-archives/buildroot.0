From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 May 2019 18:44:17 +0200
Subject: [Buildroot] [PATCH] core: make it possible to check flake8 like we
 check package
Message-ID: <20190519164417.20124-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the code to run check-flake8 into the Makefile, like we
have for check-package, so that it is easy to run locally (and
not wait for someone to report a failure from their Gitlab
pipelines).

Since there is no "post-rule" in Makefiles, we resort to using
a little trick to remove the temporary file. Also, there is a
slight change in behaviour: the list of files is not reported,
and the number of processed files is not reported either (there
is little value in that; all that is important are the errors,
if any).

Regenerate .gitlab-ci.yml.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 9 +--------
 .gitlab-ci.yml.in | 9 +--------
 Makefile          | 9 ++++++++-
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 836944faf5..002ee07afb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -21,15 +21,8 @@ check-DEVELOPERS:
 
 check-flake8:
     extends: .check_base
-    before_script:
-        # Help flake8 to find the Python files without .py extension.
-        - find * -type f -name '*.py' > files.txt
-        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
-        - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
-    after_script:
-        - wc -l files.processed
+        - make check-flake8
 
 check-gitlab-ci.yml:
     extends: .check_base
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 33cb665d98..afa0d93500 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -21,15 +21,8 @@ check-DEVELOPERS:
 
 check-flake8:
     extends: .check_base
-    before_script:
-        # Help flake8 to find the Python files without .py extension.
-        - find * -type f -name '*.py' > files.txt
-        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
-        - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
-    after_script:
-        - wc -l files.processed
+        - make check-flake8
 
 check-gitlab-ci.yml:
     extends: .check_base
diff --git a/Makefile b/Makefile
index 7246376cf9..f78e5aad4d 100644
--- a/Makefile
+++ b/Makefile
@@ -119,7 +119,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package
+	print-version olddefconfig distclean manual manual-% check-package check-flake8
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1197,6 +1197,13 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+check-flake8:
+	{ find * -type f -name '*.py'; \
+	  find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1; \
+	} >files.txt
+	$(Q)python -m flake8 --statistics --count --max-line-length=132 \
+		$$(sort -u files.txt; rm -f files.txt)
+
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
 		-exec ./utils/check-package {} +
-- 
2.20.1
