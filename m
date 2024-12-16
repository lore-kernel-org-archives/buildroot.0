Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C546CE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 12:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69419408B0;
	Mon, 16 Dec 2024 12:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkpO7d3HQB6f; Mon, 16 Dec 2024 12:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3823C408C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3823C408C1;
	Mon, 16 Dec 2024 12:01:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E30E5CE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0FE6845E4
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAuuMNrJv7Pi for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 12:01:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDA8884665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDA8884665
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDA8884665
 for <buildroot@busybox.net>; Mon, 16 Dec 2024 12:01:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so3268658f8f.0
 for <buildroot@busybox.net>; Mon, 16 Dec 2024 04:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734350501; x=1734955301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NS04lx9he0O9eTYTsErwm0Ni3Pr3y4xlpJUcLWNt3yY=;
 b=fwq4yOm2l6rLH2xAhJ5woz0PU/OR0UIpTo2Zl4MgYsu+3tZIAvKI3Rqna9J3UJlXj9
 SbB2/r5d8JPcV8SRTmsbuCyknnNB8DoYAnYvGVOH65305sm+MlyW0mROKZc1HsAW9qnN
 BcLfwiEpT+wsPBK8YgvTiJ23ze0bxg0MsRDzpq7WB0E0Qj+MzvrxPmuz+hX2/FxGj3oO
 OQCgA4Lon7YvwSaa1fTJK0J/Z/UM7/JIA+AORb2ZB5vi7BI65ry6YMAW/u7pRxCIJQYL
 NrYe1V90LTu217fqj1U0A7IiVeAdZ56wzWsMAsLVQyGzmV6UD2U4WnpaWp81MBPwqm4P
 yIEQ==
X-Gm-Message-State: AOJu0YywOcBcfDHhw4QLlj2l+VCEqAm8Mh9GI07KHc1er7fzvMy+VGce
 AL43UXKy3+MJdglQ7Hs/9JNFRwANBXGt+Bq/8TUCtM7fZkGnRoIveY8OQNySmv5S1MWjZfNimWq
 4IQ==
X-Gm-Gg: ASbGncvIeG08ss3gqQO8k8hwI3AU6+hQoc4kDcS6VoP7PhYyRfw612QpGcnNSC9nhBT
 B6jvfLvC0GWqnZemfSyUa5ZvlWFK207aVFt1443oWcasdu2Rt4K/OTzKuE39Ts1QA7SGmcBCet/
 4iUjzPk5u8ooMUX5z8g+la/+WeXEPKFo4SPq9ih5xqQL71bTdU+zBnweGLcMxWezwWWA52Zdscq
 sgoIBy/CZAcTG0RDZOAhOYUPbgKnBBL26KDF2RnOTbSdOCCJnhmuDJkrS6jOdTR03fzqlx0xj54
 8c031MraCBx0Eo8=
X-Google-Smtp-Source: AGHT+IG06sUH6gDwleObQyzjxTFEjrI1dtRugK8WCxxd8GY+Ic6qifTFz4+UeAy28+8qEouaglGr3g==
X-Received: by 2002:a05:6000:186e:b0:385:df17:2148 with SMTP id
 ffacd0b85a97d-3878884747emr14732184f8f.20.1734350500605; 
 Mon, 16 Dec 2024 04:01:40 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436362c7d59sm82202765e9.43.2024.12.16.04.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:01:40 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 16 Dec 2024 13:01:37 +0100
Message-ID: <20241216120137.1187698-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1734350501; x=1734955301; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NS04lx9he0O9eTYTsErwm0Ni3Pr3y4xlpJUcLWNt3yY=;
 b=m7IRqDcgyDhR2j0zQrKl9QWr+4EDTNbKc8nchiTXJUyPzYiamQVxEH/JL8EXFGmbAJ
 uhOpDewxK/vsAfdpkcw30NRmvRSefrLraB8ijjcUYhhyqkiTWREgyd/1vBGNoERCOXWb
 0GWMzvRMSjwMml+CzlNPfVJw3+lBWR4vkf75rScUxCmjNNbvg/CoD3/Hh0bpBIVW483M
 UIZ9eoLwx2OhxQmxEKoPB9rx9hH9hNzS+Mjnd3L8aeRg3m9HhZ1lSkW0cYJTRj8Qwg/X
 eZN9MsVddERP9hSfTMiDl2Qo4+loq4TLciGSeHMAeiU05tfU+X8zDoEDpEH/58WAkTkc
 uSig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=m7IRqDcg
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 01ea652f9..3beead1a2 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dab44ad50b10cc5f9e9e1f44f0510e0c5f7a8226c6bba821babafc5a79acdc2d  open62541-v1.3.12-git4.tar.gz
+sha256  a8719f299505b144bd68bf557ad0b023fa28faf8862ff2d0b171381c8bd278c3  open62541-v1.3.15-git4.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 92ce3b852..0d1abf724 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.12
+OPEN62541_VERSION = v1.3.15
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
