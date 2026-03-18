Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB9F1077619
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794A140AA7;
	Wed, 18 Mar 2026 20:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czTFtGCAqQbg; Wed, 18 Mar 2026 20:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA98B40B98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773866313;
	bh=+9l4hmGnx+PkxG/awWl0byQIgXlh8cvCuxAmf7SJcM0=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOqsz9LeSxh/QLJ49wgvWWsb49Nqebu+xXz4ZX24Gmri0L3nSjYmZr0yj/4RqGmCG
	 Sj9L09dKdFQXs2zN6L7wdjYD/8nzLH9O5Yt0DSw3PIDZ5OFlZ96BFOd4WkLEhMYFIm
	 kXPa1SniyYBgqpGqBEaHBS2NI8lcYo0bVK1e69ZOwZ3Jg3FEkOTH3u6yhQevsMvdLM
	 RQr18BN4huhWMdbbWgkVTWFigOcaJtKg8WUg1IbnOE3TaspurKiEE1yqHZjVSL2ede
	 btt2rqE3TrReuAN2NiSAPY2KuFU6ZtUCjqOcSCgwVxEE4qUwYHndTe6Za3gwaHcauu
	 GRzqNLzRtxs8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA98B40B98;
	Wed, 18 Mar 2026 20:38:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 272A31BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5534C40AA7
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89QqtKOr3JQC for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2C5940AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C5940AA0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2C5940AA0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:28 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-82a7ebc729dso14821b3a.3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 13:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773866308; x=1774471108;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ka91KT0AFgiEwGpIO8T9bwV1OAizoCc9VM60gXWetLM=;
 b=RkKs3vxkG1SN0shC8E2fiysBGoTexk3iAVCe/vuJuHulVI2xieCiZq6qrSi0bZs5N/
 IvSAbRez9bgMfrpVw5i1HFM0kmmbjN6oWYVKBkF05GUhhVegqBeckvx8kcmH2do/+24T
 oywyFwReum+HeKqjMwZQAwYiagoITtDZQ270eKUa/vw84uWdBvjxm+KfmVKonVK3Faed
 ujBuM3fFl4NmkJnprWsP6kkiShErz5Y9FLG7HJKea678iw8ZL25HmOm+uoVX5q69EJHb
 y+cxmGilGxq2jrIZVq0/eZ7+LsvvyzmiJt5CUpuuqI9YmBCTWqFlPD7+IFjS2CBNXZGD
 IxxQ==
X-Gm-Message-State: AOJu0YySXIxhYGxOdTkUsyte0iMEitxvcIFourTpiYEO3y/iWaoeURyk
 INRLmFTrTpzlkNyuGq1CKVMkUfBWPmQB5b8i6ZaSxWWAyEYAs3/I8O1XC8CRIxd8YAs=
X-Gm-Gg: ATEYQzwktmlQi0jQASKkrr5DT2W+tpr7yj2+6sSYzl1jd7p26oqO24RrtHeTjTEuLb5
 EOVsjAKqP3cNyMJZrdurNzoBO4SxFWRXeQbS07c9kBieLzi/YNh2tB4X1ZbPpObDh9PobpoJRUj
 YDqqyjb3zHADIoPj/yXxtfz24o0eL6buhg1eaPjyQ9PH21J3Tgc2veEkpYWH7Vv0DsUWCW7lEdc
 N51OkD6fz4wClkP5EgpQxBzu2xQIdMU4Lw3ZcS10DUYGebZbQg+ZQNtzY7s9y72Vrprr4Vj3eYz
 2IGd7Ak8QvzpG05k0laBu8ANR48OcntKYG5yzZZtlLfk6lFjPMkOzRQnKTT051IzZOue8EZltrx
 KIJQR51YLxS80qfYrVeeNyC8R2W5WalLqG30zjiA6xok5KyPUCAyVjXlmQ/usPSLG1MsG4l1PNs
 A9BfkNjGZNAqqzC8IGW2DWCoOcoMQ=
X-Received: by 2002:a05:6a00:2e16:b0:800:8fdf:1a54 with SMTP id
 d2e1a72fcca58-82a6ae6d191mr4828598b3a.34.1773866307896; 
 Wed, 18 Mar 2026 13:38:27 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b56ac50sm4636143b3a.16.2026.03.18.13.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 13:38:27 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Mar 2026 13:38:00 -0700
MIME-Version: 1.0
Message-Id: <20260318-virglrenderer-v5-4-09a3274852d6@gmail.com>
References: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
In-Reply-To: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866304; l=1764;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=GQ2USBpCC4toY0FwGBarUnG/ifhp5lt1NMCBNcFQz5U=;
 b=J/WWFhem2nAfgzWgD9xLqDRSmL1F39RyNPQHZmkaZC/xiHr7c/gvK5/oEcG+9QRK/MhzqBcua
 2oD1dTLWs3TDCScgb25bGG6GgS3KZtyv4dQ99dOqppk+tI8WTkGuAOx
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773866308; x=1774471108; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ka91KT0AFgiEwGpIO8T9bwV1OAizoCc9VM60gXWetLM=;
 b=X+hWPgyl47mzYhsJd2YfKcI99mB4R07ECSPAKzHUjUnoRvMR/RLh7X4Bm8Dm34t0kv
 mViS7tUT0RtKqMEAmM1N/9HZkCcLzUeHwi/pyQ9En8v3ulW5k0EROSEyweD3bykI6ydh
 EJQFtjdHphglxQ4wfqBExL1xNL8IP41BSMiZa3NIL9+sn5igXLWFZVZi+w+hrvemHbdg
 LH8P82Tpy2eb4vICufjQqa0j66AQweYfqe8FNYzZa15x43aGcuu//0h5uiWnaEAO2FR3
 I5V9uW90PevuQE9XRwn47Gg9PfXqlAPKzQ5rJluPf+VqHk6r7pl4nH+mwzB14XQ4t8U2
 hi3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X+hWPgyl
Subject: [Buildroot] [PATCH v5 4/5] package/qemu: add OpenGL config
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

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e16eafe446..e4e8eb3b63 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -116,6 +116,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..9b780797fa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -274,6 +274,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -330,7 +337,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
