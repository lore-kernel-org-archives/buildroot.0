Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D60C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F56A60E0B;
	Wed,  8 Mar 2023 08:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F56A60E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMV9kP60b20d; Wed,  8 Mar 2023 08:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2ED60BD3;
	Wed,  8 Mar 2023 08:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2ED60BD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 678E81BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4133A81E82
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4133A81E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glYq4GebZhca for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:50:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2904081349
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2904081349
 for <buildroot@busybox.net>; Wed,  8 Mar 2023 08:50:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so707578wmb.3
 for <buildroot@busybox.net>; Wed, 08 Mar 2023 00:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vC5FNqB8ShWGLCnygR+WKAyHTaaRxjvLW/winIKyj6s=;
 b=GJgmUeH0ptGyKFIaSZaaX1UI3PBm3VajIjMbKEOovZZX6N4qV6mqWxcC7kJ8iZ6bfy
 +wXSe1tHiyLP3/luN9himpexdmZKwD7hje0QFFk3m4awrg1smbQD3NRKFC0WrvV4dco7
 JGtiB9En+ZYsBuNkcvUa7L3Bcpxz31BYVui11BJ8hYQhIQADMTc7zPdta/iqW2dx+HmX
 YZQmKyq4yE4O76GFWkpswev5dqvYGO1mTgxGjdc3x7l/cHKk4BFP7QBQH+z8D1crq2at
 HXvulIi0C2o7+AGg4h63dQuPrUTfIXQDTzbILa5Y2K6s9WFgfPgQ2tYB6qxZ9DMhrPPT
 bNOg==
X-Gm-Message-State: AO0yUKXYLnkkIspqYLtS3hwohmOVXRA8RWLjvy5K9sibg0W1oQ/7FLgY
 FBdNF3k0iDfTh7t0USZmZsKY5sTE+NU=
X-Google-Smtp-Source: AK7set9Trqvt/mURxxrTHe8FFGfM2nzVu6epRR0so1hfcEPVoH7vr8LqoZH96QrqamU4ZfIxN7syVQ==
X-Received: by 2002:a05:600c:1c83:b0:3ea:f6c4:5f3c with SMTP id
 k3-20020a05600c1c8300b003eaf6c45f3cmr14774829wms.7.1678265452127; 
 Wed, 08 Mar 2023 00:50:52 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a5d554f000000b002c5526234d2sm14834117wrw.8.2023.03.08.00.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:50:51 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  8 Mar 2023 09:50:47 +0100
Message-Id: <20230308085047.126406-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678265452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vC5FNqB8ShWGLCnygR+WKAyHTaaRxjvLW/winIKyj6s=;
 b=DIHnkOCsldY4Dz9GsjYpT7Rlg9ZxvlYTi9RFvo3GDO2+uGdf8yM2AVir9ZuuMdh1Fi
 edwc0nsCAssmlQgsN1EFR5jADq9720QkO0Dn1dRINmSoR9bmQVl5p5P5Um7LBuuHxlE3
 e1c0LWRTyuJdAQ3Q5C63hRl+f2u0UCgaXgCH7BbUmT4uxYi7X3ILSBZLt2OQxsUGk3Wc
 RmNG7+PXoP5L0mYoJrLW1sPaYdFNour24OLZ37VgBo0BPUtEu56i6rWL/0JvL1rqa5A9
 v8s6kWrhasnghDbJvJ9pzScytLwfCpIOZTARGUMUVoYzck35Wu5jd9VmjqAehjEC0f8e
 jRug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DIHnkOCs
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d43da1344..12dc864de 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256
-sha256  5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb  htop-3.2.1.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.2/htop-3.2.2.tar.xz.sha256
+sha256  bac9e9ab7198256b8802d2e3b327a54804dc2a19b77a5f103645b11c12473dc8  htop-3.2.2.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index df2ec2590..aafda5d48 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.2.1
+HTOP_VERSION = 3.2.2
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
