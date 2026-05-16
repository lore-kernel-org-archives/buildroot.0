Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BEECD4F3D
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCA58490C;
	Sat, 16 May 2026 02:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCbFuwoEEpM4; Sat, 16 May 2026 02:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4665B84744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897009;
	bh=SWPYVP2psrLds7ZpWQAg5guMMgTaqcrhk7FxL71kqVU=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUAHCIuVBTQAiI9YlWuVgdkd2YsvEYXUhYK5SDwgrfqWl4FUwomo8PPWpGWt49PyK
	 +UzO9HrtFo1DgXobSm2rAXNgbvbe6keKVb0caOkSjrEPHkBOYdtHJE+R8O1ev3ZWra
	 UiU5/A0e2z2anmjDrDI57jFMbrHrOGGWMaubTDWzdQysROkvAkjele3lmsb1FSkok1
	 lJzvNggZDG9LC60YDy0Je9eG9L0G/FnifELKiTzW76PvsHnV6p4pxX/2Ek9Zf+0TIE
	 PIs4epfE9JEwU5vu0oiFYA31jSlF+Xd4gemFYkmzZysTb9JSvBuxhc8qYMds3sqjqD
	 KZk5bp6g7Ayiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4665B84744;
	Sat, 16 May 2026 02:03:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69BEB206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66A7B42084
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0ND2DDy_1tm for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD8A442080
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8A442080
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8A442080
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:26 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c80167f5716so158403a12.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897006; x=1779501806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YLcK9HSN+3vQ7lZdIoPOiMv/mUiK7jQs02z/sM9viqg=;
 b=XSxMhBusmzGA9uyzgtf1zmzLCvF150GT3M387dP/bGxw6G6Xg6A4b393TBcZfaN5Mj
 kDZZpZ/3FU8fvEs8K1rp9oEd2lLv3x2OIW5HkW2ZJ00hbpgm38ALEWdO3lLaUDe6DZNh
 vu38Q8JKqJFmZ4xc+kqmaxYn4AGs00PrGugBtnVUjWm+dRy3y68uhrCua9bUYycTBS7h
 s0GR0ejkmhGV2p2fJXDgHm8cSJSlqHFOZ1aaPSPk64Otu22L/fRtqjVbSihwsfO/TIij
 j4Kmkg5drw/Mxk2TKWTSPnJPEZEAupda7qW8xAiorn+sGV6LxmAOe85U2WMvBaKkKTFw
 1zuA==
X-Gm-Message-State: AOJu0YxtCzzmBrooEhWAYyq6OcXZqRZSbhA70cpmuW9/81ftESXn4s9p
 XgCxM97N/fjs7z8lD5zvAY1bfPY4CqRCljkL43OKsJp2ecq/4/bvazaq
X-Gm-Gg: Acq92OHwOU1I5AqX6dUaRhxIyjlXyic/VDNLTfdmc/qp2+1KIfQljnx14kDJ1Wlh5wm
 Sa/8zGEgLTME6oTRKGRMh0Qfeipx112yXsWaUsUowoCbuxjHezxN/q0um4BNk1gdg6C+EhMqu2D
 o6jK7KD10tF8AQoq5IlTIJQ/fxWzVC8cdVsYMvZgP5zQdp81cxYPclYHyg+xGyXWgZAcxJvAiUj
 +O4XCnRLYuBtcOv6mPwU1plASECibCekXjcMWGTFlnibyflB/yU5EulKP9nha10XWECoie1flVB
 J74l6qgQepU1Gsj7YzK3uU1lRzhvgwHFLh83AnCwdaaJ7XaEnIAFbg6DtowkXNk1ZOfl63p0gaC
 2OA38aWM260+C1rQ2YO2HC5534pMgvYSksSHKE175S2k4EIaNUMK92oPht1UWSo12k7VhOAIdL1
 asbO2rURDnhzibcn19d1IsZxN8i5NYZi36Kt8=
X-Received: by 2002:a17:903:1250:b0:2b9:ea53:4cfc with SMTP id
 d9443c01a7336-2bd7e886e11mr71690965ad.19.1778897005807; 
 Fri, 15 May 2026 19:03:25 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:24 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:11 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-2-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=1108;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=ZEuDYDV81BWi7jlziwuU6dIfFn6YrhhehlzSJdn32q8=;
 b=y6F781DQDQ5rrASqVAnn1pPVMzfGqGoGyRJMHqlqCq6O2rm6cEk+DO6aLz02I7Xd1klk1XUq3
 wRj+DLc1NN1B2XXi355U3YEsUVABN5d3HJnnABhUh9hjv5TbNMIIURY
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897006; x=1779501806; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLcK9HSN+3vQ7lZdIoPOiMv/mUiK7jQs02z/sM9viqg=;
 b=NxZqQ66uCy643q4MsrRMW+p5sIAf+TO6VTNhtuiweRYYkzqJV7SBneioM2SNAE++ir
 2knRVJyiij/cvIfJE+jpKIsR0UGYIuN2N8jtbksIw5S3cDe+FKkQEdJ+eUscSG0djHMl
 qmzhwq0mi0eRDhsO12QKB3H7LJOViptGP9mIUKXj3eTNmIGFXMqyIDngqQJGxNKtj9SE
 7FzcQOjzqvNhFJQGnazD9ornugtRhOVCFqVHgQzRNH+5f1D2Hi9GV0K9q6stW1oxO8rJ
 06wik8OLa/T52N2NhX5vPDDgc12D4jpXUDFidUejxIVYif2Cki2sWeie8cOl916Dr1S4
 kxaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NxZqQ66u
Subject: [Buildroot] [PATCH v7 2/8] package/wpewebkit: fix stale libepoxy
 dependency comments
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

wpewebkit depends directly on OpenGL ES and EGL support, but those
dependencies are not imposed by libepoxy itself. Update the inline
comments so they describe the actual dependency source before relaxing
libepoxy's package-level EGL/GL dependency.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/wpewebkit/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c8602f1de6..c4ee5a27f7 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
