Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A798CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 13:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5440481A18;
	Wed, 23 Feb 2022 13:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1x5PoDiK35FT; Wed, 23 Feb 2022 13:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D85C817A9;
	Wed, 23 Feb 2022 13:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68D221BF83C
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 13:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5664440112
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 13:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsz-vDnrtWzq for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 13:00:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EAAE400CD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 13:00:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9576BC0EEE
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:41:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D34640002;
 Wed, 23 Feb 2022 12:41:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nMqxD-009wcC-BY; Wed, 23 Feb 2022 13:41:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 13:41:08 +0100
Message-Id: <20220223124109.2370215-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Makefile: unexport 'DEVICE_TREE' environment
 variable
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

U-Boot looks for the environment variable DEVICE_TREE and uses its value if
set instead of the CONFIG_DEFAULT_DEVICE_TREE configuration option since
v2021.01, more specifically commit c0f1ebe9c1b9745e (binman: Allow selecting
default FIT configuration) - So unexport it like we do for other
"troublesome" environment variables to ensure consistent behaviour.

Reported-by: Neal Frager <nealf@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index d92438166f..0ed93e600d 100644
--- a/Makefile
+++ b/Makefile
@@ -426,6 +426,7 @@ unexport O
 unexport GCC_COLORS
 unexport PLATFORM
 unexport OS
+unexport DEVICE_TREE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
