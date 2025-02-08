Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF3EC0219E
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC69835ED;
	Sat,  8 Feb 2025 14:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVOs5sKnUQpM; Sat,  8 Feb 2025 14:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1869983A6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1869983A6E;
	Sat,  8 Feb 2025 14:23:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE334CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E937404D4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGdml1adl_Nw for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 229DE404F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 229DE404F0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 229DE404F0
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dc33931d3so1155552f8f.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024611; x=1739629411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OanTpJCTJ002DeQf9VdbIpvFhrgmNW529glzbBfU2ak=;
 b=cMmDD0WDNTGXg6BVHRYSGXr5NL04CL2OvGrsGLCfk5rAisH/agrJLXAmFqyDLFUCcQ
 3cIVvvZpGP6evUVEIyBFaGt/iHPAvqkLfQvwmxAx3Ki0/kEybqu4ke5RIA4A8n7VdFKq
 bwb49UzWSTLupOFR5UJnD0C6KuXuolLrCn83ucryzEjf1S1WEJiOiXVHL1E8GnHXX2Su
 gPKFoxyO5+E7m0TFMN44Pg4lV8oxRAwv1Do1AWfbskzLKAN7J2nJK0HnumJldGCeFELG
 WpXxtqaICkvzFpldctotp34aEnq2S6pO+IvVQ3R2HeaEJwCIWisxoJB5YaZWUK3gP+J2
 c1Zw==
X-Gm-Message-State: AOJu0Ywu030uDWusAXtPRqimr4bv8TN7vbBZWCTTDverGS5TXwH/VaTj
 lFmOInWF7L71hNGnpxA1ogtzEIsFjbVpxwdBUPK1NFaFsvQGSm59YwzwVtAqKamai5VZ1BBe2fV
 o
X-Gm-Gg: ASbGnctISEgzIg7i84vcVYQu1BvdfGf4XvST7E1VCSwGUK6Wi+Hhhc+rh77YWVhqsNh
 bvp8tV2PTldku0VKRmXBAF9GPoMzLVTrc/3iH/Zbs/cjCdbhocsx0mic9ssMOsqQK1E7gHi6LQj
 wh3uUy5I0qRd+uDs4RaJI8hCgVtBvi7KHWB4a/llSx3032FPgbw0GzBa27HnQQ6mQtOX8Qc2Vn7
 uFY0z5VgOI2a06sYqiwP3QljMLA4qVFWYkXD01hSISPBB2nRcpdsNZ4hWzW5lqjadpKDPC2YbAk
 zcUXd63nCkRdyHIYwezz8YI2gxKlRqwsIdt1zXYK3LiLFqbWdFLLSGQ7cjtRwVIU0M6CSi2dMsF
 GVkrZBt4ZvxIz
X-Google-Smtp-Source: AGHT+IH5o1O4cOcnROtqZyJe10aQlzgk6e2z6p+He6LWBlCTh6H0+wfZLfs85YyN1M93/om9NbeAdg==
X-Received: by 2002:a05:6000:1a8d:b0:38d:b5e8:310a with SMTP id
 ffacd0b85a97d-38dc8fe5357mr4667359f8f.28.1739024611636; 
 Sat, 08 Feb 2025 06:23:31 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:31 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:18 +0100
Message-ID: <20250208142327.418271-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024611; x=1739629411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OanTpJCTJ002DeQf9VdbIpvFhrgmNW529glzbBfU2ak=;
 b=cDt+svkEp/juKfEMPuOySPBICRRbY/pXaVZrbJQOyjIzCReQj408D0rDHlUezFH2Ap
 BswOf3/6NdfAd7zsyeXsjZjyoGE2IIQjlC2evcMsQhTZXvTQeADeB0j/F6jqiraJybL8
 xFlP/4k1TwwRpCl6ukpH8R1gBVY7OkBOSMEic=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cDt+svkE
Subject: [Buildroot] [PATCH 02/11] support/testing/tests/package:
 sample_python_*
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

flake8 5.0.4 provided by Debian 12 (bookworm) now detect a missing
whitespace after 'assert' keyword:

  E275 missing whitespace after keyword

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/sample_python_attrs.py      | 8 ++++----
 support/testing/tests/package/sample_python_colorzero.py  | 6 +++---
 support/testing/tests/package/sample_python_constantly.py | 6 +++---
 support/testing/tests/package/sample_python_gpiozero.py   | 2 +-
 support/testing/tests/package/sample_python_passlib.py    | 4 ++--
 support/testing/tests/package/sample_python_rpi_gpio.py   | 2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/support/testing/tests/package/sample_python_attrs.py b/support/testing/tests/package/sample_python_attrs.py
index f224944914..a5f63f9e40 100644
--- a/support/testing/tests/package/sample_python_attrs.py
+++ b/support/testing/tests/package/sample_python_attrs.py
@@ -8,8 +8,8 @@ class Obj(object):
 
 
 obj1 = Obj(2)
-assert(obj1.x == 2)
-assert(obj1.y == 1)
+assert (obj1.x == 2)
+assert (obj1.y == 1)
 obj2 = Obj(3, 4)
-assert(obj2.x == 3)
-assert(obj2.y == 4)
+assert (obj2.x == 3)
+assert (obj2.y == 4)
diff --git a/support/testing/tests/package/sample_python_colorzero.py b/support/testing/tests/package/sample_python_colorzero.py
index 23862a816d..2c03ceb15c 100644
--- a/support/testing/tests/package/sample_python_colorzero.py
+++ b/support/testing/tests/package/sample_python_colorzero.py
@@ -3,6 +3,6 @@ from colorzero import Color
 red = Color('red')
 green = Color('lime')
 blue = Color('blue')
-assert(red.rgb == (1.0, 0.0, 0.0))
-assert(green.rgb == (0.0, 1.0, 0.0))
-assert(blue.rgb == (0.0, 0.0, 1.0))
+assert (red.rgb == (1.0, 0.0, 0.0))
+assert (green.rgb == (0.0, 1.0, 0.0))
+assert (blue.rgb == (0.0, 0.0, 1.0))
diff --git a/support/testing/tests/package/sample_python_constantly.py b/support/testing/tests/package/sample_python_constantly.py
index 570cf85b23..b40d71dd9a 100644
--- a/support/testing/tests/package/sample_python_constantly.py
+++ b/support/testing/tests/package/sample_python_constantly.py
@@ -14,6 +14,6 @@ class RESULT(Values):
 
 
 print(list(RESULT.iterconstants()))
-assert(RESULT.OK < RESULT.FAIL)
-assert(RESULT.OK.value > RESULT.FAIL.value)
-assert(RESULT.get(-5) == RESULT.FAIL)
+assert (RESULT.OK < RESULT.FAIL)
+assert (RESULT.OK.value > RESULT.FAIL.value)
+assert (RESULT.get(-5) == RESULT.FAIL)
diff --git a/support/testing/tests/package/sample_python_gpiozero.py b/support/testing/tests/package/sample_python_gpiozero.py
index b95df07fe7..67965542b0 100644
--- a/support/testing/tests/package/sample_python_gpiozero.py
+++ b/support/testing/tests/package/sample_python_gpiozero.py
@@ -2,4 +2,4 @@ from gpiozero import pi_info
 
 piBoardInfo = pi_info('a020d3')  # 3B+
 
-assert(piBoardInfo.model == '3B+')
+assert (piBoardInfo.model == '3B+')
diff --git a/support/testing/tests/package/sample_python_passlib.py b/support/testing/tests/package/sample_python_passlib.py
index 3ab348b9e4..5d22bba262 100644
--- a/support/testing/tests/package/sample_python_passlib.py
+++ b/support/testing/tests/package/sample_python_passlib.py
@@ -1,5 +1,5 @@
 from passlib.hash import pbkdf2_sha256
 
 hash = pbkdf2_sha256.hash("password")
-assert(pbkdf2_sha256.verify("passWord", hash) is False)
-assert(pbkdf2_sha256.verify("password", hash) is True)
+assert (pbkdf2_sha256.verify("passWord", hash) is False)
+assert (pbkdf2_sha256.verify("password", hash) is True)
diff --git a/support/testing/tests/package/sample_python_rpi_gpio.py b/support/testing/tests/package/sample_python_rpi_gpio.py
index 5f0d884e07..de8d776d04 100644
--- a/support/testing/tests/package/sample_python_rpi_gpio.py
+++ b/support/testing/tests/package/sample_python_rpi_gpio.py
@@ -1,6 +1,6 @@
 try:
     import RPi.GPIO  # noqa
 except RuntimeError as e:
-    assert(str(e) == 'This module can only be run on a Raspberry Pi!')
+    assert (str(e) == 'This module can only be run on a Raspberry Pi!')
 else:
     raise RuntimeError('Import succeeded when it should not have!')
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
