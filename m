Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F2AC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B904A414CB;
	Mon,  4 Mar 2024 15:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhOKsN9j-HqJ; Mon,  4 Mar 2024 15:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E89B41591
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E89B41591;
	Mon,  4 Mar 2024 15:34:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0B51BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC8F540228
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNDnTvtUaCxe for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DD9D40211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD9D40211
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DD9D40211
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a45670f9508so114126266b.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566465; x=1710171265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9SAmdmIR4MoGN2pS9yfOSfj9+6rsKrN20r4g7qbMkA=;
 b=UNtg4F5qFAHlyEoCGCNU7vk50zDt3ifY8QtoBhytCoiZgrVeC69+SGr0mLGuqHZruL
 ad91qd2EZUD9wXf0Kb/a+CsdsCRrHIihbGUSfoK6Y86H0WLmvGZ5k+8Typs7/grmFTpc
 s5Qes6R9MKo4PEOcTwD66gggOcWNv7wsNaqrkUlh6v9b3vRBcy7bcTf18ytDkYdp9BAN
 ZH7XPHieirWluocXTewW2Vn/lg9HtclK7MQgz5iYWVAeC3lqNr82WhPuH+qu0795nYUp
 uAB9GnkTRFfGq7vVN3rWewFJknL8xUA15WJ6qw2tyrzUWDb6uR5h/aeueVpySTQea6dz
 yPWA==
X-Gm-Message-State: AOJu0YwOZ73YOdtZjAu2/AqD+cIbRjh0QTa4kTpttalqdj6GugrMjzQg
 HdEw/fyEMydouiaq2ICFkheE42IWjuXNbFvOMvjXLRqkwumOlXSzHCck0dC+BdsBtnAWxHeGitN
 5duo=
X-Google-Smtp-Source: AGHT+IEPmXEIvQwGmeWHJPOHqPL3V2AmO2LLDWjKhdtc/1/+r0JClM+BbxYyWiT2+PeFmtjo0I7IVw==
X-Received: by 2002:a17:906:6409:b0:a45:8ab6:5f3c with SMTP id
 d9-20020a170906640900b00a458ab65f3cmr460773ejm.45.1709566465288; 
 Mon, 04 Mar 2024 07:34:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:45 +0100
Message-ID: <20240304153253.732708-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566465; x=1710171265;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9SAmdmIR4MoGN2pS9yfOSfj9+6rsKrN20r4g7qbMkA=;
 b=SQF5Mrkg7jgeA3fA/zeDYN58JCelQ3ccu5otKg1m7j00azIkK6GMvThvtuSidt+omx
 K3iAk7Lbyode1rxiint8N18nZHTrE9snOU0waW5rh/3mhmhyY9gv5ntoLirpl40uF96n
 BQtuvCpqRQy4yt0UOmht2cXktmGaCYKbSqBiE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SQF5Mrkg
Subject: [Buildroot] [PATCH v9 14/22] package/ti-k3: disable HS-FS for AM65
 SOC
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems that some TI K3 SoC variant doesn't provide all SECTYPE.

For example: AM65 provide only GP or HS, there is no HS-FS.

This can be checked in meta-ti:

meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-gp-evm.bin"
meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-hs-evm.bin"

So BR2_PACKAGE_TI_K3_SECTYPE_HS_FS must not be selected if
BR2_PACKAGE_TI_K3_SOC_AM65X is used.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v7

 package/ti-k3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index 2a51b1531487..b8545b7bca62 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_TI_K3_SECTYPE_GP
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
 	bool "hs-fs"
+	depends on !BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS
 	bool "hs"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
