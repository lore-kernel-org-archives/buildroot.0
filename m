Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F194DC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 15:49:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6142D610D2
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6142D610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240466060C;
	Thu, 19 Aug 2021 15:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOBvEc-APdlW; Thu, 19 Aug 2021 15:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A534613B8;
	Thu, 19 Aug 2021 15:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6231BF4E4
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 15:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58F2D42527
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 15:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GDPd7hvFCvo for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 15:49:04 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC08A424F4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 15:49:03 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.181.120])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GkB3m1EAF1KizGkB4mljD0; Thu, 19 Aug 2021 17:41:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629387719; bh=NNIA0atpI1bm3TMTIDz0V/16olLi0vCy4+U9tNrKq94=;
 h=From:To:Subject:Date:MIME-Version;
 b=XJ3E2yXBCkTl+3aY5RoKKEnRvicJlbRMLKNaT+kYjtk/M4ADuwV998hO3/9+e/hkY
 M4fW58uOL/ppJPPM1edizrAAUUNZbMPVN+OK6GAu7FyOxPaAnQs2XNwwEmoLFrkVPG
 Utv4BCRUSzYlOp7H56U66ZwTjspKflXQu0twf7qHESeHs1B3CEjGPthRAit9qMISee
 coDf09b3qvg7noC8HpMkh9gntjaPN0PcYTJR7W1yI78ccQngofYgzDVqcP9HtNZ8n2
 f+Add+tFFl3NQIdlfZTs1sko3CST9tVYdxSxnaQw0Ynw6AFmwkKLObImoABVNFNbCF
 V9SwsJJPmx3vA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Aug 2021 17:41:55 +0200
Message-Id: <20210819154155.1570326-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819152458.1aedaae4@windsurf>
References: <20210819152458.1aedaae4@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNA6yeqBMK7KOOQrigGYvbXXWyqKe4VKqSWoi+75jipYjTLnwr/6X8xFOQ46RxKOIgPObvGYuA8jMRWO2kD5S0uvLNgnX4J03PULCqVqZC+tyvEwufFj
 8BeA8VbdFVp+lnD1GA4eHew4Q+k+u5UOm64Q4jWitn1nsk066wyQWU/r7XV23BTQjk8xPKJycS7ZsMaE0syQOSE3//kEDEh5NwIg0XOy4q5LIUb3TPvTTGXb
 H2xmI2elKrZM1s133b15yX6LMahRZxPWMgsvB3CZUFOp/IBKW94kvsmKKzYP1HfmmQoOcUTZwIabeAslN7zbRw==
Subject: [Buildroot] [PATCH v3] DEVELOPERS: add myself to toolchain topic,
 and to binutils and gcc packages
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
often add myself to toolchain topic(toolchain/) as well as
package/binutils and package/gcc.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* correct alphabet order
V2->V3:
* add myself to binutils and gcc too as suggested by Thomas Petazzoni
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af97de02de..5f90dbfc1f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,6 +1052,8 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/binutils/
+F:	package/gcc/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
@@ -1060,6 +1062,7 @@ F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
 F:	package/udisks/
+F:	toolchain/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
