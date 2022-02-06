Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424E8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDDEA400C1;
	Sun,  6 Feb 2022 14:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AkhUm6ZyXmr; Sun,  6 Feb 2022 14:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC524017B;
	Sun,  6 Feb 2022 14:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE201BF97D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49BC1813E5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQOgiHsDG9d4 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:35:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70C59813E4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:35:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DF20C82BD5; Sun,  6 Feb 2022 14:28:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:35:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9061b7e689db1345afc863d9e60085dd2d83db8
X-Git-Newrev: fcceee0b2ed2b36e6671c8209d17ccc4dd689548
X-Patchwork-Hint: ignore
Message-Id: <20220206142819.DF20C82BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: run unit tests on
 GitLab CI
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcceee0b2ed2b36e6671c8209d17ccc4dd689548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... so we can catch regressions on check-package.

Update to the new docker image that was pushed after the previous
commit.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                         | 2 +-
 support/misc/gitlab-ci.yml.in          | 4 ++++
 support/scripts/generate-gitlab-ci-yml | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ea4ec20a17..d54f46c409 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: $CI_REGISTRY/buildroot.org/buildroot/base:20220105.2314
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20220206.1324
 
 stages:
   - generate-gitlab-ci
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index be7951b3d2..47e72c3213 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,3 +1,7 @@
+.check-check-package_base:
+    script:
+        - python3 -m pytest -v utils/checkpackagelib/
+
 .check-DEVELOPERS_base:
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index bd79807914..aa43aac019 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -26,7 +26,7 @@ gen_tests() {
     local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
-    basics=( DEVELOPERS flake8 package )
+    basics=( check-package DEVELOPERS flake8 package )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
