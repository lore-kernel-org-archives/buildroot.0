Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A2FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 05:40:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7363261157
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 05:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7363261157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BAF3402F7;
	Tue, 14 Sep 2021 05:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4nKv4E5omPn; Tue, 14 Sep 2021 05:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35FAC402E3;
	Tue, 14 Sep 2021 05:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C96601BF5DE
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 05:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6076400E7
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 05:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObkefvN3L2PI for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 05:40:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D283B4011B
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 05:40:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g128so3791762wma.5
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0KskGjlAToU8Clfo5Jcs83YSlkxMqhcKqmlv5IXXIY=;
 b=Jx+UUmfdUwpLgs4kjNWyxso0725TpWAxwI0ZWlbODd+jDOvHLUKsTBiCdYaOkgRCXT
 YfDoofdCamyDf7jHwGY/wtoB+DiIwMNiOk6mFpPaLTTc/wfAbEYKFdPa9Ia8Zje4amvZ
 M2smuygQYROhAjvk/ct6Ob1r2mI+8XtvcOsg3iJa2ohiAal01cvDCKjL85KHpnaUx2nJ
 3sJr7xgFa7npqXHpaWfR6sro/iuyDkJpjkDcBaHP+edgMvihTT8TZ1+ZV8wRqYZJowoC
 ErMrcsCoqeXWgGrS2UZWRTKyLGo/MJBVmpOpdcKUCdXoQufRp9dvHzi+X8M5qC4b/G0a
 cYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0KskGjlAToU8Clfo5Jcs83YSlkxMqhcKqmlv5IXXIY=;
 b=DgtCNAX1Xfhc0TOgvVTXZ3Cl0kSaHc8WZ9G1IUijlVyn/fD7zwxVekLZudO/EPKwLS
 8e1/vkIhGgJV2TGGTgZvAbcxKmRtgAJqzD0sGhqopXKGTlgeH8vuAs+JgrjiUPWLvEBa
 tHmihLlxRPmWjcNyR2CPnpWeuMA0t8BoGkbdAdtLe6xztXyLqyIlXBqikZIvWNn/hg6y
 2V5nDXLYIdyXmYxnwH196htgq8XXFVoeNnCCt21kppXmfFydFYHD/082vicsdL8azCh8
 UbtN/R8biQjHmT6TAC6yJZVwLiQHjU8LtIt6gZoddSh1Pmd6Z3G85gEN8OJERPoLM7sb
 WkBQ==
X-Gm-Message-State: AOAM533S5OLuhQMtzysh+0svMliYlGxlmJAII7g9aZa8oslK7oNymtms
 GLA8o1NZORfr6JAIB00StVSWetYibbo=
X-Google-Smtp-Source: ABdhPJzJ5Lbfv89GMjS9RlvqevcMQN1AvmT341GG4hXAMxEaGxIaBJQavx4nqi5zJBK2KCRkrdAWbA==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr82293wmb.59.1631598041798;
 Mon, 13 Sep 2021 22:40:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id d9sm11640857wrb.36.2021.09.13.22.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 22:40:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 07:40:37 +0200
Message-Id: <20210914054037.4025010-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcre: fix license hash
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Commit 0e5a901d3141a3d7e477f0fb79e8f6a748f06449 forgot to update license
hash (updates in year and email)

Fixes:
 - http://autobuild.buildroot.org/results/045cd98a4067f1314deb66f52240d2db2000ec4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcre/pcre.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index a84d63e1bc..6150303e24 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256  4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8  pcre-8.45.tar.bz2
 # License files, locally calculated
-sha256  0dd9c13864dbb9ee4d77a1557e96be29b2d719fb6584192ee36611aae264c4a3  LICENCE
+sha256  51b3dea44f63338b84b9c97b3d793826a8397309068cf9379a423216ab8ea5b2  LICENCE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
