Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F81E92FE1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B724240746;
	Mon, 29 Dec 2025 21:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zG6oAPmp8y2t; Mon, 29 Dec 2025 21:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B3A407C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043329;
	bh=Hzy2mZB3TBe4mvD5vmtQHpXCmnsVYqaZhcr+QLzOVjU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YK/PX7+MKLSzRcz9rUnCTzChNkI3OyW0oICdgefpeNq2z5lV3ZZoA9wDfi0iKuOji
	 sBZDv9+M4AiYedcuEg6CknLP96LmrtB3qiX+gEV65ZeVzr9Lu5X9OBiMTkJsKeygR4
	 8JYHTpaVRY7/anoJE/umS2JkvBTpp669/6M2nK1a0gYvdH/FM3oH4FZsvxkc0M9f8Q
	 QkM7Uu1WU6B/rJfuCxAgvpsP4ffQ6SDj/CNkg3NocG/la7YHYmQEiwfoaw3kY341F6
	 BqVPlIHnNrNdKTbCJ/1SDoKpoy7Q3z3H0C9i0Pna26IFuPsnxKzKmF60OZ2gdtcn8p
	 IMo3MTtDEkF8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B3A407C2;
	Mon, 29 Dec 2025 21:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E5435B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EB4480BC9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIxvyMZWqwOx for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DCE380BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DCE380BC8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DCE380BC8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so54592465e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043323; x=1767648123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V0N306Q5j0BN8YTyvCjRdNCOsZVJ4XtAUUPQAdbvHog=;
 b=HbQ7H7MJRXq7cZn4WJ+UZPXgo0OuVOfJ1VvtkQg3d05fkAJlBd/w1SGlq95HsnFUrM
 U61dHMxeAOKuK+wnIBqB6fOGjcHjY6MNWobnFHs2rXVUjyP7PkWBQbMlrA9atLU8vLhw
 p02DxyjfuAD5QraUiT32R1oz7/fcDZdzSBND/9aHa3RnJqWR3ZVkt0WWRjNT0Mqve1mG
 I6C8ymxf9ahoSZBuBIhhFXW0S8h4XlQhxTtEE/DbJHReU2ZkR8GshV3oGkzpHpy5Gl/z
 av8nuaBfICzj+mQMUtOzQtqeW1wCZYKGirQ3P5A2UI4wuYGYvi5VqEHsEo6/mETde3Z5
 y+Sw==
X-Gm-Message-State: AOJu0YwLIjEfe5aWPVtTQqsYN03CPDhqQ4Ej86wAOM8Kwh1hH+C2f+XD
 3FXhIrsTYuBpoet266RikB1FuMbwE2aTut98ElkHvxD0+I4ijoHB1HAlVNrqh2vmnBiwYfY72NC
 ZosOyDSw=
X-Gm-Gg: AY/fxX78FHSycQ+ZugawCvwVcJ2maOin4HL/mmmJ+JWNmzcUmF7jrsXEzzQgiW1HQD2
 DzGXJqkXlWXWu8w9bTH14T6nRtA/hk+8kScUPUNSshMDXq7I9SGF6ziRf6ddjIyQeFkaWwbP56M
 Z1rM0I7kfWni66tZybbbi58si5Vh267yGDz68kPXKRogpRFNQwpA16r7jEkblQ7GJ2XWFmgQqtE
 nSX7ItBmktv7nC0PmbkCi18t7xDJyQTbpqKxBmIyOFDiyLgNcAE7NzWylwONAJs+7UJaAnkfEcF
 sRQN3VOuDbjfX0JlOnIwI0QThCbEDXZLNLFdOgngtlv5c1Vh+BHIh5O04gai+XoB0u8Jhr6m5d3
 HePB4Z2MxdOAHpCVZGQGdNgLx3P+9knP6IoIYvHgOLA/TPmP0FfvVd+2waThQ+2C8ubXJuDCoke
 CQY7E=
X-Google-Smtp-Source: AGHT+IG5PhzNl5cX47mYnHWNkkgstpSOHJqbGO7K2MNK+eHXVl69NAmkD13LsNC0X+lIyEoJQcUGkw==
X-Received: by 2002:a05:600c:8718:b0:477:63b5:6f3a with SMTP id
 5b1f17b1804b1-47d19586ae0mr353145755e9.27.1767043322933; 
 Mon, 29 Dec 2025 13:22:02 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:40 +0100
Message-ID: <20251229212149.167902-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043323; x=1767648123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0N306Q5j0BN8YTyvCjRdNCOsZVJ4XtAUUPQAdbvHog=;
 b=S8o+8N3WRICtwSkqqQr4FhadNcNmQM36yiMUvYkPZ2+w1atWL+6TphWjw5ZRh8f708
 uZ8grVt6+M0JhVUszjJUiMq8qPn0tbXQ0DwDFrncBUAIxBNXkQoxpYUjlMrmTmOl7/Zw
 R4JmrrwuIjAq48OXxRI6H1jsyb5aBrV+gVhpa9nZzWdUujIVrmorWBBhi+tEnGMFgEeL
 Ig6u39IrqCoVGkw5j3B8L5fWfE6zSp7ExbiZPqkfd/IzU35ATl1XjUeiPJW4on+f8a8V
 sUJH/78KRo13G4vElddXKiLr2XYuZ1F4ay1M5om+PMxswos4wirNBkCvPTxtIlJMTlSN
 3IwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S8o+8N3W
Subject: [Buildroot] [PATCH 07/15] package/pixman: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2023-37769 is then no longer matched to the pixman package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 63d9ccd10b..d02bb0a260 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,12 +26,6 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests.
-# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a test
-# executable".
-PIXMAN_IGNORE_CVES += CVE-2023-37769
-
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 PIXMAN_CONF_OPTS += -Dmmx=enabled
 else
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
