Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9CCD10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88B6F401E2;
	Sat, 26 Oct 2024 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69rgB3TdmJSY; Sat, 26 Oct 2024 20:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A19401F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61A19401F9;
	Sat, 26 Oct 2024 20:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17B3B5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061AA809EB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irSWFMWBmUlg for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02B4B808A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B4B808A0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02B4B808A0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:41:39 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a4e551efdbso6123495ab.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729975298; x=1730580098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z2Z3F62rrCuNvo+VaQmwvrNb3MJ6fAVgrOFw5l2Js9E=;
 b=vBleBdzGtxvM5tQ1yNexyEBuprZecFNVrxL4IKP5GPUBi47EEe2WLeIDoDHuwvHiLZ
 4LyPERG8uq8i8SiDn8GYR/YNnCCW9HBQPKBR0M4zKVkrM3iCDzNB3X3G7VG636E+vI9o
 OYEvo9dOvuINZfca0Q1YSxaDbc1t4FMl7oswSmTyeoYZNHDmrZ4RI51I8meP0yw1VNUn
 AMleNnSQwAAq27swRCXv1dalgg2gU5/AM4OGQPjXJEsOydtfMdZfcps3UbW3AtArOwxV
 jpIQ415/xDtmMjBEFw7kNL0T7100Xds6i57hKPyXBMmGWoDN6k3Vl/8AvZeJXYdOVCSa
 hnjg==
X-Gm-Message-State: AOJu0Yyf2JONu0jAmYy4I8tWlAkU98w3cKRUYZoE3P0xf+o2gaY+UJwH
 EHvRc4XEiqy9+3+WLFybjsRiCtG82aBbO1mu/ATM3fUtGnT5DHzfG9vo2g==
X-Google-Smtp-Source: AGHT+IEzyHf0G6R9Rrax2H7tn1B6xbIjymJTj9Ubad2pTLvp9j/OBrzqP/6nRBnY0kqcMrw1upgt+Q==
X-Received: by 2002:a05:6e02:16cc:b0:3a4:e771:8874 with SMTP id
 e9e14a558f8ab-3a4ed2b6332mr33473675ab.13.1729975298430; 
 Sat, 26 Oct 2024 13:41:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725eb4cesm872447173.6.2024.10.26.13.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:41:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:41:36 -0600
Message-Id: <20241026204136.3620109-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729975298; x=1730580098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z2Z3F62rrCuNvo+VaQmwvrNb3MJ6fAVgrOFw5l2Js9E=;
 b=X31yte+F0gKf0QjwRtgAGjbX1YPHMbaqTgg6pjZ3zuLh5z9A9mqgFG9i35ipPbcLi1
 8sde6OkHrkvI7AottGwa8U8Rt5EHenr6gr9uol1zLY13yciRx2peWlOlsEhp5oLspXmT
 IjoTI0PV5vXEh1c0IF77eBiOrv8x8XK2hMLCV7KNdKYiYWHCrDVvyI5WgiN8yxdZVTd1
 zTZCaZ8B+m8gXxvZVV2t2ehAfEDyEPZ+kTMQYbUb1ExoDASq+R+mvMDiQfkMBatXZUS/
 4JupEFjp9RCsDT1sxzlL+O9DwY7ZqJMXm6T+hC8q9UwrO7h2liw2U37XvDFpktE1ckad
 8ifA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X31yte+F
Subject: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.17.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index fae8e189ec..38ac016f0d 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  a90c49d375a014cff1b1fc0f4fdba833  magic-wormhole-0.16.0.tar.gz
-sha256  14e6c146898dbda7a6d190262623a69419955363e7e434d64aad2d233d6d94c9  magic-wormhole-0.16.0.tar.gz
+md5  61143e1480353de7b502d1b904837fb0  magic_wormhole-0.17.0.tar.gz
+sha256  142c7a271684b0b04470792601848f6b0ade0d8bf54fbcb30c6259d75edd9d06  magic_wormhole-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 1c55a7000a..37fddf6c21 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.16.0
-PYTHON_MAGIC_WORMHOLE_SOURCE = magic-wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/1a/55/b82ace1c0c090bc6f629a93f3fb1ed60436731b166de2454d1585532c86f
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.17.0
+PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/1b/a8/32a54e75643206665f569dac6ab19727aefb508b148882f1d05dff003667
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
