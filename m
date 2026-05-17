Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6ECCD4F25
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 08:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB1E8550C;
	Sun, 17 May 2026 08:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPW9b2dCfGxf; Sun, 17 May 2026 08:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF3B852B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779008033;
	bh=vRf9HPz0foZyYJ+3FDeULRUAh20AByZ0SdAN5fQdHlo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gytoJ6grg8tSu8GoOXVnYWeQGQA6YrGRpXFziHz+qmK61P8Qrs4UgA1Zin9PU8W4j
	 ndp4sao9QmEXktWJ098W/bbwXGenVix/rPq9yC6LJRej4abC1EpPQSOTUXOME+f+6v
	 0/ezX0YEaonbl/2tECOluzaPls3I48uFyZoKsjl7qX3HSyq4sf3Qf0dKY7zpm/BiBh
	 /SrF4rZPqg96Ch8FFpDERtwoIYLTSaWarvTYbS6W5qdV6T3fw5HsQgk6oIzYjYyWWU
	 3pM06Zxiq3tqbtzNKegLBp8G3iJyw+ahEkqT8nmvAmWfXBiNHx/NwHdze4EZDyDSl8
	 I1VCTqKhZ4+2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF3B852B5;
	Sun, 17 May 2026 08:53:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19561265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 08:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C59852B5
 for <buildroot@buildroot.org>; Sun, 17 May 2026 08:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQfni1iddtff for <buildroot@buildroot.org>;
 Sun, 17 May 2026 08:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A130852B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A130852B3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A130852B3
 for <buildroot@buildroot.org>; Sun, 17 May 2026 08:53:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so17892935e9.2
 for <buildroot@buildroot.org>; Sun, 17 May 2026 01:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779008028; x=1779612828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=plKqGNGZ0nLFtpmK1EGMpN2niFZu04JyFFQKd9P0iEU=;
 b=V0TuOB30IXfBu8d2aT/avnJDLQEGimfelic3sX7rpNJ9V9RvtNImCLS06mJpIPiski
 /ukHWtvWjSXYDSkv/B6EkHssOifb9nzLy+nxM8CtGg1lAxE3rkgVZNIRPuSxbkmAI1td
 BlAqeo5isxbLGt5TwV1sWH31hyp3B1nbEtrXJbvkIn0yN9m2AM8lZISyQzROYUJEwQAY
 E3Oe89qVl3CC1dSPpYjcqDJiFKI8OU1LQDm42VtAM6xxZjQypvpkGjvtzVesITHCKR0z
 Ei76kSc5oMdM8PpYj9vQ/LOvrpEKAEvxjDqaqdeUZzVo2a4xeqnCI87lr/BN3S8VbXcV
 BNMw==
X-Gm-Message-State: AOJu0YwZvENOuuD/NJNguU4QZJ+x7pCaiqd5H95OLPl36Ps++8WPx96h
 VnF/bU5/EjpnGBBVfgDNy52Ph/Gbq9vmf0uD0aayt+YH55pE9LYPTHElhxAfYg==
X-Gm-Gg: Acq92OFspS7u9tugdp26/glF3VaJKaUW4FHohTo/qNYK3xQuOX0ujH+OAHxpuim2naS
 PGpm3cLBipbs7L2AR4snpcM46We97XBFcR72/LPZZpR8n5vXFwbHhqun4WkCFQ53ZZUAHXhy3pD
 K5dsufj1IERfL5J1w7ahhrhHGrcGE8aXL2UcLn/NKKDcFoG0dER/GY6Qdx2EM0Hm+FpkSfYmVqJ
 xLzT8Gg3RwAP1COUt4RMaUCzevDbE8IGH2iopjzRpUtp3cxR90UoTpzc3+SqJCGhVDM0FBIIhoO
 wwimVDHPI+O/SyTC6gzvwibCVCkZFk/OOseRGce/PjAmPpHlnJ/mjs2qri7hBPWeQlGTiBM40HP
 v08yPn56qIKu0Uz0Lnr0WsfF8cpunK0sJsU1rT0P/HwWZ9nItt8EmKYw5JVcLMf5JblJDt08nHv
 h03wgkwcWCvFpi3JeH1FyL21E03z9ZPq7XmT6V7tNJw6Tu2PpWJRwEYzjoeLl8x/r+GtYmmz3sW
 bYrvfjRK94x6joamBhJ6x09+uQeAyXLb4SJQ8eamEzvDEjL4Fe27SaDx8paqUNNjIoSXpwutuuE
 1y6N
X-Received: by 2002:a05:600c:198d:b0:487:5c0:671f with SMTP id
 5b1f17b1804b1-48fe60e552cmr169103365e9.9.1779008027499; 
 Sun, 17 May 2026 01:53:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:9eb3:2105:4157:b399])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48fe53767ecsm163059455e9.10.2026.05.17.01.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 01:53:46 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Sun, 17 May 2026 10:53:41 +0200
Message-ID: <20260517085341.1338094-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517085341.1338094-1-thomas.devoogdt@barco.com>
References: <20260517085341.1338094-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779008028; x=1779612828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plKqGNGZ0nLFtpmK1EGMpN2niFZu04JyFFQKd9P0iEU=;
 b=MRQHEEcLVsNUU7pRJea+BKskFPU827y7bHTzyTbGNCBp2m6RloMl2ZymOyLnGIDppf
 mJ6Fkq3S9orCXvd+TNnw8KoXcxPuvbGLMJkcH2gGEtzqeaQrq86B57Go8dxo87KnXrDz
 jqS7m+bXiaxUvieJQuPxrmY8YYuSZ3MYdN1AoTe0E1Pxnc/vsYHS2kV2HB4EC6BOTLxE
 fRGw3T8kRtq/tbt98teLw6yOB/FlEHCsy2XjamphW/w45s7j7k6e9YzZc85skiCyko5X
 5P3wFZllgHhV1G1bGp8Gdx0I4yUIHnTJl0UwuRBukyzUIfJmnGY72WzsrPGTsjpLxBgS
 j0Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MRQHEEcL
Subject: [Buildroot] [PATCH v1 2/2] package/mesa3d: add option to enable
 patent video codecs
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

By default, mesa uses -Dvideo-codecs=all_free which only includes
royalty-free codecs (AV1, VP9, MPEG-1/2, JPEG).

Add a new BR2_PACKAGE_MESA3D_VIDEO_CODECS option to set
-Dvideo-codecs=all, which additionally enables patent-encumbered
codecs (H.264, H.265, VC-1) for both Gallium VA-API and Vulkan
video decode/encode.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/mesa3d/Config.in | 14 ++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bfd072d6d0..851faeae0a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -474,6 +474,20 @@ comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglv
 	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
 		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
 
+config BR2_PACKAGE_MESA3D_VIDEO_CODECS
+	bool "patent video codecs (H.264, H.265)"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_VA || BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Enable patent-encumbered video codec support (H.264, H.265,
+	  VC-1 decode/encode) for Gallium VA-API and/or Vulkan video.
+
+	  Without this, only royalty-free codecs are supported
+	  (AV1, VP9, MPEG-1/2, JPEG).
+
+comment "patent video codecs need Gallium VA-API or a Vulkan driver"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_VA && \
+		!BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 98f1c6c2bb..8734176c45 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -189,6 +189,12 @@ else
 MESA3D_CONF_OPTS += -Dgallium-va=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VIDEO_CODECS),y)
+MESA3D_CONF_OPTS += -Dvideo-codecs=all
+else
+MESA3D_CONF_OPTS += -Dvideo-codecs=all_free
+endif
+
 # libGL is only provided for a full xorg stack, without libglvnd
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
