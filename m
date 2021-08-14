Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FF6C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 23:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A954260F48
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 23:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A954260F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C5D402ED;
	Sat, 14 Aug 2021 23:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCfimwLWButY; Sat, 14 Aug 2021 23:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85B9402FB;
	Sat, 14 Aug 2021 23:05:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9FF1BF314
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 23:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CF12400E5
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 23:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRy1NwnXHKmS for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 23:05:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12141.aruba.it (smtpcmd12141.aruba.it [62.149.156.141])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0954400B5
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 23:05:10 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2bMmrQy6nxSqF2bMmsL4M; Sun, 15 Aug 2021 00:58:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628981886; bh=r4AYXpXVIIRswtC2Es7oze8cWn2v2mrzy2pXe9ZuPJY=;
 h=From:To:Subject:Date:MIME-Version;
 b=DNSrA6T8Pr8hx0k1v6rBy6ERKRToFsOKfcqZOieIkjcvQwJhYPEQoJtt0maWdu8ie
 uGcsj5g9IvkuyJyAyOLz3LQEzL1aqRr3nSvqr/cEj+6ndpV0pBg+8MgFQVYgGfeCmU
 WSnZTk55vQ0o0lm/je+baspzQ05d2REGqcIzGCb5EGsTdIhf/CkvM9uUhpXH6b4Pao
 vbDsgulZPC0InJSqvBmHzVaY4+LAqSQuL1Qi2GQTJQBNF91xXvwthzTUulduCUjbJx
 Odrx/zjzief4avc70LXCCYO1aVDBDaZU/mchUSBV1JHSVxOj8WezeT+4gmoBbxh/Q/
 hEU+QGfigOagg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 00:58:01 +0200
Message-Id: <20210814225803.812478-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIRxt6p15BLhkWvUUI1KmXb1hmn3y3qUP28s46qMd+9d/PkhUjvIdyf7KHcTy+1XivGD9CJlLmJDHKyAbAWgP3ptYzZnA6WyMYlpHngTsCBDu2qz/xQW
 5xNGVMn2JlB9HrJYyDhr/aDACGkvKbD9rqiAQ2fJ2SP8HYYi4VJ5YIhK+UTBMW/aAWO55E8VEtHCwraKNBtjxDP/QEwNb8RWXwKk9q5s3VDOOxIsGR5TaVSa
 DSxVxvzE3R4A6WbBQ8fdgMJDYbLDui0si3ycyyHLXea+XUXQ10POYABj1TsS79WjUHElX8I62fFL7wNwC+weiBQ9CBwTAgO5nS9DEU3Hf3ZmpqNGJDG5NF/F
 e2V02ipZaT3/K7ZSk4Vl2CfJNzsBFQ+6Yw6eAXl3Vfu4V146WAQ=
Subject: [Buildroot] [PATCH 0/2] Introduce and work-around bug 101916 on
 heirloom-mailx
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset introduce gcc bug 101916 and reference to it in heirloom-mailx
to work it around by disabling optimization(-O0).

NOTE: this patchset must be applied *after* this patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=258071

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_101916
  package/heirloom-mailx: fix build failure due to gcc bug 101916

 package/heirloom-mailx/heirloom-mailx.mk | 10 +++++++++-
 toolchain/Config.in                      |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
