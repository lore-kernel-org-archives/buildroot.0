Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6BC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 478CB410C2;
	Tue,  7 Feb 2023 21:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 478CB410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEiaOopUNai1; Tue,  7 Feb 2023 21:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3226D409F4;
	Tue,  7 Feb 2023 21:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3226D409F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80F8D1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FD08131E
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67FD08131E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWsDUnv4tynd for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:59:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E268131B
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E268131B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C638843C1; Tue,  7 Feb 2023 21:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:55:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e92bb8f1c9523227413500380df16bfc64053fad
X-Git-Newrev: a016b693f7830f3c8ae815851d3204b8b6e99821
X-Patchwork-Hint: ignore
Message-Id: <20230207215916.6C638843C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] gitlab-ci: fix pipelines
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a016b693f7830f3c8ae815851d3204b8b6e99821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When gitlab prepares a job to run, it checks out the repository with a
non-root user, and spawns a container that runs as root, with some UID
mapping that makes the files be owned by root in the container. However,
our pipelines run as a nont-root user.

Commit bde165f7ad (.gitlab-ci.yml: update Docker image to use) updated
the docker image that is used to run in our pipelines.

That new image includes a git version that is stricter about the
ownership of the git tree it is acting in: git aborts in error when the
user running it does not own the repository.

We use `git ls-tree` quite a lot in our check-{flake8,package,symbols}
rules, so they all fail (in various ways).

To fix this, we either need to fix the ownership or tell git to ignore
the situation.

It is most probably impossible to change the ownership of the files: we
run as non-root,and the files belong to root (in the container). So
we're stuck.

The alternative, is to do as git suggest, and tell it to ignore the
situation. In a local setup, this would be very insecure, but in the
pipelines, this is in a throw-away container, where a single user exists
and is running, so we don't care much (if at all).

Add a global before_script that registers the git config to ignore
ownership issues in the buildroot repository; see [0] for the definition
of the CI_PROJECT_DIR variable. Note: unlike what is said in there, and
in [1], the value actually seen in CI_PROJECT_DIR is already prefixed
with CI_BUILDS_DIR (the documentation is unclear about that point).

[0] https://docs.gitlab.com/ee/ci/variables/predefined_variables.html
[1] https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-runners-section

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 9c1faf0d5f..38aca31fb5 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,3 +1,6 @@
+before_script:
+  - git config --global --add safe.directory ${CI_PROJECT_DIR}
+
 .check-check-package_base:
     script:
         - python3 -m pytest -v utils/checkpackagelib/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
