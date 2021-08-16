Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39169C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 17:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 718256056C
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 17:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 718256056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3835A80E55;
	Mon, 16 Aug 2021 17:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0Wnj7EMQ3Pa; Mon, 16 Aug 2021 17:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B67C080E66;
	Mon, 16 Aug 2021 17:46:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B04401BF3F3
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 17:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC98980EAC
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 17:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PGtq-aGPN-o for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 17:45:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12141.aruba.it (smtpcmd12141.aruba.it [62.149.156.141])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD84680E55
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 17:45:57 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.195.174])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FggMmYIKdnxSqFggNm3uuU; Mon, 16 Aug 2021 19:45:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629135956; bh=1oD/y1hm3BV8BesGzvatsgHAtFmtiiRZTH2LNT4ZfnI=;
 h=From:To:Subject:Date:MIME-Version;
 b=l1VxFjpUnDWihMNoRywdQ8h80O/cqjhZNco6x5ubMYuSh0XCXfftZ8syJ+RPeV3ya
 16AmhcDZCAT0m+6wjhZ3Op6PSVBZjIRN2i+/sW698fmK/7K6YHpNAPg6WrRc68QD6e
 AGD10dM7lXpfyS8MMuPHbWUChc4fwNaGa7xg9y+cyfPsOygCrgcYuqCOoxJlYpHeIS
 iXSXsqhPnuMiSHP/MPa5UsU+xERdtJ+tGgnV2VWW+Wlj3Rs0wAFAwoiKWM5oGi7Bie
 8xP1Q1KM4M49vDEnH9h2gheQ0cXRNQvWOaawDyNAnnCzKNzmzeLPspMvBeTVwnJNX2
 tMSOxQ/0ebgww==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 16 Aug 2021 19:45:52 +0200
Message-Id: <20210816174553.3792860-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGeCjEkY4+GnZa8Xl7DtvsQzE96YKCpWZjAeGRXKXYTgkhUxmkwCyFv5QeuKt9QufbqcObn08JnxB+VbAYeo/OSvpQBUEgEIrQSkIpeRBA8XhLPsolg3
 TANyHrD1/wJTovHQmRqF+GHytEHQtzAZyGq5dURr6BpZD16zjKolMOhoOlQh29CHxrYb2+t9ukyr+/EyCMar5mmZ75GP/flgC5J1Qc1ZQTStec+tR10SqEoq
 DF+RADjZfUnc59XKj04y9rIsYJOfFJO0lOrlNYGeLovfZBWYvMOAXyAtIVRlNkSf
Subject: [Buildroot] [PATCH 0/1] NSS enable parallel building
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patch is meant to retry to enable parallel build for libnss. This
upstream patch[1] seems to fix it, and I've loop-built it for 24 hours
with a script doing:
```
make libnss-dirclean libnss
```
until the return code is 0. This can't show 100% it works, but I ask you
to accept the patch and eventually deal with build failure later where I'd
have more elements to fix it(if it still fails of course).

[1]: https://hg.mozilla.org/projects/nss/rev/a5c857139b37476ca10032504ea876b97e066424

Giulio Benetti (1):
  package/libnss: enable parallel building

 package/libnss/libnss.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
