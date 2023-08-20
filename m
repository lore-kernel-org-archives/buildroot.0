Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0F5EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE168211B;
	Sun, 20 Aug 2023 14:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE168211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtTBYojd1LCj; Sun, 20 Aug 2023 14:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59EB281FDC;
	Sun, 20 Aug 2023 14:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59EB281FDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A69B1BF86C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C35D60B90
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C35D60B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_d6xREJ7nn8 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8454F60BE1
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8454F60BE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FAE285E1F; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b877dc7c272d9624b6fbef97e1846e32002e4a6
X-Git-Newrev: 80a1e728b0053e6fb7dc8ea9c1331749b3695f03
X-Patchwork-Hint: ignore
Message-Id: <20230820142118.6FAE285E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: allow IMAGE
 to be passed in the environment
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

commit: https://git.buildroot.net/buildroot/commit/?id=80a1e728b0053e6fb7dc8ea9c1331749b3695f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It is sometimes useful to use docker-run, but with a different image
than the default one. This commit allows to override the image being
used by only defining IMAGE if not already passed in the environment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: s/\t/    /g]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 33d2e63abc..848e9b3840 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -9,9 +9,11 @@ else
     # Support git-worktree
     GIT_DIR="$(cd "${MAIN_DIR}" && git rev-parse --no-flags --git-common-dir)"
 fi
-# shellcheck disable=SC2016
-IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
-        sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
+if test -z "${IMAGE}" ; then
+    # shellcheck disable=SC2016
+    IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
+            sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
+fi
 
 declare -a docker_opts=(
     -i
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
