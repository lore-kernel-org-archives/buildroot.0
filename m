Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BEAD1CDD2
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882A280FFB;
	Thu,  4 Dec 2025 04:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIPiPbRX4ZDJ; Thu,  4 Dec 2025 04:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8192C81188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764822617;
	bh=4NDeBATYYFpeoQu3K+P1cakfc9UxiCA2Bf6jcclZ7xU=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BhSof7TI18QWDnde5BKhIRPJwSaQSF+wRJeuOrBu9Zol2sVTPL7CfOBGpMRLc2qtt
	 UXyL4H2t/DZNqFAzgYuJGnJMjFmKkjMAw6GE9Q8TFc4dJoT9PZT1hq/WA7ia0kwasj
	 GgD3E13ZbRW1aRLBcckg15TJ121SQImTf9Z4rAHe0ENpAdBY6LKRJEtRuEddAVELlv
	 +VTfIdxe5oQr3wtZx16oWIznPbhgL5xTi2lDn/XTUHIAYwDyV6Z/1s/koDH/CHXqrB
	 KeMtMOymns8o1WU9phEYPyG+pMy9JT2zUG8tR4LRYszT7r7DXy7OFi/eORLZixBpiW
	 OOOgJ0m4118og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8192C81188;
	Thu,  4 Dec 2025 04:30:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A12C6E4
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88B22401ED
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgvGMyBwSYnp for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 04:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A95A7401DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A95A7401DE
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A95A7401DE
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:14 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-298144fb9bcso5414145ad.0
 for <buildroot@buildroot.org>; Wed, 03 Dec 2025 20:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764822614; x=1765427414;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L2wp43ybrF4JHqfFz7CDFYrKsR71H/FS5CTdsKoLEBI=;
 b=hBHou1gjZN0MQLVzht7K7rGOsKfpx0+mm/xb16I1KMSQ14n/r46AcaNfldLAH2Cwu0
 cdz1mO2xa3WPjZthMu5qOgPldHH5emkRdsplUgLaJD6/xCINaNgbg3F2EYGENzDC1c5m
 bG48NP3STAnTv+12/FkLReGcA7Ohf8cAo17hofoHQWwANTcpYchTkyzoKr4bXiQ8oHCt
 TbBvq19VUAw7m2g1qTgYk7VaXMPx4Fn7ZGWjMGRBwh2IzWmqpo1p54Gx2jwCqpyl0ggU
 dWtP7Hu+GsNbT+cYh5IoUAfz8j8Ena24/k3GA7ZADKojE3b7h0PDmP60ksg9NGLEyiKk
 ymrw==
X-Gm-Message-State: AOJu0YwHCiu2bt1OBkvbAJAR6XtihAKyb6j/ukTLOLv5r6j0Min2J7IR
 HrvGBSYsTk7r5To8t01Pv53JOTnbcYTJLQsasZaVh6je22QV7sfXqU1u3kEX171u9FE=
X-Gm-Gg: ASbGncu1gQH7gRYkt4XooMYHh41W6xktJdPvsLR5e4TCB1JiU42US647t8l3lPHTsV1
 qTfwoAYATXZdT7nJApJ89SLrrRMRCHCpDj0Q/+JKmUVLL7/a4w6l4I7vHOPIrzgGCsytvkc0nyJ
 q05d5n9PwxbgniPWg7bsZFYb7y/SwoS5GI9443vbVCTztcn7uYR1YJ4q+cSPBBK8IiRmnqW0w0L
 XGY28WS+qKRQGKk4VEzPWA0k/70UNjmiyIyCxH1K+H1hrfXDMVgTfiBuefmviOsf35mgvOZGPdt
 Wi2ZcRQMeUSsmxxaNyHXKVngra5ZEBiI6ejAVerPYHKCEVaucb37/C0dVV8TZt9LFFgPmM4iAAs
 2NWRKAR6TjNmHajzsEIkctGOQNfCC22JZnqWQx5e4/Txtg4J9UXJitnpl42whoQaVuQg5paYUsX
 CASgflc2hZTshLhVkOu5DsvQ==
X-Google-Smtp-Source: AGHT+IF3tV0Sw204RVOgXQPXmKAXvpIm7leA5qM81LcL+kt8pS97e9qHI2AaB8B8hVQ6UnaGtQ1kaA==
X-Received: by 2002:a17:903:15ce:b0:28e:9427:68f6 with SMTP id
 d9443c01a7336-29da0153f5emr17509275ad.27.1764822613291; 
 Wed, 03 Dec 2025 20:30:13 -0800 (PST)
Received: from wash.local ([50.47.123.62]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae49c8absm4968325ad.16.2025.12.03.20.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 20:30:12 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 03 Dec 2025 20:29:55 -0800
MIME-Version: 1.0
Message-Id: <20251203-virglrenderer-v2-v2-2-2846fc1a579a@gmail.com>
References: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
In-Reply-To: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764822610; l=2673;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=DhooD88Hklp7WiZmBlQsFgIIQqdCVuqtqa6aDIDoiKU=;
 b=5mwzBp/dwKSYkDB02ajLtBmFbFNFQ+B8hUZm2i9OiB1ZLDfI5HBr5tNC1e8VNyIQs/iuEeJRn
 sqWqSfpGPnLDr+sTsuI7vvxhUH76cb2ViH8XES9mu60lhwb2rqedXlC
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764822614; x=1765427414; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L2wp43ybrF4JHqfFz7CDFYrKsR71H/FS5CTdsKoLEBI=;
 b=OYglNZWztncfJhEO+tQoBdbgDiOW3l7k96hBjtGU8T55HEDDAoJdHquv3FsVPHFbsl
 deiOsj0IzOaNPFPXtyyFHxZx1HG39hgOlOsaCIVcSu7SohfwQVnNa5U0kNSh44Kq3rf9
 Efe6XtydCxEdtwqNY6xlA0ZXQDZvU+ASIUgL0oSTR4cqjFXQIl0wuG+4J6Ddh1g4+SDI
 iL9d6m7XwqNkWu1Z3v/HKkYilwva39KdUcS/1+/hZAcATAJtMXmFRxvfqwC07bsUGIxO
 TYPkiTzTxL9OT/1sSwRGEWZKVVQ/gvW9cR1zJgSfCvt5Pg9wQO/BmDSkhocFMZesYor9
 0Mlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OYglNZWz
Subject: [Buildroot] [PATCH RESEND v2 2/2] package/qemu: add virglrenderer
 support
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

https://www.qemu.org/docs/master/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 27 +++++++++++++++++++++++++++
 package/qemu/qemu.mk   | 15 ++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ff7423bc4c..e86dcf57db 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -100,6 +100,33 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+comment "OpenGL and virglrenderer need an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
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
+	select BR2_PACKAGE_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable virglrenderer, enabling GL and Vulkan
+	  passthrough from the host to the guest through virtio-gpu.
+	  This enables the guest to have accelerated GL and/or Vulkan.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://www.qemu.org/docs/master/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fdc8591e54..05267de5e7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -261,6 +261,20 @@ else
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
@@ -310,7 +324,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
