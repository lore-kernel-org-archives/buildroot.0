Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD5CD343F
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D160984A19;
	Sat, 16 May 2026 01:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0__teZWmc2O; Sat, 16 May 2026 01:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E7484A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895845;
	bh=zm6/tybRIGIxOgHgNOEGJ8wSl6ZmB/0g06ELXKncSLs=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CMQQspegNR+CeEmtY2eAWe4s3yEt2xhkcMVvgafnLBbNN4Yc3C0eHL7emfTUPLndO
	 ecphQ4BC6Aifn67UTC4vjkJ6rAH+GuvluyexQgfhiCFEGPvam6QML5LclMjtAgMUCs
	 MCfBYHl0yUMfAUQuVFpjYzrMIJTgMNdrxClDlVSagEH0CSRqx+GKEsdKY9EW3MesQ1
	 2ca4UI7VMZosXzH6fADl52KWVp8MmpKBUF/N2w4Dcah5K6yn+qtsFvQojjzD+zHVWC
	 YOA/3AP8ZsHpCj1T+Fqjr3ivSv9mIpSEZ1Mluwt08NjZ8ITC1gQiWh/EJRI6wUUgaY
	 UczsSQ6erp20g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E7484A24;
	Sat, 16 May 2026 01:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A24A282
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3092B407B6
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SSMU4QBF_Xm for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 358304005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358304005B
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 358304005B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:00 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-837b39eb078so339202b3a.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895839; x=1779500639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZiMeXvTf7kRbjjOq+Gt3/KBxIAswg7WHjuBLVsowb0g=;
 b=bynp/qijR5TouWsCjSxpj5VOf9YhH1Nfn1n7vIflYzr0Ii9NXcSE+IE4EIDlFvhGfi
 phSt/M2rYsm06JCSNsorh1Kx/vNaIolOsPWFvMdZ/VX2WzFCyTUH/dWUbxu3x3dA+Qb/
 gkBeSqCmBViJpty92WDRMj+NO6KilGBFA7cJ2p105qHRsrrTNaTtwjOw/OlVmCiat03p
 vqyMt0NiVddrjADXcJMH8UihuyLhIQMfAcIxMzyO11u80x00Sr1R1PC+klc++Av6psTo
 Kvbdxj7SxU1MpfDWOYM782zF3dVubPFfsKVgna1fi5MzsxNNRHeQoG0Hu53iE2SrC0FL
 9rWg==
X-Gm-Message-State: AOJu0Yy0O3XGkfuoqYFsAQRw+JDgMqqm/l+OBtr8h2l4zIa8nrF9VyZB
 prlc3ey7RKsOsZ/x3rRwTSF3fMFTK2kQiUeIHS/0/hM7gdTmiNKRxxq+
X-Gm-Gg: Acq92OGzO3M7VOAsqh/vLm21Tb5B4THGOKY6dyJfaf3BEglVcz85cJNJ2PU7+lNP6BZ
 PDJhbK6gCWM+nG3a80M7i1Zy0XMy9swz2fgcWpQXzCOmuMrn1qPBmbuGNdBxpFWnQj1V4yvDFOq
 uO4I9PLJoslXbcq1zVJRTGdFpwCVeEfB8N/5mbMSEhqabHCblCdvhHQusulgava6rUUoDwSZEEe
 NOsUKvoPk1Q15EORpsKeZWrQpO5PtYhd4mnL3DD+cWMUdpKAc2ePIYyeuJaY4tbpdzG96t4E50h
 kJVwN6OyRNg5rP/vEdUIgfuEqKOVLfTcBwuCgmEX1+bxpaAilKeWiFFvqMZGVflF45aCYVA3jH9
 Ri1NXSujGrNN9l74lA19ZmdRk+UHE5bhdJY+MV2NYon3ujOpDQUQwsc8ozYRBJSURKCjXoLzPCv
 evIYI/70QjgXSLF7MFwpI0AQTqzJFDQ3+A9lY=
X-Received: by 2002:a05:6a00:1902:b0:834:ea1a:4b25 with SMTP id
 d2e1a72fcca58-83f33b2e0c9mr7470529b3a.12.1778895839544; 
 Fri, 15 May 2026 18:43:59 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:59 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:38 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-7-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=2545;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=U9OLiYRvP74tRWgGhvRBAHIt3+i3EygI0+1cGwr9HZM=;
 b=ow9LKqSeaJSKsMEgYx0mWAWAG7QuBl+n0hXdtgwnQTA79zRT/A+H34G3KXP5S1EpHmHCXjOaJ
 5Fi5k715IfEA7W+vKWGCNzmHtAAs8gGd1V7cK8j1bEymrv+btjEjmgy
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895839; x=1779500639; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZiMeXvTf7kRbjjOq+Gt3/KBxIAswg7WHjuBLVsowb0g=;
 b=jMxe8R/CMkodWkrYJleSsEnmcjZDcyjAtJrz80Ho9UmTXO9HEABelcH94oFdMBRfO2
 ZfbZQedBZKvmKnMxdpI/HbKP0KWiYfzc/tsV09UfE1MMdvflrXVSeuL6rSg6CQywYU8i
 fqgbXiGL0N4jbxhIEhHpZKBtx1a0p9lbKImVTypXZCgFoTpgNWVX4PSbh0XolzTbByTV
 +wBHxqKiLbhbzkWpDsE0jx7fL6mt3ot+oR00K5nkGKYzDKy42wdt+rH9K2aSF0YtYWZ4
 GGQtMr8K2Nd2bGjU6W4Dmt0KQ9R0QdPEKrrzkAdXuvtve1eCjUVfjk8IvRMBUzlvxeN6
 tw4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jMxe8R/C
Subject: [Buildroot] [PATCH v6 7/8] package/qemu: add virglrenderer
 integration
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

Add optional virglrenderer integration, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 23 ++++++++++++++++++++++-
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index eb34f4ba0f..dbae7c4de4 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -114,7 +114,7 @@ config BR2_PACKAGE_QEMU_SDL
 
 config BR2_PACKAGE_QEMU_OPENGL
 	bool "Enable OpenGL"
-	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # needs libepoxy w/ EGL or GL
 	select BR2_PACKAGE_LIBEPOXY
 	help
 	  Say 'y' to enable OpenGL accelerated display frontend support.
@@ -126,6 +126,27 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QEMU_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable qemu support for virglrenderer.
+	  virglrenderer backends such as virgl, venus, or DRM native
+	  context are configured under the virglrenderer package.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+comment "virglrenderer needs OpenGL accelerated display frontend support"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
+comment "virglrenderer needs virgl, venus, or a DRM backend for guest acceleration"
+	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
+	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index aff1762fb9..4f4786532c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -279,6 +279,13 @@ else
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
