From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2018 11:03:02 +0100
Subject: [Buildroot] [PATCH 1/2] Makefile: .gitlab-ci.yml: fail when listing
 tests fail
Message-ID: <20181021100303.18431-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To update the .gitlab-ci.yml file, we run run-tests -l to list all the
tests and post-process the output in a format suitable for
.gitlab-ci.yml. However, in a pipeline, it is the last command that
gives the return value. In addition, we have to redirect stderr of
run-tests -l because nose2 prints the tests on stderr, not stdout. Thus,
when run-tests -l fails, the update of .gitlab-ci.yml silently succeeds
but no tests are included in the .gitlab-ci.yml.

To fix this, set tho pipefail option. This is bash-specific, but our
Makefile ascertains that we are running with bash as the shell (if bash
is available, but if it is not, dependencies.sh will error out). The
error message is still invisible, but at least make will fail.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5c9b8a803b..83f5c6c994 100644
--- a/Makefile
+++ b/Makefile
@@ -1151,7 +1151,7 @@ check-package:
 .gitlab-ci.yml: .gitlab-ci.yml.in
 	cp $< $@
 	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' >> $@
-	./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
+	set -o pipefail; ./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
-- 
2.17.2
