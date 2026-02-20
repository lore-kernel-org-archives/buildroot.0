Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C68CC531F8
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 01:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A294417DC;
	Fri, 20 Feb 2026 01:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcrfKOYJ0Jjz; Fri, 20 Feb 2026 01:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45485417E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771550642;
	bh=bZMgh7kPriIqYkNj045FUXR8ePbC8bmW+h2cie4Jb+I=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4nkRAW/e0xikbCZU+BMO2WKw2PMITmrysCTkLTRtjji4xdLF4dQsf7RVlF4xlDmS
	 5R0XMy1QJhtLYrOt/tLPRJE8sQrhQKYeenA2SSAEEF04AvlZW2uxDSFDB1Xt/gj5+F
	 EndeJ4N9qDaeJNVE7c4Jha4aGiuXD5bSirPbUbcTRyYIez64YeBgRhlAIe8xJEcZ9d
	 GBp4pFk8rT+9M4WHVTm9n46Stfn0TAUTWYRJ5C6AY4QcdQqLJT2w+lS4RxO7XtzB4H
	 ScXGWe0T+Eb//QjoCDW1YjKJDzamMNvYqWBhOpDd7PmKf+Dc4puBpMXMoxTUZwwRH0
	 bp77BEXPPJnQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45485417E1;
	Fri, 20 Feb 2026 01:24:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A594206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E458983CFA
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRx1DlTDSa2q for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 01:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00B6580EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B6580EC8
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00B6580EC8
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:58 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-824adc96ad2so1565752b3a.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771550638; x=1772155438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DCnqEN2kLrzFrWoS42oZwLM16G3MrQl31B0awYkJ4kw=;
 b=aQNuEcYi8uCBiwxJXuWzYdvGJXLR+krCrWAac65kK0oNFiaiaHnpC9plOFJ16cLTHp
 GQEllCHRvZVH5AMBRAO8JdXxFufRfXj5z/5dOASCrjEIVrDjPHo2vcQbJrbhP4uIXG3Y
 lp+5es9ptunCrSPZQNvbGWFrk1bUwDfx9kYq3+GJL0lTRKapqawsvsz4mfeb9vxPukX9
 +qKwz51RsPQtIO2uWF8o+9f6lGx8CivXKAeF3Dnmu2N5ipPr4ArS83DSv2dxAbcTTzfH
 aM8B/R2R7JTCVCIEUwX1I9ekqR8Sq24kZ/WfdkK8ai/tQhw9YdC60wksS4SY1qKFegC2
 faBQ==
X-Gm-Message-State: AOJu0YzBmTt0lXbA0jh4dpeDFbkDoGa61+rQz447niYJXsK7gb9oiJGM
 1rCYthUivdAECTv3VuUMQrSLw4TMhfNVjvTgNPEKPzY2FpMs5dXuaSvl
X-Gm-Gg: AZuq6aKy5rG8FqKma9ygJyD8OiIG74XY81/W7KfnLTDSoNXTqF3lVK6RD6Ds+7bq3dL
 HiEcXRcgNcLEF0gKrB+M+N4jSzxQyhSfTa94vYiLRiyXtavv9JchbBxHX1HrRd747oCJcUsdz9Q
 PgbpvCMi/Fhfj2TIagQ7DqOEz666F2/HR1Jom7GeOo0KeMSjFwJPE/9hYzDJsb1dl8zAzsYMX/G
 d9M3Ofu8kX5BTAVW7guL3/OofkY5dRfJq1utMKGgy7NAfzODER6o9MmsHu+hjdTHK8CVkenEZyM
 b7nwQ+hukj5dp8p1ge6rYr7kOMwaYvQX31Ke8snhcmBxAFIpZqU51x1KX/4RxiYgATYn1Z1ynRP
 T+PWQPsuWyUKdWOdQl/jlScTj8VuqkgWZG4UE3+Bq5+O2ZBAR872fEa/yhOqsGd8LQm9Rp3DUk+
 svubu/Q2VijaW0unHp8brnHcXILQ==
X-Received: by 2002:a05:6a20:2449:b0:393:39a0:f1be with SMTP id
 adf61e73a8af0-395346d1372mr134929637.74.1771550638056; 
 Thu, 19 Feb 2026 17:23:58 -0800 (PST)
Received: from wash-5.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a627a5sm25606758b3a.27.2026.02.19.17.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 17:23:57 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Feb 2026 17:23:54 -0800
MIME-Version: 1.0
Message-Id: <20260219-virglrenderer-v3-2-e2ff1a23be3f@gmail.com>
References: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
In-Reply-To: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771550636; l=2722;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=vJ6hoxMalLGSlqW90ayTnikn9eMP23Y+H9acht41DFk=;
 b=24l98v4M+6bS49gyimik8LmicMUOpWEEhGerC60toEWZjGQ1qSbkJqDnnvgkd842VPADJ0VtR
 W2ar6eeqqn0AlxD6VcVrg2crv6h8ZZNySW/XM8LR9eDy2gs61YXPaFi
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771550638; x=1772155438; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DCnqEN2kLrzFrWoS42oZwLM16G3MrQl31B0awYkJ4kw=;
 b=XrOAsa3tx3t1oK1fNGMB7o7Adx/F6PpzPnYYjGd1oF9itUvGT2PKW2bwZ+sa4Df28Q
 6bcxHzez6VB5+S+Jg+twuAj370F4KA+4CwhVH75R/mglDXr59/DjcF8Dr++dC6EMDrUA
 haXzxqDcjVU+Psbd0F8qg76+8h4cOE6f7hz6E32ruHM/t0DpvNcaXINB7pO9doPctwQW
 2mKjUE+mr1R5/0XzdGlxXmMBN+0NtpwB5wKdsVw3F5F6X5XcMMsacsara6AgCuP74d/Q
 VUHe+0O1CPbUK8f5fyL+U2ojxGU1DvuvhO7bI+52jvGXvInb9NdP4/IX0/sqFVjoa+YI
 VwtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XrOAsa3t
Subject: [Buildroot] [PATCH v3 2/2] package/qemu: add virglrenderer support
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
 package/qemu/Config.in | 28 ++++++++++++++++++++++++++++
 package/qemu/qemu.mk   | 15 ++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e16eafe446..25921368e9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -116,6 +116,34 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+comment "OpenGL and virglrenderer need an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
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
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # virglrenderer
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
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..e250128dfa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -274,6 +274,20 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
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
@@ -330,7 +344,6 @@ define QEMU_CONFIGURE_CMDS
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
