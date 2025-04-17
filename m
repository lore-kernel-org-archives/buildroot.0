Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E98DC369C7
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 04:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19AC60C21;
	Thu, 17 Apr 2025 04:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWxtY-KWFFmt; Thu, 17 Apr 2025 04:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 391AC61263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 391AC61263;
	Thu, 17 Apr 2025 04:39:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5FD9444
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6BAC417B0
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQLFtzIjdvyB for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 04:39:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E104740C23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E104740C23
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E104740C23
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 04:39:09 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-ae727e87c26so234403a12.0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744864749; x=1745469549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+c4UhyO1aTFg20vecLyO9OF1Ivy+oTWKbvOHLWAsV4=;
 b=VqDxXyk9Ja+4y62iisvyLbBsbqb+Lxjp6+55UefMi9LeAYSoz0PZ8qOGy4hSSIHOox
 ZGC38Nnwg7AkmBlipECA1Lf0CDVZQiuB9xp3HW4m4wic4YLAhW/Pa8CzA9fGk4UUOt8x
 eWRNvrqPCdtVWBnpNXqHfNO9uGePWcbQLqrWb98gsOD2EHSu/vF0a1Y4x8lSdDjsa6Tm
 lr9kbf7zw4dZl9wLsWWICcisMsvd73CBuACdSCfR35Cr51t5cMuQjrVg+xPcU9EF5LJv
 xHO7/7OzAHbQxrghqgP8p9a1v6qZbgHCWk+gpdZfs3/1XU2735+/4BohVwEAPiwm3f4T
 dfNg==
X-Gm-Message-State: AOJu0Yy3Nlo923JMtYgcY2VpTIAf/ddaU3zfQ4LrJp0vnuCuZs7W022D
 BvROG+qi/CRQP3/3zPv3QJ7TiTNoc8l8wClum0KikJCzNs0C3KjlmnPlQw==
X-Gm-Gg: ASbGncsvn8Z1fELXLJdb0d71laf96VuxQOIEzVqHKSnah9aEI9RCMJrIL86unB6edhp
 p0FSmocg/2l1f7AHBGQjX354I9ALm0hxw6XkflIKWAM4YOQe1JWUq5xvaSTPXob3vSNLhJtDg0a
 VEuovQAV01mE1XbFpvUW4D4H3V2IQLZ3sJPmtlfBfF+o1ZC/oWdzun6mXVyrElohk/u6bDmq1SI
 0mvQjERaP/h4nz8hjCP1RtgeMlHyV3XbSSt8BqiOOUGrIZuy2uFWBLkcsHU03hBLSMuvfc0Tdl0
 NG1AcNOm/j8fvy4UYKJIrA==
X-Google-Smtp-Source: AGHT+IFZIYuKiIyHRWvUotfMzBzYiYNIBFZT2EFepF50EV8tiwbGkz5wTTC7L0dbYB5s9DL/Y/w/TQ==
X-Received: by 2002:a05:6a20:d707:b0:1f5:6abb:7cbb with SMTP id
 adf61e73a8af0-203b3ee91a7mr6158139637.23.1744864748917; 
 Wed, 16 Apr 2025 21:39:08 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd22f0ffcsm11299205b3a.117.2025.04.16.21.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 21:39:08 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 16 Apr 2025 22:38:43 -0600
Message-Id: <20250417043845.2171938-2-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417043845.2171938-1-lancethepants@gmail.com>
References: <20250417043845.2171938-1-lancethepants@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744864749; x=1745469549; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+c4UhyO1aTFg20vecLyO9OF1Ivy+oTWKbvOHLWAsV4=;
 b=S0fNwf/i60laXgfWgshP0gppKhUMcZ60p/fT8miaBkr9akNAAy2L4BlFFccV6utku+
 yGN3lmgw9O1BRH0Nordm8EhQAC4PKphnna4V+7Lxukwm5VrklFfNNv+8cgKxG2IlaiAy
 g8jmfHkfvjmRXRovXn1XwgY/2tJzgQsqCpviW1S0/f4EdM3b0TY8NKm6dQKLSeavYTgT
 PRQo3u2U2KBCNWF4G9vJJwn5ZrLzp8dBqbhyFlG29pQb5yqvjxZDQWk2CcheUsUSJv2s
 tqMlKtRESZZ3hKa6XbBB6gZEdlDPuLhbQzjcQgsFoksQM1WLUJSIbLq6E6KK34OMSPTk
 5cTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S0fNwf/i
Subject: [Buildroot] [PATCH 2/3] package/ubus: bump version to afa57cc
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

From: Lance Fredrickson <lancethepants@gmail.com>

Changelog:

 - afa57cc libubus: add support for using channels
 - d996988 libubus: close file descriptor after sending it from a request
 - 252a9b0 libubus: Make UBUS_* macros work cleanly in C++
 - 65bb027 CMakeLists.txt: bump minimum cmake version
 - f84eb59 libubus: fix initial subscribe with autosubscribe
 - 2b39a27 libubus: fix reconnect with auto subscribe
 - b3e8c4e Add auto subscribe support

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index af70e86e46..e35f37b03d 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0020c808d0ba74b1f4c9514e2b3dfa98ec13a142c97b86b9c229479c560aca19  ubus-f787c97b34894a38b15599886cacbca01271684f-git4.tar.gz
+sha256  ba7602c660cb2c15c0e04942414e4cf3d96622622406c5fc3b88895694aebb9f  ubus-afa57cce0aff82f4a7a0e509d4387ebc23dd3be7-git4.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index cc2ed81786..913c0e3e39 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = f787c97b34894a38b15599886cacbca01271684f
+UBUS_VERSION = afa57cce0aff82f4a7a0e509d4387ebc23dd3be7
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
