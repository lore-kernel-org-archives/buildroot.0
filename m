Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C849C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46FD82AAA;
	Wed, 16 Feb 2022 21:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLtYboR9r5-D; Wed, 16 Feb 2022 21:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26EA1828E3;
	Wed, 16 Feb 2022 21:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75B011BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632C8828E3
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmEFKcmvH-Cb for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:55:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF7CD82846
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:55:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EB9378377F; Wed, 16 Feb 2022 21:48:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:55:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 892834535cdf27c6290a1d45fa8e03b3e1908f35
X-Git-Newrev: cc9470c2d8134106792a5a0179fbd0c6ca4d37af
X-Patchwork-Hint: ignore
Message-Id: <20220216214805.EB9378377F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: hide docker run command
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc9470c2d8134106792a5a0179fbd0c6ca4d37af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this is a helper script there is not much reason to show the
command that's been issued. Furthermore, the incantation has been
slightly extended since the script was introduced.

The only interesting reason to print the command is to know what image
it is being spawned into. However, this is prominently displayed by
docker the first time the script is run, as it can't find the image
locally and has to fetch it first. Afterwards, users can still use
'docker image ls' to see what images they have locally.

So let's remove 'set -x' before running docker.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr: reword and expand commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index bdbc979264..5653764254 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -6,7 +6,6 @@ MAIN_DIR=$(readlink -f "${DIR}/..")
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
-set -x
 exec docker run -it --rm \
     --user $(id -u):$(id -g) \
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
