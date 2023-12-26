Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB761C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 11:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EAE64086F;
	Tue, 26 Dec 2023 11:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EAE64086F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVJLVM-gPGHh; Tue, 26 Dec 2023 11:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C957D40858;
	Tue, 26 Dec 2023 11:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C957D40858
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D652F1BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF98060B94
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF98060B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeTTA4ORsfjV for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 11:21:10 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5841460B89
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 11:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5841460B89
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d352c826eso58786575e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 03:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703589667; x=1704194467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ih0cQmmUfE9EuCZMmR+vJdJYcfDvPjR6nVsVPHgCtU=;
 b=TJyNJLVT8uKofXlkNfJ10ktDXbNNXAetfLDQSqyRa5t359ucleEVZ5vRz8sezJUTpp
 1Zg1IozJzQSE18YlVnXwR5pJA22CHP8sz8NFG3V6qaS0mNGb2IhzmtqpvFD20WDq3h2y
 EnGxtjea1DBAxTAz+d+Oul+ZI0KaAjqago1v1uAK5UjuWkdN4UY4+Ayn4RoxuuirO8kZ
 2/SrEvT3d8d+TRjGwZB9W2m5lPjhVuk3Zq+qnTdF3EDOc9XBKrgd5oUBrsVSKqHil/OT
 V1TV/RaW2Tf+Y/Z3yiDwcSXKbBPtMpftDfTbMiEAj3KeyZO65SvjWYuzOoq7vAyCz6kL
 hjfA==
X-Gm-Message-State: AOJu0Yyb5YD9PYU3IoJiXhuOo8ZS8KL3SAXTa5H3Y8eVxmG1rRTF6VP+
 haiLDBLN21U70B72ZaLBVZAcjRVCtjI=
X-Google-Smtp-Source: AGHT+IHJVyEk6b6+3rS0J/3vfAK2fAF46N1iL/wCTA4WCIxg98ux2skRRE8oJHK5WPUpnuphTvJQAg==
X-Received: by 2002:a05:600c:3b8d:b0:40c:3ea6:9d84 with SMTP id
 n13-20020a05600c3b8d00b0040c3ea69d84mr4094975wms.139.1703589667091; 
 Tue, 26 Dec 2023 03:21:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d5503000000b00336b8461a5esm6480489wrv.88.2023.12.26.03.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 03:21:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 12:21:05 +0100
Message-ID: <20231226112105.8872-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703589667; x=1704194467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ih0cQmmUfE9EuCZMmR+vJdJYcfDvPjR6nVsVPHgCtU=;
 b=aBzF+5Ob7uCqWt52TItmdOZ/sM8GJ0k5okl2h3jZA+JdAgxy1h5k3kP03Ccv5VwXBX
 8KTMslBRxvLM0FGofaHAtai+ob63OYIFtvhfKfNBj/LBOJyI6cdj1rM+j0UNuHTx7aN7
 1idc3EeZFT5YDp9XZEzOSnDXSe6wI6vgMZgzUmA2rTTVf/DwqCCZGMSt1PhePWiS1Qeg
 83yAKU6BTUVxkcaQD7VjZyl1cwPw8gTQs8Fjs3Y85eAq/7ojjfSeCwoS6Z9VQ2H+1BRc
 RsExHJuQ18GlsaouUKFBlj/ZTkVLtYEWQKmxDh7fB2eeRjA8xwdOYnYkmUo7HqTpTtK5
 hJsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aBzF+5Ob
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:encode:starlette is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/B4613D5C-E46D-443A-8738-58E4FBC0C127

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-starlette/python-starlette.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 40932929a0..b04b95a797 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -11,5 +11,7 @@ PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
 PYTHON_STARLETTE_DEPENDENCIES = host-python-hatchling
+PYTHON_STARLETTE_CPE_ID_VENDOR = encode
+PYTHON_STARLETTE_CPE_ID_PRODUCT = starlette
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
