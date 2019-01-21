From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Jan 2019 23:11:12 -0200
Subject: [Buildroot] [PATCH v3 2/5] .gitlab-ci.yml: use "include" keyword
In-Reply-To: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
References: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
Message-ID: <20190121011115.19255-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not copy the contents of .gitlab-ci.yml.in to .gitlab-ci.yml when
'make .gitlab-ci.yml' runs, use the new "include" keyword instead.

The docs state "include requires the external YAML file to have the
extensions .yml or .yaml" so rename .gitlab-ci.yml.in. Use the example
name from the docs: .gitlab-ci-template.yml.
This file is not anymore a template for our own script that generates
.gitlab-ci.yml. It becomes a job template to the Gitlab CI infra
to use when populating the list of jobs to run.

Keep the comment about running 'make .gitlab-ci.yml' in the generated
file.
At the same time update the comment to state that also when removing a
defconfig or adding/removing runtime tests the file needs to be
regenerated.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v2 -> v3:
  - new patch (suggested by Arnout, not necessarily to be implemented in
    this series, but since it makes the maintenance of the .yml files
    easier I already did);

For test purposes I created a commit that makes all defconfigs and
runtime tests to echo the command that would be called instead of
actually calling it and then I asked Gitlab CI to run:
 - only the check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072060
 - all defconfigs and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072068
 - all runtime tests and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072082
 - all jobs (using a tag):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072108
---
 .gitlab-ci.yml.in => .gitlab-ci-template.yml |  5 +-
 .gitlab-ci.yml                               | 90 +-------------------
 Makefile                                     |  4 +-
 support/scripts/generate-gitlab-ci-yml       |  9 +-
 4 files changed, 14 insertions(+), 94 deletions(-)
 rename .gitlab-ci.yml.in => .gitlab-ci-template.yml (94%)

diff --git a/.gitlab-ci.yml.in b/.gitlab-ci-template.yml
similarity index 94%
rename from .gitlab-ci.yml.in
rename to .gitlab-ci-template.yml
index a506840892..83b93d5aaa 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci-template.yml
@@ -1,8 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
-# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
-# It needs to be regenerated every time a defconfig is added, using
-# "make .gitlab-ci.yml".
+# The .gitlab-ci.yml file is generated and has an "include" keyword that
+# makes Gitlab-CI to use the jobs below.
 
 image: buildroot/base:20180318.1724
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a8209d76e6..75c30a4653 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,89 +1,7 @@
-# Configuration for Gitlab-CI.
-# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
-# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
-# It needs to be regenerated every time a defconfig is added, using
-# "make .gitlab-ci.yml".
-
-image: buildroot/base:20180318.1724
-
-.defconfig_script:
-    script:
-        - echo 'Configure Buildroot'
-        - make ${CI_JOB_NAME}
-        - echo 'Build buildroot'
-        - |
-            make > >(tee build.log |grep '>>>') 2>&1 || {
-                echo 'Failed build last output'
-                tail -200 build.log
-                exit 1
-            }
-
-check-gitlab-ci.yml:
-    script:
-        - mv .gitlab-ci.yml .gitlab-ci.yml.orig
-        - make .gitlab-ci.yml
-        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
-
-check-DEVELOPERS:
-    # get-developers should print just "No action specified"; if it prints
-    # anything else, it's a parse error.
-    # The initial ! is removed by YAML so we need to quote it.
-    script:
-        - "! utils/get-developers | grep -v 'No action specified'"
-
-check-flake8:
-    before_script:
-        # Help flake8 to find the Python files without .py extension.
-        - find * -type f -name '*.py' > files.txt
-        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
-        - sort -u files.txt | tee files.processed
-    script:
-        - python -m flake8 --statistics --count $(cat files.processed)
-    after_script:
-        - wc -l files.processed
-
-check-package:
-    script:
-        - make check-package
-
-.defconfig:
-    extends: .defconfig_script
-    # Running the defconfigs for every push is too much, so limit to
-    # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-defconfigs$/
-    artifacts:
-        when: always
-        expire_in: 2 weeks
-        paths:
-            - .config
-            - build.log
-            - output/images/
-            - output/build/build-time.log
-            - output/build/packages-file-list.txt
-            - output/build/*/.config
-
-.runtime_test:
-    # Running the runtime tests for every push is too much, so limit to
-    # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-runtime-tests$/
-    # Keep build directories so the rootfs can be an artifact of the job. The
-    # runner will clean up those files for us.
-    # Multiply every emulator timeout by 10 to avoid sporadic failures in
-    # elastic runners.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
-    artifacts:
-        when: always
-        expire_in: 2 weeks
-        paths:
-            - test-output/*.log
-            - test-output/*/.config
-            - test-output/*/images/*
+# This file needs to be regenerated every time a defconfig or runtime
+# test is added or removed, using "make .gitlab-ci.yml".
+include:
+    - local: '/.gitlab-ci-template.yml'
 aarch64_efi_defconfig: { extends: .defconfig }
 acmesystems_aria_g25_128mb_defconfig: { extends: .defconfig }
 acmesystems_aria_g25_256mb_defconfig: { extends: .defconfig }
diff --git a/Makefile b/Makefile
index a382a5defb..27412320bd 100644
--- a/Makefile
+++ b/Makefile
@@ -1159,8 +1159,8 @@ check-package:
 		-exec ./utils/check-package {} +
 
 .PHONY: .gitlab-ci.yml
-.gitlab-ci.yml: .gitlab-ci.yml.in
-	./support/scripts/generate-gitlab-ci-yml $< > $@
+.gitlab-ci.yml:
+	./support/scripts/generate-gitlab-ci-yml > $@
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 262a7649b2..c50a5f1e82 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -2,9 +2,12 @@
 set -e
 set -o pipefail
 
-input="${1}"
-
-cat "${input}"
+cat <<EOF
+# This file needs to be regenerated every time a defconfig or runtime
+# test is added or removed, using "make .gitlab-ci.yml".
+include:
+    - local: '/.gitlab-ci-template.yml'
+EOF
 
 (
     cd configs
-- 
2.17.1
