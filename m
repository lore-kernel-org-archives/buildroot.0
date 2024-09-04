Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E527CD4847
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 17:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C314C80D20;
	Wed,  4 Sep 2024 17:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRXjx9ITpBWU; Wed,  4 Sep 2024 17:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C176F80D26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C176F80D26;
	Wed,  4 Sep 2024 17:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8E211BF473
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91C3440267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlIvlyqHxf9n for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 17:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12CE4400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12CE4400D6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12CE4400D6
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 17:40:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42c79deb7c4so37279265e9.3
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725471638; x=1726076438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+Z2vTUDd2KO4Zc2OK/3LBxLYL9TG0gqF6UAbKyjqhM=;
 b=gHuffOecdgIfFo71UMrOwTqmpW7FZjKdkq3Q+XUMFQuAIO3FRCBURrecQTiHdwUYD7
 8cRUqeY9tXLV3T/UvEmVxnXKRGZL8sbr6ARPX8WoQJkoF/cA7z8ar9pg6G4LTFHWN+tO
 Re/o1GPRl16j45fE5NpDPefFyuDo25zdc116u0l588x9iO9vEWe4Ph5n4EkJmfT9IO7r
 9rg9Gs75/4inAXET3VM9V/mBodo2VUwdYbuowvXkz1Mp0CADBV9GeehN2eTWSAc2LRQ3
 rX+eYzqHYjF6ikNp/WbxGXJND+X1LpT2IrHP0VYos/TE1OAUTAZy4as37LVzv8vaF2WL
 t9yw==
X-Gm-Message-State: AOJu0YxpMWTZquHwVSi5j7p4T3J7ge6JjXtLPD2PfysY0CAgI7QrDmNP
 I0hT5qfOB0vwR5x7Wkhj9DPuOtzW8lEQ4+FWdkjGQpNKdNR5zFgHD5j3OYtarm/qOkRIHpag5Ev
 HPu4=
X-Google-Smtp-Source: AGHT+IGxNdR5R6GMsMpdyPyM497iosVVqq3/7UGww6mOPvz92nKl3zzd9uc/MHLl5hkzWnK7ZaaLYw==
X-Received: by 2002:a5d:6b91:0:b0:367:991d:8b76 with SMTP id
 ffacd0b85a97d-374bf04f7b7mr8839707f8f.15.1725471637528; 
 Wed, 04 Sep 2024 10:40:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cb134fd1sm8686169f8f.102.2024.09.04.10.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 10:40:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 19:40:21 +0200
Message-ID: <20240904174021.2670289-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725471638; x=1726076438;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V+Z2vTUDd2KO4Zc2OK/3LBxLYL9TG0gqF6UAbKyjqhM=;
 b=KNFetDAxDGAiHTHiX2W8siVHpraFPlia4uJnv+eN20uepI5uht0ly05F0saGYVz+v3
 LMoCM7LH4IhCQeRTaNRa446LfUQF00pLyNMZ5t8jWDq5hzjV7XLrJMbY+EECwjTYfaYR
 6OKxGGZGanCyslpRZFRNE0rAQK/H+1HoIUFg0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KNFetDAx
Subject: [Buildroot] [PATCH v2 1/1] package/ipmitool: download
 enterprise-numbers versioned
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
Cc: Floris Bos <bos@je-eigen-domein.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous default URL used for the PEN registry was not stable and
could change at any time, making it unacceptable to have to update its
hash every time. Following the suggestions provided by Thomas Petazzoni,
the file is now downloaded from a GitHub repository, which means it is
versioned.

Fixes:
- http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f

Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
  - use an enterprise-numbers file revisioned

 package/ipmitool/Config.in     | 2 +-
 package/ipmitool/ipmitool.hash | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 9516ff8596d3..783bd263756e 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -11,7 +11,7 @@ if BR2_PACKAGE_IPMITOOL
 
 config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
 	string "IANA PEN registry URL or path"
-	default "https://www.iana.org/assignments/enterprise-numbers.txt"
+	default "https://github.com/larseggert/iana-assignments/raw/6eaf55c1c24941db2546da242029ceeaba3f9dfc/enterprise-numbers/enterprise-numbers"
 	help
 	  Enter an URL or a file path to the PEN registry to use.
 
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index c3b298e3ba5d..f2e91ef9000d 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
+sha256  45eca3cadadd8a82736d83b130106da22cd49a34d287c9c4c7f10dffb4579f4f  enterprise-numbers
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
