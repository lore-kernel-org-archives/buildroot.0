Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E72CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E4960640;
	Thu,  4 Sep 2025 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzXrvbKKb7T0; Thu,  4 Sep 2025 16:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549B5605BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 549B5605BD;
	Thu,  4 Sep 2025 16:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E83111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 435254005F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCDSzuJF04KL for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6485040051
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6485040051
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53ECA87F82; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:45:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 681b92664da62f807f836a8c28ecbf54b7ca6818
X-Git-Newrev: dfed1003d9684d59dd1a48052003fa6212566d63
X-Patchwork-Hint: ignore
Message-Id: <20250904165346.53ECA87F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal: increase vfat partition to
 64M
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dfed1003d9684d59dd1a48052003fa6212566d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of the
default Linux kernel Image file for versal products is increasing from 23.4M
to 26.9M. This is leaving limited free space in the vfat partition meaning
users may unknowingly exceed the 32M size by just adding Linux kernel configs.

To avoid potential problems, this patch doubles the size of the vfat partition
to 64M, which should be plenty of space for any configuration.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/versal/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal/genimage.cfg b/board/versal/genimage.cfg
index d994d3a2bf..8870777f19 100644
--- a/board/versal/genimage.cfg
+++ b/board/versal/genimage.cfg
@@ -10,7 +10,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 32M
+	size = 64M
 }
 
 image sdcard.img {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
