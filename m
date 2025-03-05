Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2B5C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFC440713;
	Wed,  5 Mar 2025 21:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jegpCXejrkz4; Wed,  5 Mar 2025 21:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6514071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F6514071B;
	Wed,  5 Mar 2025 21:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D59495F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA8E406F9
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T2Ds4ikspeu for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 828B740713
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 828B740713
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F9987F7F; Wed,  5 Mar 2025 21:46:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 22:28:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b19976abc90c9712e807726f207ad3d447d876dd
X-Git-Newrev: 14a7e99b6deb373739aeb97f38f962bf10d28c6b
X-Patchwork-Hint: ignore
Message-Id: <20250305214618.75F9987F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64/post-build.sh: fix
 device_type location
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

commit: https://git.buildroot.net/buildroot/commit/?id=14a7e99b6deb373739aeb97f38f962bf10d28c6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the post-build.sh script adds device_type to /var/lib/mender,
however, this doesn't work for two reasons:
 1) /data/ mounts to /var/lib/mender
 2) The device_type location in mender.conf points to /etc/mender/device_type.

This leads to an error during the bootstrap process because mender reads the
default device_type file installed by mender.mk in /etc/mender, leading to the
following error:

```
Error while handling bootstrap Artifact, continuing: invalid bootstrap
Artifact: readHeaderV3: handleHeaderReads: image
(device types [buildroot-x86_64]) not compatible with device BUILDROOT_DEVICE
```

Set the creation of the device_type file in board/mender/x86_64/post-build.sh
to /etc/mender/device_type to fix the error.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/mender/x86_64/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 5e6967ebd1..9e909e9281 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -42,7 +42,7 @@ mender_fixup() {
 main() {
     parse_args "${@}"
     mender_fixup
-    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/var/lib/mender/device_type"
+    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
 }
 
 main "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
