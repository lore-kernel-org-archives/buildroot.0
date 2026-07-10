Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB3AC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4B0812BF;
	Fri, 10 Jul 2026 07:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pj9ZmHtzcRRW; Fri, 10 Jul 2026 07:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B28812C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668082;
	bh=i/yh9PrCSpQsvb7zA17QV2trnnD4/YkWw/OR6tvtk7E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drx0hALNBU6Lb8JFhRjHeytfXzHsBc5ZCBwllRGb/Fmd0uolHdS8vy7UsW9Wf8b2a
	 EyZ0Mo+HKNq3wNqOzRV25sJPtmIJDUfFF+7StbIkvZKgF1fr4E0SUJ2NCuazF9ucA3
	 7exm8oWCIIHLGBqHhMhK2yo3Z6A9ZdsTjcgBIexCjIHL4OcnsDaOfYlKY9NDsD9pup
	 lsgfwzh4gE9JpIOJIsvqBx8nbs7Jfbf2XF9gk0S8u2DyFylF4ENNePRolBdXZcuvJc
	 7CbJtlER4Etq3bbs7DzEh1b9+TeNMzyxWIHOm9wGpa0pPqpneqZYQ5W5LfiYQqkUIV
	 RQHAmcvC/RWEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B28812C1;
	Fri, 10 Jul 2026 07:21:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71077FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F6D840A86
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVPw4jZgVOo1 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3D9E40A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D9E40A63
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3D9E40A63
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so20651525e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 00:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783668077; x=1784272877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dv9/1Hpzpb7PP+opNmdNe+y3Pu1foeRD1fBSZcT2mB0=;
 b=FEUAQvzUuhhcvVPMqITpgLmtCqG+G3twsvleuxb8R9csXeSpzMEM92GGFl2kvts8GK
 nZ5r/JPaxg7qesdcqKSxZ6xP0pkQBRY0VTSULTCKxJoMNs+DSBoW7Afl4ba8jkzJyEdh
 Q4+AJffdHsNVQIqPHyViMU2LwSg/jxw2prVG+cOETPVhyQBroMhxNykbbeY5Q5YKKHNW
 7gurfcB6MvptX7Zf8wTyBDGZbh5vXhng/G2GSblMhRB5lRoVJcirEXhSm/IRGWH23LWF
 5GCvSBRn5zes+L/GLIys99vEFyStIxHpFG03w6faYzhToDa56JdNB3d1uGrqUiVpHhm8
 SsWA==
X-Gm-Message-State: AOJu0Yy/BOn+piVOvmrAJ9rNyU01d+vW31qYk7VlHtIdDnqVixzxUJq9
 GcmeQF8V3PsfBw9IgZa2jqZIfQCGMYhPq3uWVWEvtP8kx/mBINP7udhrmKnl6/NTAz4h1nkyji1
 ZhReG8h8=
X-Gm-Gg: AfdE7cn1ySjUhIUTeyszsIm9/5Dh/7iEaXF2OTXMpN6+8cSnMpHumVfK8xluK8TO27C
 98MefXG6fed7E8EG8zhrBUDtawI3fnisdXZTFCVduXTdMnBk9CAMYSxNwTJWZWAowgBqboJJfbU
 gwopY65qNd8vk0u+2XzjiVrmhHZpvNDAIojBrMfyel23k3bFOVR6dCF9oPCAZ5P5WonX/PvqU2/
 FNgXg9Gr+GA/pWjEKxX7/7JAFZuG+PnAbeiRpdt40vvvA0bjVZWfpo0gnJMU1Z6YozCPlpeulLY
 8Jqq4Pz2N72B/ulOBsMS8jLY2JasCV5IgJL8wzPFiJ2hjia8OMVjY85k/NnoKf4t3BAf+NZQK0s
 Vxr2DW1rzBDtWMyB06FFoZ6kdlHWa1rAIX3GuCM5TNc8dLoq9IpLXU30RQJuLZfJz7ruqR9ElV8
 hbNMHS3Xp1QMh0Du5A6wbGlzzJ7aJgYwUTRolYM9A6uUJCDgdN5Ro3Fems/wVnCKXkzw5mWsTSu
 UVMWJoWmIshNLmvBT/8d8WI4fYTYyeC/dJvB9URu64VAvx2U8o0qnQZMguBh38UbHtRmQwWxupx
 tx2f6XzYhU+01do4tiQkdrR1BVbQRDYKfDs=
X-Received: by 2002:a05:600c:4ec8:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-493f2b445dbmr19464775e9.16.1783668077633; 
 Fri, 10 Jul 2026 00:21:17 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.1.245]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccdbbsm120194765e9.3.2026.07.10.00.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 00:21:17 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Fri, 10 Jul 2026 09:21:11 +0200
Message-ID: <20260710072112.51856-2-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710072112.51856-1-andrea.ricchi@amarulasolutions.com>
References: <20260710072112.51856-1-andrea.ricchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783668077; x=1784272877;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dv9/1Hpzpb7PP+opNmdNe+y3Pu1foeRD1fBSZcT2mB0=;
 b=fwLLzljdiEfB4FzMNpVzkwYbqS0qAccta7ljBg+ZI6g2/aOrQtDTlTdfhMpw4+Z/ej
 VlXKayF+eAJFnCZ/3N2SFUSFGN5hh5875cw3XgO0h8uIVIUZnpPZ3KydHjEpWWFOXcLR
 pVqKD22YjHCBuvYjQpcFkqCucbgDr523awZN4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fwLLzljd
Subject: [Buildroot] [PATCH RESEND 2/2] DEVELOPERS: add Andrea Ricchi for
 libcppconnman
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

Add Andrea Ricchi as a developer for the libcppconnman package.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 Resending this patch as it has been a couple of months since the original submission.
 No changes have been made.

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fdfab8b489..edf0c94b63 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -186,6 +186,7 @@ F:	package/wine/
 
 N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
 F:	package/cutekeyboard/
+F:	package/libcppconnman/
 
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
