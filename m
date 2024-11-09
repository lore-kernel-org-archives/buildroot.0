Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B96FD5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E9781244;
	Sat,  9 Nov 2024 17:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtB9D5Z7fJxU; Sat,  9 Nov 2024 17:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A6DC81204
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A6DC81204;
	Sat,  9 Nov 2024 17:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E638C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FC3E42C27
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdWiPb1DJRcI for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBCF042BB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBCF042BB5
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBCF042BB5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:25:19 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a6be369d23so11544925ab.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 09:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731173119; x=1731777919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLeRsQkhhWWAu702fxnhjj8m3qjbrEeIJuUyuTVwQxY=;
 b=Q3x+ZNq4JeS0306Br2uP5Wv1FncsHMTjKW9ao5RZneb1wfbt7JbueHmytNRcdIrl+g
 0TG+ido0cQxG7RPrpBAMa+/rN6FjWLkT/kj99dKk3X4658Gmoox6I6tY0o20jcguPFFm
 lNwE1q4x/6hvzp47fDXNBEhd+dNSSUwJpWVlBd8b5PI0D50MxssuW6rmaTBDHR9XXqVt
 QJfT/rwXbcdjrwVodsvB7nDETjR6Auiu+SMViO2ZLrMiEREx20/wqJNT3EEAXG1w8lLo
 qu3tDNo56uTed03Q0fM6oVZIezuvZhN/Y0vmY6wMcWDZZm4zJYLgW48c0vv0mW60JK2/
 IMGw==
X-Gm-Message-State: AOJu0YxIrkAbPHt6fQU4q2pWN2XTQ5nslY+YXlN/Mw+VV1vpP91DBdD/
 8boQfR23NHJRULnx2LG/FOTTUPmjCBXeC4fegDgZCfjfjjOQzBV4AKbaTg==
X-Google-Smtp-Source: AGHT+IELVNzzwpC6A21BoWLitWzJ2Vx2Q+juVbnY6SY9OLTSMF68KMrIrgM+vW1N9RuB4ns3w9SlXg==
X-Received: by 2002:a05:6e02:1d19:b0:3a6:ac4e:2659 with SMTP id
 e9e14a558f8ab-3a6f19c2ac8mr75056775ab.6.1731173118716; 
 Sat, 09 Nov 2024 09:25:18 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7883a67esm411387173.149.2024.11.09.09.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:25:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 10:25:15 -0700
Message-Id: <20241109172515.598471-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731173119; x=1731777919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lLeRsQkhhWWAu702fxnhjj8m3qjbrEeIJuUyuTVwQxY=;
 b=SELgPQ9eqEqnAaHrplKQ4YnDXvzVKO6jZNJVieHNSbWNdKZPQWuHgK6utslkDVWCfX
 y2kd3Mf4CGxNGSmKm1LGjATNCz0Da7rBwTPZLFkYokeCrzmCpkNU+L6KjBDCjpY4b2Q/
 cYorc41OMUai1LsW+ZeAUpkrcbqrc/7gnDuperRHCTvmkZ7UHyCbYxkw+0GnSeZ8/4ND
 MGXsjfNAEIOc8W79lciZQTXvIsMOkTIoJE/PTz/0bSQdslGmlYUhAASdPnH0uwyjk+6s
 gPaAgNVBiuo0Q9D1VPkCy/VXE7vyBOzZh0AXu5R610rBAIordp/oE1jB/QTMnWdQ16n7
 nENA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SELgPQ9e
Subject: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version 4.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index ee9a063fe8..8b2fdb0f47 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  52f6ca66eb192890b703e99699d9f8e7  falcon-4.0.1.tar.gz
-sha256  fc0d2dd661dea0a61e149d81960a9cbd5b7bd0857749c8aa41fbd69c3a054755  falcon-4.0.1.tar.gz
+md5  779e94857aed44e78536a9d36268e76c  falcon-4.0.2.tar.gz
+sha256  58f4b9c9da4c9b1e2c9f396ad7ef897701b3c7c7c87227f0bd1aee40c7fbc525  falcon-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index e4f16ed631..f5ab76655f 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.0.1
+PYTHON_FALCON_VERSION = 4.0.2
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/29/11/66692243aff20eec2269cbc553af1d30c029a6caebd3bd8bf301ba8b2aad
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/37/4f/d317952294dee1982cd930c8ee2b8b7fbf04140473882801061b3346c713
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
