Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A9CAC580
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7404418E0;
	Thu,  4 Sep 2025 08:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuElkTOX4ZMO; Thu,  4 Sep 2025 08:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF6DF417C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6DF417C3;
	Thu,  4 Sep 2025 08:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCD09930
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 08:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEB7B84C34
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 08:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FacTZ3c6T4l for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 08:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8D16847B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D16847B2
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8D16847B2
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 08:22:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b87bc67a4so5296265e9.3
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 01:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756974134; x=1757578934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ia9AxkTIDwKz0gMyMvjPytywvTuTbGb9QVWChSTTUFM=;
 b=uuNMAup/pVwXByGxJkLNrMEt5TESb6hZ1kugGMWdulj+xBKANcNhAf5Z2SoIWt8xwE
 IJh700EsG4Wpo9HmVSsHbue+x6u1oq1jT+L9tyQ3vqj+WQ9gmUHrkpvQ+raZzyHn/jgW
 IeOlFy9tmA8hv+q5WUxYVRz5TA18GsD8qN4Q0L+1yJ37Q7uTOErwnoR5SyKJ8yv/5bzN
 5en6OnUucSOYbVuZjiEN57YmL4D82JBFDfL1duD9fHjM4W3HXx1UYad3ZrC+iljwSFB1
 Cc52/YzHQ3qAbUd6sjp2jHeAz5Q7ghRFaCDGV7HyX+h3/UwSOj5U+O0Eqpx3SbUlKqR3
 ukqQ==
X-Gm-Message-State: AOJu0YzpQDbhnq9IQ1lXH4XSadmuSmDHv/KC7DI9gxMzedZCzaQvMNJZ
 5OyyM/j74jWRMxyiHXEEv1cGGO0D0Z+Dh1CKQAQofWxy6Rnm49nLhlIAmDsGe0+zGu7IpGp/klB
 MO4LD
X-Gm-Gg: ASbGncsM0SBWvcFZbnsT4gOipASmvi7D2xJSK0w3RGkm7kf1v9sbcPfmjNnfqiI15XG
 vPZwb1uAB4dRBlvrokNMfvW1asQaaDnsCI7lgqbfi0mZZp9ywGmS+A6kricp3BMUtWeROz3OAr3
 rFTpsYddN/ALXV85eHjpCjyqukZDNgpr7NSez+FMHsN+c8NmcoRPEfEusQOnEhzYjmrNMaQA8Jg
 2Lc2jP396AW3HX45mqWUVEs/xNHtU82lxhjksyOtiYr/IHLQOUh++5Z4aakiFUMKd3u6q4TkxqI
 8yX885JMkGbLGsClek2Ur5L+OQAqNmzy9wz0WdAZtr61caLSbLUyftcM90hAqaXK3ik+qmXMX0J
 eoT0zgj5zmT0/V3CMjkAxxnrGQpCDRVDdVavSDIWVG0W+80i1BDsm8e3UDnwpOvsQicu3mF1aYN
 ku3T3a43aDuP6h7tjt18iEg6AhDBNi38wdzvtgTJSvdR0=
X-Google-Smtp-Source: AGHT+IGz7iksE/MZeclBSXuLYZy/f5MaFJSt44ZQChknpdNsttxskqyNOD7G5ItQb70eDKxRHKxL3w==
X-Received: by 2002:a05:600c:304a:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-45c44702848mr36545865e9.18.1756974134465; 
 Thu, 04 Sep 2025 01:22:14 -0700 (PDT)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d520eada16sm17920415f8f.41.2025.09.04.01.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:22:14 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  4 Sep 2025 10:22:05 +0200
Message-ID: <20250904082207.61497-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756974134; x=1757578934;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ia9AxkTIDwKz0gMyMvjPytywvTuTbGb9QVWChSTTUFM=;
 b=QQ/CX7cLMBzZ0SArkF4qg9iERR9gW7QuPj1C1qo3ViR/pCKT9l3Lnzd5Thmaz43Md2
 R0KqdYdnhb8Mm5eCne1b3CH8bli/7zy1c8rZdlQc7rCFLYDjfuU/jlDKyM6GohXPJthJ
 yZN9KzgYXQ92xmMU7t+WbkbONpdidPcNeKck8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QQ/CX7cL
Subject: [Buildroot] [PATCH v2 1/2] package/cutekeyboard: bump version to
 1.4.0
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 (No changes since v1)

 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 53b438cc1f..e4093dc4ef 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0f0af01ec99ad07607d2e58c2feee1fba37c9cb7118e8af309fa021f599aec86  cutekeyboard-v1.3.0.tar.gz
+sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-v1.4.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe9..e97eb9db2c 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = v1.3.0
+CUTEKEYBOARD_VERSION = v1.4.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
