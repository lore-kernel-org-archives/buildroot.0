Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C46C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 23:21:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D3F60FA0
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 23:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69D3F60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 361F1402B9;
	Sun, 12 Sep 2021 23:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6na6Epy9twv; Sun, 12 Sep 2021 23:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AEB0401D6;
	Sun, 12 Sep 2021 23:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 557141BF3D1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 23:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 442EB401D6
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 23:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPtfdf-3JvTW for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 23:21:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id F31834017B
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 23:21:00 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PYmPmElkhnyXHPYmQmAaCq; Mon, 13 Sep 2021 01:20:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631488858; bh=oib6WBDAuia5dWrUkH48Sh3FXfKcThmCruhJoqGU7fs=;
 h=From:To:Subject:Date:MIME-Version;
 b=OT4AMhqEq+fBFQVHVhERAKtfXn9m1fsB36/xd47oQWnywjY8W4AwjnyqIH/GYwTRq
 fk9DXJtaX81Wt7PrkEgPFUGuPilnVgWLxXO/DYl7ocy0TT+oIc9vCizx7FLEk1OfiW
 qgzo6g2T09K5lGkC71x4SC2V6/tdVx/4hSYeVBz/3kPYdNXOmpOdSh5wwI8IdDIJLe
 Igk6ELu7loExFM6AZDjCJW4W36GhSEFlfp2dH0nXl3GgH1j2FFJC3Q1QMJT8lXGOVC
 UcJY+wbeGeagMYPfXuJN8MVq+1Bus5sEOG3hu+1jGlpQnco4jseYZ4imcJOLIYINUo
 ZPupJ9PSxJ6vQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 01:20:56 +0200
Message-Id: <20210912232056.1420052-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912232056.1420052-1-giulio.benetti@benettiengineering.com>
References: <20210912232056.1420052-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHV+zNLDz31WwIRrbF4Bkx5cGpXXBOq03/OqCV2TVgGv/FkFsVGSzzE638knVzKo820iVk0pWXPexkwqGHUARnX7KFqaFIloWnn4UZvWqXxanjjrJgpw
 pxssBrkenqoipKW4aMy8ZRbDiIgKgnkjYY7ZxOchKQCr6jvC3a9vKd/1WO6HWHigxljt6oC64GffWUyyhjSA7zqbEvvxboMM30jcaGYx0tUTjKi/jBtCm94X
 HL4gPSX0ZA5uW8KVLSGTqhIjDUqjSZrxy8LzzMZAIOK/rVc1rNKytODGZMYT+xVT
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself to trace-cmd package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add myself to trace-cmd package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98628d3992..926c6a27d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1065,6 +1065,7 @@ F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
+F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
