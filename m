Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E372DCF2592
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 01:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955168110B;
	Mon, 14 Oct 2024 01:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvZvmrjppXPF; Mon, 14 Oct 2024 01:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D368110E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D368110E;
	Mon, 14 Oct 2024 01:29:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC9D1BF39F
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 01:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D15D4050B
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 01:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNxcXVseCFEF for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 01:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 394774028E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394774028E
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 394774028E
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 01:29:07 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-71e483c83dbso2000817b3a.3
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728869345; x=1729474145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pNLz6u2l+jEuJKP0G2ZwBOJfXL5uNdWVAK8SjAe/gqg=;
 b=Mctp3UEX/wo9ow6CXN0xBynt0dPxdx/pM1BLfRdssuPcZAn3b82uE2hAiXDhfXjUSL
 jO9PiMMVGrR+szRghUaz2zC5jyK+PJgaZju82kCWDy6UEVBW+nthhA0ITTxKOgm24sbC
 CPCyvGcm59jyhvteht+Y4HZX+i11GyEPET6FCcwBNBYlxWhSdB2l+d8QPupn4Mwh0/OW
 tl9ewFbihGjvcIFOqIgLyZTV843bNGI2ZxpIZ7hPLdxJ4EzCcE6aM8W2/e0+Ed0hw1dN
 TFGnSJKp5IKiw6JF9hhR9Rmhr9R+jR8SoecdtoezlW0Z1Ybk+Am3IS12L+HZcXIHYaD2
 GGVg==
X-Gm-Message-State: AOJu0YxgH9b5p6c9a/v5IhpAQvnXLqKagOhf8gApHw7wc1H+NBCGTdPB
 J8o6A/eyUoprXdwtilSOLDfT20wu4eH5E+EdMVjHRE2ONL5MpDNSOfTDK9Wj
X-Google-Smtp-Source: AGHT+IFyjhhww+BR0czxAtRYLIV6ScDPZSwyZT2qPycgqdChZOUgpa3cIwkcjFc1FlNFB1vkUXdjhQ==
X-Received: by 2002:a05:6a00:10c5:b0:71e:4bfb:a1f9 with SMTP id
 d2e1a72fcca58-71e4bfba31bmr11753041b3a.22.1728869345566; 
 Sun, 13 Oct 2024 18:29:05 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e61d3d138sm1379122b3a.126.2024.10.13.18.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 18:29:05 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 09:28:55 +0800
Message-ID: <20241014012857.136756-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728869345; x=1729474145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pNLz6u2l+jEuJKP0G2ZwBOJfXL5uNdWVAK8SjAe/gqg=;
 b=bqJn11kXTGH5UL8F0pd9mU2XuBQVNGBkflzhD0mjHD4u06xo75RyHe1GORJIf4HoD6
 taEEOkNOywkzqjJBWxKN0s6W/NzdppCc57aYpCbjerhKlSUQ4lFMHLvzUG3lbNR8g6hl
 x3IFpfSM4SVu51TPVSeEcX+uU8EUxPj2yOJ4O6sytpNWYK7EDR0IDemCoqGicLMU7xB0
 qnR43x8F/0BEq110BCsHJ9sEzVdo2nqlJ0ezsZEe1G7QcQXsJ/ZkWAmtXhQNi36vTGWX
 1q6FTiLm3+nwKOi9RjKfBaGpxkRQFg2N89c9SP9k86tJSVYXbbnbIOoeTp9MtTyz9iDo
 hnKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bqJn11kX
Subject: [Buildroot] [PATCH] package/pppd: bump version to 2.5.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/pppd/pppd.hash | 2 +-
 package/pppd/pppd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index bf22650884..92f036df58 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  535efa0e7c36e9d443b1b52c296d63ab2c1ec9458816ea0e37c701e0a921466d  pppd-e1266c76d1ad39f98f11676e34f180f78c5a510c.tar.gz
+sha256  c0537067bdff5f0b5d7a2fd1cca13c220f6dadc89183f23739a2cf9df49c68ca  pppd-2.5.1.tar.gz
 sha256  5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008  LICENSE.BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index d996a39120..4b65cf08d1 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -6,8 +6,8 @@
 
 # The tarball provided at https://download.samba.org/pub/ppp/ does not
 # include the license files yet so we use the github tarball.
-PPPD_VERSION = e1266c76d1ad39f98f11676e34f180f78c5a510c
-PPPD_SITE = $(call github,ppp-project,ppp,$(PPPD_VERSION))
+PPPD_VERSION = 2.5.1
+PPPD_SITE = $(call github,ppp-project,ppp,ppp-$(PPPD_VERSION))
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = LICENSE.BSD LICENSE.GPL-2
 PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
