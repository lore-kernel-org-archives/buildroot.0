Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6728EE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A9D9407A1;
	Mon, 29 Dec 2025 09:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRwKVa_iqbsn; Mon, 29 Dec 2025 09:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B15F407BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999264;
	bh=LGwnGLvSbc3WrVmEwMBS5jqlUptWRzpSC58ANA5vwR8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=kpt/jUIcOehC4PUvoQn7bm78KAeACF3iGULbFJZ703bisI4FrtDJYwz9omW3uWDu9
	 3Xx+51Ue4j2WRPDX2TWAuAolSEcqisdcogsRjXvEfM0ew+02Hemhp3dfrArNoGqW/j
	 pLJnyZiut1+Ky3sn9f/XAxmhaD3+I/zd9N/rtwta17H5yUzlv82aE8yfTCA+xFiY2j
	 L1yIXYsNzeaJCFj3ESYUqBr0LEVGrCkWXK2/xIDyuyQKcLT+ls2OUEteVCa8youxui
	 CCkzT94Ij+zcg6vie6ph4Q8P+MfPnjL/Zwuhl0S1VTHZ+V/XF4i8BuVZVhyeyAPF5c
	 SsMlB6F3fOGTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B15F407BE;
	Mon, 29 Dec 2025 09:07:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B17C1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6232340131
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9th8c5iTVgL for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7EE9C400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE9C400A4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EE9C400A4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so53413825e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999256; x=1767604056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OHlZFQnUH14MbUYIcdKbXphlRnJdjwvZwLlhMiTs6Ew=;
 b=efigo21klQUu6Gz70cS4z8jiqT62BKm74sRtx4jHGNB8Tnyt5h6aXR0qUhNzMCbX73
 LpFEL0OsBI7NrQlcbayB1npcbi5yp3J7g/kYpm0eqOQgvUSwcM/OG6DK1rI+WLy6pdeM
 BCqUALjFwd5EpJngcD0swSHEC49kd6kklROoPcjQ/BYqUPTGTeMM/QhGCS0zz8AJdzFF
 o86+GKqAgLKNw0r4kNC4x/Ke00Kwm0/X0sTrLgiiXWVAyyNsu2A45EsscB9cYeTSXSvJ
 VbFfx6X/rz81p1z7mcqzBMO9G8tatvodmq9nrYy9eFltXqR4NRMC88abcSGNSUModSM3
 FoKw==
X-Gm-Message-State: AOJu0YzCynz25jOpZCtvmuaxgQao7HrupAABj674iEYq9LfopZ8+iGoH
 y8PJMFNQza4gh1qGqraM+hDOlDrnFs3R6aJPhJgWIP3l7c5qFVqdAdv8sq6F8scMRuZgUN2aWbN
 p6tC0n+o=
X-Gm-Gg: AY/fxX41A3r7r/GnkTuMrGc02NTsYpdIN59MJIxydowSdXihV0Ur39SUyWrzjkybb/I
 cHOS0F69g8E4NeILcKiQC9lvGqSrcSvgthRShdWqTLp077Jm4903OIvkP+uJWt3IpNqAjInPGgM
 cQHPE3LrrGSzqmtMEqKylASaqf2wAWEAOnBJSEVtyfarmiOFJPmdlfv/HEjcZRXDbroaN9px+YR
 zFsuA5VpHTrjaZ0R7BspXgvgxn3pjMsziAWHDgII/BpEeL53KlUfF/uMPThAZrcCH4FO03mmlMZ
 NTVkzzLOMUcLu2aD7IaI7Wuoo8TwFTa7oAEnwZ6a8YVQlBYohBL1QuyVOmk5Vg61tShj+/dZ3hv
 sY8jUgW0hxT5TLcPPVehUpFtEOPitVwobcNy8JPowFtMm9qd8VVmLxgB6gc+nmjPCFU6rlq+v/l
 nTynSHqOV6LJP34Jq5zmycvfAY48oYlEG8Jl//krhEicGC5WnpH13o7QznvBOwzhbzTWzxwstyK
 6bbeuAFAwhN
X-Google-Smtp-Source: AGHT+IHZ/lbYh2C7Ig+4eYRhlyCIb85HRXCv9J76SlQbrAKHgGA92b/t67M1lWesmAY8hgCS7yjkVQ==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-47d1958958dmr329336825e9.28.1766999256265; 
 Mon, 29 Dec 2025 01:07:36 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:35 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:16 +0100
Message-ID: <20251229090719.13291-11-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999256; x=1767604056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHlZFQnUH14MbUYIcdKbXphlRnJdjwvZwLlhMiTs6Ew=;
 b=gL3V42w1ghNHIeJ1B19qNQLUFTtfDSRF5NXH/OAmg42gP+y78CWqL5VEYYsArMUByP
 wQTp3rpN4VVaFLtaWBaDGZfbBnTymodj5qzSCHfQ+TqRKIf8hNfYceerHYAP7SUcUNGD
 V7yM0TjgkuTODkAhFbJkj6A/+B+odiEtOZFmb9jZGYgYsGh7hLUxtFOU6r48pa3V+nRk
 BEMOodcw+Z70/p0uC+siE8wpy0qlTlhY9B1mAXaXE7JDG/hFyt6tbi3UgHkD5nxN9w6X
 1J1zW1tHrAdcGsczMYPdwsQiaPW56Szlf3bz5VICWFS/e4Thh5vJLJcE9YoW4lV0taQI
 Rg0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gL3V42w1
Subject: [Buildroot] [PATCH 11/14] package/sdl: add CVE trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
index 68e66bd5a2..3624c5341f 100644
--- a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
+++ b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
@@ -3,6 +3,7 @@ From: Ozkan Sezer <sezeroz@gmail.com>
 Date: Sat, 18 Jun 2022 14:55:00 +0300
 Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
 
+CVE: CVE-2022-34568
 Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
 Upstream: d7e00208738a0bc6af302723fe64908ac35b777b
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
