Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15741EE49A6
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F6981FAD;
	Sun, 20 Aug 2023 14:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9F6981FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-qtYxFNBbux; Sun, 20 Aug 2023 14:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1F381F9A;
	Sun, 20 Aug 2023 14:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D1F381F9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E61D1BF86C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2588B60BFC
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2588B60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6TxebaF6z3I for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6730F60B90
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6730F60B90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 480E885E20; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7fddbe25301aae024f7fc22498392387f6874506
X-Git-Newrev: e71fb8f71c09ef93a9d9a543105de0f99f6c64c1
X-Patchwork-Hint: ignore
Message-Id: <20230820142118.480E885E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: bind mount
 .git/objects if needed
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
