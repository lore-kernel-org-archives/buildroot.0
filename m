Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640D6C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 04:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E0F607B3;
	Tue,  4 Mar 2025 04:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1KiRyZ2XCZ5; Tue,  4 Mar 2025 04:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29301607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29301607CF;
	Tue,  4 Mar 2025 04:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07297C5
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA8008156D
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VqHiFE3KgRD for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 04:02:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 431238156B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431238156B
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 431238156B
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 04:02:14 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2239f8646f6so41679905ad.2
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 20:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741060933; x=1741665733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WE1gV1x71N171ipnLhNQ22UY/VRQGg8a5p5rFcgVens=;
 b=pE30CIyGxftYD62Zg4L2NO94e7xbnX78VUyBS7HrjKdIbZngLKEjWdeXlodXYozDGu
 1AfdBTEN/D6QIIDDZzs7Jrn5AfVKjxuvvLPJrbSV2MIbucYJg4XfRoaipyd6UJySbIFc
 v8EhXt6tlbBEDtjlwabiKkWa/c6q4m7XPsto90yQFJtiVcR1HNMwHFI3njc6zzRpZJu4
 WwddFgZ34XkfeRK/kwhcGc4IDD/JR5djvIeKWUQ5e2KV2t3DK3TK1LInXxA+nl9mZNiL
 DbWIstvBblANUSCg6c3Hz/LViKKqvEoRd8ptb6vWGZCh2uNskesdQUNb1c4M0o1rf5pB
 Rwdg==
X-Gm-Message-State: AOJu0Yxlscp2+4UukUGQ4TjBHgf+GreThCG7mqk7hnznzXtKebBJOLsm
 MYjFTGNMZh3YUmQ+PLPK97V84OQRWIwkhYTQNHzHE/0TYy+FfN/Hl9QEOnk3z5+WYRl/GPP5yTe
 DLrw=
X-Gm-Gg: ASbGnct1ULM++OaLK4PXU2YhlTcgQbHQvzgOEqHbVcjltyx9DBMhqTY/g14Pkp0ly4I
 VeGwD/Vt5S3p40LxS+0Kf+T72ziSPMAgsyz9SlQSE27WbV3kMvbHYFwwSke2ALAG8LWnYguWU2f
 P0HFMBrZ//sB4MBPirguBI/8FAmsRU9+tX2U2ym/Pyb2VmddAkjnQ7+ZPLBIvBNLtD8PESaAa/H
 V8eqt/sSAs9hUryNXxnq61xKVhafmiaNh1xBtoHRorEGOmUUTHkd50gohim95kLMcz4MPJ2dSFY
 GTDKX9KzUp6cWWXKSLfkGN9G4c5GM+Q/GZm4chNt/EGWccEsoI3Cy5cH07sLH50YnsKsbqw=
X-Google-Smtp-Source: AGHT+IEIlRa6MvkiDqShrKVuauOrvbdiy9MW7oNGqNVt7UGKRMaanKAAnU/UTh+1mKhym4GURsTMIA==
X-Received: by 2002:a17:903:1c3:b0:220:c813:dfcb with SMTP id
 d9443c01a7336-223691f8e70mr232567845ad.39.1741060933474; 
 Mon, 03 Mar 2025 20:02:13 -0800 (PST)
Received: from localhost.localdomain ([185.211.32.216])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22350531a43sm85781605ad.238.2025.03.03.20.02.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Mar 2025 20:02:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 20:01:50 -0800
Message-ID: <20250304040150.92329-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1741060933; x=1741665733; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WE1gV1x71N171ipnLhNQ22UY/VRQGg8a5p5rFcgVens=;
 b=xfyPbAi5YdFsHyiIldrqmKh28b45COWlW9uhwvsOqKMivo2+MCosC8U6rjcCIxW/Xq
 sO48aKmWB2eFhN05KymGAN0bAD6GhSDv9+jBlpzpRr7nM851bXz1Smx38zejhE5J4Hha
 hguPO3Hw0HxeBHcU74qyw9XvN+DPSvNCnfKiRfM/ESmPvtEdiXanfNnrG16rRqt8se/5
 ModMYO3xJA2rn2w8F73YMtLvxIJJk04E4RihJdQfHnFJGf0766iRu57to7MpaZZ+YIfy
 gBNoM9zgqQZAc5+op47uo0KXjGrWil14k5yuhMPjnhhsg6NisSRAI9+1TpqvSjV8ZeBf
 TGdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=xfyPbAi5
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: ignore
 implicit-int warning
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a build failure against some older toolchains.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 3a7c56a3fc..a64d671e95 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -15,7 +15,8 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DRTW_USE_CFG80211_STA_EVENT \
 	-Wno-error=address \
 	-Wno-error=array-bounds \
-	-Wno-error=cast-function-type
+	-Wno-error=cast-function-type \
+	-Wno-error=implicit-int
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
