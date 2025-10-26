Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D2ECCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29863402D3;
	Sun, 26 Oct 2025 13:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fqa9D9CWr8tG; Sun, 26 Oct 2025 13:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486FC402DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486FC402DA;
	Sun, 26 Oct 2025 13:27:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C95E15F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 830A9402DA
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uWdTEJbWe8r for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:27:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71DEC402D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DEC402D3
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71DEC402D3
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:27:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b6d5b756284so780456466b.1
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761485257; x=1762090057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jWsfRxeRy3favVab6FZ/OcsT1JDsVXqWhEujdNqROg=;
 b=HDz2mgYjSrfaIZL5z81FdsJPrRNIU4PJbLa35SvwYxnWoXnvQGsGitOp101zjLXemc
 uwcvhNh8K+GC6HUtzySasgmwOCvviD2g4waROH97P+IODdNcpN+4dADLoWCyyY3ymolq
 f8R1+VQqmGyLfZ1d5S9vCZLwo5xvOUuWUfAlPzaBCLMnt5aephe3ZMN9NyGwesgnZ5fx
 QIgYBvVo4anakvnUhVn8MZyBCPdmoetEJ/2quha2mr9evi7n7etEh0mXa3KmuHM3vB2v
 PeC5BY49npY3accMyn5HFZtfKZaRojXgZ0dGDD+oj7PglTT73JPJCmWrvNe9Rcub7oHp
 6pRA==
X-Gm-Message-State: AOJu0Yyp8CsjIa1p4Jza3HSEeTsPMkbzcqleWO2/yyzD4n52Sr8gVRHZ
 mcx9nqZEopY9Vv1wEY/3t/1SvSkcjh6nWq83xgrhtHtSvo58fcRt2XKmR2nz0Nkjazi+WfUFJCR
 +FZMP
X-Gm-Gg: ASbGncuAnimoSfzIagwUZBSARkmHDUaG8z1z8wRjOhHzEtuLH9TCg7fKMLH8UAHeHI5
 WKaMpyMmy0kt67tHMSGhpeanjHW2eLzJqlmcs9s8HtVcwyXTkYoYewfsPQKZgJ/5FmjVj8CplLd
 oEWjmfX6j8hPfR5ZV1UEDXTkOKgzMV3rp7N+uxxQlgIGuXli/7MAQrGghtqVD4mCCPFzWMcV4Dv
 UMv632xd80LM0UUBEG5McMwP3EeeGVoNkIaTehLWb8dcBgWSqM9CM2gYxgqAOqyUT4cC1XkqH0I
 Ak1+/vc6xZ4Iwmlxt7+Sl+lhuB1XufO5g3h29lo+p7fa+PGnCXRyRRK6FThxG1WRa3PSlmFyOpq
 /91BKnc/vXlnxzUigtZV91p5tZsgoshkB9rmrpCC/MsXmaWFUCC6FDyPoFXGZBpqTZVBzfSNBN3
 2jzRs1tRnpfuwJpUGvHh8mrafRaojGkkM5mKx9X3z6Zatcd152sfPBpRlH9rNtiVgMGQ3ckPJ9m
 kQ9UwY+cxdhkDIFSDtH3ACwkGjudv7Mx6enSdV6
X-Google-Smtp-Source: AGHT+IFxDU9XHzt1yfS6UPUgRkiOmGQfmCXU3+6wut/V/d12W7sRgGLYllO/kPt+sLxBoyF1Ecwf6w==
X-Received: by 2002:a17:907:9691:b0:b50:9863:dbe0 with SMTP id
 a640c23a62f3a-b6473b52655mr3886174566b.37.1761485257052; 
 Sun, 26 Oct 2025 06:27:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-41-5.retail.telecomitalia.it. [82.58.41.5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85369675sm462311266b.28.2025.10.26.06.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 06:27:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 26 Oct 2025 14:27:31 +0100
Message-ID: <20251026132731.156268-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761485257; x=1762090057;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6jWsfRxeRy3favVab6FZ/OcsT1JDsVXqWhEujdNqROg=;
 b=OFAafMaxpBoo1WtYkcj/is0W7ydt+dbwa5lB7ACyfsKyKssHrCNxYdZpMHuMdfz3XT
 lg0tyTi2ysy5QrCqjqmcEwKZTvXgcfD91GZMySl9zNUiPYXk4oNvgUV5rTxLZ5sKlgJ2
 z43UhgdoCjWzse2w0Mr5lwtJVz9eJ5PjQUbNE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OFAafMax
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.0
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index f3c847372e80..5bf5157e7fcb 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  9f55ec10f0a91fb6479ab4ed2b37a52445aee917706a238d170b5220c022fe43  armadillo-15.0.3.tar.xz
+sha256  2f71c0661fc4a46e2dd56b7651cf3bb5928b499a4b10df31efc1a4241edf0043  armadillo-15.2.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 3f9eee407b74..359c83ef5fc3 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.0.3
+ARMADILLO_VERSION = 15.2.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
