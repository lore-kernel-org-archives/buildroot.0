Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A1EC3ABAA
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616B381147;
	Sun, 15 Sep 2024 21:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cK3-NwHN2kK1; Sun, 15 Sep 2024 21:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A25081191
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A25081191;
	Sun, 15 Sep 2024 21:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED2B1BF5F6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F295F81147
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uopCtnZwtaAA for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A63A8106A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A63A8106A
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A63A8106A
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:02:21 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82aab679b7bso114385239f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726434141; x=1727038941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BXI6c39DZKsb3jh9SbLvWuxztZfLznrYJjB4xc6Wgqc=;
 b=MMrSwRJkIlUtJjtWrNzTqWFPDPY06JwkuwEWkzwTQwbBQ1stpA/4Dv3ZsDJ+jrnDqk
 8//v40kNNJ+uJtABpDApdpPvxOdHfUkAP0slQRBovNYXoiL4wad8Wz8CLMWy+Tle6GUd
 qwS4dpYUNrnN8NXhZ9nWxciH3pSFSxdtzCXnyXHuL+7wI9sNCvSDrVsjt6S0G+2jrgRc
 o3eJvSBAMZggfqIcvHCTu8MsCi8THNmWuuI/ID/poZv5x8MU0sZ6/qWwFqZR22jNhD7L
 e2F1b1fam1U91iZJXH0fEPdQLZkae6b2YlgS0799pZ9mlRxsxIu1TzYikpDU9r7Jjmne
 bHyg==
X-Gm-Message-State: AOJu0Yz7BtAoV8lmdCzXaNlYokAiV2tMQgutBGOQNdC69B8AI97IR7yL
 D7cl5+zPr4YM4SYpFLM5GZe5tmF7chXvV+zzQv/A4vuKG1UP0MzbsxLwIg==
X-Google-Smtp-Source: AGHT+IEQVxKwH+/qKlK8WG5gJ4aAbyL81/E2PkooOCzbY3AAeKcXmXXGSBdpiow6XL/og2rv8GClZw==
X-Received: by 2002:a05:6602:3429:b0:82d:96a:84f4 with SMTP id
 ca18e2360f4ac-82d1f8a8e0fmr1293354539f.1.1726434140803; 
 Sun, 15 Sep 2024 14:02:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec1c327sm1116078173.45.2024.09.15.14.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 14:02:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:02:14 -0600
Message-Id: <20240915210214.1603251-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726434141; x=1727038941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BXI6c39DZKsb3jh9SbLvWuxztZfLznrYJjB4xc6Wgqc=;
 b=b2CiE0xAy92GbaOckwLB7jjaiPat+lDLe/EtRFCLw+7m/EykkTJ0Grquw/Eo7Z8X82
 tbEGjRF8M9u4zWO7pLi6APjetZhiMCE08I2RQF5fIlYcakcwXoY6y1HID8XhwrwGOCIc
 7djL5jCKi4IgcI/RlQoAUU8isq66ZQ/9RM8o1r+ABv8P0rNvzj3dweB5gnz6l6Qdyh6A
 GnOlCXQlCroSXMqRZfUw9mbxVkHTSRls1O5Xyy9ciLT1v1ZPgTGnH23ayoNWSqS/DKYw
 dw4rhFSrVB4DFhCqKZopyZ2mUnluP0hYVUn0YOUUVHkdyq17Za6g5u+wekM5xWwYH+7Q
 8VJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b2CiE0xA
Subject: [Buildroot] [PATCH 1/1] package/python-lark: bump to version 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Verified license remains MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lark/python-lark.hash | 6 +++---
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 9ea778c8da..35ee842a4a 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  124c36ea3b68783f06cea5fe6ee8a6f2  lark-1.1.8.tar.gz
-sha256  7ef424db57f59c1ffd6f0d4c2b705119927f566b68c0fe1942dddcc0e44391a5  lark-1.1.8.tar.gz
+md5  99760ed81904c56b2db2b7ab7723063e  lark-1.2.2.tar.gz
+sha256  ca807d0162cd16cef15a8feecb862d7319e7a09bdb13aef927968e45040fed80  lark-1.2.2.tar.gz
 # Locally computed sha256 checksums
-sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
+sha256  2eee60f52d4e11357bf89e72b034d050e285e47fda1361e5662fb322ee27d771  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index 9cb30abb65..1a85b49bd3 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.8
+PYTHON_LARK_VERSION = 1.2.2
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/12/1c/b466b58dacac15ffefce9bcb5128e18948a143849610a7d5300f31920be0
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/af/60/bc7622aefb2aee1c0b4ba23c1446d3e30225c8770b38d7aedbfb65ca9d5a
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
