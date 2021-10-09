Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F96C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCF560F90
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FCF560F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193CC8333E;
	Sat,  9 Oct 2021 19:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4Yi7euajH-a; Sat,  9 Oct 2021 19:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F61B82B49;
	Sat,  9 Oct 2021 19:11:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE1C1BF31A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7936072A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbsdrSJsexQi for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:10:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BABC960701
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:10:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5D8BCE0007;
 Sat,  9 Oct 2021 19:10:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sat,  9 Oct 2021 21:10:40 +0200
Message-Id: <20211009191043.1075544-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
References: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] support/scripts/generate-gitlab-ci-yml:
 allow multiple tests in one pipeline
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 docs/manual/contribute.txt             | 18 ++++++++++++++++--
 support/scripts/generate-gitlab-ci-yml |  6 +++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 14ecdbd66c..eff80e514e 100644
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
index 063c5081da..7d09279bbd 100755
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
