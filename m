Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4DDCCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42F24160A;
	Mon, 27 Oct 2025 21:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okEZsv8PT5Pk; Mon, 27 Oct 2025 21:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19AC4160F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19AC4160F;
	Mon, 27 Oct 2025 21:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A49643F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F02BB413CD
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BRz02WjLyz0 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D15DC412E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15DC412E4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D15DC412E4
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:20:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so32363825e9.0
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 14:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761600016; x=1762204816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0WmJkOu6HjsW7eeXNL2LL9tULxVRdBvJcIMoq4PBwKI=;
 b=XyEzH6NkiVgKxwgc4W1WbKqbY1i66xClEQ/0xHhUkTP4wjeiDFWD1eE5539NaheMGc
 FfhopnfKoQFoPqTCky9sJyNEYX1iWU6BmOK6qLOBc/HpyQ2dIKuWz1KpcqG8Fs8Jjh4u
 rykaKT4aWdqvrA90SUx1PYVFw9eoV06Gh8rQhDUpqP0gIjvbjGauvqogeRcGOAN/DX/z
 Sr4eQbb4vGhhkKgvvYqRLN/mS1bJl8b2BbrNcqJm2/SCxkdcFmEM9Eh8z+5WfONe18G6
 wjL2+iAKyjM18pwaFrMvZrrXCc9DBNhpZuL3CSu5D3Fp47hE2aKpcT4nTsH/uAYuCvhJ
 3feQ==
X-Gm-Message-State: AOJu0YyrpT+KHF9FzzriKzuv3CPuZeUVan+G7KKetR//Vu7sUJhHa6YZ
 yqPvHcTQv654v7MJSHaYfNXdWg00bYj+9xccIMmPPM6Uohjg93y2rV94isbrK8i4mrNiocn0V8f
 ci9e/
X-Gm-Gg: ASbGncvdqKT8bKXuKIupoJ4uSCsJQqdHTYutWufa3OtTzS4k4lHwmPV06hcTl+ZHM24
 9Gbx7rk+U2ldYUKpctnfjyb8zp5DZmVDv1LkrcnpTqrLZ8aWGoD+ybtVmGFpIAmoNIYpqKptrDY
 HAGVzHJeuCnGlDpdvECzfdnro8hudZdQoG5VoO0zNaVf7ti/9H6sVllDSQ+38wJ/1FW29MKceRN
 GuSLHu8RNRduLILeUAXferz4AaHDIzaKr8VzWekw5DthnzCL4V+CwKNg3Z8SR7FQD2tvnYp9E4n
 1JubutvsR7BstlR3qOptzRgrbU1YHtYo/5vZH+RezVPFhAUEM9fBItMKz6GRdTZPdF1JVahUq80
 UaEyhd4yCGccOh2l01ESyYjmNVmL+RXGNbCOLFcpp7T3DAbX4av0ts1Ue4dgvJ60OC+L9OPH2Il
 08BJGGoT9WZQihxX4sCL1Bm2ZNDA==
X-Google-Smtp-Source: AGHT+IHHHqqHVBAEVNuf17pzXAua8QXIvBCBxQSOV1DVC8ayySsxuTXZcvRKH4Q8DhVyI0gELUGybQ==
X-Received: by 2002:a05:600c:4e02:b0:475:dd04:128a with SMTP id
 5b1f17b1804b1-47717e6b4c8mr9665265e9.31.1761600016278; 
 Mon, 27 Oct 2025 14:20:16 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4924e2sm157190915e9.8.2025.10.27.14.20.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 14:20:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 22:20:15 +0100
Message-ID: <20251027212015.47362-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761600016; x=1762204816; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WmJkOu6HjsW7eeXNL2LL9tULxVRdBvJcIMoq4PBwKI=;
 b=a+NxlypiXOMzOOGrghKm+UU80MRk5NUEGeTzKZNCI2j7DGuaqkx/pYPF5clEdNvtut
 hiPLHkaRW+pwNG+pqvBqrsGn1roRb5mTUTf+K7knBhgLpvIm9uoK7tF7yUPyHDznBQeB
 /4YJAp9LW30zzAkCnzoan2RLJUbhKCGTasXErNGKpD2E+ZDmHceGvrlx6Fz/ebvQsY52
 0xag1XlUk1Kk/HAfIUTAyU0gQQH88Sd9gtsFBOL3uEZHF+XdQF3MqskZ5Eda+BqHOwVY
 bDT+UsrJ9wG0QDOzem75Booei4MVleVskNGThH63coBQy5h3FWOSo9mYR6+stvrIOyd5
 X5Og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a+Nxlypi
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to v7.1.2-8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more details on the version bump, see:
  - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-3...7.1.2-8

Fixes the following vulnerability:

- CVE-2025-62171

    ImageMagick is an open source software suite for displaying,
    converting, and editing raster image files. In ImageMagick versions
    prior to 7.1.2-7 and 6.9.13-32, an integer overflow vulnerability
    exists in the BMP decoder on 32-bit systems. The vulnerability
    occurs in coders/bmp.c when calculating the extent value by
    multiplying image columns by bits per pixel. On 32-bit systems with
    size_t of 4 bytes, a malicious BMP file with specific dimensions can
    cause this multiplication to overflow and wrap to zero. The overflow
    check added to address CVE-2025-57803 is placed after the overflow
    occurs, making it ineffective. A specially crafted 58-byte BMP file
    with width set to 536,870,912 and 32 bits per pixel can trigger this
    overflow, causing the bytes_per_line calculation to become zero.
    This vulnerability only affects 32-bit builds of ImageMagick where
    default resource limits for width, height, and area have been
    manually increased beyond their defaults. 64-bit systems with size_t
    of 8 bytes are not vulnerable, and systems using default ImageMagick
    resource limits are not vulnerable. The vulnerability is fixed in
    versions 7.1.2-7 and 6.9.13-32.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-62171
  - https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9pp9-cfwx-54rm
  - https://github.com/ImageMagick/ImageMagick/commit/cea1693e2ded51b4cc91c70c54096cbed1691c00

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index f260a0e0fb..3dbea6d8bc 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
+sha256  acf76a9dafbd18f4dd7b24c45ca10c77e31289fc28e4da0ce5cc3929fd0aef16  imagemagick-7.1.2-8.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 30cacc7f1a..4e6a810631 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-3
+IMAGEMAGICK_VERSION = 7.1.2-8
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
