Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E326CA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 12:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19566154B;
	Wed,  3 Sep 2025 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjSz0K_24AvT; Wed,  3 Sep 2025 12:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE986148E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE986148E;
	Wed,  3 Sep 2025 12:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAAA1439
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 12:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85BBB41542
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WG_OeIXniTVw for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 12:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85E8C41543
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85E8C41543
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85E8C41543
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 12:43:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-45b7d87b90fso9874145e9.0
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 05:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903389; x=1757508189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXplA0EssQBdY31WcLB937oqxbHgmqK8zfwB1UOLWAM=;
 b=uygRQcuSKw2QA0sgMBSh4U9vM9QIFRl5XmhyzQL8OFtHkQ52OPlpdLP+OzH6t5TnwD
 XVs9gpr96DGgpCu1OVfMC6dVlPBuc8S+iVLZ2GlZZYIioeHzzgzbx1c7uMY9XsHzgIX+
 8Sc0l93VBhgwkSwxjQ7/UMiCspx4dGZuKvpHqgrxUeSuPKXSVj5gzVl8jrUKlBeTKdhD
 CZmHQUpoS5/+CDzATmVaIV2cFcVdxWANw4OsLECzcreOPBnkKHZjO62jldaxuaGw21PE
 ++/hep5sgeWJU+ZRdCpuv2ET6xzr3T/DROho5KmvPIefQvk2wOK+4HxU527SlzXonBaJ
 XeCA==
X-Gm-Message-State: AOJu0YzDa5T+T5h4XTMvBCiL9vBoPy7LT0uzi/hm6AZ6TZcxu+knfNyQ
 495G+KPlcCYck/N1/P+G3ALHPnQ+46K4UHSOYbHJGmAY7zGYIQfDQZi4OaaSPYBVuRw2E+AQTC4
 NeW4goTKKRuS+
X-Gm-Gg: ASbGncvTc+mZRxB6CefqhHi8oUuZdmnpHhBAOpki33s36c6mA9vqkvyTEiPQmJiR15i
 J7VwLb/vKLz70T1is4MKE3eJ1oGR6Lzu3scVNDLTAeWfKkdPycFplnwU7KLwPOTEZMXMR343L6i
 Cp2Rbuyd+GiqyuSXKsex3qhkadQGRju9p8WejKLLWfoOxbSfUij/NKcmrrA5YZowxKr37adVtKo
 P2AW2tbWmEQnJvPF0DHIORSRcMN3ME0AX32GavQcYopLPfFsYTbxDTucHp+DgjdsTlphBS/oJZ8
 FrcTWbeidfgHX42acJdR7BWvX4ZsNTF03e2enKbE/B1v5zuu0OIgPwMmSDBhVLcMoxVfDMvuzw5
 SQxKpJLjJy3/diaFEuJMH9rY4dH3GgG4DpYAl
X-Google-Smtp-Source: AGHT+IFHmxJ/LY9sg5LJeh+kIQuwStFnDSQhhB2aymLoRNqb7RTdmzrf2kPND4V0tueKGkQkgCJpbg==
X-Received: by 2002:a05:600c:4454:b0:45b:47e1:ef7b with SMTP id
 5b1f17b1804b1-45b855b3ffcmr141731755e9.17.1756903389390; 
 Wed, 03 Sep 2025 05:43:09 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b98e77231sm66980375e9.12.2025.09.03.05.43.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 05:43:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 14:43:06 +0200
Message-ID: <20250903124306.6936-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756903389; x=1757508189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=pXplA0EssQBdY31WcLB937oqxbHgmqK8zfwB1UOLWAM=;
 b=NjIz9HARpTx2HEk6dWX1WoLFWMnnXtsgzQNvpqzjzZPSa0lWTRCYc0X+/OnvrB/i1+
 gyi5MmuqImkUR10af3A2Sc7I29ybwuKbudqKCSaAorqGNZEH3hiC+UDHLwG2RnAnxNIb
 VRSbUrRxprU95x5OMqSUYSfE3mGQlC5iA2+Ol+5nT4dgT1zbVjPoaMHt4oP9lyn3g/bH
 CPau/X8KbcyVc86g8+tJ2h/1XF/Y0xQ6fWKE4mCT1V9SC1PE8TrTsyasYxmh3WbdcXD9
 kiO5X07MRmtUsT5VmEXZIxd0dY1YG6WKJQ8FkaWXyoD8oGLWeWCC9Aycihfh8UT+JYvm
 2jvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NjIz9HAR
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to v7.1.2-3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- CVE-2023-5341:
    A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.
    https://www.cve.org/CVERecord?id=CVE-2023-5341

- CVE-2025-55004:
    ImageMagick is free and open-source software used for editing and
    manipulating digital images. Prior to version 7.1.2-1, ImageMagick is
    vulnerable to heap-buffer overflow read around the handling of images
    with separate alpha channels when performing image magnification in
    ReadOneMNGIMage. This can likely be used to leak subsequent memory
    contents into the output image. This issue has been patched in version
    7.1.2-1.
    https://www.cve.org/CVERecord?id=CVE-2025-55004

- CVE-2025-55005:
    ImageMagick is free and open-source software used for editing and
    manipulating digital images. Prior to version 7.1.2-1, when preparing
    to transform from Log to sRGB colorspaces, the logmap construction
    fails to handle cases where the reference-black or reference-white
    value is larger than 1024. This leads to corrupting memory beyond the
    end of the allocated logmap buffer. This issue has been patched in
    version 7.1.2-1.
    https://www.cve.org/CVERecord?id=CVE-2025-55005

- CVE-2025-55160:
    ImageMagick is free and open-source software used for editing and
    manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1,
    there is undefined behavior (function-type-mismatch) in splay tree
    cloning callback. This results in a deterministic abort under UBSan
    (DoS in sanitizer builds), with no crash in a non-sanitized build.
    This issue has been patched in versions 6.9.13-27 and 7.1.2-1.
    https://www.cve.org/CVERecord?id=CVE-2025-55160

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 2983b511cc..f260a0e0fb 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ceb972266b23dc7c1cfce0da5a7f0c9acfb4dc81f40eb542a49476fedbc2618f  imagemagick-7.1.1-43.tar.gz
+sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6bbda40396..30cacc7f1a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.1-43
+IMAGEMAGICK_VERSION = 7.1.2-3
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
