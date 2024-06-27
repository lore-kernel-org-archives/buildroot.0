Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A78C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F5FB41A56;
	Thu, 27 Jun 2024 07:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7ZSbZrU_BYo; Thu, 27 Jun 2024 07:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDCB41A21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EDCB41A21;
	Thu, 27 Jun 2024 07:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 657C81BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F0CD80C92
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4kAD2SLfBrr for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61E0A80C7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E0A80C7F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61E0A80C7F
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so1514650f8f.1
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474886; x=1720079686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fyvogt1CQiz/hbmJdm3E5lBu4+VYgZk9KpE+awYiej4=;
 b=ANpPY+qN0qHUgrYE/+0S84r33uu5XBQWYPPAUdtRv4FWeup8OHK2fRgich7LoRc9PJ
 FT9C6pEogBa8awLx7N3kbGLteqPa2rBqU4klJIPAIwKR5/JI9OCMdXLFyvgJ5X9uiBwM
 aXTv8+yERwKe+c8fK4ShmaPP8H8BVY+IV5CJBgzAJT0XhIYlh6gKjyR9c3LugWTrjsl1
 ADbL5OCglDYNqhoOMZnsEMtMcwF2IqW7YYp0bI4ZMJqTbWLJNK/Y7wljOhAmYwoJI88t
 E3toWcHDnD8VGKYii4SkG6yXXrTUgYkPOB81qeBxC9DFD2zazAMjoUr12rd7cMUwYkmF
 yRZQ==
X-Gm-Message-State: AOJu0YwcEFZz6nO6c5SDWAO3Gxms6wYyc6RRGxhK8Vw6MmMH7tynv668
 O9OAVr+HbZi/a9M42izPi/ExxjjmOgHtp9055X/piRcuZjiWufXZNCbc36XKS6NS69P/8Jw02i7
 C
X-Google-Smtp-Source: AGHT+IFv42WbCNFAk+yKRdg77frOlxYaphow6xNwVyW6wsnc9hUZA3E7v6FlgrxsCEv+7RSO3iNUqw==
X-Received: by 2002:a5d:674e:0:b0:363:7bbf:efcf with SMTP id
 ffacd0b85a97d-366e94cf46fmr7192813f8f.33.1719474886333; 
 Thu, 27 Jun 2024 00:54:46 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:38 +0200
Message-ID: <20240627075441.4116645-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474886; x=1720079686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyvogt1CQiz/hbmJdm3E5lBu4+VYgZk9KpE+awYiej4=;
 b=VoD6A/7hX+aWxr4JXgW4bBYb9rhXWDDoTwytsJbE1XpqsFKRERiK60uJFAeL+HmHKG
 7G8v9EiyJqBB1V6Z4NdWW7B6xc7aqf+YRX9vpYzO+QDlyEQeIMbMoz8aVDHYmUju4m1H
 c9EutONglezQ2RNHqaGz3y75Av6DInEKZi+Wk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VoD6A/7h
Subject: [Buildroot] [PATCH 3/6] package/python-asn1crypto: add host-variant
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required to build python-tpm2-pytss.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-asn1crypto/python-asn1crypto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 480b70d17a..d8d6176150 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -12,3 +12,4 @@ PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
