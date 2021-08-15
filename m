Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B21C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5763C6136A
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5763C6136A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2AD401D8;
	Sun, 15 Aug 2021 19:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyc0mcxdy9nC; Sun, 15 Aug 2021 19:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7A9402A3;
	Sun, 15 Aug 2021 19:54:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5D531BF28D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C538040332
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiOqT-ja31aL for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 19:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A0744035B
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 19:53:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q6so9210908wrv.6
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h53pYB4NrNc/YWdP9Go3vaQnreBKpbhkCaOZQRf/xog=;
 b=I5BV5T8RUQsoq8tMsCkiD4I9XWtaIkvo7ToVnHSrbA7rN9cNPjRuOdeB2YN8/O8feL
 DzKPLzHLHtz2c+YjFlowP18e9HD0lKN9ZBsSEkammm/r9zsWbv+m/VDO5cWh8PZAfpBr
 FMbMyKr2tORk9YfnzPaBopDwYauRer23HXsSIh+cvR1U/omEaNJftOKKkY6dPyt/z22t
 XYz6e3nmZJ1kn0i8rswkdwqFWbengU/D+FtKjO8GZJIFlE7BbHDoPHweNk1r19+E7+RP
 y1JTpDBxI9MSGP4pkVYJe6KTgKWqnQhFvCNQrqEdjiC5tR6Wgr3cq/HKr0bLGCqGWwRS
 J2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h53pYB4NrNc/YWdP9Go3vaQnreBKpbhkCaOZQRf/xog=;
 b=a2RevoIXbtysRjxi2f1i9cC8SP6o+lxVnb5EaSwpTZHmUaqFon3UzZk1GZVsoXh3aB
 dfeoh2EB2YNM2ieLuMqPTfCrKjA+gvSFWk7vR7pnk7KPNEVMJfOGI6C9jcXOKv/wiLDM
 1AwkhmPovKjZXbV7vRwYnTMk+tCuB15fkXwex+dCoTEkxNXjaAbc1uZ4dy9KIZ3dIMrA
 jL6jmNNqb8oMgHhYQ3Qfta725G58T3joggNhY2jl8Qg3TbgGxrUtJ0ImlMFRzHVE1Scj
 pmkekwI1fy+B0pj0OsgTtlXWumPK+G4qfr4OiaCVM9g+DqJoWak9hVZU7wLDLnTsEOtt
 6t2g==
X-Gm-Message-State: AOAM530GMVOgdqN2J+UZFefRVWgbXxQxT0ywgOfHtkn8q8OOQXdojzVa
 NdtrDwIJVVv4q6PSnOCv7FzgDVUq7LNCY/wA
X-Google-Smtp-Source: ABdhPJzMUIw7gCw4CalL8SHjB70Gs3Bq86dsgHRStauXKB7TjqCnhpMyHQskyGCcNqsrK0quDzWOPQ==
X-Received: by 2002:a05:6000:247:: with SMTP id
 m7mr14944080wrz.335.1629057234627; 
 Sun, 15 Aug 2021 12:53:54 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1cf4:dfbd:c158:8c1c])
 by smtp.gmail.com with ESMTPSA id a11sm9431169wrq.6.2021.08.15.12.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 12:53:54 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 22:53:40 +0300
Message-Id: <20210815195340.12027-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210815195340.12027-1-asafka7@gmail.com>
References: <20210815195340.12027-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-treq: depend comment on
 BR2_PACKAGE_PYTHON3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-treq/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 47719f92bf..02c26a53f7 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -18,4 +18,5 @@ config BR2_PACKAGE_PYTHON_TREQ
 	  https://github.com/twisted/treq
 
 comment "python-treq needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
