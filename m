Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48B5C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42CA340995;
	Wed, 27 Jul 2022 08:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CA340995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFGJohF1R1Xp; Wed, 27 Jul 2022 08:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F06408FB;
	Wed, 27 Jul 2022 08:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F06408FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84E0F1BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F915403E9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F915403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpolI5anh2Uz for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:20:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05C1F401C5
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05C1F401C5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:20:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id oy13so30199999ejb.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LgE0Ou8KWgHwdX2GFG+mmtZ/2X7hT4wuX2ecWR6DqGs=;
 b=XH9EkJKSlm6Axuw3e3APK2b1woY1RciwF8JuLfG2I+68r3Q0/w5J40dL9MpVb5uh+t
 lDRyAGFBkmblVLEyRkXZpgsUAOOlil19+r+jCAVVVSnYZMshiS1qtZKJXnvwppD/ngXK
 iAhvukfUOD81YqJr7/Vl/kApH/JatfYAvi7v7OWwfqT2Sj2NmOav2wto+axC+u+euxT9
 mAFkHNPJepXOiBUAfA4mUOAXz9d10MYmEA0c6o24WaU/W1RZ9nBlc6934GOlMiN+wqHR
 cAy8GkptxaSYxo37SPnTtVqEu2oyHSsDtpRhxkXE78HcgX1bFvHsFGvmx7rwzZIwZiSX
 nfZw==
X-Gm-Message-State: AJIora+LO3AxkSiu46to2lwtskg7ZppRJdVw8wIRst/AaGiKOMJXrjKY
 htfAC8qUadeFlPCkKSDQ4Bh7/qCYbBM=
X-Google-Smtp-Source: AGRyM1u88xPSPLYxd/vgJ2DAN+OxrdJoKDgGFsa93PqTNS+XDtBD8Uz+ZcrKORi0aqP4NXHHZEjTrQ==
X-Received: by 2002:a17:906:8a70:b0:72b:132b:1720 with SMTP id
 hy16-20020a1709068a7000b0072b132b1720mr16282780ejc.41.1658910014877; 
 Wed, 27 Jul 2022 01:20:14 -0700 (PDT)
Received: from mercury.lan ([5.2.192.119]) by smtp.gmail.com with ESMTPSA id
 kw24-20020a170907771800b0072b609d9a36sm3433563ejc.16.2022.07.27.01.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:20:14 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:19:53 +0300
Message-Id: <20220727081953.38627-2-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727081953.38627-1-ardeleanalex@gmail.com>
References: <20220727081953.38627-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgE0Ou8KWgHwdX2GFG+mmtZ/2X7hT4wuX2ecWR6DqGs=;
 b=J3UrwOc5GQ48crl888XHyTvswnV8f4z4meOy3cXleMiZrn1KNtFV1JbwveTP37NWm/
 FgbrrwlUj+c1po7cw5sVOxI3AYlnFQZEETouu6YvfRw32Mi4efyIFUaxA/diSKV0vnt7
 wALPA/HkrElywO3vWE7MB+r0qtOwGwihsUaz+Nf+uYRZWjyv+57Lu5agpdoc1L3wIzTU
 JGhnPmfB6LKHfWHhGxSyUdTScnAikCSQPwPhA65OMlRfnBVL0TGsrBIyKvbIFJsYgjHR
 nyHHPTPEWRBE/UFrSMDD6jo117lcQE0HHH6N3CWZ4ROI5BsX6QbbgQvYyAunG4zUnbqs
 wvxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J3UrwOc5
Subject: [Buildroot] [PATCH 2/2] package/cog: add dep on libgbm's dmabuf &
 plane-count-modifier features
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: aperez@igalia.com, michael@nosthoff.rocks, thomas.petazzoni@bootlin.com,
 Alexandru Ardelean <ardeleanalex@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cog uses the dmabuf and plane-count-modifier features from libgbm.
These are provided by mesa3d, but may not be provided by other libgbm
providers.

So, make this a dependency.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/cog/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 484eb85c70..d2a910f9b8 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -41,6 +41,8 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	help
@@ -56,6 +58,8 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
 comment "DRM platform needs EGL and GBM"
 	depends on \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBGBM
+		!BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
