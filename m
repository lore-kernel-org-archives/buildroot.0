Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDBDE6C5E3
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 01:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD1540814;
	Tue,  3 Dec 2024 01:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REw4KUt_OUR7; Tue,  3 Dec 2024 01:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1672040822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1672040822;
	Tue,  3 Dec 2024 01:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03ECE1531
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 01:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5DC240022
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 01:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uM1KC2ztVE2E for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 01:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A2A34011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2A34011C
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A2A34011C
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 01:01:07 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-841d8dec20aso161651339f.3
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 17:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733187666; x=1733792466;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzxlZbwtPbT3jcV+AW2YngWeP9TBMjYZqaGpaojFnCg=;
 b=TaH0xt5HdGR1QaMpOwqJ4Aw/b9Jku/EiuX7ZxTaWbmOp/x1sM5VKV36r+vwU0VRfGV
 ln+chjrqycmBxvcQ6bEU+GvU+3vOhNxCKcG7OAg6ZUjhWP51UbVfEjgz0eiCWUWohSUV
 aDq9586o5g/aqI2fJZGtNl28olV1RcINpM+Vr6CqEAGOj7HSQYb2xVfW3m0Oddnd4LCS
 oeWfduZAr2FNBFBLPC8MxZ5nx15Sdw7x9nawsZEdFXMrT14UQ6PCIk1EsJAMAUgpaVxY
 MAXTWl/xXJ445qvfDqK7oxQxw+Lboy0Hcx6FrbeJWHsAd5921EDVLs+qmS534lGI+8g8
 lobA==
X-Gm-Message-State: AOJu0Ywf7bdz8H9d4cndILiEZPqg4zEglNzdE3kmqESelAHybWzz7CE1
 F2hUEGkAPRclgl3TNhTC4kxRsi6VobnJOA8kTKia/jEwEaPVRaoZWwfl8+bJ
X-Gm-Gg: ASbGncvSa+PXMLKwHQlkB5SSLiiHw4bj9z5vOY+TZGYyKaq6Bh9I+HzJmb0pgflJYWj
 qO1IA8b4eoq0tQN+JqMOxgQvCZcBX919MODFN9+qjCnUlNtToAdsGQg1c63kezFYEHrqTlSRPU8
 h7y0bRtnVN9d1Z5P5gCnNfMIzfUWe2EWCMmEQmMz5Pdy2Cvz14YeseQoBTdxW3JazSf0ruJgj1o
 ZRovTDAE4iu0VDZ/hs8agHfOpaSBbsZgFAhmjOoIm1nb7oBQsEBXK7Y5t3Bzo+lJuSFsvEvete0
 AMc0nOFrOFwaJA0NjaXmG306
X-Google-Smtp-Source: AGHT+IF/aW2jCWX7wDmYc3qgrF0GIW1f1I+ro26u94zOenXouYd9ssGqmfBpKk7uNqETWm9srDG0Lw==
X-Received: by 2002:a05:6602:2b85:b0:841:a652:b0c8 with SMTP id
 ca18e2360f4ac-8445b542da8mr111100739f.3.1733187665943; 
 Mon, 02 Dec 2024 17:01:05 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84405ec8613sm231135439f.11.2024.12.02.17.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 17:01:05 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Mon, 02 Dec 2024 19:01:03 -0600
MIME-Version: 1.0
Message-Id: <20241202-bats-core-1-11-1-v1-1-8113a994a973@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE5YTmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGblFhSrJucX5Sqa6hrCES6iSlmqZYmyckW5oamSkBtBUWpaZkVYCO
 jY2trAS4IL09iAAAA
X-Change-ID: 20241202-bats-core-1-11-1-ad6e94cc8715
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733187666; x=1733792466; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DzxlZbwtPbT3jcV+AW2YngWeP9TBMjYZqaGpaojFnCg=;
 b=bOYxhbZ05PW/nypr9ceYm+cAhH2KZS5ged1C717TakbSr0VsenMJ6xlAbJor4oBbu8
 INK++AgK/2hO2GVe0m7WBqwmzBJHX711tJkdtMaQO38Et59IOfEIrEcipd15Ra9IFKRD
 /ZyvWqm//TgpiUcvxp5RCWnKGN0ENk27Ozse/1MKa+cUjbih8DPNHPBLPLdOb1WSB9zo
 oUd9p9ZjqOoJIzgi9WPkO2sqFqAAocXXEvOFy0x/I3SU/YIY4ZG8EcxKwK5g3XlUQ0rn
 U+WCDiAv3KG7QGwHZjiZRmYWUADK6KmyrOY0t3s8ovvPU0HNA7qKzYxhQUi26J9JV+71
 uDEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bOYxhbZ0
Subject: [Buildroot] [PATCH] package/bats-core: bump to version 1.11.1
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
Cc: Brandon Maier <brandon.maier@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/bats-core/bats-core/releases/tag/v1.11.1

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 25b2b60339491ac306580b9b453dcecd23bc346c..e528f0fc107b73f90a3b374ab11bd906f4b3693f 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aeff09fdc8b0c88b3087c99de00cf549356d7a2f6a69e3fcec5e0e861d2f9063  bats-core-1.11.0.tar.gz
+sha256  5c57ed9616b78f7fd8c553b9bae3c7c9870119edd727ec17dbd1185c599f79d9  bats-core-1.11.1.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 716b167c0019979a87aa570838161934f9abaf5c..5e1c9c4bbc62cd9b5a614aaf189824e3ec7ac0bd 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.11.0
+BATS_CORE_VERSION = 1.11.1
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md

---
base-commit: 58ff0cb5c43cd6909841b066a78a7689eeea6080
change-id: 20241202-bats-core-1-11-1-ad6e94cc8715

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
