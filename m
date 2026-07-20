Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14123C44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 21:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895CC60756;
	Mon, 20 Jul 2026 21:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sRth83u-z_4; Mon, 20 Jul 2026 21:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0899960737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784582562;
	bh=dWip3u4Ne/CcnvRtCKp5ooFOzE5R6VvSOaHfw8tN124=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyHTgi7UdJsVtgla3p20Je7yzlUAvpIdeC/TNs9URRT/+XNDWKW3QV3gvcMUDJ6+v
	 YNkH/r3bmMSrUMC0rXryPc/Nv1h/5rSl7ZA2Stw3C9wI5GJWcCD+2iumBEZMR57faJ
	 /jFcYaSL8ZLRkIcLNBkA6r6BxXy9YheYRsuuCzO1M+VsMI7T+chLgUpfYhwJxZ/DjU
	 L+a/NkmD4AMJRpnyTq/PZGsCmoDZoLXQvKyHj/8bWvJlU0veGkhKNeDnOoRGV5iaV1
	 R/1f5jeVsrO5WTGPgo/KBD1dmtZNcWM/alicViYZAeoLHVUd2pccsGHmnMCYv7UyWf
	 fmcFdeOUujtXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0899960737;
	Mon, 20 Jul 2026 21:22:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31772313
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17469404F5
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYe493GgVdWu for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 21:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::1;
 helo=mail-ed2-x01.google.com; envelope-from=thi.zirnstein@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19475404EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19475404EE
Received: from mail-ed2-x01.google.com (mail-ed2-x01.google.com
 [IPv6:2a00:1450:4864:33::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19475404EE
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:22:39 +0000 (UTC)
Received: by mail-ed2-x01.google.com with SMTP id
 4fb4d7f45d1cf-69a75ad755cso3397750a12.0
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 14:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784582558; x=1785187358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rZpUL4+pobTLjxR56KMqLHY2ZgDR/gSXZx8J1oIRtJY=;
 b=RDQeTQ9DGNOckD900u65PoQ5go56+uhilRr2DA1E43jDkToJ67se8Bkr62e/fk5ZhE
 Wf8cprJxHfRerlnTdieCNwmpQk4EWDYDJXKAHDjEOFZ40NfePke3rHrmeKTbSxLnUHiQ
 BajjETFWgN7ALUKNR6S71Qz4D2iR+bb4FvdYNosool6y0SGgvhLz9mWo30vCyJ1QaCTf
 hZTdI+weGTzsWKZ8KcxXdwoScnWAdqet9H0iiKQSKvfzTxaAsEDkQOdkMSB8PR0T4Wcz
 NL8J43r3w/pvs9yAh5VXAqUczIj5O/qTSLQmmq8OHXFAlJBbcSMyJkxFM3knnH3ZEV4I
 n6JA==
X-Gm-Message-State: AOJu0YxmrPkzNZDeleh+cozIfVSLpvI4KNJhxoYZm4j1Oe9KrjAHGgK4
 mtusnUsbqkhBQVLGG5n7e5OXEjbUwAFjXmx7KV4JT80rymm8WaQN11UhbdkwuyXj
X-Gm-Gg: AR+sD12K1AzejIDirNY9v36xOK3kpalI2hVTAwKxqlQHufwdaGMBhUfvAzDCeNBOhx7
 Awbrrki971aaEz+lOs7+kOWNCmc20fzqvMAWj5HmDLTBwVXNA0gUgEJz3N6LO7Qi5geuNGdZEtp
 7FmuNelduj0Ri9VyJ0/8ySxSSEfXeCDGJ5I5qiQbgTNTcAHHBjt6U0sxPgXl+r85JABkaIYLES/
 b2WxMpTsxKwx3ZZdp4vTGIW8zFKP5GipvW/esobT41dim7QBYg2WJPPjZin00bQ31V0vVvPyL6V
 MuP94dIVAcMHJZbfBBazRXdtTihGQVRutpOD0gz6kBjp+u8LXWpEg9cjhPEMIROgJZAWQPeC9ZR
 w8u0LR3xqgRjYB6q6h/iqsPo5FE/HyIDLsDA/4J58pjL/vg/wcSBr90KHnAXLiz+9IRIfvto4eh
 v/2ihoHPDS8SuE6gSWRxD9+LgjIHwkwgt5T/t0DM0tjSa7mu0GmQWBogH7Xpfg2pbTD/3dVyQSN
 gg=
X-Received: by 2002:a05:6402:268c:b0:697:dc26:340c with SMTP id
 4fb4d7f45d1cf-69e652730d6mr5564045a12.12.1784582557813; 
 Mon, 20 Jul 2026 14:22:37 -0700 (PDT)
Received: from thi-server.fritz.box
 (dslb-092-074-131-218.092.074.pools.vodafone-ip.de. [92.74.131.218])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69e6fff71d7sm5071405a12.27.2026.07.20.14.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 14:22:36 -0700 (PDT)
From: thilo zirnstein <thi.zirnstein@gmail.com>
To: buildroot@buildroot.org
Cc: thilo zirnstein <thi.zirnstein@gmail.com>
Date: Mon, 20 Jul 2026 23:22:23 +0200
Message-ID: <20260720212223.551236-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720212223.551236-1-thi.zirnstein@gmail.com>
References: <20260720212223.551236-1-thi.zirnstein@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784582558; x=1785187358; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rZpUL4+pobTLjxR56KMqLHY2ZgDR/gSXZx8J1oIRtJY=;
 b=SU0u+7UeLQJlqTECpNDC/WWt/9rvRMQJWfWaSGexWxXUTCCIBypRcqDjCRYf/giJIX
 OE79wYxhUqG2P9sipElsbgf9g1LwvyPLV+6C30Vkyfiv8KgWgXHFGjGHpNckEZ0/m/MB
 +hqo46Tb+5mrV/uL9pWlEIKFuWvvK/j+KOxJhDVRos5aNCrsKivMueaXlSOTJbS1/ITw
 20wz4z7DRrWFHzMwlil6PSQkO8/BV/L6cgueX6T4bF4v3kvzkjw9F+FWEkQZtCuSorXs
 5wNEioEu4j4Ld4gwxVo1UbWPxFCWSwXLyGaajtMf/XaVEPt/LRdmHXJKEH5e+t2IRuto
 9+Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SU0u+7Ue
Subject: [Buildroot] [PATCH v1 1/1] linux: add host-pahole to linux make
 flags
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

Signed-off-by: thilo zirnstein <thi.zirnstein@gmail.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e790daff66..1b9f1192b0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
+LINUX_MAKE_FLAGS += PAHOLE=$(HOST_DIR)/bin/pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
