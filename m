Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AEBD5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 16:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BA740401;
	Sat, 13 Dec 2025 16:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Roi5DgD25ntW; Sat, 13 Dec 2025 16:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A861406C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765644915;
	bh=mF8hMsrfJqtHi4ggwHQsbGiqdAiikM1vFAVKBRza7HM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mw/+nP5YK5fRSTsUgjwJds2Bzw+WEGnfb50JITDr7vxP25wPDx+QHMYEhqd14pjHf
	 KcCqrAskYDgBF+H7dYd6OrYL8uQdgrCk7uX+XnuW47Rx0I/+HRQEM1bJI5ylb7C5sL
	 Bv6vMshPwLQ7AR3LNzflB4qWhFuGh3DKM4bROKyeKNz9pi44b91jgOOWIPmN5cAYVW
	 kGzWwzzhTrkzf1IcAM6OcsuMHgwUELV5MXDCx/FTtdn0Bii1mDPjiiesjEJz9gtuJI
	 bl9aaR6uUwyb1h2aJff5n/+iP/AkKjehln6NLCU4cizHdsjKxjWx+5J0t6ETUM7/9R
	 /8GuvU5w7kmkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A861406C1;
	Sat, 13 Dec 2025 16:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CFB313D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 231DE80F08
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKlPs2aIYaAg for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 16:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D65BC80EEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D65BC80EEB
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D65BC80EEB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:55:11 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6498a6f8ab4so3405228a12.3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 08:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765644910; x=1766249710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+VlvTUrxNB4x1NEqL4d6Jjrf+Q9ellbziFNQvYV19E=;
 b=hbAq6N6Oedl9rMBDWMEIo/OEu73UQqAvv6/dYPLFwNlpS3EppJCcM4FnV23eOV0NHh
 VhqkbaCPR7fh33IbzfKnIHFEkLoxKAYxRAXi/MFVoE/YNqppsm7gyd9s2L7Ucvi8arMR
 4JUFtks/J34BHrvG+xJ9IOvglEcvpIkCaj5QQ4kHFyp22XikE/XgvPNguvBWVTqCZY3M
 e0au3N+V7tusPE65GRfqq2n/zwMvSdM6x6aCe42H4BO47p4KJaZy3BYubYkJ/4f1krZC
 ZpXjsuCsYUs+1bFj4w5hGbUaYnf8/SA2NigwBe13kRsbGHyQBoz+767907Kwe8DkfCim
 Df8Q==
X-Gm-Message-State: AOJu0Yz78VIWVNUd/Jwn78f42LacawJxA+UnHbH9iLAQ6J/zEEhlCues
 0iZuKNND5B4tsLuE+osC/B0m6wbbmGUP48bSM+roe4TgJsDWW0Fuc9Gsijr6IA==
X-Gm-Gg: AY/fxX6zoyLwCr0j8FlRrqNlD1d7WyI5G7yQj1xx9axW0BEJD6N/AvR0rxpMXipUmXp
 xZjyB+TlWdlW6fJg4AeGPlKCxtlFB9D3CoIpGnrqYcXj4bA4RjDcrrck7ERHkDkUNgcvfKfHkWd
 F16hYmwjyJlGQe2LihxxRY02WzxM3kgoHiKffe3Ilcc2ugRi7DO0YWdBYSd+xYaW6Wmy5Rg/M2z
 uuTEbCh1HN+HDw1ldZbQMoaXC/tUIoMqqG3LqqrC9/Qec3CqOmxFmT2TevNK765XRl0L0reAHhq
 eN04OHGHwbWgVfSw/m0MYaVboxmj3YXSfuuttJQo0kTwjXHQ3ZsVEgehINd8UDUFx/YH0W6cpJj
 6wtL/zHhSFJ8QQKRl7ri7ESXjmXcWooHiD8Etpj9PPsPRGUgvBFDMg7XtUUd/kXgm26KawEef8R
 Sm
X-Google-Smtp-Source: AGHT+IEircGykis9atpjogpoFI1bh7ddxSWC0kfxc7acyaPwPUBJz8W1BVUX18A0Ql4wtuFxK4TjYA==
X-Received: by 2002:a17:907:3c91:b0:b73:32c7:6e6a with SMTP id
 a640c23a62f3a-b7d23665a3emr552222566b.25.1765644909506; 
 Sat, 13 Dec 2025 08:55:09 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::b4ea])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa570174sm882944066b.55.2025.12.13.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 08:55:08 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sat, 13 Dec 2025 17:52:00 +0000
Message-ID: <20251213175200.745434-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765644910; x=1766249710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l+VlvTUrxNB4x1NEqL4d6Jjrf+Q9ellbziFNQvYV19E=;
 b=Lrcv/PPF3lcAXIu/DxVFHnkl4bmgM8LqnxuVaS0zj6Xdrrj+yo4d2/qYP9L4G7XPPy
 j/OtJvaZwIwNBlquoKnKpE4ij4x3rwYhuPFQdIutCKHXE1tIVLtlxhL8ed7HjfATkbUn
 ttmrfr8V9+IowxH5YNUQKreG3RQplkzEJCcWBd4QGH0YdCzsgqfvbD+G4wI/nTp8O6nj
 cF98+S2+bff1IgKZLwtD4mzi0DF3boJYCj0Vpxb58cf1dEsoPW+dY7mwH3LglGur6LVk
 jhyGsuY02kYa3Qv1gmar8PW/MLvFqOyZdpXLcIC4pNqhHD49QqAIPUYZnflsUxXh1Ura
 ZhaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lrcv/PPF
Subject: [Buildroot] [PATCH v1 1/1] package/xwayland: add nettle and libmd
 as SHA1 providers
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

Xwayland can use either nettle or libmd for SHA1 support. When one of
these libraries is selected, use it as the SHA1 provider.

Also reorder the preferred SHA1 libraries to match the order used by
meson [1].

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/blob/xwayland-24.1.9/meson.build?ref_type=tags#L235-239

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/Config.in   |  8 ++++----
 package/x11r7/xwayland/xwayland.mk | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 9 deletions(-)

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
index 59d607fb5b..98bc74200a 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -69,15 +69,22 @@ else
 XWAYLAND_CONF_OPTS += -Dxselinux=false
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-XWAYLAND_CONF_OPTS += -Dsha1=libcrypto
-XWAYLAND_DEPENDENCIES += openssl
+# The order of the preferred SHA1 libraries should match used by meson.build.
+ifeq ($(BR2_PACKAGE_LIBMD),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libmd
+XWAYLAND_DEPENDENCIES += libmd
+else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libsha1
+XWAYLAND_DEPENDENCIES += libsha1
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libnettle
+XWAYLAND_DEPENDENCIES += nettle
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
 XWAYLAND_DEPENDENCIES += libgcrypt
 else
-XWAYLAND_CONF_OPTS += -Dsha1=libsha1
-XWAYLAND_DEPENDENCIES += libsha1
+XWAYLAND_CONF_OPTS += -Dsha1=libcrypto
+XWAYLAND_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
