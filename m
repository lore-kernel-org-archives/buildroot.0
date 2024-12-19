Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939EBE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F85F40523;
	Thu, 19 Dec 2024 02:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Vd1vqm_VOae; Thu, 19 Dec 2024 02:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132064052F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 132064052F;
	Thu, 19 Dec 2024 02:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F235E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1303A81B70
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L28Km6GedHD7 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:11:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 109BF81E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109BF81E1A
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 109BF81E1A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:10:59 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844dfe4b136so10678039f.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734574259; x=1735179059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W2W/AerkudnoaXFlGjg3ztHvd2yIpxUEDQMp9T0Q618=;
 b=HnoLm8rn3IYi9BYZzVeoJC9mzOqTn52h3oxMZ0XL7HV1KhyZCCAJTQRUNSu3ebqfh2
 fw0TOaUOVE2QAPZsAbSRHCpTK/BMK3z+ZQw1MtW/BqlvM94z1aY6NfBNUz8fScWhE1t5
 Y6PG6ECpgYZaX6GXudLa8ES8PJOBM3BQ4prS7KgdgcJeuzBDxiSUY1281STUvDtjhJ7T
 ZNzBBDUt2oF7ICp99qH2dC/dfjWyODEbUgunXpLjwmcfMKgT/t5oUOLu9mdoi79DzwuG
 jR4C0BE/9P0dqDN7c2nRaIsW77bPr2ikH6ifurXi/V9+LouvIb6IBPv8N5zAJ7M503RN
 iNQw==
X-Gm-Message-State: AOJu0YwMEPqna4YuRWEo5F6r55pKzSRxBGGipaPnrykfG3gj0nxRCTZ5
 FOiNWsNAZw8n87FI2lshYe/Ip2T7mWs4N/3zHaoRAreZxlbjRU+/Z0ipdQ2lIWs=
X-Gm-Gg: ASbGncvhRmmMqkDvXGMrQsI3vYJ8YUSaOpEakbGmExzAPpg4dKPpkdJUNQlNnytWePW
 1yaldjrlGwKjDyoDSEUPJwSH1vgmJoi3gD8NcIswcz16zVC1sqCODC/tBmLBQE9Iw1QLP5MtpaY
 HqTemxzEoC+CUeBuN781jbU43/4pb6vmz+MnxeUwN8usuvukNRBC2Sx3x/pVPO3Ibhv6qSr8Ste
 HzTL56PjexrQ5tZe25M+BNt88bIVABTV+HFIJhyojHEvux7mNz0QKRxbSzzoWWI1sm+8g5exyW3
 IoXjK5U66NnfOTx/QtY7J4g7uOsR0qCRLQ==
X-Google-Smtp-Source: AGHT+IGE1GVGpU43o8IZjjhWxsMcXBBSE00S9k6VaNARfRWQugEVrvfhLMllgcrrc7yYkFeriz6zWQ==
X-Received: by 2002:a92:ca4a:0:b0:3a7:98c4:86a9 with SMTP id
 e9e14a558f8ab-3bdc4f178c1mr54885465ab.20.1734574258710; 
 Wed, 18 Dec 2024 18:10:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1de70dsm47473173.130.2024.12.18.18.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:10:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:10:56 -0700
Message-Id: <20241219021056.273976-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734574259; x=1735179059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W2W/AerkudnoaXFlGjg3ztHvd2yIpxUEDQMp9T0Q618=;
 b=fsTwX3lCtmIuN2dK1mCAoLXp5L9M3VvtBDBczxe5DMqQunf7HhsTdkdhzESgWTOhnL
 kH99/amQ6rAiYxosJ1BW53N6gYr1Uje2/LXnHUpB2JyaK2Vl8cNyrKOZfuZSir2/DDmC
 7p4fXjyOuBiJjytz7CKU7DKlX9AG8pjNChV0eYvRT+c31a50SGYnxyYUo5QrY/lqLLki
 vNAv6MDLXCWzv/zV5PKOS0AUQRNV1+I0mfmmLMkZYeBz0QLTXI3xUoAnEsb0hCFA23F5
 9pjDJONdN4Yo/IurNbrP1BuVFj8WyEPvBCdTWazDJYErLZ8V+ZnYFq1mgx429htyaQgK
 SaHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fsTwX3lC
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: bump to version
 0.0.20
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index d68be9e0e3..594c7cd497 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  7051f07d9645d3f2e72c0a889329057b  python_multipart-0.0.17.tar.gz
-sha256  41330d831cae6e2f22902704ead2826ea038d0419530eadff3ea80175aec5538  python_multipart-0.0.17.tar.gz
+md5  fa3ee0a8ee83e24b66ab40a841922244  python_multipart-0.0.20.tar.gz
+sha256  8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13  python_multipart-0.0.20.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 1f8d581d68..8c49e2df9c 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.17
+PYTHON_MULTIPART_VERSION = 0.0.20
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/40/22/edea41c2d4a22e666c0c7db7acdcbf7bc8c1c1f7d3b3ca246ec982fec612
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
