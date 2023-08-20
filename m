Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B21EC8735
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4DB41DC7;
	Thu,  7 Sep 2023 14:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D4DB41DC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ah5pCqz2EoDS; Thu,  7 Sep 2023 14:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0FD41E36;
	Thu,  7 Sep 2023 14:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D0FD41E36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D47161BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7E8081FFD
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E8081FFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRp7NdTvp4Ac for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1654B81FF0
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1654B81FF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0638486A27; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fddbe25301aae024f7fc22498392387f6874506
X-Git-Newrev: e71fb8f71c09ef93a9d9a543105de0f99f6c64c1
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.0638486A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: bind mount .git/objects
 if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=e71fb8f71c09ef93a9d9a543105de0f99f6c64c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If buildroot is checked out as part of a 'repo' manifest, docker-run
doesn't fully bind mount the .git directory, leading to commands such
as `utils/docker-run make check-package` to fail.

Signed-off-by: Nicolas Boichat <drinkcat@google.com>
[yann.morin.1998@free.fr: use newly introduced mountpoints list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 7b27a9b05c..40027514c5 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -33,6 +33,14 @@ if [ "${GIT_DIR}" ]; then
     # path already (in a wordir), then that's a noop.
     GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
     mountpoints+=( "${GIT_DIR}" )
+
+    # 'repo' stores .git/objects separately.
+    if [ -L "${GIT_DIR}/objects" ]; then
+        # GITDIR is already an absolute path, but for symetry
+        # with the above, keep the same cd+readlink construct.
+        OBJECTS_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}/objects")"
+        mountpoints+=( "${OBJECTS_DIR}" )
+    fi
 fi
 
 if [ "${BR2_DL_DIR}" ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
