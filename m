Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27528D3398C
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 16:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFE860672;
	Fri,  5 Dec 2025 16:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzvQIvwd612d; Fri,  5 Dec 2025 16:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA544606F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764951710;
	bh=iiinLikcy1f0KUWqCh2zqwUSVwnvqC3ZfukLtSpUQQQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WUcrJLSpJEHAL/xGD13llPxVOirTwCevItvGOBkK0hwvjzJr+EwDUcH9W3GOUwECY
	 sHuqguhdtntW/BzAjA3q1YREm6S8+kiNhCO8EAks/ii/+5ThxZPUuKHUu3umwOVDR/
	 wyhj5ZT8Yc0QxIG5/Hn4x0/uv7spIhhrH/lLH/pzPkuR6RRg12YLsfA2gdgiIca1Ob
	 JV0XLxYSDiqRU9aCkKGJxenNKDMOyUe/BWKROokSqTC/5orcRdwkRyWKcfW8SBnxqL
	 qaOPbJYKKqPUuCzPtHg8BOfQ/s283wbecaK8Rt2Q9n42c0Qhr89/dWis1y4CTjn3nw
	 YUabI6Bbsa3Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA544606F1;
	Fri,  5 Dec 2025 16:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C06A1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE8B606F1
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAaQxDm9pZGL for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 16:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B65A60672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B65A60672
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B65A60672
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:21:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so16013875e9.1
 for <buildroot@buildroot.org>; Fri, 05 Dec 2025 08:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764951706; x=1765556506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/N2Lv5n5jC8oMS6uFHNLMI/+K7i0xQdUl3hiEZVoqkA=;
 b=wwaejMoHUU4vjlz99Fae6g4aYIXb14VzqNTHzqEngEi67dU8oZaZ0ncxj37/+8gqpv
 uZK3yn/zUVFap8tOXQQsNhXJmeWBVyFO5pxnG7E4aVGFrZPDKngwEqxiIbvzR/zJax8w
 /KJtJcW7iXvVcyJmhiNXDSKUSmBWjuedkYfJPCZ6KR7A2Ler+UnA9unhmq2KSiKDdoog
 VW9HqpVkr58DmGL12jA4TjHkS2LsiTn1/pSDpK20hY4QNbOdrBf10y86g2U1B7QPvyZe
 GResg9kDleAPJk7IWZB4lNp+H038ZNIZ5KjetDZtCOBH53HVFk40ZM7rGlnkmYRzdxci
 yMcA==
X-Gm-Message-State: AOJu0YwphGx00dcYCBnVH6hm6Eci5y7krghH+NcOGB03Rb68d3hkcsti
 0w8kqNab6KB8RMg9T7mBsCdITUVejk5OjV8nvcheHsQNJARrwkVV53K40IkK9A==
X-Gm-Gg: ASbGncvQH7N+oNPG9WY+2HvNQkAPkSqlgF9NwlnL+wweRf5pcMiiHLOI56D1kD/OCW0
 IC2V1b2H8ZE/jskRlxl/XllQYwxEfR0tkrLjYeTEwdySYKwQ0AiWKHiNuyCwMV6IfSiCRjQISm7
 NhTsyi1IFQ+CTjGAn7uwD+v9pSSEOEkfkhaIcWZJGb3uG8gayJoHZ+0kHNTfNvdSCfyZqccfl4R
 950oSBiSVLsLBW37OZR0+zsiDMNGOo6geZYBS2/MF8dxDfsQ1jL11r0pUwhf62uL9nkJC/qd0Kg
 V0ko+Kq8xUfWmrQuzx7QW8m9EOQNWoknfGP7xAqAL/yZi0HYJmFoMTiPNcLk3meiSa+nPojZLwa
 khAGC/GJwLyAKzYLS3NcvjgRRNkSVkcC81o3rKjA98JLW1K4QPZp6fbU9fyYftNJ0bISd8DyOxb
 xY
X-Google-Smtp-Source: AGHT+IFkaccE8ZabS3WfIewsrfPDisD+Q4Kbz/H0kBUXjXMHg1Z2bCT7RU9MCw6jLKL2NvmFq9s2Pw==
X-Received: by 2002:a05:600c:4216:b0:479:33be:b23e with SMTP id
 5b1f17b1804b1-47933beb24amr24690685e9.17.1764951706293; 
 Fri, 05 Dec 2025 08:21:46 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::daa5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47930c7473bsm147449955e9.10.2025.12.05.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 08:21:45 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  5 Dec 2025 17:18:36 +0000
Message-ID: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764951706; x=1765556506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/N2Lv5n5jC8oMS6uFHNLMI/+K7i0xQdUl3hiEZVoqkA=;
 b=g6c6YwlPZQ5omDKZy1XJ7nSDyKvvVvQ2r3MzBid5R+Dx4aFojcVjGXUb7bTV7nSY3w
 Q3YatyoKaBbsGzfAqvFYDMNRrIBofR99wCKE3hlwCYnqotV3QAk/IXf7JBbQpQhdGoP6
 ++KXegTgPRMrp0s3aI8gNWlpDF9TnQqrRCv77qZFz6riASbAms1iyY/ZzND6E9756Rz/
 BoJ6OVbprKfqRsXg6i92VxhAyWWMRGC0qYd/Uclld2GT2/ouSAQPH54CHN0U4fCMQW/d
 ZUFFoygqKOMANESYtJc+aRyqDjJGQnuHucS92+At55ksdMsIotqXbYKUmd+YdEO4Olp+
 O0VQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g6c6YwlP
Subject: [Buildroot] [PATCH v1 1/2] package/xwayland: add nettle and libmd
 as sha1 libraries
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

nettle or libdm can be used for sha1 library. Therefore, if one of those
libraries is selected, then use it.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/Config.in   | 8 ++++----
 package/x11r7/xwayland/xwayland.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 311dae25ec..3df8677545 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_XWAYLAND
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	# We need a SHA1 implementation. If either openssl or
-	# libgcrypt are already part of the build, we'll use one of
-	# them, otherwise, use the small libsha1 library.
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	# We need a SHA1 implementation. If either openssl, libgcrypt, nettle or
+	# libsha1 are already part of the build, we'll use one of them,
+	# otherwise, use the small libmd library.
+	select BR2_PACKAGE_LIBMD if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_NETTLE && !BR2_PACKAGE_LIBSHA1)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index e3b6727c19..b0cb893ea1 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -75,9 +75,15 @@ XWAYLAND_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
 XWAYLAND_DEPENDENCIES += libgcrypt
-else
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libnettle
+XWAYLAND_DEPENDENCIES += nettle
+else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libsha1
 XWAYLAND_DEPENDENCIES += libsha1
+else
+XWAYLAND_CONF_OPTS += -Dsha1=libmd
+XWAYLAND_DEPENDENCIES += libmd
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
