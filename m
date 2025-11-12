Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DABCCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 09:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1742440509;
	Wed, 12 Nov 2025 09:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gS69fSLEn5S; Wed, 12 Nov 2025 09:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB7840311
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BB7840311;
	Wed, 12 Nov 2025 09:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 703CE230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 09:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56712816E3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 09:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnIPsb0n_AxX for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 09:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51C7A8169B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C7A8169B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51C7A8169B
 for <buildroot@busybox.net>; Wed, 12 Nov 2025 09:31:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso5633975e9.3
 for <buildroot@busybox.net>; Wed, 12 Nov 2025 01:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762939881; x=1763544681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zZVD1wyJanPWy3fgwKxi9wuK+fyREBBkJjxIb7Y4P0=;
 b=HwuiniFtcx2BrNNP5sQhcGjb4S/MF5HQzr5IkL0bqmHqs+CNS/3+pYaKEk4k/ZkT/t
 hcvy9ypDhhKfKLoTluV99z8jH3XTfEwtjO1GGIhXxtA4nwXdn/bu8bUvjERe56WklbMd
 X2HW8jMcYX42A/lji7W5srcKd0QFKuzMZxyTTP4jqHax180pmYChtDgiOx2UFqCgQg2T
 t+poM2D/YqSZZWzlaTax8T03qiT2ob7HLjzFjGMkaYL7T+u/iVaf3HHDx1nY7bMDX3/+
 U9rVKY54oNOcObehkxzqZjIg1cnNrer4JcyLbNWoKMXlcXyOy5+xhlRY0GctQEmquhl8
 mVmw==
X-Gm-Message-State: AOJu0YyhpB1KbyN6VUOumHB4dDqFd+qF36TOHSxrbvh/toID++wejL5T
 3oAaZUKhXbbPpomN9fromOUNRIGN9AoDe+AdHDDhrek3Ki5MerYyv92Ms9o5498nL2n/LygzP+M
 +mQjtmg==
X-Gm-Gg: ASbGncvg88L8d9CQces09tmBk3ywSDXq/MBxyu46VuL4u3ti63LtaCb0Oq7mbCwWA6M
 D1VtGYzFgDDuRUUUhUuCfxVq/niT+CJ8Ywvw6jhxg3rHpwqv240xle2HCeGXZyfQnl3vhA6O2uq
 C9yRF4H6H8vR5huOjFXBGLjt/1wLaP0yEnu8OJUi8g2m9UlQgO3VMkUIkauPAL9ywOv8yQrllRR
 CMaJCcI/2ESPr0guE8yIPeIOq9VSh1kPgWC5MzwKdOhaRT4/AlWmK4Hrle52Uir/a4x5C3SWkf9
 qtW1B050TlJT00vEw8fqZ4uVKBBlqF/Lo6McP6M9iZdjIEXpAwa7pdDeDn55wDvvzitaxlEwMem
 jzW0cOc6kdjsWgeMcv29lxYPaWVoGdwnWdXUI5TC0BfdHT3N1VRgMky5Vk/wiq0ec1lWY1YILdB
 dvgPXeV9DRx5LTcTe6kWhUm0uXXOHlVMq5rnTvrm4OWxMH
X-Google-Smtp-Source: AGHT+IFV46OarZgr558Badum0l6lDFOlHEjK0Ad/Zt22Xh4kKCTndp/JfaHFmtwrUTXzTcsCqyodrA==
X-Received: by 2002:a05:600c:1ca4:b0:471:13fa:1b84 with SMTP id
 5b1f17b1804b1-47787048564mr22549595e9.12.1762939880630; 
 Wed, 12 Nov 2025 01:31:20 -0800 (PST)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47788a72851sm8922945e9.6.2025.11.12.01.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 01:31:20 -0800 (PST)
To: buildroot@busybox.net
Date: Wed, 12 Nov 2025 10:31:16 +0100
Message-ID: <20251112093116.481902-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1762939881; x=1763544681; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7zZVD1wyJanPWy3fgwKxi9wuK+fyREBBkJjxIb7Y4P0=;
 b=kfN4Jl296R+n+ACeVELl3K1i8HOGwZ+D5Qp9JfWqhmQV4jqQUYu5syKuSz3oUcpO7Z
 8m8dgenTLoD/lRhsW/RycKR2+slfC/jOcfZnkSRA4Y6ut9xTr97EgF7v+9czdfH1s9yc
 T1BLS1+SM1lX7okKbzrgM1/CIcIWAQcNGjuo8PvU5QUM5kN2dHso7UIwzq1ktX2qC6Ny
 PXliyxDq11LLOClVIIffvRptxJa0k2UzGANb9CBE0GTAJS32ItBXpFu+AOfpUMuUx71R
 o9js/iCzJOGbSUyZ3p/pVJT321ORBLdQl4gdZZuXiyNiKD5rUsVcl7aCM8e2PKjJmMlC
 LPTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=kfN4Jl29
Subject: [Buildroot] [PATCH] package/kbd: bump to version 2.9.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/kbd/kbd.hash | 2 +-
 package/kbd/kbd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 25866751f..d46a60a80 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926  kbd-2.6.4.tar.xz
+sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 953adccd0..8008a9b3b 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.6.4
+KBD_VERSION = 2.9.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
