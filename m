Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F44EC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B878134E;
	Thu,  7 Sep 2023 15:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B878134E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smB69SpZ2n2m; Thu,  7 Sep 2023 15:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B946883B17;
	Thu,  7 Sep 2023 15:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B946883B17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1121BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64DDA41DD5
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DDA41DD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMjMylG6pBH7 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1891941D62
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1891941D62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FCFF869E0; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e71fb8f71c09ef93a9d9a543105de0f99f6c64c1
X-Git-Newrev: db777eef134ac3034a7970511ab96312d356c83e
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.0FCFF869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: also mount current
 working directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=db777eef134ac3034a7970511ab96312d356c83e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, using utils/docker-run expects that the current working
directory is the working copy. This means that it is not possible
to use docker-run with an out-of-tree build (one using O=).

Add the current working directory to the list of mountpoints, and
use that as working directory in the container.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/docker-run | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 40027514c5..e64b4f10c0 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -17,10 +17,13 @@ declare -a docker_opts=(
     -i
     --rm
     --user "$(id -u):$(id -g)"
-    --workdir "${MAIN_DIR}"
+    --workdir "$(pwd)"
 )
 
-declare -a mountpoints=( "${MAIN_DIR}" )
+declare -a mountpoints=(
+    "${MAIN_DIR}"
+    "$(pwd)"
+)
 
 # Empty GIT_DIR means that we are not in a workdir, *and* git is too old
 # to know about worktrees, so we're not in a worktree either. So it means
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
