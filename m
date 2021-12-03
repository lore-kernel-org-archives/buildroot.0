Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 16:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A098317B;
	Fri,  3 Dec 2021 16:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pvwxm-jJCLWQ; Fri,  3 Dec 2021 16:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98DFB83112;
	Fri,  3 Dec 2021 16:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC731BF589
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1945383123
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87t5dM2bPgro for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58598830FB
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E653E92403; Fri,  3 Dec 2021 16:40:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Dec 2021 17:42:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64cb922db7db08d180f59010e59f3adef5ae2e0b
X-Git-Newrev: a9bd2b8685ee9cbc6b00e0aa684978fe5f6ca2eb
X-Patchwork-Hint: ignore
Message-Id: <20211203164018.E653E92403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: release: use .tar.xz instead of
 .tar.bz2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9bd2b8685ee9cbc6b00e0aa684978fe5f6ca2eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xz compresses better than bzip2, and is (getting) more popular, so build
release tarballs as .tar.xz (in addition to .tar.gz) instead of .tar.bz2,
similar to how the kernel did ~8 years ago:

https://www.kernel.org/happy-new-year-and-good-bye-bzip2.html

-rw-r--r-- 1 peko peko 5,1M Dec  2 17:55 buildroot-2021.11-rc3.tar.xz
-rw-r--r-- 1 peko peko 5,7M Nov 30 18:15 buildroot-2021.11-rc3.tar.bz2
-rw-r--r-- 1 peko peko 6,8M Nov 30 18:15 buildroot-2021.11-rc3.tar.gz

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 53f6ae9173..0f84122bd3 100644
--- a/Makefile
+++ b/Makefile
@@ -1210,7 +1210,7 @@ release:
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
-	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
+	xz -9 -c < $(OUT).tar > $(OUT).tar.xz
 	rm -rf $(OUT) $(OUT).tar
 
 print-version:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
