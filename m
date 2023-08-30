Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D336BC83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6706B41859;
	Wed, 30 Aug 2023 22:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6706B41859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hef7SQ0rcYw; Wed, 30 Aug 2023 22:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C47418AC;
	Wed, 30 Aug 2023 22:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C47418AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B95171BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 316E341E0D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316E341E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9Py8_u8RrnX for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4173341E46
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4173341E46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30817866C0; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:30:35 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: fbc2e83d41c3f1aa723f68c9926311db0a4ed22f
X-Git-Newrev: 71278999515fa80b61192c3a156f119676e42424
X-Patchwork-Hint: ignore
Message-Id: <20230830223119.30817866C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] utils/docker-run: fix
 running when CWD is not MAIN_DIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=71278999515fa80b61192c3a156f119676e42424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Commit 90790790925c (utils/docker-run: fix support for git-worktrees)
got last-minute changes when it was applied, and the case when the
current working directory is not the top of the current working copy
got broken.

Fix that by duplicating (and thus reinstating) the 'cd MAIN_DIR' to
match what is done when retrieving the git-common-dir.

Fixes: 90790790925c

Reported-by: Brandon Maier <Brandon.Maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b559109eeeec19e6e33c82712690aec89dcb562)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/docker-run | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index b201d28289..ab95e61e84 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -27,9 +27,10 @@ declare -a docker_opts=(
 # .git directory.
 if [ "${GIT_DIR}" ]; then
     # GIT_DIR in the main working copy (when git supports worktrees) will
-    # be just '.git', but 'docker run' needs an absolute path. If it's an
-    # absolute path already (in a wordir), then that's a noop.
-    GIT_DIR="$(readlink -e "${GIT_DIR}")"
+    # be just '.git', but 'docker run' needs an absolute path. If it is
+    # not absolute, GIT_DIR is relative to MAIN_DIR. If it's an absolute
+    # path already (in a wordir), then that's a noop.
+    GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
     docker_opts+=( --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}" )
 fi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
