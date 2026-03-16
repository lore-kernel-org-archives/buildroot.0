Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09AAF46453
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 11:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648CF60A6C;
	Mon, 16 Mar 2026 11:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31yCYpgnQYnB; Mon, 16 Mar 2026 11:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6370260A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773661044;
	bh=EJNhRgXH9nZc5ZexZUswuMLu8V0q6m/8Ew3/75S/6Yw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b3ReBtC/5z7IDQA2bD3Rn3CpdsCjblQ6qkQBO7i3O7CSNrTVxANh42hTeocgm+ZAD
	 0c1PsHbIy8sfJLFgdM4YF16YieE/GhQUq6R/kqKYQK+NQApwrLXi07QaMk+rAEJ81q
	 v/t9eSApVj3KC5Oi4G6ZwphBcR8JuDzFUEmrPRMsjWCGXODzzsh/SXOzHOQZ+Db5lN
	 AOhdiLumymaFFhb4L714VcxrT0RzB64KSt2wFXXSZCxgx4DtQYhO/h5CTE7lbg6/qT
	 9jaa/04BSbhexd8lv7Z2Wqf/FW2VJOUod1+UeAu6TBBLB98Ts8bhkZxOFSwxNObj4O
	 FRrDAELaxmv2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6370260A96;
	Mon, 16 Mar 2026 11:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2FA93BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87A3A60A96
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-w52vQIpZMb for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 11:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D47B60A6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D47B60A6C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D47B60A6C
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so3424191f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 04:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773661039; x=1774265839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qkd2oOv3vaOktEioMbWfR+8Ko7mhwJ/er3MQusANtug=;
 b=KO6oiw4qeNMFalxQqD5gCmCmQE548tJVkSzYcoNF0bwelxRsdcYyYXFs6RNnL0pZ/K
 /FHbgKA66Nih7UHfNDi/gJvaCu2VNoEpQjNaVZBmAwlMqgZHQqmokAqbL6Exqwoxb30S
 iGnoUkgVKR3BXvuNIZDovb4nX6FU/oFNJbIec1Vg1Cn70Solhu+ATO7Q4qP18vv/v1v5
 k3e+HTSkS497hivmUj1jVs3hxSgKlnaXizXpaT8IbWGiDsCagvW3xUdfaaTgBl/3pOo4
 ZYfUlTAGqcMcWVfOQduyZzeknwdAC8YKE0sm/3UfkiBNQEumNaT0bfAlpr0MLcm7TF6j
 oFSA==
X-Gm-Message-State: AOJu0YwrSgGHx5CPHN2gqNxisHCeTg942tcOc09qC6o8KqE+AsJWQQR6
 FiPvcIn9kkCPXQZkqAuIE0umwxmNWFtpG65rFaVa9hXu97TTzk7ByLII2jxD7k6luByljSF7QsX
 Qj2gH4Ac=
X-Gm-Gg: ATEYQzxKVp/kEMyV6irvPklIIdNlwy4emWrG6Eq4OZ3klCc2BJfTtGN4nRa8dtxXhRN
 Z36uQ6Y+gn+1+s8Cq9VWdd6fwhxyC28cYn4MM/3wLMyldxmyJjEgpSTotMbc5/43491XkL5Xe0i
 J7baByKOWC+7WGCmS6OZp72BLRFoQxMSna6CGXnegHd1xXqpSSFBB+BPEU+iSKDfpFxzyocekzR
 vKaGb+f29rJWRFBFrWpbMFWaydsFEOUwVkP+fhio9ICBtefjbG6fkLXieRyKtyaJ2MKvwbU0aXR
 cY7AucXADZGF9Hxqrqnv3/hlv+WQwXcNkGYtYw4Ietfun0CRASXL2JPSP8eB4sFDqJyn6OAgglT
 auBkIToM10hLFtHolKsqOwaw0Zps9rAJGD7S4N0Vlznro9pywyodqHLJ62q/YV1iHrPAw+3PAA0
 G0JAd2+Nj4akc7jl39wKIcMoKHORibY1IXA/XG0H1DMITFOOTC+HAyj6gr1BBT
X-Received: by 2002:a05:6000:4e9:b0:43a:4e5:73b0 with SMTP id
 ffacd0b85a97d-43a04e585b8mr17766428f8f.17.1773661038664; 
 Mon, 16 Mar 2026 04:37:18 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm19809750f8f.0.2026.03.16.04.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 04:37:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon, 16 Mar 2026 12:37:15 +0100
Message-ID: <20260316113716.208738-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316113716.208738-1-thomas.perale@mind.be>
References: <20260316113716.208738-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773661039; x=1774265839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qkd2oOv3vaOktEioMbWfR+8Ko7mhwJ/er3MQusANtug=;
 b=bD+yZkBh+r9FEbqdLDqzafrbX/6pcosL27V9942ZF1CCM9HTswKEvP6v1xryv0mF/C
 kbDS9dcw3o5M/XIv+JLNxQy2sV/2GmbKB81VAgqf6gPHnl8GHgT45+Xj4jzy51JVOzJt
 1J0fb1pMseeDF1y1ySQzc6ptIRdFG212v79LU7vk237WrXS3fRHtRWSeKxnSOrd8GbMI
 qfKwIeZxXUsAMjImdC5k1v9DnCpzQAdxp9W51OS+7I70fIpkmimETtmZpHXLmIbGSvKA
 UCY1dCxL0VsHiDljQbMr4GJN1uOMI1IwGAMLZy9ct3V2qY0tMdTj4UYc3Pa8dGjrN/ZD
 X0cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bD+yZkBh
Subject: [Buildroot] [2025.02.x,
 PATCH 2/3] package/libheif: patch CVE-2025-68431
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

- CVE-2025-68431:
    libheif is an HEIF and AVIF file format decoder and encoder. Prior to
    version 1.21.0, a crafted HEIF that exercises the overlay image item
    path triggers a heap buffer over-read in `HeifPixelImage::overlay()`.
    The function computes a negative row length (likely from an unclipped
    overlay rectangle or invalid offsets), which then underflows when
    converted to `size_t` and is passed to `memcpy`, causing a very large
    read past the end of the source plane and a crash. Version 1.21.0
    contains a patch. As a workaround, avoid decoding images using `iovl`
    overlay boxes.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-68431
  - https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...x-wrong-copy-width-in-overlay-images.patch | 26 +++++++++++++++++++
 package/libheif/libheif.mk                    |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch

diff --git a/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
new file mode 100644
index 0000000000..4d845b2f90
--- /dev/null
+++ b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
@@ -0,0 +1,26 @@
+From b8c12a7b70f46c9516711a988483bed377b78d46 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 11 Nov 2025 19:47:50 +0100
+Subject: [PATCH] fix wrong copy width in overlay images (thanks to Aldo
+ Ristori for reporting this)
+
+CVE: CVE-2025-68431
+Upstream: https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libheif/pixelimage.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libheif/pixelimage.cc b/libheif/pixelimage.cc
+index f202c61049..84a8dd739e 100644
+--- a/libheif/pixelimage.cc
++++ b/libheif/pixelimage.cc
+@@ -1508,7 +1508,7 @@ Error HeifPixelImage::overlay(std::shared_ptr<HeifPixelImage>& overlay, int32_t
+       if (!has_alpha) {
+         memcpy(out_p + out_x0 + (out_y0 + y - in_y0) * out_stride,
+                in_p + in_x0 + y * in_stride,
+-               in_w - in_x0);
++               in_w);
+       }
+       else {
+         for (uint32_t x = in_x0; x < in_w; x++) {
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 8d91a109db..325502ad00 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -23,6 +23,9 @@ LIBHEIF_CONF_OPTS = \
 	-DWITH_REDUCED_VISIBILITY=ON \
 	-DWITH_SvtEnc=OFF
 
+# 0001-fix-wrong-copy-width-in-overlay-images.patch
+LIBHEIF_IGNORE_CVES += CVE-2025-68431
+
 ifeq ($(BR2_PACKAGE_DAV1D),y)
 LIBHEIF_CONF_OPTS += -DWITH_DAV1D=ON
 LIBHEIF_DEPENDENCIES += dav1d
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
