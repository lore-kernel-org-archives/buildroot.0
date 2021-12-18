Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB701C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C28D60B33;
	Sat, 18 Dec 2021 21:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SDtNI90nHN1; Sat, 18 Dec 2021 21:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9733E60B2F;
	Sat, 18 Dec 2021 21:00:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 208411BF267
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E42F80D41
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 20:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGJOwMUtbNDB for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 20:59:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6221D80A83
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 20:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1DCF3822D1; Sat, 18 Dec 2021 20:54:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 21:59:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: debc50bd594f98aa433e2de336018d769a3496ec
X-Git-Newrev: 223085f671366ee200242f390214e9fef4323211
X-Patchwork-Hint: ignore
Message-Id: <20211218205433.1DCF3822D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boards/odroidc2: fix genimage execution
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

commit: https://git.buildroot.net/buildroot/commit/?id=223085f671366ee200242f390214e9fef4323211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix the following error:
ERROR: hdimage(sdcard.img): partition [MBR] (offset 0x1b8, size 0x48) overlaps previous partition bl1 (offset 0x0, size 0xc200)
ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

which started at the genimage version bump to 15 commit.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935217
Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/hardkernel/odroidc2/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index c283b514d6..f31867a591 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -18,6 +18,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "bl1.bin.hardkernel"
 		offset = 0
+		holes = {"(440; 512)"}
 	}
 
 	partition u-boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
