Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E49BCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D5A961397;
	Wed,  1 Oct 2025 16:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyyQRcpH4rcY; Wed,  1 Oct 2025 16:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBF5613A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBF5613A3;
	Wed,  1 Oct 2025 16:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB04B93C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B05218322E
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01BX3--VUviL for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C5AA82A29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5AA82A29
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C5AA82A29
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:55:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so59545e9.3
 for <buildroot@buildroot.org>; Wed, 01 Oct 2025 09:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759337714; x=1759942514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zP4W0P4rkVDLff9CR/jfKpR44ZToorCRiGSGlW9a+k4=;
 b=QlKLtYwvaiYsvlPMobeNpf8S3lZpQ28rxtX+dRpSQDIS/qUMLNzVA2Gj++K9IitWNs
 W53vD/HYeyfby53MAjOjfH8RtLTdTrMZ1wbt6g23tlRTFi5R8UExkbKSkaH/q8LOnU8G
 j5iL7xslykt4p8/Li2WsnK0ihj7uhBqbiaP+xUjpnZuqwUpg3HDGURnW6W84Fx+n8PVM
 62Q3CEPpzQ77VxBmWKBLmODObx4hGGixSNUB1Na5sRiEqWG2F5IG5vfbDdvSRRSwZHOl
 j4Il0wiRttlj53+175ar7a6x5Po5ajeZ1Udjp/zjkVF82tii6CAxvVIHkM1OYz3TX5vO
 2QnQ==
X-Gm-Message-State: AOJu0Yw947kz6GoiUi8aO66XbD7Iq/EDZ1vch2DLcqErxf8IZDZKTgnP
 4MFe50d6Y2IqErVFEFw5c5GGDbEXG3uyIFsfF8MnQH9bcnmaet1NuGbTuC+yPueztug2UtPBGfY
 Q92XI/yo=
X-Gm-Gg: ASbGnctduw61cAf1AvCvjjdwEsPD6/LUWchcKmKBz+WUkDuNV/JZRjmtyRGa8eB8Pqp
 s+8gdrtzx8gJgGWB5fihyR5VZauVQFb0V0j5rlKzXunTrsQqfFFWxpBVe3jM3gc8lzaKP6FHkiL
 zL/Ut+NHvsvrGa8xJwgQv5btk3DfVgxJeg8cLYisWAzUJDnrmWfzmrsyUZ5W+wTSe/P9u2H2//d
 0WHoLdUhTCtOdHJj+wGbrPEqg9ce/oslZW6s9zioCVoRDqIpAhkCY6WrBQ7faE25TXaCwq4BTQg
 jN0EeJOHBqWPTrOIA0p5fNC+2vRH/diSYMM3Gehg2CC+AYeZBVeP9qq/Dx+hvM85+KxnPA8JdRp
 Z/Lp2fZzWNVn7x45zlf2mXNFni7dVd7VwJIayGzF7/fsnMfsKJrJi0WxxpppS2mT3zlwEBLbcCQ
 RXzsmmc411l0ydTg5gB+O2l3hkhqdOeg16tXM=
X-Google-Smtp-Source: AGHT+IEIqzFuO8Zvp4vgcgN+wkZMn2gwvkxJD0rLL91k5mVJ/tD2Kiqmz/x6kN1W+Pt07Ki/Xkq47A==
X-Received: by 2002:a05:600c:3b08:b0:46e:4704:b01e with SMTP id
 5b1f17b1804b1-46e612652d1mr41444605e9.8.1759337714467; 
 Wed, 01 Oct 2025 09:55:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b86e1sm45186595e9.5.2025.10.01.09.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 09:55:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  1 Oct 2025 18:55:10 +0200
Message-ID: <20251001165510.3843216-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759337714; x=1759942514;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zP4W0P4rkVDLff9CR/jfKpR44ZToorCRiGSGlW9a+k4=;
 b=kGBPjWmk+HFj/c1cYr2eWzprYu2RhSzIvDx1XBP+MeRXRwtfVThbWVolyowUNoA1ye
 c8ERewaPRgpE16oDSg3HpPqbNooliQh3tml4VtV8dV2qLLie6Yw+qRSKmQ+DxgxxikXb
 82a2gBek88TLRf7Z1WsOaplJ9qdSp3EB8bP0o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kGBPjWmk
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: bump version to 1.2.9
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

Drop patch that is now upstream.

Release notes:
https://github.com/exfatprogs/exfatprogs/blob/1.2.6/NEWS
https://github.com/exfatprogs/exfatprogs/blob/1.2.7/NEWS
https://github.com/exfatprogs/exfatprogs/blob/1.2.8/NEWS
https://github.com/exfatprogs/exfatprogs/blob/1.2.9/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...rogs-fix-argument-validation-check-2.patch | 41 -------------------
 package/exfatprogs/exfatprogs.hash            |  4 +-
 package/exfatprogs/exfatprogs.mk              |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch

diff --git a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
deleted file mode 100644
index 28c9a7146653..000000000000
--- a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5055bc4e852e18ddbfc618623cdaa2c0572d5f0e Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 2 Nov 2024 19:27:46 +0100
-Subject: [PATCH] exfatprogs: fix argument validation check (2)
-
-Since commit 7d354e5be83ed3bb981c59b3435ff64da56d185d
-("exfatprogs: fix argument validation check"), exfatlabel tool
-error out when we try to set a new volume serial or label.
-
-  exfatlabel /dev/sda1 "new label"
-  exfatlabel -i /dev/sda1 0x12345678
-
-Error out only if too few argument is given, ignore
-additional arguments.
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419
-
-Upstream: https://github.com/exfatprogs/exfatprogs/pull/279
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- label/label.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/label/label.c b/label/label.c
-index 12d027b..9c8aff3 100644
---- a/label/label.c
-+++ b/label/label.c
-@@ -78,7 +78,7 @@ int main(int argc, char *argv[])
- 	if (version_only)
- 		exit(EXIT_FAILURE);
- 
--	if (argc - optind != 1)
-+	if (argc - optind < 1)
- 		usage();
- 
- 	ui.dev_name = argv[serial_mode + 1];
--- 
-2.45.0
-
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 5ccad03ca2d0..e73d9d884bd4 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.5/exfatprogs-1.2.5.tar.xz.sha256
-sha256  f27160dcc1ddd17c96cd41a6ceef7037adc2796ab5c5633d3d85cf532c3ee2f0  exfatprogs-1.2.5.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.9/exfatprogs-1.2.9.tar.xz.sha256
+sha256  d9a42197c6ff9e6a8e923789413008e317415cf7a4ab85c486c5ffcaf49ca175  exfatprogs-1.2.9.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index a541a6311646..638cb9caa497 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.2.5
+EXFATPROGS_VERSION = 1.2.9
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
