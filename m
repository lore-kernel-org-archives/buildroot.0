Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F107ECD8CA7
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C816160E5A;
	Mon,  8 Jun 2026 02:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XL6NLBi1hu-K; Mon,  8 Jun 2026 02:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D895460E62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884387;
	bh=CF4SilusQjJKm6IcUjTQvzG2FfAP+F69uiTuEue/SZs=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OP9etqSV0z8djTU25LdH4OHn5modOAaVMAL8E/njPAjxWLB/LR8x6a14i5oYlMG3W
	 WAurXNyW3XRG2wNFzfXZO2BLpGTD43bH8xsD1DnE/jEzHz++vfUiiYOIpovO1sO6rx
	 CH7bVA81ndBnMLYN1ad5wfhvGU3WjVgBFlIfqHtWQd77ERV4nnSHJRWhapYdwgHfhx
	 xCSI/UD4QxGcFascoVDNldj0nwJjicMjrRnmoJ+nD7IbwGbcvlLG8HkJgjcfVqN2YS
	 EROM0HxB3K2LILh+ZvNKeBF057eOZjWv9uE1AmHSWcTptWDvyYV8kes9vCV/rLUpS/
	 jquikXbmm5OFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D895460E62;
	Mon,  8 Jun 2026 02:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB4492C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CC758084C
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymZ2XDdOE7OR for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5CBE80849
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CBE80849
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5CBE80849
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36ba3ea5c46so2100612a91.1
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884380; x=1781489180;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jFVNxmaAgo3/4LnJkZMjYDe2WrxTznJfMr3xS2xBRMg=;
 b=oInN04avqN26JmYLlwGiOaGbzX0J6fj/NmdvjGy5Fskxq4DIz4zbTNVgr6+1wKDPbh
 UQAmDwlVBgs9f7K/5muuLfHm+U5p6p9gNU6yDrXZ4GDDO80vFEEyJlDmknmp7QhxJzYM
 JTpwtp2XJ7FcTZlUTKmITUDp11YEzo08cx7sXI5WcvUJcnxnaiqI5ubc/hoW2YUqGYWK
 ThNF6zEpJs1oaMLq8F1xvtrQ89LRYYQ0IJfvmF375dHoLMoD5p7UwPGVsUejkWaEg6FK
 2dUrHroAnM211pxEQp8ZnqBfBZvUEqzLoB7uQnCszB+hnoRmIQTbvw/6HnKKFzgKW4F6
 OugQ==
X-Gm-Message-State: AOJu0YwNgmBAX5RTslNn23u+Us3hwtg7dZ4Mfh3etNw4UsYRprX7EfV4
 JUshba8ZRtWu/9Rf9Diy6isQLEpDkQonLtDzOoc44vLZuvNhVPX5kT4j
X-Gm-Gg: Acq92OHmAL0JCx3yduc8mXnUd7NPVN7aJbwdPWFlikkqF1igKs/YcNrwveedTQES9wC
 yZVppRGfYNtnz+ybkc47mhx05fm2CPkImLefzPNt1edF/GZ8lP38OQM1c36sTZxKPF4dBgOsOcn
 w0UQrr9ySicx+OQcDrIako9h2XZulDe+4QD31MwYhOi6LxQhRsYulA9rP1FmFVPFM0eYvk3sg1F
 1sExMmH/4vaCpeW0dEuHl2OXJFV3OrVAq/CruzxFITb6mFDqNAMuJbpfPv5rdPcSF/bdpSh75UF
 ik11mObB9cWhqjOZ9TvzJOcvZCtiC8Pg4Y3jvOZLBcPLjAtmm8HXAXjIKpTJc6m0T/AvIOkwh5Z
 zmrPhvFvaUhaxG0SxGgsIfrlW41OtP2Ypr7J0uPsl3oBSv7buLepniodZvDf5ZKO7OtmJBnWYUq
 zpl4Uto7yMi1cRJ1/wI7bedLOpeBnOWYSvKFx8DwQ=
X-Received: by 2002:a17:90b:554e:b0:36d:7d99:5316 with SMTP id
 98e67ed59e1d1-370f076d8f6mr14807032a91.17.1780884380161; 
 Sun, 07 Jun 2026 19:06:20 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:19 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:09 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-6-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=2147;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=SiNQHWtw+Ve+xhOZAuYBUp8j0E/h2diJCoBxb03p4V4=;
 b=hQBc2oIbZ+zYQNs8HxKAOX/wycp/wHrwqMjKbBWOJL0iCkHHmraNH/eeGCG204lmA7uNNXjX5
 ZISZl/pxEwmCVNk5rMWc5b9ff3lqgMOCfmzpXq5Cen1GQAVo9Z2U4ND
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884380; x=1781489180; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFVNxmaAgo3/4LnJkZMjYDe2WrxTznJfMr3xS2xBRMg=;
 b=p7jEc0/X9dt2PuMSdVK+dVUuD5OfuMUGbnQHyAyvn3IBfjs/6PuhN4KZM8YLcX19dJ
 L7HcRyOjsThla/ylEb8SssKW6kyapn0uR2GZ9hwKY7SedfhyFXEItTdlnbeQApvTelbj
 zby31q4QIXNvQSKTsNfP6U/A21EtwtrpUlkW1oWBJspsivUnjHuXGVtctjQqKX9uW0m2
 WWQ5rxDubsg+dgEa/tO3nMCNp+ILtz0AyiJW6wl+RtHp/8WdttFLvZ+zsU5d2Qs/zlPU
 tcz+TKhDMMtLBY+dgiI0i86+KQb5ao7osjk9f18+WXje0+XcDqHSVEPuP4SkGOpF7BwB
 /jEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=p7jEc0/X
Subject: [Buildroot] [PATCH 6/7] package/qemu: add virglrenderer integration
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
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add optional virglrenderer integration, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 21 +++++++++++++++++++++
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 8e932c014f..bfb8ccea88 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
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
