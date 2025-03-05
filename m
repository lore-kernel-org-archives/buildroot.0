Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B60FC19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 09:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF53B40BD9;
	Wed,  5 Mar 2025 09:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dc4AP76StdNx; Wed,  5 Mar 2025 09:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD89C40BDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD89C40BDF;
	Wed,  5 Mar 2025 09:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD51AE2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 09:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D6A5606E0
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 09:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_80tDc_2toZ for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 09:13:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=boerge.struempfel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A8FC60674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A8FC60674
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A8FC60674
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 09:13:56 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abf675756b8so60109766b.0
 for <buildroot@buildroot.org>; Wed, 05 Mar 2025 01:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741166034; x=1741770834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgSDF7aTC83Y1EHfNwON1yvZsw8DBP3cAM0B7Z0i8yk=;
 b=mju26DE4WWf9eZ6PLyl6/zt8bpeRRsAu5f7YK9w1ZqD87dJRL49lBc9ClwnIhsRwyk
 N+jCD8NleolvSj5A86cjKZPnm86CplJrLhKjFDPrd/H5J1O40QVt1Iu+eZ1UY+zFDNqc
 uCAx1rrvd58XG8mXUz9VFFTg/AuVF7oPF+fTOHRLQqsZ1v32n4srgJ0BItuqOzJcBEe0
 AL0+D8HY4ZJYNEcW+odnI1bjTAL4VEdQk2H4ecUes7dxbYbbeZ1NouYjQy6bHS2qE3qO
 C9ftS4vIegZ/5My4aEvfQsjR2qHT8KuPkTxawFS6Qc1UhmBdfhx2X8A47VkM7mMyTwm1
 kV0g==
X-Gm-Message-State: AOJu0Yz5cI2xQBjpuTnNKo0EPkraivG+sCjcmNG/vJyaZ8yOP6YF68mt
 4ulskkwLBcvNr8MyeDF/jiIZ3qSK+RcTT5t5lrbG8kxgAwGnBxJWwuPyng==
X-Gm-Gg: ASbGnctc4uL5UjCut/ppimhuJPtzZKcomD4BOEWS125gxWX4JNmHstfci711YQI63Z6
 RV9ZhwhjLiAM3c7KfPoNjMev8pkOSltu2OXVXu0AGxRhAfosfTUJV+1OlpykMArDzvtIylQEoqA
 hjqivayZsIjGXzs2w2T8CX10OCxJocLQGKTm8KyQGHOcrOyPQu0bhJ6rETfyz1amTChFm2m4M2p
 cefWtMtXWYO/Ce35aeYGMw6U9T3eX0+B9jgbexKoPdjON2ybB+7zHLr/dazKU+GguxuPmdLkAWj
 sOOlGzHgYSJOA9TOsAiMN9vbAc922PsCS6eIN2RdsFmFrT3LsTc+PuKWYgn5LtcqWvXy44XSSl/
 D8zBVN+R1h9Thml7/phHz/Rz8hCdcv5LJdPx1+hQNj45/lpiZnrfN
X-Google-Smtp-Source: AGHT+IF8EsyK75HQPALHKoMEbu0CYhGCppJ0dYe2WwTILFZwcoJKTuFsx5MnsLZk7s3IPUc2B3rXkw==
X-Received: by 2002:a17:907:97c9:b0:ac0:b71e:44e1 with SMTP id
 a640c23a62f3a-ac20d98b993mr77239666b.6.1741166033579; 
 Wed, 05 Mar 2025 01:13:53 -0800 (PST)
Received: from wslxew228.fritz.box
 (p200300c787486300dbbbd69c121d5bfa.dip0.t-ipconnect.de.
 [2003:c7:8748:6300:dbbb:d69c:121d:5bfa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1d860c279sm408720666b.27.2025.03.05.01.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:13:52 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: buildroot@buildroot.org
Cc: Boerge Struempfel <bstruempfel@ultratronik.de>,
 Boerge Struempfel <boerge.struempfel@gmail.com>
Date: Wed,  5 Mar 2025 10:13:07 +0100
Message-ID: <20250305091307.815518-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741166034; x=1741770834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LgSDF7aTC83Y1EHfNwON1yvZsw8DBP3cAM0B7Z0i8yk=;
 b=Fqkn96+Fp7Q2ZdtVgtswsN9jtIga+3ddb/v1JacJYsuTpom4NSS9M7+9g6g7fhiOlf
 tmG03N0zLQscIt5stBVPxChhRyGm/njLaPL5PPmFqE6kua2WNcI3pzaREC4iT5wrW0h7
 jWIqDbO4YEQhiIiUaymUpioDsLYBDqqTL8lhQzK4UYOKiZMUQjRiVqKNJ0pQtKxacsR2
 snfkOpb/KyirDwdM8MYfv32VW9KwJfl4WrkpF3sMYJ5DL6nDomVl9lQNulgpfGFtgjvy
 Dg5MXWfxgXFbAUCfoxshxhdMixzR0SqH4CmgaU+c+uL5B1l73agnH3F/uM4FgGlKmW61
 GPYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fqkn96+F
Subject: [Buildroot] [PATCH 1/1] package/libgpiod2: bump to version 2.2.1
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

multiple bugfixes, see [0]

[0] https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.1

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index f51cc80b9f..2845a0ad94 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07  libgpiod-2.2.tar.xz
+sha256  0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608470903fffa2d4b18  libgpiod-2.2.1.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index e73f8d699f..9b47ab7c2a 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2
+LIBGPIOD2_VERSION = 2.2.1
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
