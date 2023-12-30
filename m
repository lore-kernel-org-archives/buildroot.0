Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2CCC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C03860A87;
	Sat, 30 Dec 2023 20:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C03860A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7GvwQQRnFwl; Sat, 30 Dec 2023 20:33:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86EBB60A64;
	Sat, 30 Dec 2023 20:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EBB60A64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72A411BF5B5
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B41F60A64
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B41F60A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gNkO7VUarXV for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 20:33:34 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC5E607C7
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 20:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC5E607C7
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so16273895e9.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 12:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703968411; x=1704573211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hpqPOvqiBHzUjDSrZrHQa5OTlcYyQvwyJiTsRG9PIEg=;
 b=HZVWhg2kWMVylIUcKNsS13r5jZzr58k1gXmVlqXgR4973A2BMeJxguZMhsQf+NTykE
 7sjTxgsyPWzPZVQAKAZjUUV6nI+w7RoPrb4FHI194mZmL1rwK0AHcPnwcxXAs7G82JCS
 nlqzV+mOMO5R1KLL3TNThUWYrv7JK56gCGbETkGmEOBqhG47GFkUu7FUmoAcdG0+UV8d
 RIrodzV5pjoZdJlTL7z0ljXbXyRYVoNz9O/agx+CgutO6Y301WL9V47RHiJIiiN7wwvC
 uOflLnAfijp6exGeq5e8dac/hmDetnU5OD9tDRL7Ntpis05Iv7GgVqQuww5w/gzmzv8l
 ycTw==
X-Gm-Message-State: AOJu0YzMALkvjOIkTQLk1UQNk+07cvs8k0vYo6rJ3q8l/eiPFmeatRcB
 Cbhef7CYLSu87kUbL8tjaQ3mSOodqMY=
X-Google-Smtp-Source: AGHT+IEja/nETgNWOyhXt0jXczwlv2P4tarnT1yvsQWcpJAgiuAfjLEqbF+nyM496BQus2hxGKMqvg==
X-Received: by 2002:a05:600c:444a:b0:40d:73e3:41dc with SMTP id
 v10-20020a05600c444a00b0040d73e341dcmr1373175wmn.11.1703968411155; 
 Sat, 30 Dec 2023 12:33:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c19d000b0040d604dea3bsm12261137wmq.4.2023.12.30.12.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 12:33:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 21:33:28 +0100
Message-ID: <20231230203328.1202724-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703968411; x=1704573211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hpqPOvqiBHzUjDSrZrHQa5OTlcYyQvwyJiTsRG9PIEg=;
 b=ijbVTxTTdzYn5s3w93p4srK8piscWD4ApGLH4b4G7VG7Iiz9zz7pwUNx49tS5P+pJ3
 sbS3EgEja7fXkeFWFEGbojRjsYjmkSl40Yg9spOtCaQAeMX87vPrOLRkjYEozrmar1LC
 wrPtPi3Y3wItiiEYYE4zWz2eC2tcO2E7K9SkO62ojxr1pQqOibg6tFh5OeueK2sGnhQ9
 XozzteR0ZGUWlewguH6Y1DBuEBp8T63x47qdbhfYpLAPdzsyR/b55FIS1ijHFs64ZeIm
 51UhOyeAp3WfCw4QWe8qioVP2GVdXGvPNSUH2Ngq1KkwuMrhknRGjscrnFlVr6U29o9g
 yrkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ijbVTxTT
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump to version 2.4.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cisco/openh264/blob/v2.4.0/RELEASES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index eecb0b9625..fe98b7773f 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  453afa66dacb560bc5fd0468aabee90c483741571bca820a39a1c07f0362dc32  libopenh264-2.3.1.tar.gz
+sha256  a44d1ccc348a790f9a272bba2d1c2eb9a9bbd0302e4e9b655d709e1c32f92691  libopenh264-2.4.0.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 750ec41e4d..478c29d7a8 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.3.1
+LIBOPENH264_VERSION = 2.4.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
