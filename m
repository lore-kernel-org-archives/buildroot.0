Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC1FC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2026400D1;
	Sat, 30 Dec 2023 21:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2026400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EUkNdPzPuU7; Sat, 30 Dec 2023 21:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD5734038B;
	Sat, 30 Dec 2023 21:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD5734038B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4331BF867
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 360658216C
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 21:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 360658216C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFjfHZHDNT_H for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 21:36:27 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2929282168
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 21:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2929282168
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so2568020f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 13:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703972185; x=1704576985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAj/9pkiixKL+GdtUHeL8aRzkXGFsHAilY5gnoJKzhs=;
 b=SErlJ4Ie/g+bvRixAildEIA9FrpUcDqNAb+I6/tpxMKO+22MPl/L+2jYzuZUuE/w1t
 /NIbxW3V/BwGCGuPqxtxT8JZPRWxgnjvOQ94TwrAZjmdzdMUjXwqZJIIjlmMT7FFfAX5
 2aNmb61rEXkfDy2ai5FdgXkzJ/6GelgjQIEz4HVatwdmejkxInf0BVg6jVWyTswa4U95
 23Ro3uI5ZGFWCl9+ICrejuUcS2ASaUU7Fu62pEc/9g89RTYIvViQ2sXJ77fiGBh89OFg
 NYla0Z8lz3/6mm/f60snuBwVobuF/cO6xFwjnsqYy3ypg9DZ6akKLgfkbFRYP8oVguWO
 3LTA==
X-Gm-Message-State: AOJu0YzIAD7a6eTf7mm1Jcn236ve/ZxCVPdRLohxWtDrZHbWYEItHc7O
 qDeTfzpGoijVGJnQZRZFis8AMYQ1LrA=
X-Google-Smtp-Source: AGHT+IEnq42UETSWB3+D+hxDtN5fJy4jI6kW/QxwsXwgEucxx5klVsYciK4xldrg2DNH+XBCuKAeQQ==
X-Received: by 2002:a05:6000:1c9:b0:336:6dd3:bfd3 with SMTP id
 t9-20020a05600001c900b003366dd3bfd3mr6953492wrx.37.1703972184474; 
 Sat, 30 Dec 2023 13:36:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c6-20020adfe706000000b0033342338a24sm22439312wrm.6.2023.12.30.13.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 13:36:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 22:36:22 +0100
Message-ID: <20231230213622.1394276-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703972185; x=1704576985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xAj/9pkiixKL+GdtUHeL8aRzkXGFsHAilY5gnoJKzhs=;
 b=JUUaemhxKCjsdYxHOkyG5wGFuoU8jd9KX1xgpAau0ALbq85GF7fyUccQq2JCIjfcvi
 ZrJfuihzv9AXp9NuCz0HaxtBbMfFm0ChFR6Z0EfXMxq0JbRVBe7LdyFYLM8kTN09XTNZ
 W5zdVqqLSJV89G69sxqHoFlNDyPANrNQA08jV3Z4qj0zJcw8jFAXIst/dfz87FlytmzF
 705d3p+LGqMAr9yw/OMy3IJOi8uk0T0KtD60NK/bhCsAuBA+58RsQ1VCwfVROlsWMlvy
 S2dePIKJIrK5aatnFW5lzsrKJDB8CLQvbV4bpLVY/0fj081uLhqaNaZjJvkn+ZsHzk6+
 GVgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JUUaemhx
Subject: [Buildroot] [PATCH 1/1] package/scrypt: bump to version 1.3.2
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
Cc: Parnell Springmeyer <parnell@digitalmentat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYRIGHT (update in year:
https://github.com/Tarsnap/scrypt/commit/c6e440c4f51eeb4aaf5e490734f46cdb06f4b4c8)

https://github.com/Tarsnap/scrypt/compare/1.3.1...1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/scrypt/scrypt.hash | 6 +++---
 package/scrypt/scrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
index 4004b89737..fb78909b3f 100644
--- a/package/scrypt/scrypt.hash
+++ b/package/scrypt/scrypt.hash
@@ -1,4 +1,4 @@
-# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.1.asc
-sha256  df2f23197c9589963267f85f9c5307ecf2b35a98b83a551bf1b1fb7a4d06d4c2  scrypt-1.3.1.tgz
+# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.2.asc
+sha256  d632c1193420ac6faebf9482e65e33d3a5664eccd643b09a509d21d1c1f29be2  scrypt-1.3.2.tgz
 # Locally computed
-sha256  1fb4da0e9000287414066a238f378528d5652f89b72b4a1d6b89fdd20031b22d  COPYRIGHT
+sha256  277ba0da6001b6c53c1da3f0d0d9107cf847eed49280e2cf4ca1421b8f707119  COPYRIGHT
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index fb305faf41..977045b8e6 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCRYPT_VERSION = 1.3.1
+SCRYPT_VERSION = 1.3.2
 SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
 SCRYPT_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
