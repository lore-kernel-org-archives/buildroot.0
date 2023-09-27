Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115BE82CD1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31BB14051D;
	Wed, 27 Sep 2023 20:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31BB14051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dqo2nYv0F3TT; Wed, 27 Sep 2023 20:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 758EA41927;
	Wed, 27 Sep 2023 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758EA41927
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFA51BF35B
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E86D240111
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86D240111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a92nMzVQJArI for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:18:17 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 947FE404A0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 947FE404A0
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so2517542f8f.3
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695845895; x=1696450695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dl/Y8m/NjiCHNd8kn+oJ8AdM/DNB9pHKBFTu1ZsI2Ds=;
 b=kAGn799Nn08VsTTvMzshZtkXMrJoEb4gcESXsiEBjGDyrAPq5Fn9/J/KSosMvJzb6b
 2oqCw4c+nqqM2+KkIyIC+t7ggGVN/UCHxqOFoaIZe64f/J/cmoXN52Jsed6Wr57Nn7nT
 Agob+2y4jck5dJoI3aZa4KUUr1J/YyjFLSXfhMXlJADFO7lDnTYg5aeqQh1PbH+HI27P
 RJxYPMhZJhy7qkKRYvqpMljHwu1YOWwaetVzr9VwZBtjswlAGvC2u33KcQyXVOUrVFsY
 J/lnKxcQ8TTwag0i5/Tet/LEucxE/H1LxBN3+FFWP/xWufHr0Mi59z88GmBr0dSvZAP2
 qSEQ==
X-Gm-Message-State: AOJu0YzXUb3T054HHwXNyEu6mIbI9tryjVZ3Ao6IAkVCOse2cXQn+RSw
 fgAk3sCi0mEgH0CycoIv5TqFg1Od0y8=
X-Google-Smtp-Source: AGHT+IEKW3xpJ/+dt3GCEmXrFutIPpV10giSa3EkKtb0FyFJ72a1sbbCiRoldFhj60XcR7Vd61MEaw==
X-Received: by 2002:a5d:448c:0:b0:317:f70b:3156 with SMTP id
 j12-20020a5d448c000000b00317f70b3156mr2521649wrq.28.1695845895166; 
 Wed, 27 Sep 2023 13:18:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b003196b1bb528sm17888870wrw.64.2023.09.27.13.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:18:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:18:13 +0200
Message-Id: <20230927201813.508105-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695845895; x=1696450695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dl/Y8m/NjiCHNd8kn+oJ8AdM/DNB9pHKBFTu1ZsI2Ds=;
 b=YqJTU5+FlTAuli1DnS6dO5Xv+QH41qYt99w7LTrUdJILj1v4Kx8WdzczFgRNGvbTL/
 bS6cPBDJlpTW3FGvxBc9uif2VRYNh7CE1V++iW8vKR1eePvHoMhAe8LVtwOanqkBCoSL
 fOIh3tkqRFJ8EVHreffF3o9d7XEwkiM5oQ3XjXegp5IMiSd2EgWBp8FF+tdbPYYdZHMA
 jfZMKKvtlHLlD9kYcQLBAixJ+B7krOMPOEKVVbs0hBXAjt+kxAn2zKef3gk+Z4aHo3Ya
 t0PAdtZW+7Mcwo6BRALnu35veNjI73qE8cE4PsfMIWojn+0W2nfqiYgm9R1CxXsKLWP4
 gr0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YqJTU5+F
Subject: [Buildroot] [PATCH 1/1] package/upx: bump to version 4.1.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/upx/upx/blob/v4.1.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upx/upx.hash | 2 +-
 package/upx/upx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index 7c24906152..072bc0656e 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f  upx-4.0.2-src.tar.xz
+sha256  0582f78b517ea87ba1caa6e8c111474f58edd167e5f01f074d7d9ca2f81d47d0  upx-4.1.0-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 6018b0a63d..0a0e9086e5 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPX_VERSION = 4.0.2
+UPX_VERSION = 4.1.0
 UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
