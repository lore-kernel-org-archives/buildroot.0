Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1315C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31BAC40B23;
	Sat, 21 May 2022 12:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4f9uAQ6eWrvl; Sat, 21 May 2022 12:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B242F40B07;
	Sat, 21 May 2022 12:39:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3B711BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F139E844AA
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DwjR8YaRoC3 for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:38:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52DD482BED
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:38:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n13so18147920ejv.1
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvmjahSH6Cju7U9qzDN5zEJqIaL+shkYAg0/c8jmKAA=;
 b=KP5bnkX6Nb/et9ga3dAmlhnjQl88ANrdpT7gGv4FgP3LnsSs3FhTydqRwOlty/Rzg4
 ZAKeZe6uE0Ms1Dy9/QXBAGLKxY4FdvaURSggqeAbaYWgfmqJczdt39ccX+oCXM7TI280
 ZOkZ+98UExnM0Bbi6ByD0Q06w4XTcGMoxWJmgbAu0tEz9kA7xa62UZrsFIni3Lm6k7bb
 Po9pgFbZvHTvgrdZMzGlBeAH+oGk8PNbTByqi+rvRzvQGeDcdRjKsspbBOsHa+nxDq9g
 u+4X9H8lYdrYUkRS6w1Vavh3QTIfVMMlDOMTTL0fSqa/TkuwlNhgA6YAEa+lEg2QOjzK
 Rqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvmjahSH6Cju7U9qzDN5zEJqIaL+shkYAg0/c8jmKAA=;
 b=aif9iluhz11g8CAh7+ca9pbpLx2vXQtfYBlyKFXFuWERXmrxmTwagCeP9lwNVDuqpz
 sgxw8CcDR7roe1M7X1E9+SoW3AvibMOBWOMFB2aQnY9duXexzuEOHhMAPkvQFfcokbdB
 fFBE2HSqorFSg/8tfxiDNBlYJKCCPj7WOT1/a0da63/TErkidccqt/fsMpzJVq9SHaZ/
 Rs2Mm5GrYuyHUbHlbq+ZPbmS5fdD7UUxvXevsiau+nPMvf1kvVqtMDKdVe5oHR2jo75X
 DIVxloPU2qF1tahsCoRKiBymr439Z5B2rGp5egxOx9o/rlNDOWmrGI8hnsLx1avJno+J
 EKnw==
X-Gm-Message-State: AOAM533HFNcNatk7VcgPv8CNCyd78YHU8g0/I6hNsmxMf07wZFO3HwOH
 19HaIMyAITjvXTUBCU0AJam9x3WRnU4=
X-Google-Smtp-Source: ABdhPJw9ItLuIHFPSyicKsB6dRJkMurVc1uvKNN1HjaLgHkQCTM5kBZLURG+hy84nqrKO5Iq+fb5fg==
X-Received: by 2002:a17:906:b048:b0:6fe:be4a:3ecf with SMTP id
 bj8-20020a170906b04800b006febe4a3ecfmr2148765ejb.104.1653136737093; 
 Sat, 21 May 2022 05:38:57 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214da3sm4110479ejc.9.2022.05.21.05.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:38:56 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:38:38 +0200
Message-Id: <20220521123838.2881-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220521123838.2881-1-heiko.thiery@gmail.com>
References: <20220521123838.2881-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/nettle: add build support for host
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/nettle/nettle.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 3dbd0cb94b..bc3708ca94 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -27,3 +27,4 @@ NETTLE_CONF_OPTS += --disable-arm-neon
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
