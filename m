Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F5FC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB94D8203A;
	Wed, 10 Jul 2024 15:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQI3I2W0s3Gf; Wed, 10 Jul 2024 15:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A348203D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A348203D;
	Wed, 10 Jul 2024 15:26:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2B2A1BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD07D606EE
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSbiF6Lh5Nq2 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 392A4606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 392A4606D6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 392A4606D6
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:26:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DC47C000B;
 Wed, 10 Jul 2024 15:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 17:25:47 +0200
Message-Id: <20240710152551.332680-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710152551.332680-1-kory.maincent@bootlin.com>
References: <20240710152551.332680-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720625166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HoIhn13OR/sFqoYWsbe8Xj84GdEStwQENaLEFpWAr4=;
 b=VXylu06x/jq2FfeWScrI2S0/qXUSgH7lYjoO9BlafS6w70ZE2tPFPolGZvwz8w2ADxVudX
 iPWyvBkFE717gi0Y6OkQ7ttWpcuhhMUqlDeX0o91q5Wi1GeerzW0wdVgSmao4yBHWuHwza
 wpSInxlfLn6kC0aHVeXWUFaTSebDXucxMeax86aNUKib9d5QPvvDSFKoW3IlyxDjMqHBxj
 S4gn05bArCNn0mL7MK0QJNwMlHmvy3F6MHjfCd6/VnvWiFL8zj43GR97/gdiEJphp3Juka
 bom9u9j8LDEF1Y3wsipqZmdJu3XKNQy7ScvnznQybxPpCqTtvk4GWbfsMCzPSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VXylu06x
Subject: [Buildroot] [PATCH v3 1/4] package/python-intelhex: Add support for
 host package
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the host package to enable future support for
TrustedFirmware-M, which depends on it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/python-intelhex/python-intelhex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-intelhex/python-intelhex.mk b/package/python-intelhex/python-intelhex.mk
index cc8b973f0f..56f758e643 100644
--- a/package/python-intelhex/python-intelhex.mk
+++ b/package/python-intelhex/python-intelhex.mk
@@ -12,3 +12,4 @@ PYTHON_INTELHEX_LICENSE = BSD-3-Clause
 PYTHON_INTELHEX_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
