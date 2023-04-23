Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2367AC77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F711405A1;
	Sun, 23 Apr 2023 17:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F711405A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ue3aA1EEvmRi; Sun, 23 Apr 2023 17:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC96E404AB;
	Sun, 23 Apr 2023 17:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC96E404AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92DC21C2B1F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 17:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 789A640931
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 17:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 789A640931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F11Ro5QFwIvB for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 17:37:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A54504091C
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 17:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A54504091C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9161A844A9; Sun, 23 Apr 2023 17:37:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 19:34:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6104b62d95e87e5cb4f4815b78841541de4301e8
X-Git-Newrev: 3d8212c4b29d00caf20a3036ced885a3260678ec
X-Patchwork-Hint: ignore
Message-Id: <20230423173711.9161A844A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: allow running without a
 tty
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d8212c4b29d00caf20a3036ced885a3260678ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, utils/docker-run spawns a container with a tty, so that he
user can interact properly in the container.

However, that requires a tty when calling docker-run, which is not
always guaranteed, e.g. if called from a git hook.

Since the script is a bash script already, we can use an array to store
options passed to docker, and only add the -t option when there is
actually a tty available.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/docker-run | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 164e11c0e6..135a1451b6 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -6,8 +6,15 @@ MAIN_DIR=$(readlink -f "${DIR}/..")
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
-exec docker run -it --rm \
-    --user "$(id -u):$(id -g)" \
-    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
-    --workdir "${MAIN_DIR}" \
-    "${IMAGE}" "${@}"
+declare -a docker_opts=(
+    -i
+    --rm
+    --user "$(id -u):$(id -g)"
+    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
+    --workdir "${MAIN_DIR}"
+)
+if tty -s; then
+    docker_opts+=( -t )
+fi
+
+exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
