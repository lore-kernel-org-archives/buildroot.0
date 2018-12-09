From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:30:24 +0100
Subject: [Buildroot] [git commit] Makefile: offload .gitlab-ci.yml generation
Message-ID: <20181209202741.AC4F48B5D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7e30455efd02c0f1bb7f220a123f3218610bb18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GitLab has severe limitations imposed to triggers.
Using a variable in a regexp is not allowed:
|    only:
|        - /-$CI_JOB_NAME$/
|        - /-\$CI_JOB_NAME$/
|        - /-%CI_JOB_NAME%$/
Using the key 'variables' always lead to an AND with 'refs', so:
|    only:
|        refs:
|            - branches
|            - tags
|        variables:
|            - $CI_JOB_NAME == $CI_COMMIT_REF_NAME
would make the push of a tag not to trigger all jobs anymore.
Inheritance is used only for the second level of keys, so:
|.runtime_test: &runtime_test
|    only:
|        - tags
|tests.package.test_python_txaio.TestPythonPy2Txaio:
|    <<: *runtime_test
|    only:
|        - /-TestPythonPy2Txaio$/
would override the entire key 'only', making the push of a tag not to
trigger all jobs anymore.

So, in order to have a trigger per job and still allow the push of a tag
to trigger all jobs (all this in a follow up patch), the regexp for each
job must be hardcoded in the .gitlab-ci.yml and also the inherited
values for key 'only' must be repeated for every job.
This is not a big issue, .gitlab-ci.yml is already automatically
generated from a template and there will be no need to hand-editing it
when jobs are added or removed.

Since the logic to generate the yaml file from the template will become
more complex, move the commands from the main Makefile to a script.

Using Python or other advanced scripting language for that script would
be the most versatile solution, but that would bring another dependency
on the host machine, pyyaml if Python is used. So every developer that
needs to run 'make .gitlab-ci.yml' and also the docker image used in the
GitLab pipelines would need to have pyyaml pre-installed.
Instead of adding the mentioned dependency, keep using a bash script.

While moving the commands to the script:
 - mimic the behavior of the previous make target and fail on any
   command that fails, by using 'set -e';
 - break the original lines in one command per line, making the diff for
   any patch to be applied to this file to look nicer;
 - keep the script as simple as possible, without functions, just a
   script that executes from the top to bottom;
 - do not perform validations on the input parameters, any command that
   fails already makes the script to fail;
 - do not add an usage message, the script is not intended to be called
   directly.

This patch does not change functionality.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Thomas: make the script output on stdout rather than take the output
file name as second argument.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                               |  4 +---
 support/scripts/generate-gitlab-ci-yml | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 37df98520e..c5b78b3274 100644
--- a/Makefile
+++ b/Makefile
@@ -1152,9 +1152,7 @@ check-package:
 
 .PHONY: .gitlab-ci.yml
 .gitlab-ci.yml: .gitlab-ci.yml.in
-	cp $< $@
-	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' >> $@
-	set -o pipefail; ./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
+	./support/scripts/generate-gitlab-ci-yml $< > $@
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
new file mode 100755
index 0000000000..431911d370
--- /dev/null
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -0,0 +1,17 @@
+#!/usr/bin/env bash
+set -e
+set -o pipefail
+
+input="${1}"
+
+cat "${input}"
+
+(
+    cd configs
+    LC_ALL=C ls -1 *_defconfig
+) \
+    | sed 's/$/: *defconfig/'
+
+./support/testing/run-tests -l 2>&1 \
+    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' \
+    | LC_ALL=C sort
