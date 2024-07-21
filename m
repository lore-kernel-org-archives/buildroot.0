Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8837CC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F41E600CB;
	Sun, 21 Jul 2024 21:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8o2b2iyOpGr; Sun, 21 Jul 2024 21:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F740605D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F740605D0;
	Sun, 21 Jul 2024 21:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6F01BF2FC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 21:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E8E40319
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 21:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49HnwbAljS6N for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 21:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2B2B40314
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B2B40314
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2B2B40314
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 21:26:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-368440b073bso1573261f8f.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 14:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721597213; x=1722202013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DTSHXS5jLrZwxaktG1dCmCwyjUcV+L2astcgEcLw/1c=;
 b=aZw5BwuL3pY6PJwvibdZXLtU3pwiv+FyWZApHstkGfzUSNHT+XHL/pCt07KBeIX2KE
 NLxFDoJYvbHxaaL9XKaGfLsHHqVU/MC5HwwCGLA7VZFG1Nj3b+jrkVYK9aYEwexR1rBE
 TqqS3Rn4/bKmfnjCQSwN8zuhUyGoI28LxOZ0wZNjSc4yz7g2gffuTiio+qniDsDql+Gs
 6jpTxuIrk+5VLG5ZUZT1Tli2MEhVdQhP8KtH6otFSd+KQIf8GTdbsSffI4MxhAm9MDlM
 sDZqckPGjcahZVRh9SZSa/p43nak5zjjjdMkCkdKL7rG9lUF/eFR96rskHFhT+0hQB11
 sH1g==
X-Gm-Message-State: AOJu0Yyk+NyFsyJyO3RD0Jr07o/VFEi2haoAG6Atb4YeNACr5fzUVVxa
 dvapUJ8gA+5DLMulNT3td6PgeYftv9K+7j+yIY+xWXitNceXqWzDHgzxPw==
X-Google-Smtp-Source: AGHT+IGHHiHgVJ38sp84e4TszYlhA3qbiQl8SvZJIqbqAQXoE517ATgvjKaL+KzD5m+jAIFhGeSW9Q==
X-Received: by 2002:adf:e5cc:0:b0:367:89ae:c204 with SMTP id
 ffacd0b85a97d-36873eccaf1mr4853353f8f.12.1721597213038; 
 Sun, 21 Jul 2024 14:26:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d8f1cf7esm91929965e9.39.2024.07.21.14.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 14:26:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 23:26:50 +0200
Message-ID: <20240721212650.3542775-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721597213; x=1722202013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DTSHXS5jLrZwxaktG1dCmCwyjUcV+L2astcgEcLw/1c=;
 b=JHiGTH6Tg+cB9k9RzRB/Hfdiy20nMoziVU4XYRQY26EUhkK9BN7NitM9p2qfago8SX
 BrvXzURGSih0yk34ncqTTAWa1Tef+ALU+TXiopMbpOUUrDyZUdECA1IagayCv8wJbURg
 ZjZanMLNZNNiIU2+3MwbI9rOlcgF/sKqsNpAlML14fPieyb0uNkn0OUj1eMoogxq25wq
 VgeiXU4U7WRfWqutxWuzXlwqjTa/PK9JuKTedzMYZCyYuYjFCQQTfpuyAfjZ/iioLcUJ
 y3m/JOLUKt1MzgJ72Te9jUpIufSw4TKj6PPGf2zRWPbDbjs/wkPqEwfEFovgNkgrtmcJ
 hx4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JHiGTH6T
Subject: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version 2.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/storaged-project/libbytesize/blob/2.10/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbytesize/libbytesize.hash | 2 +-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index 7dd572842d..a52a2803e5 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8bae8287af6ef5624c320f70defdcd84ddc0c2057d3b59a5871897f27697811e  libbytesize-2.7.tar.gz
+sha256  1d1ce3be8ac59fd59511d0794c7327d5cf33f1e83496837b17e19ac49400cad1  libbytesize-2.10.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index a95ee08357..7f56cbcb79 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.7
+LIBBYTESIZE_VERSION = 2.10
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
