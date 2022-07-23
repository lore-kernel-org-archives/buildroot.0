Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE32C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03AC341803;
	Sat, 23 Jul 2022 13:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03AC341803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SoVJurhfSNr; Sat, 23 Jul 2022 13:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD223417B9;
	Sat, 23 Jul 2022 13:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD223417B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C47C1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 352A640B08
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 352A640B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cV6zcIYkj8_G for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7299140143
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7299140143
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 818FF8445C; Sat, 23 Jul 2022 13:23:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:36:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97fc9b2a7f32f803286238edffbe0baf5c49b349
X-Git-Newrev: 4c6e7a134fba3a17bbd115edb34eb5964dcb6b95
X-Patchwork-Hint: ignore
Message-Id: <20220723132308.818FF8445C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update documentation about
 partition-type-uuid convention in genimage.cfg
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c6e7a134fba3a17bbd115edb34eb5964dcb6b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Whenever possible, we want to use the "shortcuts" provided by genimage
for the partition-type-uuid values:

 - U for the EFI System Partition
 - F for FAT32 partitions
 - L for root filesystem partitions and other Linux filesystems

In follow-up commits, we will convert existing genimage.cfg to this
convention, except for the root filesystem, if the existing
genimage.cfg specifies a partition-type-uuid that doesn't match the
one that "L" would imply. In this case, we will keep things as-is to
not break existing setups. However, for all future genimage.cfg files,
we recommend to use "L" for the root filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/writing-rules.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 84d8f76431..758965d80a 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -198,6 +198,18 @@ image sdimage.img {
   chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
   (not +kb+) in place of +G+, +M+, +K+.
 
+* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
+  the EFI System Partition (expanded to
+  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
+  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
+  _genimage_) or +L+ for the root filesystem or other filesystems
+  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
+  _genimage_). Even though +L+ is the default value of _genimage_, we
+  prefer to have it explicitly specified in our +genimage.cfg+
+  files. Finally, these shortcuts should be used without double
+  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
+  specified, lower-case letters should be used.
+
 The +genimage.cfg+ files are the input for the genimage tool used in
 Buildroot to generate the final image file(i.e. sdcard.img). For further
 details about the _genimage_ language, refer to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
