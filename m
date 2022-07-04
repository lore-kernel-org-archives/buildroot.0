Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5B2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 10:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC33540991;
	Mon,  4 Jul 2022 10:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC33540991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJS45aArcxum; Mon,  4 Jul 2022 10:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9673A408A1;
	Mon,  4 Jul 2022 10:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9673A408A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5731BF295
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15BBE40877
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15BBE40877
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TOdhvp9Pw6T for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 10:08:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56AD8408A1
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56AD8408A1
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 10:08:41 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e40so11081112eda.2
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 03:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kXSa0/V31doXTEpqUBLqijnzd5FEe2O16dD50k4kg20=;
 b=JooTD76r0bUCAsZu3p7oX8mrKfD8gFTWfNyGW5fFZOPETIaiFGw41+ZoTUuTxt5RUK
 TV/nL2IA3lPrwtw6c1eBpgSeBaQ3GwQwR59YgklV+jBH0mEuHVEVPYZIePk+PLVKn8h2
 /ittNXeqeAJmcTfnxGo1hiJ44sVOkAKKbn64JB+Y6KdTMxjzj6zmVO8/YC0GRnrvIbGj
 kA/j5brfoQfXWY0xFvZVnWJwJeYeA93KaxacQH9k3lmpv7s/xoJ8VA2HFTGR38nS4Cn/
 ve+ZxShjssDOSIx87/3vfl4XX0Ewx7pfVHKIyZ2i9sJIc/a54ENqOVLepQQyIQ7k2YNf
 HaMw==
X-Gm-Message-State: AJIora/9Cy/2z/uhyIiVFPHEpYjRAPMYwt1WI5cKD2tSW7RJQSNcxBnX
 9XD64eJH8pDuFHCoRPDvN8OWrLmN4+1gCA==
X-Google-Smtp-Source: AGRyM1st2+gWf97aFb2h5Spe8f+W6eC9qDseTk20yPPHeOwoJB2ey+Ea7XEl/OmjNTymGn0rQVRA0w==
X-Received: by 2002:a05:6402:4026:b0:435:87ec:467 with SMTP id
 d38-20020a056402402600b0043587ec0467mr37899625eda.303.1656929319168; 
 Mon, 04 Jul 2022 03:08:39 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 r12-20020a170906c28c00b006ff52dfccf3sm14058106ejz.211.2022.07.04.03.08.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:08:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 12:08:36 +0200
Message-Id: <20220704100836.17277-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=kXSa0/V31doXTEpqUBLqijnzd5FEe2O16dD50k4kg20=;
 b=Yg3g8WBJFkP8EcgFx9ueBynRhFQXaIsnXw2GrWLK7n35q/BaLntEk54ZHROoaFvkUq
 wYwLq8fWfqSNgIfX4K3j1TLe9BlnXlHLTNhVptqfMpdq3zEmDeCM4Yf1oHSyeOG0UqBp
 DdzSGtAlCIZJ4EgGkQqxNrXVy5aaaHARbfCfdHwwY6X6xLzt7G2ydR07/xFolevaI6/w
 jfn3O/tGMTl9ucCf+YR+wUwXW11bT+cFGPkkSVfoFTle0TRSx/2BeJ+gZPdq5fpQ0Fqd
 w5IzqyZbfBiq7gYzhmzbfomk+SikLrH1EUDZssleN8HnU6S2zfMA5/OUKFM0znPHUN0T
 ZYQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yg3g8WBJ
Subject: [Buildroot] [PATCH] package/python-argon2-cffi-bindings: add
 missing build-time dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-argon2-cffi-bindings needs host-python-typing-extensions.

Fixes: http://autobuild.buildroot.net/results/3e0b4ad4b1b0714ef0fc877ab61933f32c0d47a0/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
index f0d71e803a..7d666584c8 100644
--- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -13,6 +13,7 @@ PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
 PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
 	host-python-cffi \
 	host-python-setuptools-scm \
+	host-python-typing-extensions \
 	libargon2
 PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
 
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
