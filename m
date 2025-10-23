Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08598CCD1BC
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEAFB843FA;
	Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYjokc_KlI_H; Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BE28446D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BE28446D;
	Thu, 23 Oct 2025 14:05:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D43E8DE
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C056A40FE4
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0WvMYN7TguS for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 14:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF34340F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF34340F6C
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF34340F6C
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b472842981fso120702366b.1
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 07:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228337; x=1761833137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ov3naLTwQ0ncT0Q6pWmEsWqbT1zcyx/bJsQ6pZUd5oA=;
 b=ZfXBOwPLRH5/v/2Vku29ai9e0W8U00NbBUTJjMwHjoCjQKR2CDezvrmk3ZcKt6rbx4
 BSAbvw3UbSXmSTMtAXXsfWL957CiaPYk1cZA8Tr1iUECxCBRfU/BbAKtEq3OUABq4Wo9
 BEy99jS0YcL4BMlDrAnGtzvwmL5uwqcXn1kkTKjZeh5q6PmvZ5nJtwo8Zia/3dPGYFb1
 xqjWtrPkim31H3h15lOYLlcM4cKBxXIUvMCvDTfdXGHOLyIQTrD9zTP/npFHIsiXeMim
 2O53tDdA2dKOehVFuFYin+BMykjED8TpaCnUAsK8FZE63iY+VeBy4chE00WPqxFGIYFl
 sUvg==
X-Gm-Message-State: AOJu0YyRXXFsJIEsOAYhmLepMKRLj2kCOp+lFgHZv4DnUsvhUsoI+bjq
 2jYoyP5WcYQ7/2EtRkqV1K7p+SiwvijGcSYOsVS/NyNM1nP23AjgiHSc1ZrvkDoX86GMNuiihXb
 6tKFwvLU=
X-Gm-Gg: ASbGnctz4WmKW4zDs8kJFqPILSngkxivgyRLR7lqcD03040GDurToNS/mBh733/qkX+
 PrH/u4cLep0GyVYegaTqh632NgzuhjTHXN0b+5KVa2h85Fjvd4ie9Wil/+8xnajR2mkwBfsb0RZ
 E18XUN91E1Sc2JgoCyr3X07AqRvUX1BDnQ07l0xHrF+5px4pU/xGcJPd7Zv/Ywub7SZfSTWCjRw
 /QML0rG0YVGSr2mWbop/qawKzm9k2Y0t9EvC0saxfQzbHsTPHnOlGSYoyEyw3/4kL22G6vuoxB4
 o2sf+uTYR1LQSq3KqhIUhGUzVfdKxtJKUUuKAyNADtqGPdpdfgkVyzRXisJ5Af4EA6hdQ2N52IC
 wqywfMAKIFxcuQ79BtFVRNUAH/PYw/d7gU0zRuf18fDuA6cF/bMZk2v3VSXfTI1rU5WmfK878+L
 PjWh1/fX1H3/peDVZikMn3X8bH
X-Google-Smtp-Source: AGHT+IGnVs7FfWRIPjIh+AmT2xlNXxpoXYhGvL4co1BA8IAumv3qafowWRZSAqXHw8OCquc1FGxROw==
X-Received: by 2002:a17:907:fd8a:b0:b40:33ec:51ea with SMTP id
 a640c23a62f3a-b647195b5acmr2521236366b.6.1761228337190; 
 Thu, 23 Oct 2025 07:05:37 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51317e97sm222834966b.35.2025.10.23.07.05.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 07:05:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 16:05:23 +0200
Message-ID: <20251023140527.544948-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761228337; x=1761833137; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ov3naLTwQ0ncT0Q6pWmEsWqbT1zcyx/bJsQ6pZUd5oA=;
 b=CmRhqEDGp6JfX6gJxu7Varl2DolcJA78qQRu1GnzYQi7s0FNwB3fdz4wfyzBC3czeT
 iKYgzB9/2N5huqhBgkSTd0QCwOBuQ2+YSsjj1Ge/Eh1UbfQDgKZ677DQfr3wQZmaENWd
 8Q41CAc4RC8/kcqPHqtID1KjipBzP49gNSjceyZednhWZ6YyKweyV3MzdtVqQqDoULhl
 wGSi3LLDi3SXYm+bTQaLqLUYMHmrJM2OIcJCIqdCA+QvKQpTJe6f6pv43/5WoV0wrNmR
 omANqtOntQH1t5pv+EeXbwa6tmL8P1Q4mYXN1JsQIkMnFlHAT4DybLZWUJ6k1/747OXx
 D+VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CmRhqEDG
Subject: [Buildroot] [PATCH 0/4] Ignore some CVEs with inacurrate version
 specifiers in NVD
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some CVEs have incomplete or inacurrate "Known Affected Software Configurations"
in the NVD database, and they are therefore incorrectly reported in Buildroot
packages. I've sent a request to NVD to update them [1], but in the meantime,
let's ignore them in Buildroot.

[1] https://lore.kernel.org/buildroot/34229503-5bda-4427-9dea-17ea1dd4a688@mind.be/

Titouan Christophe (4):
  package/freerdp: ignore CVE-2025-4478
  package/libssh: ignore CVE-2025-5318
  package/openvmtools: ignore CVE-2021-31693
  package/tpm2-tss: ignore CVE-2023-22745

 package/freerdp/freerdp.mk         | 4 ++++
 package/libssh/libssh.mk           | 4 ++++
 package/openvmtools/openvmtools.mk | 4 ++++
 package/tpm2-tss/tpm2-tss.mk       | 4 ++++
 4 files changed, 16 insertions(+)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
