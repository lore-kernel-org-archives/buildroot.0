Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75694D65549
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 11:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFE083224;
	Wed, 17 Dec 2025 11:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIjHO4GhU-T5; Wed, 17 Dec 2025 11:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C46282C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765969351;
	bh=yD7o0TOKKaTsTCMX8c1Fo90bcR3tXSZFaqGw6yGrNrs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qhhKNFCdkceXvY7s9owk+CEt/ntEDExuPQ2YKIsYWSgL6KdwwImQvGSRMhyaCva4M
	 6YfMl7UegUw8b26ZrFOzsxTFHEp1ZB5SN8HPe8YnhxQiBx7Sat0zBiIULVa1gdrxgC
	 O9NrwIDb9ilQGMizYzA3tTrPa7D32YBOgEx3f0vrD4uHXu+vtucDPIc9jRXCQ/xrs4
	 93l7WLNdRoZMB2EWCdBuMv3GQlLo9YONhfPR9k3n2kvQV/Z7SN16moiB0DTVs/c6Y1
	 tVqpPiXr8ZsKNQhwmUhAFnALBZIYJpTAzDqiDu9qbViyuRBPEVCnPbwuV+31rpGmId
	 uJNpdtOrQ69VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C46282C21;
	Wed, 17 Dec 2025 11:02:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FAC375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2D3140DC3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eh2gF8HqzZKZ for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 11:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F41EE40DC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F41EE40DC8
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F41EE40DC8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:02:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so36174205e9.1
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 03:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765969343; x=1766574143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEvYq4VfGcrZa0Q7oEmNr/DBagMzYtyOtwMKnqtsRtM=;
 b=mhZWJmUZdZS4Bbs8u8USXo/FcKlS4ZnPe/L4gEcaUn+90vEgqL4Ld/l39PWLtQPJVg
 YDy5Wypc8Ko5vDNxbwm35YyLFp0oqq6qTRM0MVbnDjFDFj6zyKVA6f7NmVr/zD+kWYAF
 8ZlINlZBMIIFqs1iRtm01edmp8HQxxEXcbN0pIdaf0AtSrGDx1tdJL+ErLSdKxgrZvZJ
 bpIu39X4krjQXE9c31RvJ1eAMbgUUZjhokSDq3eP896n4PdD4gw/Ht5jGhGLcq4Xid+U
 opFLY+XqSHW0J0jSEOoi6IT7U8H1mP486rNT/Fs4PitopYVlf2HQogYAw6qXvNJE1FDW
 YTrw==
X-Gm-Message-State: AOJu0YwrP709BJIAraZEBVnkqhjmaCPzYTgLeerLo7z/Eh6N3fD4eOKe
 d2+wmS2ahGjVjx1DmZaImnhID6v1Z4xV/lE/eyIe4Mrl3lDHZSwUOA4Y6b/7t54g
X-Gm-Gg: AY/fxX7pMfPEtXaFK09J0re5PHQxDMZ87YTOBCCnZJJ9k3wyw4A3NfdJyx2YCVDmYeF
 +zZslQ+cH0AQDcz7rbvzifvhcyVzMX1wDC3xkPOKMhso9YtBBfYdXHYWFoxccuKHtDZlFwJsBdX
 OYfiPDF9WQquIl7QkoP9Q1LYUwlUqg7J52y8LSS1uCStbfrC1MMPUMz4/ThBJYQ/qn+ujXetiLI
 hN5zDeue+DjdjRja7Uc07tqNov7lfEnRmVBVf36L5GW7v4R3F+guA1F92VUXR1N2VIN2pV5C5EX
 CsY1NhOFa8UJuZHWXNTk88pxfX48zIQzEXaJ3vRcd/wwId5uQXL9Ydfv0SP/6AJXWmg/Fclp2+z
 XWTtxg7Rrz38m2nnp8TpV+K/2lJ2qHwW2FhKdW3U6s/T2NK+NFmm2vJAt4B+7ODaoXesThrIKFt
 DgK/ydSX4zvDkt9awhTyg9F3WCQansaFAs+HPHpTs2l4lyFiT0dPppQN5fCDhMvaQjGzbkqa//X
 9adrQxgAQ==
X-Google-Smtp-Source: AGHT+IFHUjGNq3uB49kDFyrz/q7fcv2P/c8E7Bic+c2wHNxQUWhTJ/xa4DnujpkMtmaru/70xd66Kg==
X-Received: by 2002:a05:600c:548f:b0:477:994b:dbb8 with SMTP id
 5b1f17b1804b1-47a8f8bd84amr162718805e9.11.1765969342540; 
 Wed, 17 Dec 2025 03:02:22 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4310ada846bsm4055269f8f.9.2025.12.17.03.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 03:02:22 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Wed, 17 Dec 2025 12:02:19 +0100
Message-ID: <20251217110219.64233-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/libfcgi: security bump to 2.4.7
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

This is a security bump to fix CVE-2025-23016.

See https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.7.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 348b0b6867c..be9e3e8db96 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1  libfcgi-2.4.6.tar.gz
+sha256  e41ddc3a473b555bdc0cbd80703dcb1f4610c1a7700d3b9d3d0c14a416e1074b  libfcgi-2.4.7.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index e0ef6da55c8..da84ba6297b 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.6
+LIBFCGI_VERSION = 2.4.7
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
