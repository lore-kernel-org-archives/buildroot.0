Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F2C52D6F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 05:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 783C140205;
	Tue, 27 Aug 2024 05:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39UAyZgjbY2B; Tue, 27 Aug 2024 05:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE8940218
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DE8940218;
	Tue, 27 Aug 2024 05:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 287251BF2BD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 05:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15C1E605FC
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 05:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhFIFW0S3dlr for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 05:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 386CA600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 386CA600B8
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 386CA600B8
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 05:16:52 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5d5cbe88f70so3808071eaf.0
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 22:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724735812; x=1725340612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4xA9nTMxUQJoD+lXJl0ECSa7AQ/Jm1NmcZtB4ohpSb4=;
 b=Iel90JtO1fsY+AcfGq6t8PHc12K4/Qx67AWRsbL0LfvbV471LRZ2SEcCV1TkCGX2DL
 JVpBEMvlvBWIsHuHDXur3o63K9ZySePqiSxILQhTDEvGMRbwbIELxr27LXAx3psNMJv3
 sag61Z6AA4W/5JnyP0DC1Y2F+zuNZdgJsEm0zK33ENluJQI1/kyuiW6hlsgbSBW7JwsX
 HA8d3vvnGu0796QsP5q/WzMi+jncJ+nijLBXomrQ/JgovmmHDmAogdMeByKdNcGBdp2b
 BXzfttxaIFyjaAXX3qgjWJ2HrzHyI/04PCjAoWdFObmTWdbU2QIaTaQYFxCfFtbGd2UZ
 hNJg==
X-Gm-Message-State: AOJu0YycgPwQQJp+dHznTCXXHBvdjJaJYK9ogkn6bOsA5wny7i2jm+w4
 rkyMUi4ICnvuXB5XF7U0QtuREMkCgvlZHqKahrEkGEkGXSuhn4Nsm5Ccg9f4RC4=
X-Google-Smtp-Source: AGHT+IH2IBAAJZ1msrmhylAhnL+xYSmDb9Kxtnw7CDJQncxJrm50J6CXehyXP2xeC6AZ4bxaQnjN6g==
X-Received: by 2002:a05:6870:a68b:b0:264:9161:82e8 with SMTP id
 586e51a60fabf-273e668c85emr15759336fac.41.1724735811791; 
 Mon, 26 Aug 2024 22:16:51 -0700 (PDT)
Received: from toolbox.wdc.com ([129.253.180.115])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9ad56c5esm8515946a12.75.2024.08.26.22.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 22:16:51 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 15:16:31 +1000
Message-ID: <20240827051631.234377-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724735812; x=1725340612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4xA9nTMxUQJoD+lXJl0ECSa7AQ/Jm1NmcZtB4ohpSb4=;
 b=QnzzMBXinYgOw5rxJ85JXZM+yE3FMxwbGcMpm7E7YzHCQ/wK5IoHJtgK6NVNm7sTWQ
 6hgAIRhHiFOh+Mi7gwqNSjtK68kPEDWqUSwBDqQ4tFTWKua5yDQjRXErPl7p1lr8PN3G
 T1d8wR8sOQrAmPfdDhsZnAJpVzgH4r29fA4qjr7DMC2KybfWPUbyo1mms9ZkFQFMkP9i
 +wBytPxHZD/LCm7gos0Zo+T+jjIUhR68bb0WDpNg/ZTQZ/FPiJuYjDGkNClH324GKJ7b
 hZDx/AD1XdKnvyfQw1kGqCH2KkrYv1wu5Mj2jEeGQQ/wYakUQQXMp3yYWKbL4oFEoogI
 oE6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QnzzMBXi
Subject: [Buildroot] [PATCH] package/libspdm: Support spdm_context in the HAL
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
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This allows us to build libspdm with support for `spdm-context` in the
HAL functions. This is required by `spdm-utils`, this macro will be
dissolved in libspdm 4.x, with this feature being defaulted on.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/libspdm/libspdm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index e86a79ed67..2a76892737 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -20,7 +20,8 @@ LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 LIBSPDM_CFLAGS = \
 	$(TARGET_CFLAGS) \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
-	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
+	-DLIBSPDM_HAL_PASS_SPDM_CONTEXT=1
 
 LIBSPDM_CONF_OPTS = \
 	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
