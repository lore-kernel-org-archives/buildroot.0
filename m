Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE7DFA1FD7
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 17:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3ADB42274;
	Wed, 22 Apr 2026 17:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybNelazmY0HX; Wed, 22 Apr 2026 17:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA164427CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776877993;
	bh=sSbuNivizGhw4zbqzs5N1NJRX5CaHWqk35WVZ8fEPIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pFtDdJ1vkuO9tqQzTuMg2VB2irEvcwsimSr8M7eCmCAg2WpoqE+8EiYQcuijVmxcS
	 6GN7zXByn/bvzaE9o5MUuzH7/CWrQnCHUz4Vy5fRJwKKIgpu0bHOekaldo1R2gfO4r
	 SjFsEiZ0DoGth2ivbw20QneFqkKiEo/5YdiInHUlbPqrnOi5pwnk+6LShwcFjrTp9Q
	 yX7zMSz1P1it4P387+h3Fe6Xb0U3ufd/HsrzDFwRCO0fwglhZnlJBmeycRMo+VVCIY
	 Ezl2dW3u2OAz5M7EZO8RdWJdR+YfOFZQoqzIwlmvPtpW6Zsed2+e7FCK+byqrafWXA
	 kifvALLucIEzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA164427CB;
	Wed, 22 Apr 2026 17:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A0E183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 17:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5623984A91
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 17:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPq2J9DF2_Qb for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 17:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A961784A90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A961784A90
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A961784A90
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 17:13:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso22590215e9.3
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 10:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776877988; x=1777482788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZwsVLLUYL0YYMfDxD1P8biewXxUYN1m/P97iXx8fQw=;
 b=WOMJNNAhlc5bAhgGdtG0vL0HlVvKG+4hpyfnpdg+n6I6ApeyWQQYmgOurVNzfyGMiG
 QEheMnJz/ODuUpk9MKQnCtUYoAMUofgEe22Tav9Z8wcFRfkFS/7ZK65ikwAVqQ7O9+ps
 hyWL7DLR1QjeX5a+n+DGuI1uyYR6QOIDaDoep3CgSGH/F9sIJy4i5q3WIFpekmJPWrng
 etTeVOLDwE3KJ+QDBjICYia3AQge8iNhuikVFq1qEObUUG+NdEQug6SsBmIARtDiAoeT
 1i181Ic8K6qWxYqXjIbUPRl1uYHAUNIa5SA2Wvqg8DACa12bLqo1UqIQnWb2NHO64X/z
 L2iQ==
X-Gm-Message-State: AOJu0YwE/f/5LoY8GwUDCNCUG73IzrM2XNsw9p+mLItUAijveJ3WdcMv
 YIPE5NhWEjd4W2Qmt9lxv+6YGo3nFIo2jGMLP2Q7gipHuaMTo+wkDKGt/90RUIxGuv038eZ/zwA
 8d0sdlP8=
X-Gm-Gg: AeBDiet3cyW5l1N623zgHxLlIPBdu0cGArhbGQZZ/KT/vEmYn/Rje3/GssCCKyq23LX
 +UUuV8Ouw0OHcMtiXVqFzXOKQDjGHap+ppkl/P1egVqPWeYzSYn4LoSnQMMrTefRiXVKUlDgyu+
 Swk4cJLMStESRZqz6J6+pKXRfTHnx3XJ0PjDwBG38aBDxXM3itCeduJldcttam5tzbsxnBXgFLh
 TYqNXaECz0LR9TEJ1y9x1C3dqivmAoG3QpnPX0MGpSNv8slR3TVPGwc4VXNWxqVxhBSgbec/Cj1
 y9NMfdSF863YEaiaQlo5IZOa/U7viZ6EMrFMzuQoul8VoT2dk5/jGHLdWAuaVZhOIFj9DMdRYBJ
 o3R6/AmVR0nHlibswvv/t6WJpwKuS6Y3eBu9ia4GTu11Lj53YdunCpQ67gCM0z1gb4YvvexCEOw
 IvzEuxNpyyZALfDYo5wF0QsVU3z5Ml7K7zV94R7af8qus=
X-Received: by 2002:a05:600c:2e56:b0:488:d243:8da9 with SMTP id
 5b1f17b1804b1-488fb73b2d3mr205053695e9.1.1776877988124; 
 Wed, 22 Apr 2026 10:13:08 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a7b4sm43753690f8f.22.2026.04.22.10.13.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 10:13:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 19:12:52 +0200
Message-ID: <20260422171252.3200023-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776877988; x=1777482788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=vZwsVLLUYL0YYMfDxD1P8biewXxUYN1m/P97iXx8fQw=;
 b=bNIYr1c4YtmFqlqbm1YYngedrkezL1geu8/AcKcUMKpsg5wilRFNHlRhAVfCf81Qjr
 +SBGzldlCyvOgrgC8SEdcGwi01GbpYLL/OaHsL9iAttfeU+KbM+e+Ilp2yJ5fgEa1eeb
 CoSraBFdGFcWLqUW8pd/94PjH4szyyHoCqR1gel1GMI3vFtZ40eYB99Qx+7HIgqRVsvn
 5X4O1OXKyc1dGluP7ADEDzB+f6svvEMq11/rOD08NDhnXxynvaBWH6POafyoFPXhrtn7
 c+mUAAYM5C4aokyf/udvpismc+yZyoD1rw/RP7R6uxJRlX+C/8k1ptuniMW2dWxIl4hi
 iZYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bNIYr1c4
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to v7.1.2-19
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes a large number of CVEs:
- CVE-2026-28493 (since 7.1.2-16)
- CVE-2026-28494 (since 7.1.2-16)
- CVE-2026-28686 (since 7.1.2-16)
- CVE-2026-28687 (since 7.1.2-16)
- CVE-2026-28688 (since 7.1.2-16)
- CVE-2026-28689 (since 7.1.2-16)
- CVE-2026-28690 (since 7.1.2-16)
- CVE-2026-28691 (since 7.1.2-16)
- CVE-2026-28692 (since 7.1.2-16)
- CVE-2026-28693 (since 7.1.2-16)
- CVE-2026-30883 (since 7.1.2-16)
- CVE-2026-30929 (since 7.1.2-16)
- CVE-2026-30931 (since 7.1.2-16)
- CVE-2026-30935 (since 7.1.2-16)
- CVE-2026-30936 (since 7.1.2-16)
- CVE-2026-30937 (since 7.1.2-16)
- CVE-2026-31853 (since 7.1.2-16)
- CVE-2026-32259 (since 7.1.2-16)
- CVE-2026-32636 (since 7.1.2-17)
- CVE-2026-33535 (since 7.1.2-18)
- CVE-2026-33536 (since 7.1.2-18)
- CVE-2026-33899 (since 7.1.2-19)
- CVE-2026-33900 (since 7.1.2-19)
- CVE-2026-33901 (since 7.1.2-19)
- CVE-2026-33902 (since 7.1.2-19)
- CVE-2026-33905 (since 7.1.2-19)
- CVE-2026-33908 (since 7.1.2-19)
- CVE-2026-34238 (since 7.1.2-19)
- CVE-2026-40169 (since 7.1.2-19)
- CVE-2026-40183 (since 7.1.2-19)
- CVE-2026-40310 (since 7.1.2-19)
- CVE-2026-40311 (since 7.1.2-19)
- CVE-2026-40312 (since 7.1.2-19)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 90383c4d17..a308cd1f06 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
+sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5a03fbfd8f..d88323ca2d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-15
+IMAGEMAGICK_VERSION = 7.1.2-19
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
