Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00036FF6E8F
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB51881280;
	Tue, 17 Mar 2026 22:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhDYYU0JBke7; Tue, 17 Mar 2026 22:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B774680E56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785799;
	bh=g6QE3eQTAr/WOEosLOXmtN/JsLY5ZczFHuADSG5/In8=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIhsplWiGe2uxKJ+JiGx+1jLOeJkITbVa+TS/LNGGN4SoI8IPfWJn0zM1SvsnP9wT
	 GO8ZJXpGyI0NU2kPtMItycAoB0h0xPORn8ZAFNJH8wqJNliILuPIBh2Lw1aUHSUsBu
	 IBaTN5E08Wr77vuAMSqmdsvB7B0uhQ/BLz2OMS32utbZnIPsQdbNp2Wco+VTZkwHrp
	 8aunD2X2ukJEnOeMP+u5jB09AzuOHML8uM65R4jBoLqxxg4mrCcHr+DJu6dlnelUnz
	 tPtvsfZGyXQNuwB02IgHMbdZ8rEsU2mPPH5J46CveSFW6atOXmIFqG4OED1XjIDDni
	 lacD8QXNyD/Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B774680E56;
	Tue, 17 Mar 2026 22:16:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D843BE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 779BA40E6E
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SiwREZ9CGXi for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 918AE41058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918AE41058
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 918AE41058
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-35a288a2c00so2169185a91.2
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785793; x=1774390593;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PniJoQt6PFBrGzIThlZRaRv/aNjgoG2T9+nM0GuteQo=;
 b=TnoHi3+EGAQJjSjINDU+Qn78sKcpkf3PMtDub4/9+fBsMVVh95Gdr+d8eKuBERn0Ey
 cxvv2zo+HhruR9cFMXhktET+eSTjxb6PXj6/dKzkakprYJGWf8gv/Fn/Q3bjAybTb26I
 AxRJ+g1LNXiKRgiQxnyGuGpG16mnjbx5kjaHGR14x8VGmk0D+m+B11eRihfaUq6v4d6M
 qQ4fc9W95zITiF389+U8dnP70htnBkDoPPYbxn2YEpdgZJ6liHIm9McFKea2fVu8j9AA
 KqXbDpmTOxkbOaIPbttA2IhbecnCWgIDOSBV3K7DhTzHl5WwJAGW6tx3P69ecLNGy+f2
 oO7A==
X-Gm-Message-State: AOJu0YyWJYRB8rCcg3Wgmq/g3KknsR/JpGgg2zpY7qFm1rD6QRMwtbT/
 L6EwzmuCBdbMFUiyThHCO7nzIwobdnjF2zSmR6Nw452NI+DNEAu3hik7
X-Gm-Gg: ATEYQzw7kYEqKQiFCeXUb9JmYG9tfM3ySar/yBbVzw23m59bmjJgz5Q5VyxJwwwwvFy
 ma91YFeWhitdouS3Hu6CMDOUKHjr05bQwLFSX+Yw2wd6mnmzNuiqvxGHvzSzX1detASEVWvltc6
 tTAK+4YHVL8RTKprTboZofAYYZseSNxWe0zwD8PA9r34+Wfusn0G/gz1dgUOtVg0JqvXDnYaQOj
 9I8w5fV3UGLjB3NDkVVn6+kQa14ghzhsICdX3ccBenfjw3RpUQPsmkRaY3CLrimatuqy5DddT+m
 yFiOs/vwnSfaVIaP/1vY7RVZxdpCAie1HJizyPUcNkXg+lXkH3/synwNu25XCBUsMHUSHT7a8Ye
 zjZpukxZayP3pENbUuLmvkm2TUqqLBf2zcE7OrI0WNHUCEyhrq5PQfUzV8VotkfaE7a6s9kN2ni
 8byNb3LEIDw9/wBwxJOJG1yTd/eho=
X-Received: by 2002:a17:90b:2692:b0:359:1063:6aed with SMTP id
 98e67ed59e1d1-35bb9f2e111mr822415a91.22.1773785792701; 
 Tue, 17 Mar 2026 15:16:32 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bada2bfdbsm3997231a91.3.2026.03.17.15.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 15:16:32 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2026 15:16:26 -0700
MIME-Version: 1.0
Message-Id: <20260317-virglrenderer-v4-5-ed223e222bb6@gmail.com>
References: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
In-Reply-To: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773785788; l=1963;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=oXrfJJrLQt38G4PEoQkXW3ciA3iL7STlKnB2vQP4Tsk=;
 b=dCzNxHwlh3ks8GmWowGoHc6NHuG2SK6ngDSkur1oowMcFEJOLxUtADUl4V2QSVOG4PHdedAJX
 31iqVkNjGvxAWG8vGrBf6hEyFG4tqyhAHEqotQl8xiNumJDRlKSSkA1
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773785793; x=1774390593; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PniJoQt6PFBrGzIThlZRaRv/aNjgoG2T9+nM0GuteQo=;
 b=iv/J/z4n98KWWF5fGipvDaofXk0LCAw0lau2o0oRztFMjS2Zru/Y+4fc8LPPFp0YHx
 w/9LvvkB5Z//esqHXhr4pmAJuIhz3xvlmZlkuJFqrdWN3KE/ydTcfOq8cBTxfcw+eDSk
 7/RTWiUb5GTVFUifeO6RWUYlVsO+F5tPKOx1cG+lBF/cekxkP0ij063H4kuF6BXvDYdT
 D7jaGvhZdi4Q/0IpPfhRa1lkMyGZOTHstVW69wfwzHtYJEbcl89opYfesY1vhQqjs2vP
 HrHcrcJEknVNLFQ9PQO4dKqPvOWN/BDSg1OhsbcWj4DYO4uL7ytqZeLEcvleFU1Tof+A
 HNSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iv/J/z4n
Subject: [Buildroot] [PATCH v4 5/5] package/qemu: add virglrenderer support
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

Add optional virglrenderer support, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 17 +++++++++++++++++
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e4e8eb3b63..599bcb11bb 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -130,6 +130,23 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QEMU_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable virglrenderer, enabling GL and Vulkan
+	  passthrough from the host to the guest through virtio-gpu.
+	  This enables the guest to have accelerated GL and/or Vulkan.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+comment "virglrenderer needs OpenGL accelerated display frontend support"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9b780797fa..e250128dfa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -281,6 +281,13 @@ else
 QEMU_OPTS += --disable-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
+QEMU_OPTS += --enable-virglrenderer
+QEMU_DEPENDENCIES += virglrenderer
+else
+QEMU_OPTS += --disable-virglrenderer
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
