Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06642C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 10:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD412607AC;
	Tue, 25 Mar 2025 10:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mH0eQ3OvlxQU; Tue, 25 Mar 2025 10:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C389760AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C389760AD9;
	Tue, 25 Mar 2025 10:11:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07C50E0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 10:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED68B40284
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 10:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RK0EG0393-LR for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 10:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.51;
 helo=mail-wm1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05E8C40215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E8C40215
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05E8C40215
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 10:11:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so26458455e9.1
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 03:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742897484; x=1743502284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7jpVbVl8K4M5cakFQlHKVqiZ5tSxNIFUYOpvSaHL0o=;
 b=HJh1SFapxN/7mjkFzZwt7pRNmKuxYonrjY76temTpTWTNA619AC4W2bcW/MtUHg4XL
 Clqfx+9zJCD1elRbgH+R/ipkmrWHTYPlWg+yTZINdi2fx4riSNd9kslxqVQ5m5GGzi63
 hqeBEFAXV6SyiHbbUsuBL8iqCbUBTgx7sYkhbCUaw1F4/LoNDA10j0ciidf/St9PTAEe
 apPH5Vy6kCXVNnSbQDFX79UCQvs2oVfWCs80Zx+eQPai1SaNLfRVwtuUXOH5UiQ8k+Dj
 raAkbf0/+plnj4oi7spr5XJ5WXKC8T6tbE9jI1JexVymoexlNtf3JUrqg7W2zeCBmfEw
 KtwQ==
X-Gm-Message-State: AOJu0YyxKUpNvt0Hop71CZBEAY0qGCafSCXOrnlsVRMFJSDdc1UPF4Ot
 Fe9ZFY0iAaQqYJqEdssvAevV/ftdtF0hLqSiPdp2ZQWdYBbGMRvz/sRrP+Kr
X-Gm-Gg: ASbGncsKrqH29h2RkXFBOuX/B75k29I2EPu2SXeEGimLzRT7NsTBleBjYaEkjInWBKk
 upu8egQUSzbWyoMc5TU66+i3dUEAv3eRDrZEfOnvpT181DAGr8Wt0uXg4RGIK370x19up9y0EUI
 aLtJdSNj1le3asF1FaHrQDJve9KGgX2vX1OeEZy4qF1TxSLFWYkUa59406vZOlDCCT44pgiAl2p
 +6RiPDimAYi173GZaMu9kCASVXomFbmOTd+/3kE64gMaSuWDMJs3xGgiQUI3Fq2tVzqYnycHZTh
 Sjx9ZEQ4B44O/oBVPF87hFvBl3OduaSmvUTTYaRWPhAYdPB/Ot28U507C3XpJL/OUzSyslk1DEu
 kceJnNGiNk5A51qh0vVYzsw==
X-Google-Smtp-Source: AGHT+IEGeOIZQkTdi+J+BImzQL4VAD1werF/FNrWioOy52K79ir9R7418tmDqqT8C47PU6Rd/GdqgA==
X-Received: by 2002:a05:600c:1e04:b0:43b:cd0d:9466 with SMTP id
 5b1f17b1804b1-43d62c6121dmr74243265e9.9.1742897484170; 
 Tue, 25 Mar 2025 03:11:24 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a31a7sm13112621f8f.23.2025.03.25.03.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 03:11:23 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 11:11:14 +0100
Message-ID: <20250325101116.791637-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205163750.6072f1bc@windsurf>
References: <20250205163750.6072f1bc@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/wayland-protocols: bump to 1.42
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
Cc: thomas@devoogdt.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
 - https://lists.freedesktop.org/archives/wayland-devel/2025-January/043966.html
 - https://lists.freedesktop.org/archives/wayland-devel/2025-February/043980.html
 - http://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v1: N/A
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 645d6d8f25..c6fca6cd25 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-December/043920.html
-sha256  e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa  wayland-protocols-1.39.tar.xz
-sha512  480a195ec0846400d93160e3d0a7ba12948ed841835ee4661f54b0101ae0027affd9c0f660a73244786fecd70e4f609830489a6b95e00d750cf2379734aacbe0  wayland-protocols-1.39.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html
+sha256  23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa  wayland-protocols-1.42.tar.xz
+sha512  ce85fecbe886264eaeb34c7992d4e493295f57f6213d5a2ec04b3471daee04a4225b1a7e77a27ccf39306074780553ec1383c55af30cc2c78942b40cc5777c1b  wayland-protocols-1.42.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index b04693978d..b7c5b118e6 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.39
+WAYLAND_PROTOCOLS_VERSION = 1.42
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
