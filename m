Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD27C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D4F61446;
	Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1D4F61446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzIKvfTp-SVy; Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 531856144A;
	Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 531856144A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE2E1BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 443D783F18
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 443D783F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7AYVHNW5gUb for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:08 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C907683EC4
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C907683EC4
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40ec048e0c1so12382875e9.2
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092506; x=1706697306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WkvzAssXCa8HBmc2uaOQ9FyCNRA71wdc88hAW0f4OkE=;
 b=YyVnpcZaD0FfHM7WW2Z8LlunWB9nJwDHWAURQ0aDbmSN7XyXVndZl0CTxPJwEb0BDt
 YC3AkeHmh7lw/4/r+0b8komwyy9COOrlZRluIl2aN4YawsIoFzIrd148bZPvHZa8jaZF
 ncF6VcQ4S3JDWuSH9WyxmLqqgVA6qKgR2rojgiXNWSbvND+TSU/awWnhV3khRxO7hF4a
 eTpDXwv1548zYH6LPqUVNFfJSxyQWI7msn0jLA4ReqiN9ypC86KuwN3xv4mAZYfsOd/D
 3GmxOtVoF3XpK1wUUslKIq6lpfLqBCnGov07GgqXOGBCPElS+I6QjxvVLljZjM1bKjmC
 jDRg==
X-Gm-Message-State: AOJu0YwLb6qN6ymDc5lcltHYBM/P8ish84kXNWOJxf5Pr5pj8Ii0gpln
 J/DSrLgl/juMe285vn3VVN3tD9PNNrujZxcINDAhb+owIg4c8MA4xaSxczmA
X-Google-Smtp-Source: AGHT+IHHys3o9nibnXFEVd0redi6XBnlIp2u9bn3hI2VwKFaqOLdqFMVdqEdl9p7BtLPGhRDVtJaOg==
X-Received: by 2002:a05:600c:4448:b0:40e:937f:16dc with SMTP id
 v8-20020a05600c444800b0040e937f16dcmr1430976wmn.17.1706092505473; 
 Wed, 24 Jan 2024 02:35:05 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:05 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:44 +0100
Message-Id: <20240124103453.623733-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092506; x=1706697306; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WkvzAssXCa8HBmc2uaOQ9FyCNRA71wdc88hAW0f4OkE=;
 b=QN3TpBjHpHD/qk7Fh669ID7CcQ0i3uQdEwC84RvvJCA75NOxs2UKlBJx5hMKTlSiq7
 lJKbmGtpM+LjkcrSo46oWWe5odnuxgSklzv41k6Tu8mzG2hxQR8cTvQXxvVmGbbudmwY
 pu0ON5Y9sm2YJZbcoBu6eVdLVdeit2Su5lrHLmaGjQTGy0o7nsBH/d4tv8dm2rrQpqXz
 9Pu8F4viCGzqeYPfDnn5dKBdyaUTMGunHXWAt55JcWHXhk3tULGRzz/iqr5Cpx1DNQNS
 yrIA6Bg71Taha6cvWS5cQ4tz6rlm5e31U2IP1WHlr5FqCRxtanZCwLzv6fA3dZZ2CiSh
 itjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QN3TpBjH
Subject: [Buildroot] [PATCH 01/10] package/perl-cookie-baker: bump to
 version 0.12
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
 package/perl-cookie-baker/perl-cookie-baker.hash | 6 +++---
 package/perl-cookie-baker/perl-cookie-baker.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-cookie-baker/perl-cookie-baker.hash b/package/perl-cookie-baker/perl-cookie-baker.hash
index cc2a84b14..34bb4b143 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.hash
+++ b/package/perl-cookie-baker/perl-cookie-baker.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  bc8f95893d6ec3093a62d1957e1908f2  Cookie-Baker-0.11.tar.gz
-sha256  59275f474e07c0aa3611e3e684b894e7db913333d8214420be63f12ec18cd7ab  Cookie-Baker-0.11.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7ab63698d2f24a8cfe31a7ea270e9d2d  Cookie-Baker-0.12.tar.gz
+sha256  9b04df5d47dcd45ac4299626a10ec990fb40c94ee5a6300c3a88bdfb3575ec29  Cookie-Baker-0.12.tar.gz
 
 # computed by scancpan
 sha256  b4ce94671fa219074d4e91e2268652d6bf9764cebcc7a5e27bfc14897745ca4c  LICENSE
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
index 27c88f3e5..add5fcd0e 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.mk
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_COOKIE_BAKER_VERSION = 0.11
+PERL_COOKIE_BAKER_VERSION = 0.12
 PERL_COOKIE_BAKER_SOURCE = Cookie-Baker-$(PERL_COOKIE_BAKER_VERSION).tar.gz
 PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
