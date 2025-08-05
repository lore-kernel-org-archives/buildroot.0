Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8849C87FCF
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 00:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF8D8384B;
	Tue,  5 Aug 2025 00:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJk6mtpf1RUS; Tue,  5 Aug 2025 00:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B1D83807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B1D83807;
	Tue,  5 Aug 2025 00:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 967D8118
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 00:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8833D40E85
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 00:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUPbdzgriUW5 for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 00:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8CC640E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8CC640E9C
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8CC640E9C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 00:03:56 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-7072ed7094aso35644206d6.1
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 17:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754352235; x=1754957035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHy3C0HN8eWuHUNxGtjU/bVz3iqKTKJPZUPInQVFZjI=;
 b=ajCG7v1IoTzLg2iY7m0QknCJbzqMK3yirHGGb5xtbgi7Fh++QCjgwnXTWG7HO2m+iz
 hXANy1eg6NP7KO7TuhgoifwzuNQiB3oAhl/PjfRbIr21mXwF39cpAbXtjYa+KDyZWzOy
 qyyOUDCaRnsUyEg/1trmxrYjtNI8mddnq147nHaiypCPR0uGLR09ba69xM50hYcX+QHV
 J0oTKCJspmIuElsFpdeSRgQ3YKqXrdOzonY5b76blpIR+7UuoLqt8YuJZiAjsG8BDzAv
 Gb84+7fa+tL3uBL2PdajeScgGiP+AGAly15i3r7PvYmhts/NIUlpamAAyFA3TngOhmYV
 dIhA==
X-Gm-Message-State: AOJu0Yw2f8+lVLLuHvljqVE4yLlEVEzO/rC0QbwA/YiCx1aSQp8lDaix
 Eczg/kID2WzWWMMJIVc8/Iqynmp/4kZP2ePAi3u4AKJqIYvzErHQFosyHy0vJg==
X-Gm-Gg: ASbGncsKfSRfb6N9Gm0MWr9/yIc50wMWT5KbrF02A6eOZmgM3b9zSI2GIQfRwhLp1kx
 UOsXqLD7EyljYRYhuJZGulyK5oF5DwHfViwxsTkWvZGFdixPXUD+QYYfR/AuWfSwFRmMFtLYsYh
 CVEKwzC7VzlH+9J565dwObC85PtP4Oex6Xim+b/dCbcJBEfNDxdNc0OBcT+pimhGKH5Y9JrsWrG
 OyzD8YJdUZA80zwKDy+EzdQ//5MF/6hTam5WgvKk36FHoF4RuhJuT3Nu2wY7f8enD0JuqOrvWp6
 X/L2ppze6gQYzFVNIUeiVaKFJEnv1PdbXvEDgKvrTyG0d8x6FzNObooiQGBLJpdeHz9Eg6udrDh
 WoxlBUIjFY0bwnASHT3/XSE/erSc2EQ2eabWv5abrDv0SndRWF01PM58DVSjhZeUvAeS2WnGC88
 Uv1e65AmYgwHpC++E+
X-Google-Smtp-Source: AGHT+IHFSpkICun1yfCA64r3cLeoeYlf3iqg4w5CM3tKMBDCa81mmZAP3lhLW9Xl/TjCc2qjNxcILA==
X-Received: by 2002:a05:6214:2626:b0:707:159e:d1c9 with SMTP id
 6a1803df08f44-7093637cd44mr150713106d6.51.1754352234835; 
 Mon, 04 Aug 2025 17:03:54 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca3621asm64065846d6.33.2025.08.04.17.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 17:03:54 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Mon,  4 Aug 2025 20:03:52 -0400
Message-ID: <20250805000352.4062434-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
References: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754352235; x=1754957035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHy3C0HN8eWuHUNxGtjU/bVz3iqKTKJPZUPInQVFZjI=;
 b=H15pqP/Aty0cr/3fhLhCH9pAYHGnH0v0zZMQ2ygCZ/gTPVYyvEYZkQtLTAFa8te+JQ
 XlApCuJer/oY/dCE5mBKiTBGfw4++Tb3lebMjBUMlBsPlhDJuUY57vRYkJx7ri4KMo+I
 my6FKvUKcSRkGDrut/DSXCumi76udfcuARYa7AaQmPh5BtAPjDcKZiKSJIrydN0Y1rTL
 hJFrsA2+XQEiAezO3w6THlgMuJPzjI1BHN9w0vmZV3Km2HsnXAE+3iqP7y/2C/xzZota
 IkPvHKZCAbXyjqqDVIjfRYCplhqhm9bOcObwDRDZMGvsFTwNnKdj3EU1yf6FaShryI0X
 lL3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H15pqP/A
Subject: [Buildroot] [PATCH 2/2] package/pico-sdk: Clone submodules for
 picotool
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

picotool needs mbedtls for --hash --sign and --offset.
Clone submodules in pico-sdk to provide the nessasaary files for
picotool to build and link mbedtls and other optional libraries.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 6d40417f3a..a7028cfa1d 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  979af5c5aa5a07990544bc65e24a2121c096abd72ad0e6a03e7c524302e0f26e  pico-sdk-2.1.1.tar.gz
+sha256  9f50e041d5f5afa7d7d0dd0d7dad46e524e9702c7d07ea3f445556c35afa226d  pico-sdk-refs_tags_2.1.1-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index cf487ac568..45db495623 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 2.1.1
-PICO_SDK_SITE = $(call github,raspberrypi,pico-sdk,$(PICO_SDK_VERSION))
+PICO_SDK_VERSION = refs/tags/2.1.1
+PICO_SDK_SITE = https://git@github.com/raspberrypi/pico-sdk.git
+PICO_SDK_SITE_METHOD = git
+PICO_SDK_GIT_SUBMODULES = YES
 PICO_SDK_LICENSE = BSD-3-Clause
 PICO_SDK_LICENSE_FILES = LICENSE.TXT
 PICO_SDK_INSTALL_STAGING = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
