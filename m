From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:27:07 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/tzdate: use
 classic 'fat' format for uClibc/glibc compatibility
Message-ID: <20210217100552.CC23D814F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c0236968023f2c3e86e58efd7c329efbeec8ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385940

FAIL: test_run (tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/core/test_timezone.py", line 66, in test_run
    self.assertEqual(tz[0].strip(), "EST")
AssertionError: '' != 'EST'

Commit 7868289fd5348 (package/zic: bump version to 2020f) bumped the zic
version to 2020f, which changed the default output format from the classic
"fat" format to the new "slim" format:

https://github.com/eggert/tz/commit/6ba6f2117b95eab345a7ed9159cef939e30c4cd3

The slim format is unfortunately not supported by glibc < 2.28 or uClibc, so
explicitly request the classic "fat" format.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1efb7b9618f4aee4e1614b7aa942c16a1052f768)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 04f5d84bf0..8201dc1201 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -51,8 +51,8 @@ endef
 define HOST_TZDATA_BUILD_CMDS
 	(cd $(@D); \
 		for zone in $(TZDATA_ZONELIST); do \
-			$(ZIC) -d _output/posix $$zone || exit 1; \
-			$(ZIC) -d _output/right -L leapseconds $$zone || exit 1; \
+			$(ZIC) -b fat -d _output/posix $$zone || exit 1; \
+			$(ZIC) -b fat -d _output/right -L leapseconds $$zone || exit 1; \
 		done; \
 	)
 endef
