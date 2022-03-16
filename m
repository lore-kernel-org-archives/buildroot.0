Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5164FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 19:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9FB640223;
	Wed, 16 Mar 2022 19:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsMEPnRFJXfU; Wed, 16 Mar 2022 19:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6666A400BA;
	Wed, 16 Mar 2022 19:06:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 086E21BF9C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB9CB841A8
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZpIiHOy_CgH for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 19:05:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DAC84176
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 19:05:50 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id q129so1352647oif.4
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 12:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y7bTBtUeeazPx0cjxFw7TCNcJzgPAiJW0vzMW0qqEoQ=;
 b=bnj3y5TdQ5cNPrCZ40TWljzhbDkXbWHHqBmVNal/0fmZa7POoAhbS/oHgXVbILcsn4
 XGYExBV5ajaHT6Mtn34khrZjWK6NdvhsKNg2QjEEPZBhUW6hWT0leLnWCbXD77+KgLW/
 URRSRH+gtQbv6THdlbepjTeYYPRzBrB9PHgLPuSgcV0ZDc9SNtEgRQtHMmHNKy0uotTS
 viNl8/tp+82ikshYow+yahxZzlWDx0d2UJJ/U88Fs3P1NrWWLqRqD/QR9d2ljehm/R36
 3BPFeuBLLxoDAEW6Y+z8m5cEtBVHprIT8XwBBuz8wjYawxlEO4qw/u4tGTTf4JSaXVb7
 rw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y7bTBtUeeazPx0cjxFw7TCNcJzgPAiJW0vzMW0qqEoQ=;
 b=mm9amLNoLpSG5hLC82rpjn3k8/pDgT1O7CBzSsSVN6FQx5BYqUvjPnZM91O8nkVZ9C
 WWutqkE/+yzaKfjFp+4mibQq/MoLWMIwlpNsuslMQAEY8Wk+UQrTka2IwKfDiOIi3kid
 PCowzw/4Jj196Rd0Iu3GV53jStDszCdo1Ojzy/7MA/fHEplx/9iuB4yMqHdqmnoRVBBB
 jEbRtgD+P5SnA7ZIs1wrZLNpc5wVk42+WdgSC5WRdhmdkgkelLXtfivzlnrGC3eTIRCF
 c3gDs8xTrkkZaKdKs4pwkIvu2/v58AJNVgPAXCsiRosTUUPe2OVsrAfCpOy2J+IyCqge
 +gaw==
X-Gm-Message-State: AOAM533AAKNwmwkoTc1UeRdDztJaDbQ5VRKo+wPIPRGY+hcmGn4uyjbn
 AT0U2f/4NdFbu8fr+qD4fUYxgqf6ezs=
X-Google-Smtp-Source: ABdhPJxC+clGHgckiXlus0pZj1t7B7nbyaOTCelcEzLSfQwtrH1IibFnHB0gMkoN0iWiDznLybz9iQ==
X-Received: by 2002:a05:6808:6ce:b0:2d9:a01a:4bf5 with SMTP id
 m14-20020a05680806ce00b002d9a01a4bf5mr454120oih.284.1647457549547; 
 Wed, 16 Mar 2022 12:05:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 k13-20020a54470d000000b002d9b7fa03e1sm1249760oik.12.2022.03.16.12.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:05:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 13:05:44 -0600
Message-Id: <20220316190545.3618918-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.49
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
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
index 4bde1ab677..9affa390b8 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5  ell-0.48.tar.xz
+sha256  a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f  ell-0.49.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 267b44e5f0..9735865eae 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.48
+ELL_VERSION = 0.49
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
