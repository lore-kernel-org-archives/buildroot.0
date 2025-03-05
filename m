Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E44C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76604071B;
	Wed,  5 Mar 2025 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AhHp-9j5m_w; Wed,  5 Mar 2025 21:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C5F40B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C5F40B4B;
	Wed,  5 Mar 2025 21:46:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC3B9E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA08840167
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byoirIm-iv5G for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9377541153
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9377541153
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89EDB87F80; Wed,  5 Mar 2025 21:46:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 22:28:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14a7e99b6deb373739aeb97f38f962bf10d28c6b
X-Git-Newrev: e070406523af4547d94fd3fea96354622eccb0ad
X-Patchwork-Hint: ignore
Message-Id: <20250305214618.89EDB87F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64/post-image-efi.sh: fix
 bootstrap creation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e070406523af4547d94fd3fea96354622eccb0ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the mender_x86_64_efi_defconfig does not build the xz package, creating a
boostrap image with a lzma compression results in the following error on boot:

```
Error while handling bootstrap Artifact, continuing: invalid bootstrap
Artifact: readHeaderV3: handleHeaderReads: readHeader: readNext: Failed to get
next header: reader: error reading archive: unexpected EOF
```

This also results in the same error for the generated mender image, as it's
also created with lzma compression unconditionally.

Set the compression to none to resolve the above error.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/mender/x86_64/post-image-efi.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 3d4ef1176a..a3e262f8fe 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -53,7 +53,7 @@ generate_mender_bootstrap_artifact() {
 
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
-    --compression lzma \
+    --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
     --device-type "${DEVICE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
@@ -68,7 +68,7 @@ generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
-        --compression lzma \
+        --compression none \
         -t "${DEVICE_TYPE}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
