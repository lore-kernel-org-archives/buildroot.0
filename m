Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25C4E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 16:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724DC40148;
	Sun,  8 Dec 2024 16:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORnIattPAgGA; Sun,  8 Dec 2024 16:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2839040173
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2839040173;
	Sun,  8 Dec 2024 16:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19441ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5F3C403CB
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmzijDTgddUv for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 16:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB1C8403A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1C8403A2
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB1C8403A2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 16:42:43 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21654fdd5daso314135ad.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 08:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733676163; x=1734280963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cCKsyJaevfk5tSXcTVuBb7eAZSglJ14qi0Lr6FF1jkk=;
 b=e07mV0gu2WP1Oyc7TY3zqO9O53/gK0Qnlv375bLQuSsMS8VxQk/u5nfmxq5qMM2pl3
 CN2k52/Lx+xGrPXnvkEHF5lF84C6CtTrWwoL3GdJNf4YIIOsHXBv07Mzp4R28ld0P6Lk
 TuWEmwoXNU1XoH5KqRbdIMrHvCgZHGtHKjnVi3baao3jD4uZ8f1CbqP6gYicKnKEceHP
 tI9JVd4xDGv0hVSzj3pbXHbdRSpb1v/A4SSklUjL78sXPbC20FpBPjApSaeKLVI6A35l
 I+l9k52fqHnVlHlgbSnUrUIsVBaWi2rmOnTOu4IcLMakSsMX/58DGSvOswrUHF7fBNZx
 tMRA==
X-Gm-Message-State: AOJu0Yy7XRjq5Of0HdKIyb7ln2YVGwanOvbhLdDDo+HS9VodB66dvlb9
 6iVyGezoY1PrM1LNi/qaAmHOlnTnbvEBx6hzStwSu7ZjYSbZT2HEUPHjoaXCB/t8ZUCLrx6IPx6
 dPU4=
X-Gm-Gg: ASbGncujZHbgOTIPvAqAEdY8FmFd/jqigKMsAmLRnpoGnhi7ZMOMybHlnR/+jHDbQNo
 6t5ftVaakASPDIRX4pDNb9PTIz38JmGwYtjcFZepizLKGaVRYzGHX3BOx9AOn7gRmBdfGh5uhCN
 ZLuOyJaNsL2ZYugFENoe6DHpLr3qHjcU7gTvRu+3f+QLy+1ZUinUk49M7tn/xzgXjK6JOb4SYi3
 Nh440czBgmfs9N7NqYzaOOAAr3f6nMguCRX0I/pD8iVcVxSBbJQFYaFR94JeJ0CoFAJGoNLSNVO
 awsugFSGYGNWkI6StuWuDTnrqri50151g/I=
X-Google-Smtp-Source: AGHT+IFzdfBEfQMxSwFuTxfKWbB63y3oI/Y6MJqre7aPzg0CFAkZ5i6QwYevQ+/KrPY5LTjTMILEpA==
X-Received: by 2002:a17:903:24f:b0:215:b75f:a1cb with SMTP id
 d9443c01a7336-21614d1f163mr130187885ad.9.1733676162703; 
 Sun, 08 Dec 2024 08:42:42 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21634f24f78sm19146515ad.32.2024.12.08.08.42.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 08 Dec 2024 08:42:42 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  8 Dec 2024 08:42:30 -0800
Message-ID: <20241208164230.87048-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1733676163; x=1734280963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cCKsyJaevfk5tSXcTVuBb7eAZSglJ14qi0Lr6FF1jkk=;
 b=qscmZL3nV0oX2rLaCKcPLgjihUyS33kePEihzZDt0sM6Or6wecXzruUqAIMYxPih69
 w4+O19z4wxQVDg5irQhQOpE8DMCDicSrZL1Z3+Ur4X7rmbv+T08jqvnkkFAEX7zdNSvp
 IUWecXWsfFQdtt4kca46UmwQhh6Hq+57ICyY3x5DFxvy0EM5LQle2+QTNTG6d86GdL1W
 tMbejk/yc5DyVIpFF0ia0MbFqXJ7hqmoucVB9yzhsDu3s1lnx+qCrmVzLSYr8tNfg2ww
 lqzkgQr5s0sMMU2mLz5BgbEwBniYqgkfYES41qMdiqT0j/FRvvcq105/HsgtoOK6Zbd4
 z77A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=qscmZL3n
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.23.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.23.4 (released 2024-12-03) includes fixes to the compiler, the runtime, the trace command, and the syscall package.

https://go.dev/doc/devel/release#go1.23.4
https://github.com/golang/go/issues?q=milestone%3AGo1.23.4+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 5f008c773e..37e1db20a9 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
-sha256  3d7b00191a43c50d28e0903a0c576104bc7e171a8670de419d41111c08dfa299  go1.23.3.linux-386.tar.gz
-sha256  a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8  go1.23.3.linux-amd64.tar.gz
-sha256  1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce  go1.23.3.linux-arm64.tar.gz
-sha256  5f0332754beffc65af65a7b2da76e9dd997567d0d81b6f4f71d3588dc7b4cb00  go1.23.3.linux-armv6l.tar.gz
-sha256  e3b926c81e8099d3cee6e6e270b85b39c3bd44263f8d3df29aacb4d7e00507c8  go1.23.3.linux-ppc64le.tar.gz
-sha256  6bd72fcef72b046b6282c2d1f2c38f31600e4fe9361fcd8341500c754fb09c38  go1.23.3.linux-s390x.tar.gz
+sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
+sha256  4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f843bc  go1.23.4.linux-386.tar.gz
+sha256  6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680971  go1.23.4.linux-amd64.tar.gz
+sha256  16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b13e  go1.23.4.linux-arm64.tar.gz
+sha256  1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755de1  go1.23.4.linux-armv6l.tar.gz
+sha256  65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a1b9  go1.23.4.linux-ppc64le.tar.gz
+sha256  74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d7d7  go1.23.4.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 1a185d011c..0b11d8d392 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
+sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3dd590bf6f..91d9f8d1c1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.3
+GO_VERSION = 1.23.4
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
