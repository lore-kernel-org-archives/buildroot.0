Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5666FE728C5
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 16:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD6B740012;
	Fri, 29 Sep 2023 16:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD6B740012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MlLSnMh-7HH; Fri, 29 Sep 2023 16:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02C164051F;
	Fri, 29 Sep 2023 16:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C164051F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6BB1BF27E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16DCB8141D
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16DCB8141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRgDCbv1Qdbw for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 16:17:29 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB7BB81417
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 16:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7BB81417
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32615eaa312so460306f8f.2
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 09:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696004246; x=1696609046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8tkB00M95HUomYY0OHYtjURMuscjRuFJKszNA6rzgnA=;
 b=BhPwzn3cj0neOF8d3SzW3BBMDu/OUT2x8UYMuy+ktHDojXAAJSfxtqJq4PJMLYveDF
 awYdeBpCUtkJrKAFt9pUewFIg7fzbaTtxPZunMncwo+fm/JZBDioL24/IBKO4i7vao9S
 9TiI0L5A7m84b8KlB23p1m3akPhCVqKjUjF+dJTKfYCklQkmKlOCdTpl5CR9LXRTdK0x
 juoUKNcY3D4mb9fHKpzUf0OtwaG+oBjgOQKK5uUUCncZtOmlJk710SLuguPaZev6SHqM
 +N3DERtfwkhLO/vO07gAPrnPzPqsqz5xnQ9QpjSI5ds9ccQwVgo8tHsDtZ5BdrUea4KD
 Vebw==
X-Gm-Message-State: AOJu0YwT0050SqoLO0Vk7TpxhLIfVp7Vqa9i3y2fQbuW+l2iItfwDFli
 D46Zg1q7L8ymdHsH3LkunERAYy/RqAE=
X-Google-Smtp-Source: AGHT+IFkpIRgHXaBm1rvpP1NNqCTxg81g21LO4AhD+c+ZSFJKRLjwAiY0bI0M4BGJRSQvg+9G70V2g==
X-Received: by 2002:a5d:414d:0:b0:321:3c37:ec81 with SMTP id
 c13-20020a5d414d000000b003213c37ec81mr3858201wrq.10.1696004245276; 
 Fri, 29 Sep 2023 09:17:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p14-20020adfe60e000000b003197b85bad2sm21949303wrm.79.2023.09.29.09.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 09:17:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 18:17:20 +0200
Message-Id: <20230929161720.1111638-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696004246; x=1696609046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8tkB00M95HUomYY0OHYtjURMuscjRuFJKszNA6rzgnA=;
 b=Crm7NJa4lWl3IGOaSyVv8UNlNa65TPQ+6Oi1yxEUc8mQ6WsXYNeMTGoF7KCj6/o7NB
 CMGXi120Ip8lxSOPLjvGPYotfcWUfRKV6hWPwJ2L2NBPfSwu+X+CdksniScYWYp/eoBS
 KNSDvgHdNfwRRAiTTp9irOTsQIUxk7Xw7IYEHp61n6mrgcOWB2II648c8d8OlIL1/saB
 5JOn/w/yuqKp9mSjiVYWE9xkFpXAejeJSczYLAeuhvdhaGwo41asnmEvdkSh0zY2jK4O
 kk1wFe8kQTtAeBZAVQA0GnRmcuvCDyHOfBTt0maj9JPx8QIK/oaFrC6VrofD+dRNAyZy
 MznA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Crm7NJa4
Subject: [Buildroot] [PATCH 1/1] package/putty: fix legal info
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit bf284bcfbaa7f031713afcc4c4e33d54724b6f57 forgot to update hash of
license file (year updated)

Fixes:
 - http://autobuild.buildroot.org/results/900b3fe8d4bf029c6bca6ca63c6e093e42cc1072

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/putty/putty.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 05c1a9eea6..0ae2a86be8 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -4,4 +4,4 @@ sha256  428cc8666fbb938ebf4ac9276341980dcd70de395b33164496cf7995ef0ef0d8  putty-
 sha512  4f10f870b229c89e928921d3b350955ce1c1170a062e7943d9cc8dbd83389d82a9b844623541605f0db5a429d545c2d188bf8e384c6515466fae69b216120983  putty-0.79.tar.gz
 
 # Locally calculated
-sha256  7b10c93f0d582e820a9e6f8c6abbcff54192e41e60644f4d09b96b14fdbc74f8  LICENCE
+sha256  7ede37f344ee03436c155a375ecb6cdb42a77105baa6e7804bf43260dc4a0c54  LICENCE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
