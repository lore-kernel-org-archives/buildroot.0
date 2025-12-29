Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1BE92FDE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E07D2407BA;
	Mon, 29 Dec 2025 21:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAukp1TeIF5S; Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C477E407B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043326;
	bh=KE3uM9AB59I2A5PC2mdB/y8wiCKjjPjIPoSVKXOF3mQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=bbZPpdgOfdNU1IT3wPZ+s7qlkm6gMuCLefpwicyzp5sedcwEMdOzTo4DafH9xbUMO
	 tPP5ggyWfyWj5Sk7Ldti4ycwbf2/8rSuDWtGjuaYPUDbfMI6Bdqw/dchymv3ixlY7A
	 X2bZXZe8mCCV9SRorFO4jYDe1TE6OcVGVDm1onPhoUMBN6hrvbl7z+BsoYKcC1dyZL
	 ki6qs/sZbxcPro/lPN5pbam5Ikn9BMwCm43pmt3TwNtoW/t4py1RPEnVctul9/ujQm
	 CMAhLdTsXNw5y/qiSZCR3c9tNLGNR/1yWMC8H5g1iIMPRsGH4i89sLWEocQ+mQu9uH
	 SIhA8TsA7/HLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C477E407B7;
	Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36737177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 289C34005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyxWJ8zcRikt for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D3284002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D3284002C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D3284002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so69050695e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043321; x=1767648121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EZEXFMuif2S3hWJukWpBApGTJQbSP2xPXHR6/3OWUL4=;
 b=Cg29z2LkbWCQtVuVuXyvI3Gkf/zDJ4vTwkg3PHRZ+gf7jvQn1G/L83CiXFalWPUgnT
 mL5gOUzvXPzeaEWSEpj4SRfNf6N7KBrQcRYwIWSdIDOuYi/0scFELxTCYYovT54irLvy
 9FVB1knhZExfVoErEAOvWh1qn760yJpL867OytkqlTNqWbJMG3d/sTaTD7xfsl5jBbPm
 EP6q6RdmAUgCgv8dAKuENd84dSY8PHOd3ug1r4NFcZawkO46K+C2mkfeY0iRFkbBw4fK
 kUz7xKZmMMj3yu6euENre+X6cIpFmc6lOZ2sZjlvZ2l0elCdLn72AJkmMtOjFwntxyC0
 zLMg==
X-Gm-Message-State: AOJu0Yy9pJCcCV6uXBeJ0voQFuPiIzo531JHHXea70fsHAJaNfTgeEXG
 HJ58kf50tRA7SnRXDrAgtLntp8ovFrBqLceLAeXoYSKMaS9zjRB5poz3XI43lSGRvlsoTg/y0Bf
 PvytJvbY=
X-Gm-Gg: AY/fxX7A1YOXhYhCOKm+WsWIICRaYCQo8fHxA1B8FcAH5LDJ9Yf4k42VCdey5PvPUcX
 kvC+FJDWoNTGbRlgM6lsUeMo+cG8F8hgcedyw3bycJZsU1w+TaYtG2Ro7CV0B7TTdRSap4GU9V1
 2ZgCyc2bT7qmiB8cIqs1C8iu1+9gmQ2LCR9fyHMVwSJOvDD/3ByV1c1dHrYUxKcj/C8pio7hI7B
 IN0JS2i8r8PURj6PKawKEphG1NER1orm5cGf2rArWqa5JKg5RUk6Rbc2PhNUqsR1yi1tmiBWB8G
 5HnQcaD17zYj55xZapUE6K2e2G8O1jWGlT2uqZAtXoIURzCcEcuw4DKtILscy0Ncxu7UNA2kPCY
 A1enH7W4lCMXpDgSZpRFf9VghEI+l/Ex+FgkU7j+8F6S/UsSGqaHNgkUUyubvFqKcLoXnHcHfVJ
 hrBGw=
X-Google-Smtp-Source: AGHT+IE96rUWYd3w3PPkbGS0O35vbT1VGOCN3oFJUH2WO3tsW8rgzkwZo8Y98HqEfCKOyuzlwy/PtA==
X-Received: by 2002:a05:600c:1914:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-47d1955b79amr338796545e9.7.1767043321116; 
 Mon, 29 Dec 2025 13:22:01 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:39 +0100
Message-ID: <20251229212149.167902-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043321; x=1767648121; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZEXFMuif2S3hWJukWpBApGTJQbSP2xPXHR6/3OWUL4=;
 b=hD9nx5VullOxeTya+H846ilgImqWUWFnN8qzSJ3Gb0DOIWzra6W1Ejn0VXpP5ptUms
 ZsW1xXjVXqzOUI+T0R/Obh+MdXs1u6i+SCj//QUcGYpqVAkDo+Os2oWfQsabHCQ9AVc4
 M9NQw5VGmsOlGtny5KEdstDXOiRSqzne2C1hKXlZ63Q+S0pSFcXoWqg8JhCWADPmqgEr
 jRgc+2j8jW924akGLM8w0Ck7lLc3I+KcXkyMQPoqkG6Yfjx6ubVkfvbXykRYnO3uUZ5Z
 Q1vCmaLlgRCxsvbJwxwWkR/oLt0Yeb3pvi3etQ3PSHOk98PnKlZaWWqg4Aq/PzFtgzhl
 WUtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hD9nx5Vu
Subject: [Buildroot] [PATCH 06/15] package/postgresql: remove stale
 IGNORE_CVES
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

The CVE-2017-8806 is then no longer matched to the postgresql package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 78d7cef4f6..38403b0f45 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -28,10 +28,6 @@ POSTGRESQL_DEPENDENCIES = \
 	host-bison \
 	host-flex
 
-# CVE-2017-8806 is related to postgresql-common package
-# It is false positive for postgresql
-POSTGRESQL_IGNORE_CVES += CVE-2017-8806
-
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
 POSTGRESQL_NINJA_OPTS += world
 POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
