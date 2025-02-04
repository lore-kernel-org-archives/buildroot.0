Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77574C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4303E6FCC5;
	Fri, 28 Feb 2025 17:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2o7GV1qvbbJn; Fri, 28 Feb 2025 17:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4B570ACD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4B570ACD;
	Fri, 28 Feb 2025 17:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DA31DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CD7441457
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvl_ACqRI9ZM for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C0E142F5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0E142F5D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6665185FAE; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 13:18:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ecab31fad12a494ec0d2a3767c736a55c80a769
X-Git-Newrev: b2e6cff38f34eff37f8edea6a80094788a33bc19
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.6665185FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/mender/x86_64/post-image-efi.sh: re-arrange write rootfs-image args
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b2e6cff38f34eff37f8edea6a80094788a33bc19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Put the write rootfs-image argument before the compression argument.
This change makes the logic easier to follow.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/mender/x86_64/post-image-efi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index ab12386076..9ed597d3e4 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -45,8 +45,8 @@ make_data_partition() {
 generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
-        --compression lzma \
         write rootfs-image \
+        --compression lzma \
         -t "${DEVICE_TYPE}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
