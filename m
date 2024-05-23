Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3808C25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 16:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7928482329;
	Thu, 23 May 2024 16:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy8fZiCikX3F; Thu, 23 May 2024 16:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E4A8232E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E4A8232E;
	Thu, 23 May 2024 16:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29C931C5B85
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 16:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15F294085D
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 16:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVniuBVv4rVm for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 16:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96AA24085B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96AA24085B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96AA24085B
 for <buildroot@buildroot.org>; Thu, 23 May 2024 16:53:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4200ee47de7so56165785e9.2
 for <buildroot@buildroot.org>; Thu, 23 May 2024 09:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716483194; x=1717087994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=btgsJDN+QV52kF65j6ObSRybOUHyJF3G15A1rGNO5kA=;
 b=Z1T7k8Xj+C+7IaEb29i3jiiOTxcGNocgnjk1odr9i5Mp6/NW0E5BAULX1yARsYcBy0
 IOYDrk9WN5sH4p+SEmcO4P8jw/lvcL/2gjECvZV/Gr5uGrblET1CpayjwQadvB3byS8Q
 YxuEA1ouEczuf5b21LzwstqHSBnkxlAAn89jBb39DF97e7oNf0ILjUXTjgJ/Cec7TiDZ
 UUbcXzTtBim3/kWYP1VDm/gkFqOhjzRoxfhz5nCJEd5n1G1HQ5vMQq5szqB20UUe3PMC
 x36MY2qQS8A1ztNoILHboQC87esZWeNkpqoUT0Uza6IIol/vbikCQVl4EMkGU5vgGqVT
 WtAQ==
X-Gm-Message-State: AOJu0YyB9GZJAsB9ocXRQznVDJLqPetbNJSSPB1u+0DaOmuajagidJZ+
 Uc5porRZwBmAmwwrL2zaBO9t3j16N1srti8UxyLmh6mpsISjLV2ynqXoyw==
X-Google-Smtp-Source: AGHT+IHswfjfP22l4I8NnYmM+Xu80GSaFX1r2dSdWUjx2zFqNX3iKN0SB7FHRBN1KMv0/px9/dSEHQ==
X-Received: by 2002:a5d:638d:0:b0:34c:d9f5:a8e with SMTP id
 ffacd0b85a97d-354d8c74910mr4069626f8f.7.1716483193981; 
 Thu, 23 May 2024 09:53:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-355038eb8cbsm508906f8f.33.2024.05.23.09.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 09:53:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 18:53:11 +0200
Message-ID: <20240523165311.1484645-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716483194; x=1717087994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=btgsJDN+QV52kF65j6ObSRybOUHyJF3G15A1rGNO5kA=;
 b=DZE1AM8WXxYvPh9DZHZYyx2xhghFp9Baq6H4VJ6DSbVQsPHsi1uVbZErpbUBH5E6a3
 NpuzhWHd23ttoflGmbvDQvaegO7JghvKS7USUgMmw1HPIZW7s/PKRgM9Np3iz+BlnKmc
 vj3M2ug2RBrflTB7sZZvI0TP4Jmk5Ax2hhoIU7J+cmNnTGmyeRXZxyD3JTu0yRVJKEWj
 RM41l4cNF4jhqCsr+jCdTMywWSOdlVfXQj9un6lvLOQzuvqfjJxt7EgFWkPGAnw7GZ1/
 VRtZDHz16a+uAHIU8H6vb1UX1ZcORQeldyUUPEdksKkw4x/XPTy+wDu7ksLuohWrOu+A
 0Jbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DZE1AM8W
Subject: [Buildroot] [PATCH 1/1] package/libgeotiff: bump to version 1.7.2
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OSGeo/libgeotiff/releases/tag/1.7.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeotiff/libgeotiff.hash | 2 +-
 package/libgeotiff/libgeotiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 883199501d..089a39166c 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  05ab1347aaa471fc97347d8d4269ff0c00f30fa666d956baba37948ec87e55d6  libgeotiff-1.7.1.tar.gz
+sha256  93c51fe139661d78092b30449293d28c230041d4e33ec3cabadeb167745c1177  libgeotiff-1.7.2.tar.gz
 sha256  a822a731a7ac4ba7d8f18fa0dc29db2e68a5dcfc315b46e4a4c8956720d55d93  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 6ab60c93fc..8caf89c184 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.7.1
+LIBGEOTIFF_VERSION = 1.7.2
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = MIT, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
