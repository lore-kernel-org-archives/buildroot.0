Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364B1C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04EEC61156
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04EEC61156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70F5404F6;
	Wed,  3 Nov 2021 20:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cI_lYCrFlSaq; Wed,  3 Nov 2021 20:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BBA40501;
	Wed,  3 Nov 2021 20:57:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 059081BF9BA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87AF400DF
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijSGJ87U9OXS for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C66504038D
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 413468A3B7; Wed,  3 Nov 2021 20:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 21:19:18 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 54a8dbe6af53d67e6cec3c2e5ccbb46eefb22092
X-Git-Newrev: caa5e73a050f8c7ff8c902e1edd37b6aab85f4fa
X-Patchwork-Hint: ignore
Message-Id: <20211103205252.413468A3B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/generate-gitlab-ci-yml: allow multiple tests in one
 pipeline
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=caa5e73a050f8c7ff8c902e1edd37b6aab85f4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The current Gitlab CI mechanism allows to trigger all tests in a CI
pipeline by pushing a branch named <something>-runtime-tests, or to
trigger a single test in a CI pipeline by pushing a branch name
<something>-tests.<name of test>.

However, there are cases where it is useful to run a suite of tests,
for example to run all tests in tests.init.test_busybox.

This commit makes that possible by extending the current semantic of
<something>-tests.<name of test> to not expect a complete test name,
but instead to accept all tests that starts with the given pattern.

This allows to do:

  git push gitlab HEAD:foobar-tests.init.test_busybox.TestInitSystemBusyboxRo

like it was the case before. But it now also allows to do:

  git push gitlab HEAD:foobar-tests.init.test_busybox

to run all Busybox tests.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 23186356a1c8f6cb8a104e783034e25633a0fe40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt             | 18 ++++++++++++++++--
 support/scripts/generate-gitlab-ci-yml |  6 +++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index bf3d5a7075..36512c0ee3 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -677,9 +677,23 @@ string you choose to identify this specific job being created.
  $ git push gitlab HEAD:<name>-runtime-tests
 ---------------------
 
-* to trigger one test case job, a specific branch naming string is used that
-includes the full test case name.
+* to trigger one or several test case jobs, a specific branch naming
+string is used that includes either the full test case name, or the
+beginning of a series of tests to run:
 
 ---------------------
  $ git push gitlab HEAD:<name>-<test case name>
 ---------------------
+
+Example to run one test:
+
+---------------------
+ $ git push gitlab HEAD:foo-tests.init.test_busybox.TestInitSystemBusyboxRo
+---------------------
+
+Examples to run several tests part of the same group:
+
+---------------------
+ $ git push gitlab HEAD:foo-tests.init.test_busybox
+ $ git push gitlab HEAD:foo-tests.init
+---------------------
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 3f498e08fd..69c3fb275f 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -71,7 +71,11 @@ gen_tests() {
             do_runtime=true
             ;;
           (*-tests.*)
-            runtimes=( "${CI_COMMIT_REF_NAME##*-}" )
+            runtimes=( $(./support/testing/run-tests -l 2>&1 \
+                         | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
+                         | LC_ALL=C sort \
+                         | grep "^${CI_COMMIT_REF_NAME##*-}")
+                     )
             do_runtime=true
             ;;
         esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
