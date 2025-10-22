Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DC4CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 09:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575E081D46;
	Wed, 22 Oct 2025 09:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsr3wPN3YPYR; Wed, 22 Oct 2025 09:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7310B81DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7310B81DE1;
	Wed, 22 Oct 2025 09:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D80F470A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C95D660C01
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4J32yvW-YFdb for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 09:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9804160BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9804160BE9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9804160BE9
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:39:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so4295765f8f.0
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 02:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761125943; x=1761730743;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZdmtZ+dBaC0aUfHvjiPH2wJdsbvRgWqCwRgIoBcd3dA=;
 b=SsPUUZXy/WZgYvHhA8A5VIdyu5LTQv1tlBTgkSBmMVuLeLUlwgDKFX803PTVTvSKbN
 0/0+zEZhaal6bPJQrEedf3YoIpX18+AU8//HTD8AiTNYEnl4YMvlCYkxAkLTfQdCPXZE
 xRTOUpbLfU2sMNU9uv49A+JcZFjViJZMZkcxboahe9xc9g+6MwPFP24pMnK52bIBFV6i
 kDhAO6mi2mWPAki+y1kVlCAfNuf4lo+tFr5WPh4iMSoNM5kYCgn0IZ0PJ1McrHqzqTQJ
 WC3ewT4u3YnwjZ379374q+lLs8yNs7OEqHh0n+BQtpPqwLaQWxyMPHR3uMEy2iW4arqk
 jkxQ==
X-Gm-Message-State: AOJu0Yw04+cf1FLcv8mESyfO+c4vUbaqnGFxb6HP8hGo2pcTNHPyv+44
 Ez2u/kpuao0jxAY99PMOj5U2Dfy6Lbgynr3cFxo14HqL+q60Bl6i6vf0MgPrPw==
X-Gm-Gg: ASbGnctuBvZ6F4JS50oKiGluORkV+nWCeknuZ0zbYInzu7Azy8kC4dJqLSuOsxLvUvn
 ENv0rkFaI5Cs0WO8Yf6zkQN9kQhA5ZzS5LORdQnyywOW9UO++gfg9O5qkFU/yBd12aDNX+DYLZU
 WJZ40AC+YADPX8jmhvr8jAkpb/or+Aq5/ecOVorj5q4LQic7MNfWeAXqYGayStAl3EfuyVZCj53
 mFYxcYKBM0g00orEPkxSXTluvXisJ4yzvwcUkJNa/l4SENZWoJA3PvkHgEYB7On0ReoVepdO9Sp
 tKB/Vc8Y2OsvaXKKaVKaHyjF/Owe3ZmNUGkB+p4GCQdzrUgf8kFSP1y0xIx2amH7knhIQaElCOQ
 ueoS0SmcM4Frv1iKbmCjdTohVQBbGO5LDn1Ing/TtUHg2fEUXrupuc9vI+wlvTIR+l/ytaPX0fK
 ljRw==
X-Google-Smtp-Source: AGHT+IHHycudQIr365gmHGwfZkI/mkV+0Vaj0V2plbAXqfbcqSKwO9a3riqMxpQvJ2PbyaQ7KUt1NA==
X-Received: by 2002:a05:6000:420f:b0:427:614:83ef with SMTP id
 ffacd0b85a97d-42706148516mr13835755f8f.25.1761125943265; 
 Wed, 22 Oct 2025 02:39:03 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3b45sm24537044f8f.11.2025.10.22.02.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 02:39:02 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Wed, 22 Oct 2025 11:38:40 +0200
MIME-Version: 1.0
Message-Id: <20251022-piglit-v1-1-9c1a52af5650@gmail.com>
X-B4-Tracking: v=1; b=H4sIACCm+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyND3YLM9JzMEt3UpBTzxLTUFEtLCyMloOKCotS0zAqwQdGxtbUAa2e
 7qlgAAAA=
X-Change-ID: 20251021-piglit-ebd7afed9982
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=gQBBKIYjpS5dptzzQfnBxAt1f46FuSbURIIAaRFyWLQ=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBo+KYouFXkB7mpPJwUMJ21JcakYvqokEVwC3/ob
 jrzbC4ylACJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaPimKAAKCRDnIYpo1BLC
 tbTED/wNuAt5/M8keuIQw6F5Vw8bpImgld3RA/Q9u7LJ56GN/uhVHmpbPjt80dzJ47aUMFtdinZ
 6umCC9rYRPhTK/Yp+Uww+Ix0JGMasPdkwTlU/n04yxlEeFtyUDxvZNLM5ICVVvf3IeYjmMWzwe7
 wJAg+qnEeGEvfK3J9hBE5MwVcaXdpjT+S+IvwaYCEV87h2ZlRuS6mEE80LwUhiYUacyHedL4vad
 Bb8zHyI08k3avdYebpfQfi0w3fOz7sVFSlV6nD8gpnJH+Dty7MGylG0ksmZLtY5YAIVNJHopVu1
 w5rUQzzD3xlAaMxK9Tuhfr77ndenvlKLViddJetTsz5gzXMrzS2CzStGleKB6hOpGeZpZD8Fp8T
 jwxsukg4EuOOuSb0jm34JxI865sUZ/wGyvkAg9eimYX5WmGbsA5KS5uwX4EfkdeYzTlLxmLmnhl
 zaS1zPhU5pQCBtS6FTHyQ6W0wCcat43Ix8Uz4SL6r40VFRPbVyg3aCvnBRTJ1hpPCZJKoKVxOMk
 N7LFwEZYPyb9c8+W+Y95CqFR9cTjhmuWDbh+3DnQKJXOqYZS+orPHZwXjsiUrU0fLgmAbt6Cduv
 /MIvubMN7Nkyyp2Q36tgCqq4jR3v//6XlFvBFl3Ej7H2/G7q3nHcuawf1Wk0NzOFxwzkfosIpAM
 bDHZo5mdDByOw9A==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761125943; x=1761730743; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdmtZ+dBaC0aUfHvjiPH2wJdsbvRgWqCwRgIoBcd3dA=;
 b=ZyshkehpgE7KR15UELJ+TfOufzD1zYcVp+UE60OMoy8+2PZx+eMHgZDcUZGvXsZoNM
 CDUAOhDTsOv35HbE5nU5LxnSZCB6wevTJzUNfWLB8hwNIsg5aEo4yKE9r85yw0HEIbOH
 K8pfZ08EbM2lYcoS27m6pwGiIBvCOkwy/pGItDTV9rs7xtyJg0PO5gg9YRaIL4zwV73U
 e+umKecb2pVGBdG09ItXefu7YKCPCnqYz6W7vppwIYfPBvODIAU+ApWeIAf09fbZXBgm
 jGfPkggLulU21G/SXiGif+gHMH1LlfhGtHckSxAMpvWa2gFH3VMRgkvJMIjBtuY9aPja
 j/5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zyshkehp
Subject: [Buildroot] [PATCH] package/piglit: bump to
 a70c33045c59310f972dbbdb33f322eb209971bc
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

New dependency since commit 2519c330fba5 ("make: introduce option for
building vulkan tests") [1].

Add vulkan-loader new dependency and bump version to commit
a70c33045c59310f972dbbdb33f322eb209971bc.

[1] https://gitlab.freedesktop.org/mesa/piglit/-/commit/eec9ea557fe813b963e8aa77a95c4d2e6e432033

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 package/piglit/Config.in   | 1 +
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 48b7641909b5..3b92443fc56f 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
+	depends on BR2_PACKAGE_VULKAN_LOADER
 	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 2c0b6aa52a46..20c79a4546af 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
+sha256  e968966faee7d97305c0a526d339102ddfc8435a2c9007c90444cb3303629f6a  piglit-a70c33045c59310f972dbbdb33f322eb209971bc-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 4d17405d10ea..76a759cfca40 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
+PIGLIT_VERSION = a70c33045c59310f972dbbdb33f322eb209971bc
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
@@ -23,6 +23,7 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
 	python-mako \
 	python-numpy \
 	python-six \
+	vulkan-loader \
 	waffle \
 	zlib
 

---
base-commit: c55714aeb9e9bb32b0674b93c4a4cd4b6fa4eb52
change-id: 20251021-piglit-ebd7afed9982

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
