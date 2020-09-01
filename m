From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Sep 2020 22:34:47 +0200
Subject: [Buildroot] [git commit branch/next] core: make it possible to
 check flake8 like we check package
Message-ID: <20200901202728.00C8287627@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841ee767be173126ec61f77b7022da2be6665d8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Move the code to run check-flake8 into the Makefile, like we have for
check-package, so that it is easy to run locally (and not wait for
someone to report a failure from their Gitlab pipelines).

Compared to the existing check from gitlab-ci.yml, the Makefile check
differs in this respect:

  - don't explicitly find *.py files: they are supposed to also be found
    as a result of running 'file' on them;

  - use git ls-tree instead of find: this is supopsedly faster as it
    uses the index rather than readdir();

  - don't output the count of warnings or errors: the output is a single
    integer, which is confusing when there are errors, and even more so
    when there are no, when it is simply '0';

  - don't sort: the output is already stable and independent from the
    locale;

  - don't report the number of processed files: this information is
    rather useless, and getting a hold of it would be more challenging
    in this new code.

Note: ideally, we would want to use --null, --zero, or similar options,
with utilities that generates or parses a files listing.  While git
ls-tree and xargs do support it, it becomes a little bit tricky to use
the --print0 option of file, and then grep in that output (it is not
undoable, but would requires replacing grep+cut with some sed trickery).
Since we do not expect our scripts names to contain funky chars (like
\n or a colon), we just hand-wave away that issue (and the old code was
doing the same assumption too).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                      | 9 ++++++++-
 support/misc/gitlab-ci.yml.in | 9 +--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index faef1a1be3..65c57d071a 100644
--- a/Makefile
+++ b/Makefile
@@ -125,7 +125,7 @@ endif
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package
+	print-version olddefconfig distclean manual manual-% check-package check-flake8
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1208,6 +1208,13 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+check-flake8:
+	$(Q)git ls-tree -r --name-only HEAD \
+	| xargs file \
+	| grep 'Python script' \
+	| cut -d':' -f1 \
+	| xargs -- python3 -m flake8 --statistics --max-line-length=132
+
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
 		-exec ./utils/check-package {} +
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 7218ea027e..def5bf994d 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -19,15 +19,8 @@ check-DEVELOPERS:
 
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
 
 check-package:
     extends: .check_base
