Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8893C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5781F437F4;
	Wed, 10 Jan 2024 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5781F437F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4vpHjYluiLf; Wed, 10 Jan 2024 21:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70D6E437CF;
	Wed, 10 Jan 2024 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D6E437CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 134B71BF94D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D2241584
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4D2241584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAl6gmDrz8An for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:58:07 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA46440999
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA46440999
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e461c1f44so42615505e9.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 13:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704923884; x=1705528684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNRz7DWQL/Kxa6FAWss/MECjY7bnjM+kw1tW/ZB77C0=;
 b=XcI8Ff8h4ZOh3LJVkTO3E5HnHT6odTljTI51IBllHeXbM9jBohiR36lfps0ATDIy8Q
 sMO3U9gGMILGnYICpTLp/bIywYyNfBSZGtyeCdWhKKRebo8PjmhxeMYtLmmKp7BQOM7K
 mxV+d7L0GAEKnHZENfGKpx6iWfA3Gx0zr7Spi8NZ58inO5i6MEmRWmyapUGJjchSBk/q
 9h67O4kUskZzBnWIsKW1ZMWIPl/+fQ1aSDg3iQco+yRW1JXZrPwIDleR3u3PqWpfHrK9
 ZbzJ1n2rHoYB094x8pJV02IVLJr59W6H9sOEaAgWGjVKWxfXZWj0RHV9HQhAH4SMZIwV
 Hveg==
X-Gm-Message-State: AOJu0YwPjnLGlabF6LE8p24E8SsPN5qGQBNCvcijh+h0kMBgEIUbR7ca
 aDGeqH1SHJKp6GkeXeNsLpv2Gt6IPCg=
X-Google-Smtp-Source: AGHT+IEIzPxlhtCbJq18lSEWoVd4rOQoptfNSieCkSh/DyaaV5QIuAPIJAqJ/R3SiFOA+6aeqUs/rg==
X-Received: by 2002:a05:600c:130e:b0:40d:3b17:1e93 with SMTP id
 j14-20020a05600c130e00b0040d3b171e93mr42407wmf.24.1704923884314; 
 Wed, 10 Jan 2024 13:58:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t21-20020a05600c451500b0040e3ac9f4c8sm3469824wmo.28.2024.01.10.13.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 13:58:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:58:02 +0100
Message-ID: <20240110215802.1265804-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704923884; x=1705528684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TNRz7DWQL/Kxa6FAWss/MECjY7bnjM+kw1tW/ZB77C0=;
 b=lUR52ePhT+dG7LjCeLo1cMWTz2LWEhGzKSNOcH54i68ou4qUB2k5j6JLfKAgE207YX
 dmgZq9YQRuhfyNTFzHGrCiEVXa9jfuPZX6d98NyNCaIuyiWBAUUfY/E9SkW+pWwt8O/i
 g7WD1acgol8c2skNJ6S5KukQ5/zeBZLz1jlgjjOVBSemUKqVPiHKamrbMgw4fZePgZKe
 XSfGoBpwHXP1e1Nq0vx//KtixntX8lUaoMTn6piQ4dtAHikqezIIDYjLvlNyp+w69Qe9
 lNneA1zf4+feAfdO9yS+nCgpCvitxPNIENGcSwj/+54Z7WjHphkfhq+MZMnOlCN7rJ8W
 XLsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lUR52ePh
Subject: [Buildroot] [PATCH 1/1] package/lensfun: bump to version 0.3.4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/lensfun/lensfun/releases/tag/v0.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lensfun/lensfun.hash | 2 +-
 package/lensfun/lensfun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index f03d0b54ae..5cb4fe37cd 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  57ba5a0377f24948972339e18be946af12eda22b7c707eb0ddd26586370f6765  lensfun-0.3.3.tar.gz
+sha256  dafb39c08ef24a0e2abd00d05d7341b1bf1f0c38bfcd5a4c69cf5f0ecb6db112  lensfun-0.3.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index f82ed44495..59f008ce6d 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LENSFUN_VERSION = 0.3.3
+LENSFUN_VERSION = 0.3.4
 LENSFUN_SITE = $(call github,lensfun,lensfun,v$(LENSFUN_VERSION))
 LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
