Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F4DC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 22:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD4F60784;
	Thu, 17 Jul 2025 22:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNUXzsB1YnoC; Thu, 17 Jul 2025 22:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4BE607A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4BE607A6;
	Thu, 17 Jul 2025 22:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A05A1A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 22:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C68360784
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 22:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMmfSbOAEEuk for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 22:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D58E16077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58E16077C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D58E16077C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 22:48:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45629703011so11119955e9.0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 15:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752792482; x=1753397282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WA3EED9ePkxsWOrCJw+QWJHi1FKUe3+xlX6OYNgw6dU=;
 b=C2CQcmhxtFoIkY/opy8rF6oSCJOh/BO4vVpk7Aofm5iBx1JoRcK0mJ//TO43QBfHus
 iwLmDUplK0zqHwHiN6yM1MxQ9U8Kw5+B1SBgx/Id76DgseJJ64oxFYik76V29Kx5TIS4
 K/wjbQw50QyIHXJqV1w6KZU5QXugg+PlyEwCxkd9CXf+E6ZGJexfmLqJI0yak3eLKUv1
 kooRHK2e744OGL0PRYnRyUj0kZn/P/oeYbHDEEknpnKwjIWpeOfgK9wAtdkSj+AuLhVZ
 nQRqOxa/ZCQc+YokTdHpXt/i+arSN8oPXlfdzTYh3pUFC0EmIQujIhiWfH6sRvYX2LR7
 6MKQ==
X-Gm-Message-State: AOJu0YyIK/XgFb55vEoQbFahAvlkBrOXPtnIZ/r64GI+aMiX3YGc3S4Q
 dXW3RHyZfRvaa/XJ/azNLkLxMi4TUQatsMyGc+XkPmF8IuW7OaFXdypUg7izT1mZqs9YXT2K9i/
 HLaH3
X-Gm-Gg: ASbGncuwDFiMVSE1AtXQ4aikOtF1kdQ5e13fSjekE2rNQiilh8w1l7/9ZG8EOW1uDSK
 eLjnpTDPx1wbk9/V/mr1d8iQUwQe/ol6OH/+Vfd8FleCA4frcQ1JjnjMmxDaz9EQglWg5r88Hdf
 HhIsiib8xzM+yy0WbFVQhaEFy8gmvB4zMSROSDTCTWNgN2qjl75Abf45oVpGRTNprMwO/TM8qc/
 1/1/yNSAv1/OiQAsMUm4fy4h0zRYVQLdIO2F9Huoidi7E32kabzGLF/32xndA1kodmvBb0W/Osg
 nhIcxNwOE7YnVePeFODv6Ln5+QGmL0s/arLFscBbQc+Fh1HJpJXmJOOvhAfTTpjZ4BilbYAVjbq
 BKb2syIQ7pRFIhLVS+Cdfmw5tMEUqMjF7Bt8Il4hZbMC0hAwUFwPjog==
X-Google-Smtp-Source: AGHT+IFaNpzw0qd/mW0SDJf0pTsoSd5XwttEp/ZnLm1dupjpTFUzgNbH0S3Zt4uh7/sii1chzqmzEA==
X-Received: by 2002:a05:600c:1f13:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-456327bbf81mr49983015e9.28.1752792481757; 
 Thu, 17 Jul 2025 15:48:01 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8ab642sm61754615e9.36.2025.07.17.15.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 15:48:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 18 Jul 2025 00:47:38 +0200
Message-ID: <20250717224738.1048325-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752792482; x=1753397282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WA3EED9ePkxsWOrCJw+QWJHi1FKUe3+xlX6OYNgw6dU=;
 b=R6kvsCmHGnCaYJM8pu1umsaF5139z1sXd0rwpEEu4I+HlEkcAXvD0YX3p64KqVutfN
 rG9BFQrApSKw/Y+StyGSjbA2rJE1cCkd8wRG6Od9DwmmC7vm+74EjqzSikp18ylV9PWq
 DQXKq9xwRQHiDGPaqLuJ03ndzXm/8EcVj56P8OWzgEXew67nausWTBL7HwM2mV23GgBj
 Jye0Mr+iXuaMd1wCcXMTZwUKYYgvWX8TMCZA86N1C32GGIWu9kh0RoZ/fHm5HnZIg6Up
 tU19FYRSF7/YIykh1fn3Um1wvb/cLdLhhv8SMnt+Tp0Ew/8rZr5ge/zlG7tcujHq+gM4
 4QmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=R6kvsCmH
Subject: [Buildroot] [PATCH] package/python-aiohttp: fix missing build
 dependency
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since aiohttp was bumped in e4451602ebee8ef6f6b354e8f9b6dcc80206f079,
it now requires pkgconfig at setup time, see upstream commit
https://github.com/aio-libs/aiohttp/commit/40563751adf02b811d5acf95696c096a4dbd9ed4

Reported-by: Julien Olivain <ju.o@free.fr>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-aiohttp/python-aiohttp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index e52b6e81c5..7070d00cec 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -13,4 +13,6 @@ PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
 PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
 PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
 
+PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig
+
 $(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
