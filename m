Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B36DC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 05:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0D1406E1;
	Fri, 12 Apr 2024 05:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKvAsVyv720Y; Fri, 12 Apr 2024 05:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C269E41FAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C269E41FAD;
	Fri, 12 Apr 2024 05:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A69C1BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55969406E1
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrEvc5LCV0n2 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 05:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A627405E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A627405E7
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A627405E7
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 05:54:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e509baddaso468751a12.1
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712901260; x=1713506060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDwpOjOpRVPKekKO/HzqEi8u8rqhrezawEX2z9IYs1A=;
 b=Qy8V/31YoLxT0iQxmMmy2CP0y09jmQsJld8CNk5RFR2X/C2PFHxiwQbPX4a9znIvgp
 IBetaISlIS/nMzdPqwYISCagx74agCqFtlqZo+CRqGSpBqSBC8s21XE2WcOPwpzz5gZK
 ruiLw7WnG0KQnyC9ocuKX8HHzU1nfXULAz3KOl05YzjmFb9jEabIM77Lw9rHWCq8suxT
 8iPNHENzkHtdlAH5hh+ckwrJjSuYP8lfcuJIennFoD5mYmMR8fWOxf2e29M+rS6WuCxz
 nH2lGinqZAZVo23rWaTYpiWYc3OFd457idOJEyqeit//ckmmhu+qBSygS0HO7ikeivvg
 eF4g==
X-Gm-Message-State: AOJu0YyO/wLBKZiVs+qQ/4KINaFZvBbw4ImGtQND0TRvovuYFJNlAaBk
 ffDt8IYtoKLUGo//gFqF85lZ3jlEjKxft8WisA9by1n+r+1q/S7onid9BQ==
X-Google-Smtp-Source: AGHT+IE0fVIKNzTMfmCAkpVtLSTHrwwi5YOaGwQ3R+vwY4ulHkw4UVYkVXAh9yiph98c9LaIXG5vSQ==
X-Received: by 2002:a50:99d8:0:b0:56e:2f2c:e249 with SMTP id
 n24-20020a5099d8000000b0056e2f2ce249mr1089001edb.7.1712901259958; 
 Thu, 11 Apr 2024 22:54:19 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 cb12-20020a0564020b6c00b0056e67aa7118sm1354199edb.52.2024.04.11.22.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 22:54:19 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 07:54:01 +0200
Message-Id: <20240412055358.1354293-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412055358.1354293-1-heiko.thiery@gmail.com>
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712901260; x=1713506060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDwpOjOpRVPKekKO/HzqEi8u8rqhrezawEX2z9IYs1A=;
 b=Sa0Hm5kknG9IcAYWdpEseMxz7rvfzcE3zcolpbzq8x7opMlg1O9T9JXIp3eOa1N7o3
 f/rqmXIZ5k/jYTkYW7iCjjCeEDZH1VdebS5qdAOlumIyXQCGHUxlEWL0LRssRsG2I/bR
 xq5lMCVF2YmwZT1eVWXoQn4HkUSOoxwiCob+/hd9MEvXQDAmWKhF0IbcQw1s+kQtEV5B
 8+lRRTN6p5UHI63aAV3JiDV8rdwuhDcS2wpUh3xzylbCIbhyPOmf2ojPYdw/b5zbPsCD
 jiKMGuN/BKbd2rBWfi5eosmbkE+BmqABouycE1e2C/NlakBJLZONUmSraxWueoB9Ac5d
 ZKiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sa0Hm5kk
Subject: [Buildroot] [PATCH v3 3/3] uboot/uboot: add new dependency to
 yamllint
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2: accidentally resend this series as v2
    (it's too early in the morning and no coffee yet)

v3:
 - update URLs in the comment

 boot/uboot/uboot.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a894654698..0ee63cabdb 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -276,10 +276,12 @@ UBOOT_DEPENDENCIES += host-vim
 endif

 ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pyyaml
+	host-python-pyyaml \
+	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
 endif

--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
