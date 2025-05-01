Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A0C3ABA3
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 08:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD889838D3;
	Thu,  1 May 2025 08:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_y_sPPHbCmV; Thu,  1 May 2025 08:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23CD9838E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23CD9838E6;
	Thu,  1 May 2025 08:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C1C022D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1299F838E6
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsPsNC8d9isF for <buildroot@buildroot.org>;
 Thu,  1 May 2025 08:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 492BA838D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492BA838D3
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 492BA838D3
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:09:29 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-227d6b530d8so7039955ad.3
 for <buildroot@buildroot.org>; Thu, 01 May 2025 01:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746086967; x=1746691767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KYyKwNSco+pOskCgkX7vBnnq3KCKREZ5YfiCrzwSHXg=;
 b=W3A8nQgFXWhq0KCx2hyzGkNx+YSY0DtQjgqKofFfnRenY+l5V6MTCyE0h6y+adevpr
 MlT5SFdZc94RSXQW/yoeyN0hMx5QIb5ETkT+1gs0T6D4FEmHsIlk3Xzqj4sJ21VmnspW
 iklr/q8pFO6HnsghHaiCEr9HkKsxqoGD3/t3auwpUtyN4YLqkf/SeRGI08Du9WpPX6vN
 Zb3L04ffr+33p93JZ3OR9X/BnVoW81O8CQMwjotNNYPGW9ebRffIDkHO6pMC1Q24NK74
 5Qg7NZysk2ieavuoa7neGtXsOFprupFxJvON+RT+GE/K3XJi7P4gwdYW0DedOylbgspf
 oyCg==
X-Gm-Message-State: AOJu0YzSDAv5F7/FfewM12HhBLSlKDngStgSeWphlSrvj2wnD7S+857N
 AOyAtxG1Vqu+BMAqWBfSeyOzmZv8w4hnXtEwwZI5y6hhHVFb2GjTt/snoLBp
X-Gm-Gg: ASbGncs5ib+16Onch7sR4kDaJsh0tqFgfiWeD5BNtH9fciHI9coFXifmVwDiKrfNosW
 kDqoGrljCu1BfTRWYDewarkAk+Xx8efuO1LV/aoZSzDff+GNBrhGKUUDo4aQW+APXr/kuP96kDN
 Gmjst4kqbTwvsauxA3iQ+LbTCP4oKzJCgTuNN7S7/G7Jo+xA3QjbvRHjKtBqUl3w1bhve+VzSfa
 XKz2j5J6OBqriGV69ecRryovzeHMjFvcoO6jygKoAMbD1tE30D8Oji6j83dK1mpZgRudyo0OCap
 +U8zRMRyfdvDBc6Ryg7pR5HsvMF3jyzAbXAg3ezSeImjp2NkzWT8eApeRXbMCJVrrOltTBTJu1v
 YgN5i8OGo2YXR3jlj3uM6De9+pvM=
X-Google-Smtp-Source: AGHT+IGeeML9P2Tz0n73NafMx+TNqKCzK4gi1UgtwGr4NwSTV+jnRuuZWPbd6fN/vPQfKQ87dggK9A==
X-Received: by 2002:a17:902:d2d2:b0:221:7eae:163b with SMTP id
 d9443c01a7336-22e0864a4e9mr24967385ad.46.1746086967539; 
 Thu, 01 May 2025 01:09:27 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e0bc6d6b1sm1671475ad.134.2025.05.01.01.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 01:09:27 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 01:09:24 -0700
Message-Id: <20250501080924.18726-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746086967; x=1746691767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KYyKwNSco+pOskCgkX7vBnnq3KCKREZ5YfiCrzwSHXg=;
 b=UWSoVTmJZa25ZajVwmCvhbjU0FnNYkj9dBhsvwNUsbFCIQ7cziyKs60kdXK+zjL8iI
 yW0Ds1oQ62h074ldzgixh3yWs03txlRn1FHpuD9PqkbsPsbzjUjIUJe5L+QadPjWATH3
 48padV+LoEtYqu+DJWwsSW7xMnVJYlSbXX0PxsJNZBY+WBmVavV9CzUm8L7nLHSsmQV0
 Wh2PtK8w9OYfRESsrdKMdPAv9Lg4TysAmRh5TgFEvgfMSnTyUFnZ79pNc/vJf/Z4t+95
 Mnx+r+rkoz/uF6apbXaZKpBlWKwghCDx5ldP8gmAEgWdcrsazFcAFRPawuqJVI5Dp8gE
 5Now==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UWSoVTmJ
Subject: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.28
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

Release notes:
https://github.com/libusb/libusb/releases/tag/v1.0.28

Changelog:
https://github.com/libusb/libusb/blob/a61afe5f75d969c4561a1d0ad753aa23cee6329a/ChangeLog#L4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 8ca68f03ba..3d51244b2c 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575  libusb-1.0.27.tar.bz2
+sha256  966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29  libusb-1.0.28.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 15649a2ab1..3d809bfb6e 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).27
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).28
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
