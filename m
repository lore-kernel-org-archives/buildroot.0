Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5941CC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A369610A3
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A369610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3FA34074C;
	Wed, 18 Aug 2021 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cy6Jlf3pcVOs; Wed, 18 Aug 2021 21:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB064075C;
	Wed, 18 Aug 2021 21:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DBB61BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A17060B85
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaFKN7tZZTel for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:02:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10111.aruba.it (smtpcmd10111.aruba.it [62.149.156.111])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B4BB60654
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:02:23 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GShYmxxasnyXHGShZmd04q; Wed, 18 Aug 2021 23:02:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629320542; bh=WWjCAjXRbrPtyATMnBBJTsDbg7Mi10y6ywg6/r2RCtg=;
 h=From:To:Subject:Date:MIME-Version;
 b=LHThtGHd8pw6wEaKz60YYSRDAddStjkcT24pH58Cd5DVx+SmZkQhZJgJutkHHzGEL
 jI1W9+kwwvk/rGNe0wlN2TOWAo726gYJqdJWfX0f31I6arkZfqXXLANgjc+UOG1nji
 iee/1oqQbompwAGjw9/Xd24cqfqKDjt6z+SlgAtDmCiLlD14wcXAgNiGClkrTqpNCZ
 h0RpQtZFLgL2XqHuZm2UCMcE9cXpCXQG2tuGdDY8MVQAxcKRACINYIMjjsrospwwD9
 0PE/nVQOoemt40B4yWN4G6SaOtPqHPV7QEJMJbzX7zPh1AjELq2Stqb5qNGVVf/ROi
 SQTur8058FEYA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 23:02:19 +0200
Message-Id: <20210818210219.351801-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA4au+yh4DBPsLbbLIfOl2830c4m7MWtOfn/SMSr/H2K/OYbzO3crlc8MJ5aHEYj1ciM0+mj/lWMLxG3QW58JAnlQivHjsieex3G9KABTl0OXGW/nn3/
 3HtbLh+L9OMJS3Ft6cOALz74biO5K/lKeC4CzwPW4/Z1Wl2hyIP4qRi9l1QCi2f1VRcEod/5FlSmH3k8P9M1k9j9fMr9JeQ+7xWfruA5GT0FRQqbeQKcc25O
 N88FXUVHHgjfujExC+lWrQ==
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to toolchain topic
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since I've dealt and deal with toolchain bugs and their work-around very
often add myself to toolchain topic(toolchain/).

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af97de02de..328c7ba943 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1059,6 +1059,7 @@ F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
+F:	toolchain/
 F:	package/udisks/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
