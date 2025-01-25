Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21C3C02182
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 05:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB576FB51;
	Sat, 25 Jan 2025 05:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjzu21qs2_WL; Sat, 25 Jan 2025 05:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B676FB64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B676FB64;
	Sat, 25 Jan 2025 05:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0D9941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2763403E2
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xD1dUMKveLRi for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 05:26:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD3D040249
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3D040249
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD3D040249
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:26:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2163b0c09afso53854755ad.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737782787; x=1738387587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kxF2e9fjPcxuoQmSKILSUiD9l9zzYFSm5zH+hkvAm5Q=;
 b=f8XnOjd4flq269cSZBrcrcsME42MSaPKdOeX5hTdhBjZVcAI/hzKi17Mf0vlxVCKrm
 ZagEV5Sxu6e3iLe+0XT5+fhxjAWapF8cl5bbiOdKiK7PoLHvSb0eJ+M/cOFBFzg1EVjN
 pVu3omWMRvq5RvzwrLu3y4Lzj610gRO2eXpczDxkJtfbYCFuW27iNaoykkN8RxWP5H+F
 avbAOLeO5bu+X6pWA7ETT3OeIMjAivkAXN4ugf2t6CezKdkEOk9NVZ2M8mGPxJr76GVx
 Dnod5RoVWGL3JOV4IMccRbIIGcn7wSYjv1UYWJ2/5yJgeue9v6Xc1Xm5pa6FGGIoxweX
 Ti1A==
X-Gm-Message-State: AOJu0Yw3p9UQmylIvcux4gbtE31zsAFwTl6v5LSPbGU1QUXYri2LkPeF
 rSm8EMJ9fxXdlgJUTTJ9Q49ni3Q7lryXm3V+01EtWBqEar5qDiSX7V3lAMhV
X-Gm-Gg: ASbGncu4nC0yUafUu/1y+l9fWI0M/HYODYA0I6DBzNjD3QEpLn6WY+Cmh6mXNdtGDF/
 xqn+srskBy9c0HfcmNQTIXKFpx0tN2bKbjCV2v+lwO5SluuP0RQUzAvTf5bA7Q5NqEEXr/00mtC
 1hFeauAZeBleNQVSGMHYawPRrATeQbsPaly+p+76HzuDK7aIqFg1Kv0Us4huAvLsKuy/6MoXUN9
 cbk0xJuWK+Ql1JC0VQGYpZHZKsJNauLo/bkIkFmm6h4SEZpTsq9/ZBAd7VYyAh9rkqEKzuPTz2n
 KvLtolDjHO9f3Lanu/J/bLNH3P4ExcHX0WR6qnXMtxUceJbAZL/oJwRSA9tx/qM1
X-Google-Smtp-Source: AGHT+IEfrIkFRpMJpsLkje/jQmB9zIltfFa3zTA6ul1XAxk+XHRIm2FD4Ll1Df/a2kqpFqJ8XtJeIw==
X-Received: by 2002:a05:6a20:565a:b0:1e1:aa24:2e5c with SMTP id
 adf61e73a8af0-1eb215eff85mr36633046637.38.1737782786834; 
 Fri, 24 Jan 2025 21:26:26 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a77c892sm2852421b3a.151.2025.01.24.21.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 21:26:26 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 24 Jan 2025 21:26:24 -0800
Message-Id: <20250125052624.86290-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737782787; x=1738387587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kxF2e9fjPcxuoQmSKILSUiD9l9zzYFSm5zH+hkvAm5Q=;
 b=DG28DE+mgYAX4+jTGIkDyfJJcY1ar1xvdsg2CQyGbHXKXVoP1dirEzW733L3d0jGs9
 VSXeEi2wXo+E3v0ZRyYm7ceCeL5yyuL7PDpv3ENOOVk7sj0i0a2UHrnUK8P5Zrx2Ork9
 50bZ8QpvD5FTiXCUveWTOv6/gXPYbSTZfJv8dyZ9pRWzSVBaN4CUKXKCuE9fmXed1zvr
 ycCn0x5WxEr/O6hQEbO+Ra+kHeyAwMXqPIQBR9KZott7Pji1qUJGyretvHUZPM/Ps+8n
 t5+kZfHZ4aMyIKh4hM5rAraSEbKfQLkce7sK6N+Giuzdvyt4FuplQMfO4+gK2S7jzSHT
 es6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DG28DE+m
Subject: [Buildroot] [PATCH 1/1] package/xz: bump to version 5.6.4
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
https://github.com/tukaani-project/xz/releases/tag/v5.6.4

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index c403ea2be4..5ed714273f 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.6.3/xz-5.6.3.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.6.4/xz-5.6.4.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  a95a49147b2dbb5487517acc0adcd77f9c2032cf00664eeae352405357d14a6c  xz-5.6.3.tar.bz2
+sha256  176d510c30d80a23b8050bbc048f2ecaacb823ae48b6821727ed6591f0df9200  xz-5.6.4.tar.bz2
 
 # Hash for license files
 sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index b3f8c30026..4a54f93a76 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.6.3
+XZ_VERSION = 5.6.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
