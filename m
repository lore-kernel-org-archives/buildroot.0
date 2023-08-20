Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7D9EE49AA
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD59A81FCF;
	Sun, 20 Aug 2023 14:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD59A81FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-eMyqkBaJW0; Sun, 20 Aug 2023 14:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 439688211B;
	Sun, 20 Aug 2023 14:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439688211B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 740A21BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C89981F65
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C89981F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ai0G2W3eEkrn for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5268E81F61
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5268E81F61
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DF5985E1F; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f4b798120b0eb43d3997aa9aefb8f54d47f2849f
X-Git-Newrev: 7fddbe25301aae024f7fc22498392387f6874506
X-Patchwork-Hint: ignore
Message-Id: <20230820142118.3DF5985E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: mount the
 download directory if specified
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fddbe25301aae024f7fc22498392387f6874506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If the user has defined $BR2_DL_DIR in the environment, it would be
nice to have it accessible inside the Docker container, and the
BR2_DL_DIR environment variable set to access it.

This commit does exactly this: it mounts the host $BR2_DL_DIR as /dl
in the container, and sets BR2_DL_DIR=/dl in the container.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: use the new mountpoints list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 2f689a1fbd..7b27a9b05c 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -35,6 +35,11 @@ if [ "${GIT_DIR}" ]; then
     mountpoints+=( "${GIT_DIR}" )
 fi
 
+if [ "${BR2_DL_DIR}" ]; then
+    mountpoints+=( "${BR2_DL_DIR}" )
+    docker_opts+=( --env BR2_DL_DIR )
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
