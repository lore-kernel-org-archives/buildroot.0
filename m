Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28246C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E756058C;
	Mon,  1 Jul 2024 20:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRhWuEtM1-9G; Mon,  1 Jul 2024 20:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B726059B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9B726059B;
	Mon,  1 Jul 2024 20:07:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97B361BF32A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 841D641365
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wxe6GovT3fFY for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50B8B40156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50B8B40156
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50B8B40156
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:07:08 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7f61f41eef0so152829639f.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 13:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719864427; x=1720469227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8w9TUUVanUrdbJ9R5kpsMpbRRHJBTF/I6v3Pgn+/C3k=;
 b=LhwSfB3OMwqb9v/dMqKrxo0FH3X23LIGxyRHmFLsE2lcOf3XzzYi2TL/hR1E1MjCgD
 BHYXocEOC0rv3CF95/m33a7jtRQRyMTs8eZezkUZYGkG2AilPgkxp+Wkv0T0lx8DLVD4
 6asqwv85MMI9/a8HAT1/pKmY90Uw38l3R/0bnNQ2cjAqf35gmwlFfSL+tLLvawTKWrDx
 UzijRUocgZ+P0V4j6Ul/YASqvKTBECb5qxPb3JQtlY44GbuvyXTixjIvb0WcbJ+5TMgN
 t8XbZ9UeUv/9VRHdoQJJWDRIv3aCK3HSEbgSGQXPdPnXLg3caxSrEMpjnM9ZlgTlw5RM
 /JjQ==
X-Gm-Message-State: AOJu0Yy3XE5OvLgVyfCXPG7cybtwi/kZBTrEh4aJDo5pI3jH28jtjg2j
 ESVqNJmpIN56PFu5RXf9c4fewt2qy66CrzIWH8Pli80JsitZKNSlCljoTg==
X-Google-Smtp-Source: AGHT+IES/QI+8LIzz+8LILy5BLPLgWv8NEpLa7vnO5xYr3Fmaok5n3CQlWilocUHmQrQcYxAj1wDtA==
X-Received: by 2002:a5e:de4a:0:b0:7eb:6f43:a5d2 with SMTP id
 ca18e2360f4ac-7f62ee3cd84mr791683839f.6.1719864426992; 
 Mon, 01 Jul 2024 13:07:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb742bd08csm2430856173.148.2024.07.01.13.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:07:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 14:07:05 -0600
Message-Id: <20240701200705.1801155-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719864427; x=1720469227; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8w9TUUVanUrdbJ9R5kpsMpbRRHJBTF/I6v3Pgn+/C3k=;
 b=fl/4QzYFyBz8GRZLVRdWHjUw3nHTJIa29VPKdeFT6eF1r6fyMBGEbLsOMQeogT9alR
 otZEWexXgNkbGviwy/aay/t63mlKoXSxVONef/kgzu49AuVmnAk70JDXz+DZVnNmOmof
 +9c5QYH4pBFmPuD2hDPt9O87b9TyOULkfsE5lSndERUir/KbPF6fpyXDvDGKjWgBh/6l
 YmgxZ1iCubxPBvtCPApeBgNemN5RF+cc45wGzTYrn7ecRN8gskl7Tv96iGKsw8qXYNCY
 CHlNZRNlBFAdJgl51lEsaZtLinqlr3R3rHlXgO/fMsP7M4K0Z+z8TlPi6w5IgBtefOqb
 NFow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fl/4QzYF
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 12.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to formatting changes:
https://github.com/python-websockets/websockets/commit/9c1430379bcb42120e45ee0e9f9dca142b1d7560

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 6 +++---
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 62c7cb8467..8d0bda501c 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  d6b1a2cb5e194ae43f849c125b71c8db  websockets-10.4.tar.gz
-sha256  eef610b23933c54d5d921c92578ae5f89813438fded840c2e9809d378dc765d3  websockets-10.4.tar.gz
+md5  49d033c8236aa56ba2524f65570a27c5  websockets-12.0.tar.gz
+sha256  81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0537f393dd38c8b1b  websockets-12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  daeca11bf3608da35e546ea0c32be18958a8be1441fa3de9cbd20e4c8bc718e6  LICENSE
+sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 7f721220a5..2b8761c029 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 10.4
+PYTHON_WEBSOCKETS_VERSION = 12.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/85/dc/549a807a53c13fd4a8dac286f117a7a71260defea9ec0c05d6027f2ae273
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/2e/62/7a7874b7285413c954a4cca3c11fd851f11b2fe5b4ae2d9bee4f6d9bdb10
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
