Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F0BC77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3778C40602;
	Tue,  2 May 2023 07:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3778C40602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7upmanmIQ12z; Tue,  2 May 2023 07:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F27F41746;
	Tue,  2 May 2023 07:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F27F41746
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB621BF85D
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19FCC60BC6
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19FCC60BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKPpRzdBUUZX for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C30C60672
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C30C60672
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C980856A8; Tue,  2 May 2023 07:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 08:30:09 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7959fe04b5ea75b488eaf7cb06d43f81d2e8494b
X-Git-Newrev: 904966909dbdeb835d22b41166eebfcbaa5b46cf
X-Patchwork-Hint: ignore
Message-Id: <20230502072850.4C980856A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/docker-run: allow
 running without a tty
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

commit: https://git.buildroot.net/buildroot/commit/?id=904966909dbdeb835d22b41166eebfcbaa5b46cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Currently, utils/docker-run spawns a container with a tty, so that he
user can interact properly in the container.

However, that requires a tty when calling docker-run, which is not
always guaranteed, e.g. if called from a git hook.

Since the script is a bash script already, we can use an array to store
options passed to docker, and only add the -t option when there is
actually a tty available.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
(cherry picked from commit 3d8212c4b29d00caf20a3036ced885a3260678ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
