Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA8CEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D63681F69;
	Sun, 20 Aug 2023 14:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D63681F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FxNRblpG8aF; Sun, 20 Aug 2023 14:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D7681F67;
	Sun, 20 Aug 2023 14:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D7681F67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32AA71BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD9381F67
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD9381F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6W0o7OYN5QoV for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48FFC81F60
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48FFC81F60
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33EC985E1E; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 193f6dd002a60a7c52090c3713fd6efeaf757fd3
X-Git-Newrev: f4b798120b0eb43d3997aa9aefb8f54d47f2849f
X-Patchwork-Hint: ignore
Message-Id: <20230820142118.33EC985E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: introduce
 sorted list of mountpoints
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
