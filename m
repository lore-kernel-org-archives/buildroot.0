Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4D1E77194
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786A780D5F;
	Thu,  2 Jan 2025 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XR3x9l86u4-3; Thu,  2 Jan 2025 10:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C8E780D66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8E780D66;
	Thu,  2 Jan 2025 10:09:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32FA4F27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF2760775
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-Ire_sr5NE2 for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B5A26077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5A26077D
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B5A26077D
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:08 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa6a47a3da3so182487466b.1
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 02:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735812546; x=1736417346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+GT4I6JCeJ473kw2yyaBCnazX/g+kF/ayvw4cytsGk=;
 b=ikWBcJn0TjB/NkVsf4XHdRPVbpJFOMBL1BnSvbOlnRvY+e+GwEteyYTFOy7ZrsENKo
 FU4LcarNYBLXjsiRQ+dD4UOQi/qeoGSFbyuX7Y7ju9d/nR8LBZNvg8BXnXbBL/fBibpw
 j1nMhl8T4pnAT5gPyEn8EZ59NW8N93BE/MSY5nSVT7HQZRTH4VLgW/DWKkXh8B91dqB4
 6fh1D6PYbY1pR1aBTwwwB/vofb8+xswMq9eKY9C2ucw9lWBfsaH1lVHUPKjNhK/WaUb2
 1epIlx/aLu2Ksk/bpXG5/KK4wmfMF4Kr16WYPpGSqDjnKrHZN34Vcg778lzY8sMvJnOS
 UNnQ==
X-Gm-Message-State: AOJu0YyW/68MX50AFkvjdz8NBsWKUXGK0tlB4XiJ7SIlegEEegTDt86n
 6VYWPHs58uVqVQgT7zbETMJe07lY/E/Ye8IVTey3RJfBWPIzcN2jAltYYnLeTTRDhRKRmn8CN6z
 YEMQ=
X-Gm-Gg: ASbGncuKS84JYWmpvKvzHIqET7tf1ldg9aw7JVCHtDI+Uo1VgaiD3T24WEhKb0/Ibeu
 bWj9HoFozjSPjIUThnJwX6QY4Yp6hB2M4XQKQu9m1T/LFVHTdkNlrLvKv9fX0go1oayHPvpavcF
 yhLfSNG10upFr0hXrQ2rnp/lE1gPAd9CjAB3l+FZNAwvhWDka0Wr048YvIJALhjS1tlSKItAG1K
 l/7H9aYbBgySucymKj0j80zbCDlFMR0/t3XaIGpdh4HiI5jr7p2yt/vBpTS4Kpqxtf+dmg2HFxn
 19ygYKqVIO48
X-Google-Smtp-Source: AGHT+IFqOOY95mwJf0i4+gQKcYQ6kwe86UxIETOSKZZ9i2Bqn6KgUdjQLhyaXsd1BjTVdUw6qBVOvg==
X-Received: by 2002:a17:907:1998:b0:aa6:6e2e:b7f with SMTP id
 a640c23a62f3a-aac269824f0mr1396817366b.0.1735812545942; 
 Thu, 02 Jan 2025 02:09:05 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b10sm1759295866b.37.2025.01.02.02.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 02:09:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 11:08:54 +0100
Message-ID: <20250102100854.8937-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
References: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735812546; x=1736417346;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+GT4I6JCeJ473kw2yyaBCnazX/g+kF/ayvw4cytsGk=;
 b=VDaeGUrGxUYt8gG2T6+4Czjt+q22RizfThcid/Q5HccJgST61r2vci1h2y0jYyZmMU
 UsTtjmwwqkWiTtgbK6QkNAbWIcr81HynJ+dV8KArayk3Pu0CX4TO6Jfvv5dnjL7LSHP6
 AImW8cOThBhrRYszIwamyk+e/fGEUX1Z61dfg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VDaeGUrG
Subject: [Buildroot] [PATCH 5/5] package/flutter-pi: bump to version
 af8c8d66c5f40a6aaf366882bb9ca525be9c600a
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 6a73524745..892aff75f5 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3c7df5712cd7c45539b325b0d8d58d0942b08a6f66c55e3f53aa5225cbe86af  flutter-pi-37bd9773c1938e5f76208bc4e8632fdbbb4190ff-git4.tar.gz
+sha256  b30e8b67109a81a7c2a2bbec3d82491b69e827a1eb84c529f3e31691c19671d5  flutter-pi-af8c8d66c5f40a6aaf366882bb9ca525be9c600a-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index fad1da3215..4444493e61 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = 37bd9773c1938e5f76208bc4e8632fdbbb4190ff
+FLUTTER_PI_VERSION = af8c8d66c5f40a6aaf366882bb9ca525be9c600a
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
