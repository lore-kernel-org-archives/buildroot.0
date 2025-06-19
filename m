Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6D1C71157
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 00:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6950740C21;
	Thu, 19 Jun 2025 00:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POdjQrU1e5qc; Thu, 19 Jun 2025 00:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579B640C52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579B640C52;
	Thu, 19 Jun 2025 00:59:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE94FE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A45B260B92
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zv37rQyH49mH for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 00:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB9E760A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB9E760A93
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB9E760A93
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-234c5b57557so3132825ad.3
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 17:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750294775; x=1750899575;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jg0JF6IlJTU/ZEGnmcXhkykD6dYHUqySaX2PKKSYNos=;
 b=mGzsiL3AimKukn+WofYmOObuij6kcXMm7Cs6GjaX3nEgDoj8wgxEfb43fpXje831ub
 HJOfSGhZXf5ut9YzwEjC3wRXy4nAlrjvAy7rtifZjB1tqPi5mR/JRcV9M3GoC/g3BQQM
 ZxF1BgyyUIOYLW43N4AD2Ei55GcYzwOfjwjwbMaL//V6FTdf1OspsFHIBQbaEPIFw8NB
 SAR7YtNdYyp7H6Cov0Z2nAf7ZcDsLIfyQA+z5rYF5xb4BgYFalSr5B9+xubEmJ0A34Vq
 +qS0WfKw6a096YodMgnCxsWe4DBIjYdKGf9Tz4vSvDHHWbV1RfkXl46QdQA15GpIWP3A
 c+1A==
X-Gm-Message-State: AOJu0Yy4g/3TqoC/872uFJqmT+g1ern9ypZfvbW4kCubQSs9nKhXsvTw
 HEJlut9Y9U1KiAgldmtJbgk/2T04HwHqwfS1e+lyrK5z06MMPdeDTrsvqTzqQo4V
X-Gm-Gg: ASbGnctog66133gRRifC7bpTqC+s7NCIMDUYeg23URGCfNfinxIr5AaJQtWphOJuLg8
 DYuI9tYlCrrexC8a/OuEKPF4ewFCdEhpRIPOb601E5E31ROSMGegLhloLKPCZDXbqfurNMKhrbd
 SqU/oPnAkn537590id0AHzFpPO2ttUdUTSEGKyU+qn1+6qYGhqlkF10g5wugcqw1KXBAnbeRH83
 FdnErPaDP7kwhpIo02qljhE/xOq55YxQMC5/3ROhMwOttEXByR+lFuiV4BLyJe3uuI+O6Fz/jdH
 dEL6hxjKssG1U9BJBG9KeZiuAhskKoacYBlKew0ABRVbShd/shi7ERQNwOZ4Ow==
X-Google-Smtp-Source: AGHT+IHMufWdMGo/1EojMHn2Hi18/msjdo1vmAa3rBGShgnqjcekuLgU67aB2j9qW1p9tyYNp7yAjg==
X-Received: by 2002:a17:902:d58d:b0:235:6f7:b918 with SMTP id
 d9443c01a7336-2366b3c5bdamr335878505ad.28.1750294774958; 
 Wed, 18 Jun 2025 17:59:34 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb87ddsm107884165ad.177.2025.06.18.17.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 17:59:34 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Jun 2025 17:59:32 -0700
MIME-Version: 1.0
Message-Id: <20250618-virglrenderer-upstream-v1-3-57525ac8406e@gmail.com>
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
In-Reply-To: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750294775; x=1750899575; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jg0JF6IlJTU/ZEGnmcXhkykD6dYHUqySaX2PKKSYNos=;
 b=cqVyU7+BSLBdrkhXTFXW0PntZp9DV7guwKK5unFL7RbBxRv3S/p405q2aLBlbqIDNB
 0aY3mL0b0V8ehQAG8gCZDZ/9vT2yNw88pGs9yshwy3wqiG01zkMlMTaoWSXxpFa9DqbE
 x9pdqKHa4IZLfehllbJ/Qok28N4MIVBP91IvrEzGpnW7EobVlvucJQdCturewBRO2n04
 zSjCpWVogqj8KTl859H23I+Eir7Ev8Pg1y4Tkj9sQggVVREvbEZvjJ6nt4i0l35jd/4I
 YBWyPhxPGdGftcsPSQ3RYjuYR+TrTSvbu+xsX48ix04t1Kwp0G0+mKLh2U5tPqGR7FPZ
 1d8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cqVyU7+B
Subject: [Buildroot] [PATCH 3/3] package/qemu: add virglrenderer support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add optional virglrenderer support.

This feature isn't very useful with opengl disabled, so enable that
too.

https://www.qemu.org/docs/master/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 12 ++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2d15ab1ea9c7889939e3fa4c532f3403c26edaed..334f1dcf5f68a2b3c5e72b4e67e68f94ac665e33 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -100,6 +100,18 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+comment "OpenGL and virglrenderer need an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HASLIBGL)
+
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # virglrenderer
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable virglrenderer, enabling GL and
+	  Vulkan passthrough from the host to the guest
+	  through virtio-gpu.
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fdc8591e546ab6b96fdb02b3742b75f587be239f..4221e027c07924f681359179692743420ffaa38e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -261,6 +261,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
+QEMU_OPTS += --enable-virglrenderer --enable-opengl
+QEMU_DEPENDENCIES += virglrenderer libepoxy
+else
+QEMU_OPTS += --disable-virglrenderer --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -310,7 +317,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
