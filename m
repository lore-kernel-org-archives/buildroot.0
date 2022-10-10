Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA40C4332F
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 08:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29988409D9;
	Mon, 10 Oct 2022 08:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29988409D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoBuO_AzT9Ko; Mon, 10 Oct 2022 08:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6123F405D8;
	Mon, 10 Oct 2022 08:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6123F405D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10B01BF40B
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 08:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAC2141606
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 08:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAC2141606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkr2M7v-F3sQ for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 08:49:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 995AF41601
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 995AF41601
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 08:49:49 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id r142so3784395iod.11
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 01:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opRv3vbjfO61hKXPTnXrFmHJmuebN2Ra867574EgqJU=;
 b=a22NUIDL/MuEGU6TXOqTIlVn37iTKFcqc2hUqc40jC4pYS3k3YUeXtx8xNzAlyAJZ4
 qaISsJFbE+4gigLWPG1p/rpXoDo9ylQo3DPPc9waA1NgcN+rO3Sq2SmXbInfJR02Jva0
 IqVeczjtAzGAKiRMymMJKW+dvK2XmytyMTs+9TXhkr0jvyqwu6I6nDd27n6J6RjERnxt
 F/i1vV7Aul+7/xsuYhgw0AfPmNLEnJaUsnGpjbWL4vGTH0Kq9LJOw9Y8GYvS6n0D/XmM
 OHgBVq9NHtQMOuTyhF67kJS5x4Orq220TsyDU+2dmCykYKbcQ/h+Fabn9GuHeCh/Mn5o
 KBWg==
X-Gm-Message-State: ACrzQf0WbWZ+NGNoD41lfNRLBOYxuXOn+aqIjNBbFdNNXmSVvRuxL8vI
 5L3nebHf1RuatobZ7nbkNeSWMDPRH4dpmg==
X-Google-Smtp-Source: AMsMyM5FmWDXJT3SkiGA5ROMdG82V6JgbNv4VBKEezlQVU5ypF3vSVdXeD/WgJ9zExI5i7TJpw6IEg==
X-Received: by 2002:a05:6638:35a1:b0:35a:27ec:b00b with SMTP id
 v33-20020a05663835a100b0035a27ecb00bmr9255427jal.245.1665391788008; 
 Mon, 10 Oct 2022 01:49:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056e020c6400b002fadf9505b4sm2886311ilj.16.2022.10.10.01.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 01:49:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Oct 2022 02:49:43 -0600
Message-Id: <20221010084944.685684-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=opRv3vbjfO61hKXPTnXrFmHJmuebN2Ra867574EgqJU=;
 b=K1NyZI71lvpIOPlFjOvoQaqdPpsWoBEXqz2juKcuE+1y/Z1RTtmIrjeprBeYLiM0/H
 7dHZrP5a4g7nSKztzRKU9EIa5SvtNPPvF1PBBLDQXYSNkz4uDuhTdcfvay91AY9YeYC0
 fUL2oIGXLXep+0OsJl68IGI4FAvK7tjUUOr+NvmNhO0yI8QbwsI95PBcptqkdGnhmt7t
 HClDYVyCdbvjilZQDSxXU3q8ie/Hv8g14ug8vUR1Vorm2DHQYpOia4/dREKPDxSvMnEA
 jMF9Pei0Pstjaiddl8sr2R3G0afavq/vsbXvjOvklCeFoplWGOs4+CCEzI96eDhNAWOr
 iszw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K1NyZI71
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.53
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 9affa390b8..68832c3201 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f  ell-0.49.tar.xz
+sha256  a7d0df846af839bbea1b80f292166371070328854b3fa785b5c607fe600552ad  ell-0.53.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 9735865eae..b27d6feb65 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.49
+ELL_VERSION = 0.53
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
