Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90122C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3DB140A40;
	Thu,  2 Dec 2021 17:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcYHEd5pND9O; Thu,  2 Dec 2021 17:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 218B240184;
	Thu,  2 Dec 2021 17:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D47FC1BF5EA
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C47EE83EED
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SOmteZxXQ2g for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:01:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63B0683EDE
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:01:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0CB8FE000A;
 Thu,  2 Dec 2021 17:01:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mspSw-0005OK-7a; Thu, 02 Dec 2021 18:01:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 18:01:45 +0100
Message-Id: <20211202170146.20676-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Makefile: release: use .tar.xz instead of
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
