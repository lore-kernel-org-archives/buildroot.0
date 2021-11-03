Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9C5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B5061101
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27B5061101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF50F4036F;
	Wed,  3 Nov 2021 12:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgGR-yJbVrPO; Wed,  3 Nov 2021 12:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B359940364;
	Wed,  3 Nov 2021 12:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5AD1BF364
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 12:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D42360622
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 12:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5Wks0M1N-yy for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 12:34:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31A5C6061D
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 12:34:26 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 17so3610127ljq.0
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 05:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uH2P1FffJTZfJmAWVmsdCqB+8zCzTCH5k/318Hwxgx0=;
 b=aipr/9iRa4pc0KGBwW8y/lHpayrM1xEvwvxZCaqYGyMLr/FujD9xSE9ezEpaW++4zX
 fvd6qSycYBxseYMJ8svuQ/d5orhLvDMbaY2+sNh92C5unPKKXhFRUr6PwNeUf06iEgU2
 aFSwjqQoIsYHAQ08bzstaqtzzv2p8JhM5XPTUWeIOQO5KXJcUbVx+gRqLaqgwNsJL4EE
 b4sPs0tkU05CtkyFFh5h34qXZPqIxQVsuZ/J4JbowPvinLf/W27cRPiUIG6RBz885kcY
 D7TcBIBipDnScMbPdU1yoN7QyQkiiLlrn0+npvjCqGIrcU/hDQZfBXfo8fbbnVqdbo5K
 PSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uH2P1FffJTZfJmAWVmsdCqB+8zCzTCH5k/318Hwxgx0=;
 b=4qLGwZRdsKxWS75rR40W2QBVt3oR8WgR73MBuqpsjKkeV9enPAfEI1ypOveN/T8zH8
 yzEJ/8iK+95mDPquIabZn97DhW0q2Rvf8rStPhPJogiJeeXrK2LS/J5uz0Q4thzH0TN2
 9aT4CNgO0WKpSWyHm4ymhqlV33axeWALi5pEYTZl1tlu9NC9x3YbiM16DDoq7dbtFylA
 3mwny7teW+ehe0y7VGHE5tnCyM+SzgYlA7hTRDAkTQzqyZMexuetW8nDtioScyb6Ew9c
 9Hs6dbuv9MS0VLcgIZEN4EmM6jEbfF4B/UAqBAOF3Q2sYdudkjeS2sWPActH+o3H65Dk
 bHIQ==
X-Gm-Message-State: AOAM532/er7W4gkczoTGzN8jmOZABsKEtm/XeSl5jtuyWSbT00d/Vhnu
 fUlC7WdGwjdI7M32YjI6fgD4o67HqRM=
X-Google-Smtp-Source: ABdhPJxT6AfVSydJa8C76N5sTsmv96zFQ8tvkwkBubxiPUrgHGrOlv+LobJFIjgWVqzFUfZ035f1aw==
X-Received: by 2002:a2e:8014:: with SMTP id j20mr47665063ljg.186.1635942863658; 
 Wed, 03 Nov 2021 05:34:23 -0700 (PDT)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id s11sm181827ljp.60.2021.11.03.05.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:34:23 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 13:34:08 +0100
Message-Id: <20211103123411.3116067-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/mrouted: bump version to v4.4
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates mrouted from v4.2 to v4.4.  A lot has happened between
these releases, e.g. the experimental RSRR mode has been dropped.  Other
notable changes are:

  - Support for multiple instances on the same router
  - Support for multiple multicast routing tables
  - Fix for segfault when parsing phyint directives in mrouted.conf
  - Fix for broken (built-in) IPIP tunnels (tunnel VIFs)

Full changelogs at https://github.com/troglobit/mrouted/releases

Best regards
 /Joachim

Joachim Wiberg (2):
  package/mrouted: bump version to v4.4
  DEVELOPERS: add Joachim Wiberg as co-maintainer for mrouted

 DEVELOPERS                   |  1 +
 package/mrouted/Config.in    | 13 -------------
 package/mrouted/mrouted.hash |  5 ++---
 package/mrouted/mrouted.mk   |  8 +-------
 4 files changed, 4 insertions(+), 23 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
