Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2B4CD4F59
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 08:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB434047D;
	Thu,  5 Sep 2024 08:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6d2vgjcl5a4N; Thu,  5 Sep 2024 08:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5139F4049A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5139F4049A;
	Thu,  5 Sep 2024 08:57:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 333741BF476
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A3E608FA
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsaAwbc1b7O4 for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 08:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14783608F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14783608F9
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14783608F9
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 08:57:18 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5c245580f52so69983a12.2
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 01:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725526637; x=1726131437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O880zNPsLD5w1ONc/WgOBrWYmcC+PEsyaLvCUQsiQPo=;
 b=Pq8UEOAjbdnh5CwondvqfL7xDLLHGYVUQzJVbal59KegxiZqfpXKe07WiI8cIwSqDm
 K2Wq3ym59RBgrfUVu1A2Bcs12nQYSytMzJeVItpnjgcpXMY7ZK5XNZMf9RaE3hUnLSZs
 Wy+c695zhG4CKB2hZw2xam7pB/Xc41Vym6Wk3QYs0edNU7oCOgjW/WiqFyYYeq13y41W
 O3n3xtlGbTLyIceV+3YpYfTqViIyJANlbdvoTj03Nwt48VbMcosSH+8/jdX/aBiY+Jc4
 vdzN72/CUKxHRcf6lz3uhe1ZVSHv8Ejcc3IjuJYb+6QzMRHoG/BVhq+tWMc+1HYw1nhx
 SpUQ==
X-Gm-Message-State: AOJu0YxackrWqK1rFgsZlLShp8hyxXjZG4JzEou1rrKusgmjk3icVDa/
 FOsg2cxoo25WT+UwoJsSWB9T7kSGNiLGPSVhxLfjcbzojnXdGuo6vN0ImSCZoHRDJ/MhnfNBNt1
 iWVPknlv0
X-Google-Smtp-Source: AGHT+IFCbefoR4nFuVz3ot1kN0SkjxqcumWi7xBfBlgcR31XTR28CGdPDkeghQNzi6rBF8ZoqKp0Xw==
X-Received: by 2002:a05:6402:448b:b0:5c2:6850:79e with SMTP id
 4fb4d7f45d1cf-5c2685008cemr4487004a12.5.1725526636358; 
 Thu, 05 Sep 2024 01:57:16 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-432d-2b48-7707-30d7.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:432d:2b48:7707:30d7])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc699e68sm941429a12.62.2024.09.05.01.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 01:57:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 10:57:12 +0200
Message-ID: <20240905085713.383116-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
References: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725526637; x=1726131437;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O880zNPsLD5w1ONc/WgOBrWYmcC+PEsyaLvCUQsiQPo=;
 b=Jt3Kj0EUZdPSfvqlBPGBg4IbZMJJjQBlEg6Q2d9D6BkZ2e5jLPuRKad7ot23067QEI
 urx7EDvO7JsZh8Jg7C9EUDS4s8OhqsCbu7CKfRjV1AXVZyhF7OOs4Q1qlR3NKtdLDyRX
 91J1U/TDGZspdhNfKwRdUMa6riGUUOYInV0kE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Jt3Kj0EU
Subject: [Buildroot] [PATCH 3/4] package/flutter-engine: bump version to
 3.24.2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 020fa2ee8a..a8158d3559 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.0
+FLUTTER_ENGINE_VERSION = 3.24.2
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
