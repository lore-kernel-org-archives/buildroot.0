Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAECFCAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 09:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2274211D;
	Fri, 26 Sep 2025 09:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWZ1T9bRCehO; Fri, 26 Sep 2025 09:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D293842123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D293842123;
	Fri, 26 Sep 2025 09:12:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C50D12D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 096EC84ADD
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQeG7sYNdV5q for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 09:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10CAC84ADC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CAC84ADC
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10CAC84ADC
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b2e0513433bso305829466b.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 02:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758877948; x=1759482748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCuhyUHKHOJcc0ZSMTrnIBydNem/XT5wHo0aSN3hsvA=;
 b=qpG+Xl+Z3yMcBkQwilJlhAb+JpWqFDNClMxEk2A7+Y0zZXc08ivhsaQmfERgUlZvAY
 6FCoIdy9L8xHo93oFYOxq4xypTcZvHfMNySennA1GV6Bj8Z+HUh1ewGbSUAaB2n9QEpD
 6o6nJPJEoJ9g2ZShd2+CbJZxl2KCCS7uH/MXIU7yqflTEl0hykMb5M4o0NrUVrxjFnyR
 AkG2LBHobWhVEjWZpIGyhwksynobTKkIhuaNaQcOr7fCGka449hRLABVXsTASNs2TUj6
 8IVfj00ya4/0dBnjCOhD77GGxEAR6+JEI1P5AY5GEgSMOiHPs7N2PCJtHvzP957X19BH
 YiAQ==
X-Gm-Message-State: AOJu0YyD0Yr/vPrLYpkZ/7jk5bPPhzgJpSwynuZuchYR1tLgDtYOVMJf
 V7a+5zSKyyoKmj2CtQN4K54sEyHO+Cd2eS41NFytU6iM84cfQ/rkhAPepWTDfvFy/Sc=
X-Gm-Gg: ASbGncufuUeXCgx/OW5BNFLmQ69Siq+EnNgQa/6pgpv9a3lclVn8CG+CLomXihLAoiZ
 kOn+inavVV10RRNI7Ry9Bszwwow9lga0G8RCfP0n+x6mUU4HUeYJMpmolXC33j12Nu5wXhnu3ld
 gacUZ6Mc3sHwU+Tx/B9f0bF8Se88xUOkk3aIFfWyiVujY9yYa9Q5363yXzMmkxyVtj2qFNha0iP
 Dyj/U751RcvAMFtT9PonpXbmtUjf9BJTEX6P9eVG7l5/4hA/l2Rpp1pSA97U9g5EmtUuPskVy3H
 cYB0RwdvShBp1noV2Rs3LFzTbtwTZVY16++cfOoEyjEez3zOLRIIFoW/NcBM9eNriBbyEsjQfAv
 CwlIGVW9oMFdX
X-Google-Smtp-Source: AGHT+IEqZ78WSU2s+Pett3lUgN8Co7lyT7mChAiNf3QKP/iizc9lCA0xajQ1wZVuKG+qTp75EYwHsg==
X-Received: by 2002:a17:907:1c8c:b0:afe:e9ee:4ae0 with SMTP id
 a640c23a62f3a-b34beba9703mr727081166b.59.1758877947995; 
 Fri, 26 Sep 2025 02:12:27 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545c8510bsm328256466b.108.2025.09.26.02.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:12:27 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 26 Sep 2025 11:11:18 +0000
Message-ID: <20250926111120.357053-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
References: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758877948; x=1759482748; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCuhyUHKHOJcc0ZSMTrnIBydNem/XT5wHo0aSN3hsvA=;
 b=C7kv5MtqGzERLfO+nIByMmDdp/8u9uGs2zeT3IIETAzRK6Fk6JzY75Ixd4R8FToB5r
 3NgpUiR5DVpUylMNt26sZUCMvzqe2Cfv4IN27ym2uqUitfFDvhwY6MVCJWhdeEkjFatb
 7+OCbZ7kyQIkgLwFp4PLit3U8VeQ9OA3VWd3x84BELEOG8egL8rO1j0EIYfgLM1ouqMI
 3+MvMqR6XBU2mptlYOI1KQBLdd4oIKWqH2mJsgMQcbk2XQBNaHNBZ3C08AXfkXc9RtF4
 4+hRqwcVkGLqVfGeGHGobu7h4QCf+vwrSaGUjvMwIlUT9JJsHI4PYfpkr58BheEGW4jb
 Alqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C7kv5Mtq
Subject: [Buildroot] [PATCH v2 2/4] package/wlroots: add missing dependency
 to libgbm
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

If the render gles2 is enabled then libgbm is required (see [1]).
Therefore, add the dependency to wlroots.

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/0.19/render/meson.build?ref_type=heads#L44

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/wlroots/Config.in  | 3 ++-
 package/wlroots/wlroots.mk | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 02bd54c999..6d2992cf2c 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -1,4 +1,4 @@
-comment "wlroots needs udev, EGL and OpenGL ES support"
+comment "wlroots needs udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
@@ -15,6 +15,7 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_LIBDISPLAY_INFO
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 689662f536..babadea94f 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -19,6 +19,7 @@ WLROOTS_DEPENDENCIES = \
 	libxkbcommon \
 	libegl \
 	libgles \
+	libgbm \
 	pixman \
 	seatd \
 	udev \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
