Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE3DCCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 19:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7465B83DC3;
	Tue, 14 Oct 2025 19:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFtGiQnN3-4b; Tue, 14 Oct 2025 19:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E0483DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E0483DC5;
	Tue, 14 Oct 2025 19:18:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11828BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC1AE83DC5
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9JCmz6t8xm3 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 19:18:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DEEA83DC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DEEA83DC3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DEEA83DC3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46fc5e54cceso16769015e9.0
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 12:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760469515; x=1761074315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U0nVyIwoImWCrpIWBZKQeg5bAk6nCr3k1yFIYp2XcrU=;
 b=DUshH2BOdMtlVZ4RhTOgEhedLeOgP1QhL3NZz6R1xzY1L9cbx64gcl098hmId/fwfn
 qbzh8zVTvcSr9q/Ikt1KsubeWQySbejHJ8Q/i49/mxVL/MkjKzbkv6iEfsNYOirIdQoY
 AhSeAZaajJW2zCatY7PtBxgCpZlXqaAPDcl43X+nUEun31ermYC+EBu37Oa1i2rU3Bt8
 kOnoV/qx1VE0Y+WakEf/Ac3CPdSK9jTfbHxexvJeiekd59LeEI3eDd3VVBJtmXK2qrZH
 Kk5nR+PT7CnBafNAy5lLF0qr/5Yz0YzGLvjMLx6fxfwrucQUevAL4tOWKE57zooGLABL
 lUMQ==
X-Gm-Message-State: AOJu0Yz+9KIqgg3NRfujfNLQNtStaMiPw0nE64G3YlMHg+x2GXNk8xfi
 NNhZSxRS8RxTE5XostIxL6xQdXrl6Q97YHmblbQG7pmPed+drAqOAkra2zEB8A==
X-Gm-Gg: ASbGnctrB2oEVF0hU0+DnAU8v9fAg94JGDuguhFicjz56BnztnHhi4xsQDV6il0idyk
 spvvhKTVG26FQUHxMhyBnbjJ3HDyThRvOQcx+M13Lc/95wmePuLfawYocFKnyiyo94t7i1UZFYZ
 buE66yXaPMpSO8x/en5qdzxxWBtfrucaMoN20am4LRAodMgPc5E3m6ISvbWuOCIaD98YHbCxSCZ
 hnb/tw9TgrtjCvREpZv8fm7r8CtWshepk2kycbu4+TP/noX0P4ADUWgeaQ3g0Sixk9PHzsH3B22
 to/ghyaVqNsD5WvB9nefYSG1ybJF3KGoPoP3y/lGDHsH481Mj84c7JHpiEyt0pEsw0j1xHKH1pJ
 ZvIxRp5TYt/Fs+yKGwMaC0yiuz4IJT+kbyHhrzEG76hBH
X-Google-Smtp-Source: AGHT+IEIxYmtTtDti9X+3iTNXNxyRSVuemIKfXBGvh9lxqfQuDxTC/H+OaHAE4w/Xh4nx9DPt6s+Yg==
X-Received: by 2002:a05:600c:1395:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-46fa9aa204cmr175276815e9.9.1760469515085; 
 Tue, 14 Oct 2025 12:18:35 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:5505:2845:5a50:c0c0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426d0d9050bsm23343262f8f.13.2025.10.14.12.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:18:34 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>
Date: Tue, 14 Oct 2025 21:18:27 +0200
Message-ID: <20251014191828.442802-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014191828.442802-1-maxime@leroys.fr>
References: <20251014191828.442802-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760469515; x=1761074315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0nVyIwoImWCrpIWBZKQeg5bAk6nCr3k1yFIYp2XcrU=;
 b=cLHIqOQ/mqzeoT0KwSGPMd8HRzo+sJ8XdkKPhczIhlKF790dtfvq9WfJ0A9lZVQafD
 uiZZYFsTl5bO6nZB2LLAr2Sz3Lb8tNjdfIUYg784VNJ3fIEKl83iPVOg8rPT88ySYpBl
 HCShQofR3Yk9vDDK3mdV6kzJ8Aatp1qMTq7HgsoHXff3L2GDuzFLHbpwdSmdKSNuLg+n
 y8EZch6t22EzIwmFfCanZbocQx0vuGYDxz3Stp/VuG+CIN8xrL6R78owT79wXTSnTVg6
 MTlE1fsg58eRm/snrWGzo0mUOn7aZ+1IrYuGRn4XNGthmZjLdiieZXaLJJRK2zlgWkmC
 Rk3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cLHIqOQ/
Subject: [Buildroot] [PATCH 1/2] package/libecoli: bump version to 0.8.0
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

This new version is required to compile grout v0.13.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index f973b6f254..e200b796bf 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
+sha256  ac71cd336d7e19921ed1a0ae35ab14433792c7151d23abe92b247c6e36813246  libecoli-0.8.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f989e7b9cd..ad4fa62914 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.5.0
+LIBECOLI_VERSION = 0.8.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
