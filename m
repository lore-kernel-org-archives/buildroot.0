Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88ACAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3268A415FD;
	Thu, 25 Sep 2025 20:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKGkqIgtO_Vc; Thu, 25 Sep 2025 20:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55D8941765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D8941765;
	Thu, 25 Sep 2025 20:03:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF4CC177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFA7941286
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wteIov_RhAHH for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9BE41283
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E9BE41283
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CEAB863FE; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:58:17 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a903cce65c874e091613919187fdb75358eb5322
X-Git-Newrev: 2d703d9437644cce3e54ec23416474f0a7df4ee5
X-Patchwork-Hint: ignore
Message-Id: <20250925200243.0CEAB863FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing:
 GitTestBase: remove git daemon due to Gitlab-CI security settings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d703d9437644cce3e54ec23416474f0a7df4ee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

TestGitHash and TestGitRefs are failing on Gitlab-CI since 2025-08-18
(first runtime-test failures report for master) [1] due a new Gitlab-CI
security settings that prevents the any use of localhost (127.0.0.1) on
the Gitlab-CI runner [2]:

"To prevent exploitation of insecure internal web services, all webhook
 and integration requests to the following local network addresses are
 not allowed:

 Private network addresses, including 127.0.0.1, ::1, 0.0.0.0,
 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, and IPv6 site-local
 (ffc0::/10) addresses."

Gitlab suggest using a second container as a Services [3] since each
containers have access to one another and can communicate when running
the job. But this is really not practical to run git daemon since the
service is started before the Buildroot git tree is fetched and git
daemon needs git-remote directory content.

See [4]:
"If you have your service that tries to write to CI_PROJECT_DIR
 immediately after it's started - it will not work and fail with an
 error like '/builds/nknapp/gitlab-ci-test/': No such file or directory
 error. Because that directory is most probably not there yet, as the
 job step that creates it is yet to be executed!"

Also, using Gitlab-CI services requires to handle GitTestBase setUp
differently on Gitlab-CI than local use of run-tests.
So Gitlab-CI services is not an option.

We could move support/testing/tests/download/git-remote to our Gitlab
group (https://gitlab.com/buildroot.org) but since it's only intended
for testing the git download backend, we don't really want to do that.

So the only remaining choice to clone the repository from the Buildroot
git tree (local machine).

To do so, we have to do the following changes:

- Replace all "git://localhost:$(GITREMOTE_PORT_NUMBER)" by
  "$(GITREMOTE_DIR)". GITREMOTE_DIR will contain the absolute path to
  tests/download/git-remote directory.

- Force to use git download backend using "SITE_METHOD = git" otherwise
  the download infra will fall back using wget download backend.

- Cloning a git repository with submodules using the "file://" protocol
  needs to be allowed from git config. It's disabled by default:
  "fatal: transport 'file' not allowed"
  Use a local gitconfig file generated by GitTestBase before starting
  TestGitHash and TestGitRefs with:

  [protocol "file"]
    allow = always

  This is considered safe since we are using a git repository from the
  Buildroot git tree.

- Running TestGitHash and TestGitRefs on Gitlab-CI requires additional
  git config settings to disable ownership check of the git tree [5].

Thanks to Arnout for advices about GIT_CONFIG_GLOBAL.

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/jobs/11428504450 (TestGitHash)
https://gitlab.com/kubu93/buildroot/-/jobs/11428490035 (TestGitRefs)

[1] https://lore.kernel.org/buildroot/68a3ee65.500a0220.397724.30db@mx.google.com/
[2] https://docs.gitlab.com/security/webhooks/#allow-requests-to-the-local-network-from-webhooks-and-integrations
[3] https://docs.gitlab.com/ci/services/
[4] https://gitlab.com/gitlab-org/gitlab-runner/-/issues/25982#note_2139685797
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/a016b693f7830f3c8ae815851d3204b8b6e99821

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124174 (TestGitHash)
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124173 (TestGitRefs)

Cc: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a367362af00ed349915b0b4496ebeb9910fc86e4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../br2-external/git-hash/package/bad/bad.mk       |  3 +-
 .../git-hash/package/export-subst/export-subst.mk  |  3 +-
 .../br2-external/git-hash/package/good/good.mk     |  3 +-
 .../br2-external/git-hash/package/nohash/nohash.mk |  3 +-
 .../git-partial-sha1-branch-head.mk                |  3 +-
 .../git-partial-sha1-reachable-by-branch.mk        |  3 +-
 .../git-partial-sha1-reachable-by-tag.mk           |  3 +-
 .../git-partial-sha1-tag-itself.mk                 |  3 +-
 .../git-partial-sha1-tag-points-to.mk              |  3 +-
 .../git-sha1-branch-head/git-sha1-branch-head.mk   |  3 +-
 .../git-sha1-reachable-by-branch.mk                |  3 +-
 .../git-sha1-reachable-by-tag.mk                   |  3 +-
 .../git-sha1-tag-itself/git-sha1-tag-itself.mk     |  3 +-
 .../git-sha1-tag-points-to.mk                      |  3 +-
 .../git-submodule-disabled.mk                      |  3 +-
 .../git-submodule-enabled/git-submodule-enabled.mk |  3 +-
 .../git-refs/package/git-tag/git-tag.mk            |  3 +-
 .../package/git-wrong-content/git-wrong-content.mk |  3 +-
 .../package/git-wrong-sha1/git-wrong-sha1.mk       |  3 +-
 support/testing/tests/download/gitconfig.py        | 51 ++++++++++++++++++++++
 support/testing/tests/download/gitremote.py        | 47 --------------------
 support/testing/tests/download/test_git.py         | 21 ++++++---
 22 files changed, 103 insertions(+), 73 deletions(-)

diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
index 5497bd6bfe..a9b7c451bc 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 BAD_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
-BAD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+BAD_SITE = $(GITREMOTE_DIR)/repo.git
+BAD_SITE_METHOD = git
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
index 8d7d3ff970..40c4b52a7a 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
-EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+EXPORT_SUBST_SITE = $(GITREMOTE_DIR)/repo.git
+EXPORT_SUBST_SITE_METHOD = git
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.mk b/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
index 0f0eefd944..8071de657c 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 GOOD_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
-GOOD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GOOD_SITE = $(GITREMOTE_DIR)/repo.git
+GOOD_SITE_METHOD = git
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk b/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
index 1da19d88c6..825e26782e 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
+++ b/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 NOHASH_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
-NOHASH_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+NOHASH_SITE = $(GITREMOTE_DIR)/repo.git
+NOHASH_SITE_METHOD = git
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.mk
index 6d4177c5bf..7b5ddce30a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_PARTIAL_SHA1_BRANCH_HEAD_VERSION = 68c197d0879d485f4f6c
-GIT_PARTIAL_SHA1_BRANCH_HEAD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_BRANCH_HEAD_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_PARTIAL_SHA1_BRANCH_HEAD_SITE_METHOD = git
 GIT_PARTIAL_SHA1_BRANCH_HEAD_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.mk
index 2f65b5c9a9..738821bc27 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_PARTIAL_SHA1_REACHABLE_BY_BRANCH_VERSION = 317406308d9259e2231b
-GIT_PARTIAL_SHA1_REACHABLE_BY_BRANCH_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_REACHABLE_BY_BRANCH_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_PARTIAL_SHA1_REACHABLE_BY_BRANCH_SITE_METHOD = git
 GIT_PARTIAL_SHA1_REACHABLE_BY_BRANCH_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk
index 05aa659dd2..a96af88a06 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_VERSION = 46bae5b639e5a18e2cc4
-GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_SITE_METHOD = git
 GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk
index 515492397e..8e06d4c2c9 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_PARTIAL_SHA1_TAG_ITSELF_VERSION = 2b0e0d98a49c97da6a61
-GIT_PARTIAL_SHA1_TAG_ITSELF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_TAG_ITSELF_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_PARTIAL_SHA1_TAG_ITSELF_SITE_METHOD = git
 GIT_PARTIAL_SHA1_TAG_ITSELF_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk
index c810e81175..081657e0e5 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_PARTIAL_SHA1_TAG_POINTS_TO_VERSION = 516c9c5f64ec66534d4d
-GIT_PARTIAL_SHA1_TAG_POINTS_TO_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_TAG_POINTS_TO_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_PARTIAL_SHA1_TAG_POINTS_TO_SITE_METHOD = git
 GIT_PARTIAL_SHA1_TAG_POINTS_TO_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.mk
index d3ecaa8593..4238a12222 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SHA1_BRANCH_HEAD_VERSION = 68c197d0879d485f4f6cee85544722b79e68e59f
-GIT_SHA1_BRANCH_HEAD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_BRANCH_HEAD_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SHA1_BRANCH_HEAD_SITE_METHOD = git
 GIT_SHA1_BRANCH_HEAD_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.mk
index badf9e13ca..ac982a4a4c 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SHA1_REACHABLE_BY_BRANCH_VERSION = 317406308d9259e2231bd0d6ddad3de3832bce08
-GIT_SHA1_REACHABLE_BY_BRANCH_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_REACHABLE_BY_BRANCH_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SHA1_REACHABLE_BY_BRANCH_SITE_METHOD = git
 GIT_SHA1_REACHABLE_BY_BRANCH_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk
index b5fde7b586..f90fa8d707 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SHA1_REACHABLE_BY_TAG_VERSION = 46bae5b639e5a18e2cc4dc508f080d566baeff59
-GIT_SHA1_REACHABLE_BY_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_REACHABLE_BY_TAG_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SHA1_REACHABLE_BY_TAG_SITE_METHOD = git
 GIT_SHA1_REACHABLE_BY_TAG_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk
index 8914496653..72a456a7e7 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SHA1_TAG_ITSELF_VERSION = 2b0e0d98a49c97da6a618ab36337e2058eb733a2
-GIT_SHA1_TAG_ITSELF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_TAG_ITSELF_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SHA1_TAG_ITSELF_SITE_METHOD = git
 GIT_SHA1_TAG_ITSELF_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk
index adaae7329c..3e54ff1a82 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SHA1_TAG_POINTS_TO_VERSION = 516c9c5f64ec66534d4d069c2e408d9ae4dce023
-GIT_SHA1_TAG_POINTS_TO_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_TAG_POINTS_TO_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SHA1_TAG_POINTS_TO_SITE_METHOD = git
 GIT_SHA1_TAG_POINTS_TO_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
index 7a35b3b51a..52219f36df 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SUBMODULE_DISABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
-GIT_SUBMODULE_DISABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SUBMODULE_DISABLED_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SUBMODULE_DISABLED_SITE_METHOD = git
 GIT_SUBMODULE_DISABLED_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
index 48a42f5e8a..8f92a5b223 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_SUBMODULE_ENABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
-GIT_SUBMODULE_ENABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SUBMODULE_ENABLED_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_SUBMODULE_ENABLED_SITE_METHOD = git
 GIT_SUBMODULE_ENABLED_GIT_SUBMODULES = YES
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk
index 6960ceb2cb..95e7671344 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_TAG_VERSION = mytag
-GIT_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_TAG_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_TAG_SITE_METHOD = git
 GIT_TAG_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
index 786224dad9..f1f5fab669 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_WRONG_CONTENT_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
-GIT_WRONG_CONTENT_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_WRONG_CONTENT_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_WRONG_CONTENT_SITE_METHOD = git
 GIT_WRONG_CONTENT_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk
index f9d0d2226c..b77d05f29a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GIT_WRONG_SHA1_VERSION = 0000000000000000000000000000000000000000
-GIT_WRONG_SHA1_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_WRONG_SHA1_SITE = $(GITREMOTE_DIR)/repo.git
+GIT_WRONG_SHA1_SITE_METHOD = git
 GIT_WRONG_SHA1_LICENSE_FILES = file
 
 $(eval $(generic-package))
diff --git a/support/testing/tests/download/gitconfig.py b/support/testing/tests/download/gitconfig.py
new file mode 100644
index 0000000000..31cee6e123
--- /dev/null
+++ b/support/testing/tests/download/gitconfig.py
@@ -0,0 +1,51 @@
+import os
+import subprocess
+
+import infra
+
+
+GIT_HOST_DIR = "host"
+GIT_CONFIG_DIR = os.path.join(GIT_HOST_DIR, "home/br-user")
+GIT_CONFIG_FILE = os.path.join(GIT_CONFIG_DIR, "gitconfig")
+
+
+def run_git_config(logfile, cmd):
+    logfile.write(
+        "> running git config with '{}'\n".format(" ".join(cmd)))
+    try:
+        subprocess.check_call(cmd, stdout=logfile, stderr=logfile)
+    except FileNotFoundError:
+        logfile.write("> git config failed\n")
+        raise SystemError("git config failed")
+
+
+def generate_gitconfig(builddir, logtofile, gitremotedir):
+    logfile = infra.open_log_file(builddir, "gitconfig", logtofile)
+
+    # The git repository used by this test is cloned locally from
+    # gitremotedir using the "file://" protocol. Since it contains
+    # several git submodules we need to allow this protocol to be used
+    # with git submodules. Since we don't want to modify the user
+    # (global) gitconfig, we use a local gitconfig file.
+    localgitconfig = os.path.join(builddir, GIT_CONFIG_FILE)
+
+    gitconfigdir = os.path.join(builddir, GIT_CONFIG_DIR)
+    os.makedirs(gitconfigdir, exist_ok=True)
+
+    # We are using the git repository from the Buildroot git tree
+    # (gitremotedir). This repository is safe to use using "file://"
+    # protocol with git submodules.
+    cmd = ["git", "config", "--file", localgitconfig,
+           "--add", "protocol.file.allow", "always"]
+
+    run_git_config(logfile, cmd)
+
+    # Disable ownership check of the git tree for Gitlab-CI
+    # environment.
+    # See: https://gitlab.com/buildroot.org/buildroot/-/commit/a016b693f7830f3c8ae815851d3204b8b6e99821
+    for git_repo in os.scandir(gitremotedir):
+
+        cmd = ["git", "config", "--file", localgitconfig,
+               "--add", "safe.directory", git_repo.path]
+
+        run_git_config(logfile, cmd)
diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
deleted file mode 100644
index 7df252d031..0000000000
--- a/support/testing/tests/download/gitremote.py
+++ /dev/null
@@ -1,47 +0,0 @@
-# subprocess does not kill the child daemon when a test case fails by raising
-# an exception. So use pexpect instead.
-import infra
-
-import pexpect
-
-
-GIT_REMOTE_PORT_INITIAL = 9418
-GIT_REMOTE_PORT_LAST = GIT_REMOTE_PORT_INITIAL + 99
-
-
-class GitRemote(object):
-    def __init__(self, builddir, serveddir, logtofile):
-        """
-        Start a local git server.
-
-        In order to support test cases in parallel, select the port the
-        server will listen to in runtime. Since there is no reliable way
-        to allocate the port prior to starting the server (another
-        process in the host machine can use the port between it is
-        selected from a list and it is really allocated to the server)
-        try to start the server in a port and in the case it is already
-        in use, try the next one in the allowed range.
-        """
-        self.daemon = None
-        self.port = None
-        self.logfile = infra.open_log_file(builddir, "gitremote", logtofile)
-
-        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose",
-                      "--listen=localhost", "--export-all",
-                      "--base-path={}".format(serveddir)]
-        for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST + 1):
-            cmd = daemon_cmd + ["--port={port}".format(port=port)]
-            self.logfile.write("> starting git remote with '{}'\n".format(" ".join(cmd)))
-            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile,
-                                        encoding='utf-8')
-            ret = self.daemon.expect(["Ready to rumble",
-                                      "Address already in use"])
-            if ret == 0:
-                self.port = port
-                return
-        raise SystemError("Could not find a free port to run git remote")
-
-    def stop(self):
-        if self.daemon is None:
-            return
-        self.daemon.terminate(force=True)
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ba52e03ef5..0cbb74a061 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -1,7 +1,7 @@
 import os
 import shutil
 
-from tests.download.gitremote import GitRemote
+import tests.download.gitconfig
 
 import infra
 
@@ -12,29 +12,35 @@ class GitTestBase(infra.basetest.BRConfigTest):
         BR2_BACKUP_SITE=""
         """
     gitremotedir = infra.filepath("tests/download/git-remote")
-    gitremote = None
 
     def setUp(self):
         super(GitTestBase, self).setUp()
-        self.gitremote = GitRemote(self.builddir, self.gitremotedir, self.logtofile)
+
+        self.show_msg("Generating custom git config")
+        tests.download.gitconfig.generate_gitconfig(self.builddir,
+                                                    self.logtofile,
+                                                    self.gitremotedir)
 
     def tearDown(self):
         self.show_msg("Cleaning up")
-        if self.gitremote:
-            self.gitremote.stop()
         if self.b and not self.keepbuilds:
             self.b.delete()
 
     def check_hash(self, package):
+        gitconfig = os.path.join(self.builddir,
+                                 tests.download.gitconfig.GIT_CONFIG_FILE)
         # store downloaded tarball inside the output dir so the test infra
         # cleans it up at the end
         env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
-               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+               "GITREMOTE_DIR": self.gitremotedir,
+               "GIT_CONFIG_GLOBAL": gitconfig}
         self.b.build(["{}-dirclean".format(package),
                       "{}-source".format(package)],
                      env)
 
     def check_download(self, package):
+        gitconfig = os.path.join(self.builddir,
+                                 tests.download.gitconfig.GIT_CONFIG_FILE)
         # store downloaded tarball inside the output dir so the test infra
         # cleans it up at the end
         dl_dir = os.path.join(self.builddir, "dl")
@@ -42,7 +48,8 @@ class GitTestBase(infra.basetest.BRConfigTest):
         if os.path.exists(dl_dir):
             shutil.rmtree(dl_dir)
         env = {"BR2_DL_DIR": dl_dir,
-               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+               "GITREMOTE_DIR": self.gitremotedir,
+               "GIT_CONFIG_GLOBAL": gitconfig}
         self.b.build(["{}-dirclean".format(package),
                       "{}-legal-info".format(package)],
                      env)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
