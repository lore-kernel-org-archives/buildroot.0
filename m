Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6117EC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DEF48161D;
	Thu,  7 Sep 2023 15:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DEF48161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ji7izi4PD3FW; Thu,  7 Sep 2023 15:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE94183C1F;
	Thu,  7 Sep 2023 15:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE94183C1F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 209D51BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E91241E6D
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E91241E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJb0FsL2O6dk for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0808A41D6A
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0808A41D6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E579A86A21; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 193f6dd002a60a7c52090c3713fd6efeaf757fd3
X-Git-Newrev: f4b798120b0eb43d3997aa9aefb8f54d47f2849f
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.E579A86A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: introduce sorted list of
 mountpoints
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4b798120b0eb43d3997aa9aefb8f54d47f2849f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, we only ever mount two mountpoints, the main directory (i.e.
the working copy), and the git directory.

To pave the way for adding new mountpoints, we introduce a list of them,
that we sort to ensure that we never mount a shallower mounpoint after a
deeper one (that would shadow the deeper mountpoint).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/docker-run | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index ab95e61e84..2f689a1fbd 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -17,10 +17,11 @@ declare -a docker_opts=(
     -i
     --rm
     --user "$(id -u):$(id -g)"
-    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
     --workdir "${MAIN_DIR}"
 )
 
+declare -a mountpoints=( "${MAIN_DIR}" )
+
 # Empty GIT_DIR means that we are not in a workdir, *and* git is too old
 # to know about worktrees, so we're not in a worktree either. So it means
 # we're in the main git working copy, and thus we don't need to mount the
@@ -31,9 +32,14 @@ if [ "${GIT_DIR}" ]; then
     # not absolute, GIT_DIR is relative to MAIN_DIR. If it's an absolute
     # path already (in a wordir), then that's a noop.
     GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
-    docker_opts+=( --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}" )
+    mountpoints+=( "${GIT_DIR}" )
 fi
 
+# shellcheck disable=SC2013 # can't use while-read because of the assignment
+for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
+    docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
+done
+
 if tty -s; then
     docker_opts+=( -t )
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
