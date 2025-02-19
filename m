Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAC9C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC2681203;
	Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emvaFG1aUuUV; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52FEA84D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52FEA84D8D;
	Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A2DF127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66CB54015E
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjXogTdgYJok for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 556B740603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556B740603
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 556B740603
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso5056059f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955045; x=1740559845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XJb8Q6f0+m2pKvKmGd8Ytog3ZQ/BEQ6Hb1NYSLdJJxQ=;
 b=GmS5BE+NcDBZ99e++uWCDp+GahCxJT9R9OUYKnf7qwtMnqJk7YEo8VdyyzY4tA6Fc4
 yBt98+Z9xOqhnD1VdEcvdCskTk/jmATMi3ZiRrfLkOcgZMw2tQxaweSjoMIYdmw2gIRU
 h+T1uMaIVAXcu93BQ89aCKaW1Zz35Di+vJWboTQKTAIiemFXrNQSE04UkEokaihoeufr
 ootjgoVn7cYN5EuLF04cbGbZlDHpb8ehQ3IIBz5VCGhKu/2agfvD5WNNb7+n/FLmMnks
 M33/E27cKq+GYk0YolhqcfehthlQcOXlAmQNFumUYyTqdZwdogno8E5zZIdZ4N7cOze3
 pV0A==
X-Gm-Message-State: AOJu0Yw105rnABnz4iFb83YNPXVxVYVSXDdRESe+upktLts7VTLKXBIe
 BeBx0MNrQ2OwAY3n7lcivvq5g7GJmgeIMNzRBhEFw3Ns2KLZFvsKfSNTBg==
X-Gm-Gg: ASbGnctoNbwbhhaxaBvm+PKkX71r/aThPOwf+oYhK/EsiGZ4tH5YGLmw11cT74JJeiP
 /v9imoSEttsue6Wv7Q2KV7gssg7sitr1SVJzwLMiOaDDzOuwz+h6STLBVydlbOKgyzX8bLlnG4V
 nMxGnIWRTpNAg2Ve7gmehfq5Foy3SkQsO/T1zI17P0FCkk1RleT3kgGTrZGDtCaBUQDUCnSP5kc
 +fuRytoagVkd39xGB7OiXw0t8WfcmFa1QfiJQQeTvckzeGuov7SCiZu6XDTD6sNfXGUZXJz9exD
 F54kBip7+UWptScofAeeiVV6gA==
X-Google-Smtp-Source: AGHT+IGiM+QsgYDLER1kbkkTYu2MUBRSJDk4NLPoYUx/EBL478xz1sOSJlLcZOcxPAVsE1KbGM1+ag==
X-Received: by 2002:a5d:5687:0:b0:38e:48a6:280b with SMTP id
 ffacd0b85a97d-38f33f511cbmr15531846f8f.34.1739955045329; 
 Wed, 19 Feb 2025 00:50:45 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:19 +0100
Message-ID: <687bed19fc356411e3fef757bc036bc4ea9cf551.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955045; x=1740559845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJb8Q6f0+m2pKvKmGd8Ytog3ZQ/BEQ6Hb1NYSLdJJxQ=;
 b=ZtRQfhRG/zEfX9N9h+PQS4aq3ZIDmvRv1dqK4pyMG1cM49H/3nVcDePEcsmFc+gmGi
 wD7oQxwrOf8qb2X5B59cUnmfnSj5BD4o0jKQX+0/d3oSKmp+naJJXFj4wwjpfT/xlFMV
 DTa20016F4INV+O8rkFcmPGf6cLeiA9Leh/HCRrZTFwg01fd/f2QsTs5xM6UcNqBrV82
 aMCpCqaYLk7hNrMaF50BtKgEw5CJ4GSaPb7noO6JMgNlJdqnmsGaHGBv9tg3gnFUg6BV
 v92GQ5I4jKYMGhYtlLvl+RZt8uEsseeFc26TFcsf4sV3LSLO8FHl8zswlScEAUxanCqd
 OHrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZtRQfhRG
Subject: [Buildroot] [PATCH 04/27] package/liberation: ensure at least one
 typeface is installed
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

It is curently possible to enable liberation, but disable all the
typefaces it would install, which does not make much sense.

Ensure that, when liberation is enabled, at least one typeface is
installed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liberation/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index 8d6b3e78d9..18ad7044a5 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBERATION
 	bool "Liberation (Free fonts)"
+	select BR2_PACKAGE_LIBERATION_MONO if !BR2_PACKAGE_LIBERATION_HAS_FONT
 	help
 	  The Liberation Fonts are intended to be replacements for the
 	  three most commonly used fonts on Microsoft systems:
@@ -9,6 +10,9 @@ config BR2_PACKAGE_LIBERATION
 
 if BR2_PACKAGE_LIBERATION
 
+config BR2_PACKAGE_LIBERATION_HAS_FONT
+	bool
+
 config BR2_PACKAGE_LIBERATION_MONO
 	bool "mono fonts"
 	default y
@@ -16,9 +20,11 @@ config BR2_PACKAGE_LIBERATION_MONO
 config BR2_PACKAGE_LIBERATION_SANS
 	bool "sans fonts"
 	default y
+	select BR2_PACKAGE_LIBERATION_HAS_FONT
 
 config BR2_PACKAGE_LIBERATION_SERIF
 	bool "serif fonts"
 	default y
+	select BR2_PACKAGE_LIBERATION_HAS_FONT
 
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
