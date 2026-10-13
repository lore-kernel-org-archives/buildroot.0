Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A265ACC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DBE3406D8;
	Tue, 13 Oct 2026 08:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OT6X2E9r2vmY; Tue, 13 Oct 2026 08:34:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 12D53406DB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791880498;
	b=WhSW9QiOA6+lw5frk5qBEm8RrGVXTng+Yrv11NezwfhqxLIWOfEhVt0dtzEIcfykxjoo
	 MP0JOM3VIpsrahamgubgrefz05+0QxmAfZDalim9HwAzd3KFGrDX7viEyBLgvc36XIWeI
	 YUOcYwaRtTofNmgSuboVVg39d4VTzqolsxnl1IyJTaBf85XDR2ICKZOAU/603kpn8xM6c
	 E7tU+R3ne6BUraYisp/qdk3rp+Y18qRK89TOCw4kmixQWjBXuWzVvmh6myD13ORSoWpet
	 Bxd1Ylu5YHJozsRDf/RGuRjzxBwW6wLqHSr0EcSoM1bkByRP+ougIrbyQvy9REZi2Mw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791880498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=IiO2y+wBKZ0YwwOkKlfv/Ua+8xQ1Fu0oiVe48hs9CqA=;
	b=MI66MrBHYAb7gfa+HHx4FKTqmuQM3uJX6gPER/D2Z+Jj0nBi/BDZO/UozpXSJmB1h90F
	 A6m+mSTkd+WrxRKYrUeOd71mlVhjzNs+QLB/1GroOp05c96ToYG0ikI3VJOjAdRioOocy
	 dYWmEAlKcr3XIJel2NL1rrtNLeJFkVHSER0Z0yxAZaiGQJ9BKwYeeJeniIC9v5kR9Zo6N
	 hpmeNBRsVelDxVQ6NKrNy1XeWvNkayn2UvPjK3s3uMjg1wBAMqhCoBXKla33v0tR7Y3m4
	 H0TfdbtUOh19gBDE2xnMMOMUaLMWyWjq9+7jnVFFWmwXWBrROWwQx+fqyJmwdYuPiDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791880498;
	bh=IiO2y+wBKZ0YwwOkKlfv/Ua+8xQ1Fu0oiVe48hs9CqA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KSOe6k3y/Q2NNW7hz3o8EvDE0NbOCBerEoCOpvs297kpAtKzBJHmRJrQjuKjbkO/U
	 5ZHEgs+H0PcSL2ET+RJqTPsMmD3pqPokU3VYL3vysMmF6+8QZShxClisDzS2U2bVBZ
	 gXNmZvMMonRjKT76EXvbjwXFZ10Du5J9OJ0N+fastOJRqv195iLTClsAubhCW0517C
	 u4XxKoAwLRdMhUXrt0USPiQvjLv5PLoFjhqtV6J4J7MC10C+6BblOTtPa7id3n44gb
	 618L+vpNmpJCwFrsIvKjNrTWJFiLkAeKzVAJxNpXFSKxdlGHcQSIxa69ohKyXnyyQD
	 1d1aaXMXG/+GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D53406DB;
	Tue, 13 Oct 2026 08:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABB521E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D56060779
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzaCYklJI2R9 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:34:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5820960774
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791880495;
 b=YKQStZ7FfW/SG5IULYcWUkvP10SaOc3+jMX8T0KV057saRFc5kz/aEGgiNxlWvWAI+BD
 2BmwGsoW2zYSonkaMBX/mgNn+ryAbidRbyRnixpMRaREO+XHk1VqPrMR4+7KOrgXrJVs/
 oBx6iCzhAw1QEToDvnmzhkz00KmzLOW9B/UFK8DX7OJocxZ7NYFeFikfRBMndlrJ6DEkg
 2hIiHA5kEkvDX0oJbC52mHnbKFGV67FYG2sI4A+Wvq3/zSeFZVLLa7Nfc+9Zf5xqu7bX7
 usbTPtvRgrtPvwxbOIlnTomlxpGbvIi7MO7Kma/KE8Zrod/7xFGyy0rRjY0T0zrEtcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791880495;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=PUb3UC1TjNxPtvQzNtZMAAPgbS1W+KyYH5JarVi6P1E=;
 b=sAsm0sVf82e2Q0aiVcpBjMrwWSWSGyfcYbj7h2dT7pFn/BTWtfaqn+JY7qBn5K4dcQkI
 2IuLTah9U1j67eo3SnHWSvCwlFojD9eIxStlJeWMCsbJWaAH76FyngS46aYyHzFjxtMal
 +GpMMlbOHgBGsl4WJjIqf3Ms3sWxXDiKHYVRHOGCePN/Meb9ykyPP6kFRaRlQjLvYgb1q
 0uPLEBNXUHGPLOUZhBSNTqW/noHcfrl9WyWpLeAA7AKqWbgvQayeKGrHbzGoEwKjgRLnT
 5IS5D/QvMl7corwEEFjjJA6Xa0qUP4TDZBTjCNdGSM2/DbwxuZta+yE+dIyz8wA0sfw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=mGwkQv1i; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mGwkQv1i
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5820960774
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:34:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c2e6df2742cso398806566b.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 01:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791880493; x=1792485293; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PUb3UC1TjNxPtvQzNtZMAAPgbS1W+KyYH5JarVi6P1E=;
 b=mGwkQv1iBrL+nf8bpIwNqUplVHS9SDQJNSWqc56xqLEM/9v0NGICUXcDuExyJUe5uK
 f0PL5lK2YVYFjNT1cQhhxccWIQ9CESbHJlX3KMIhTwOGppgxP/ICG6BW1vjDnoRJahnz
 fe/0T/u9g+1Xo9zeTWNUPBa9A70uVvi6PuVEtZdTaUC6DOuberwEHTa2ZvGYdVvwb6Na
 4KqQoVrHOwxBjVc6sDCA2NL9sFIzWl/KYGUyXaOkz9gJ1DYJINrZH3fufM2k+6BdSkPD
 PJ5PLk9iNhfb4DXf7un6L0bto6UqYLDNN6i4voB3WQ3BSf0Tri1+Oj78h5issIbN9fsL
 sX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880493; x=1792485293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PUb3UC1TjNxPtvQzNtZMAAPgbS1W+KyYH5JarVi6P1E=;
 b=jz8zxBIFxbD3V3oCFXCIaXw2FkJcejutZM/BOjqXA+cjFtZQk53TeYm5f+Krmq4xVD
 /vDsWlIsPnWKMKfmbq/mMml0FjM5nwLwY2Y+UA/grSpsn9fn7LRY9XaSuW6rhK3M9cok
 YxXrXj+V0q5E3HvGsOqW3s59PVGUV+hYZTQwoIBd9buZPw9FEr+GMVb3LE/+tlD7DgAL
 wNsKvHDbHrfPC3+BDZod71/QzfkCpuaJdLjP46GmJ0k6TYPIs5hLxkIDBNd15OtzqPkR
 HeQFc78VgtHuTUqG0cPL8zZ9v1y+IC5VVu6BlMsiTq3JinsYhbPkJoU3iPXE6oP+Xdax
 ssvA==
X-Gm-Message-State: AFq9FYLk35eI+7glEzYxKLTiEvnNLU2v4bNsEZWJ55RTGxhwqDWEaeGb
 TRQFLdiob0OHHDbcvWmv5mfJxXuJqYMZMqawv1+fiXwWht+VMcUFLei6JhKRyg==
X-Gm-Gg: AYBFou0VnovqpVef2vTkmVm5dgciGOJ+v6c21W4imWu5mimJca5Mfdd2TCkTwO6PPhC
 flrPsrmbbHhol0S5VdLjo/BFQ2d8VMfcj9m4OKS8i3/QKejmn03YlGRDZFPHR+lB9MNH6NEx3Zx
 eNo+zcpqPk6FM9dk4AnUjBjHM54j6yMDcsUSJe60/N6z6RJhzoB8M55PDagoHsJlIqDEF3r3V07
 oEkf+4sxk+68HjVVSNUTamP0hFrlfwdtnsi8wz4TFXLMvyqBlDpOFwQ2HgvCs5p1h8C0/6IZIPV
 TcRB+qD6yxXs+4mOJEjUrgHxq8tBogn5y8RMInoEr0awzHEifO8TSpcrDX1MTD5qTt+pVTGoT2j
 0g4+Fjz7/daDQ/wX7jJkcA5UaUXBZF9FvS3zDS27MfKsYxOw1tVewY/qyljfeLMTbXkuvvvGQAh
 2NjJ3NyrE0ubtbYAfZL0NIWFMsN6w7BwhQ7QSAQHVmBdq+RfGhEsoWTJ0BKEGfbZQn8wIsQTzYb
 RYqhAcAN1jJv7xfIjYYYOwcRH/0qT8D/WsTA5ep3it3xBQ=
X-Received: by 2002:a17:907:f447:b0:c2a:f7f2:b732 with SMTP id
 a640c23a62f3a-c31aa0bee0emr1113681566b.45.1791880492532; 
 Tue, 13 Oct 2026 01:34:52 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9ae6fb7sm548224866b.84.2026.10.13.01.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:34:52 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:34:48 +0200
Message-Id: <20261013083448.1588053-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rtty: bump to version 9.2.1
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
Cc: bernd@kuhls.net, Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This release adds support for Mbed TLS 4.x and OpenSSL 4.0 and fixes
several memory-safety issues in the command handling.

rtty now requires libinih (found via pkg-config) for its new INI config
file support, and no longer links against libcrypt.

Release notes: https://github.com/zhaojh329/rtty/releases/tag/v9.2.1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/rtty/Config.in |  2 +-
 package/rtty/rtty.hash |  4 ++--
 package/rtty/rtty.mk   | 10 +++-------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index da5afb8364..a66bd20987 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_RTTY
 	bool "rtty"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_INIH
 	select BR2_PACKAGE_LIBEV
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Access your device's terminal from anywhere via the web.
 
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index 95b7a6bcfa..7d941bc47a 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,4 +1,4 @@
-# From https://github.com/zhaojh329/rtty/releases/tag/v9.0.4
-sha256  3bfc5db341c40e451544a218b7ef2cc59329ce04c50824b8ce6e5b805504c9bd  rtty-9.0.4.tar.gz
+# From https://github.com/zhaojh329/rtty/releases/tag/v9.2.1
+sha256  3764ec2537a5ae2b3a93853dda13fc20b0c0a57184cac30ed2ac1317312c3e2a  rtty-9.2.1.tar.gz
 # Locally computed
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 4dbebdf12d..1d7311e06d 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-RTTY_VERSION = 9.0.4
+RTTY_VERSION = 9.2.1
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-RTTY_DEPENDENCIES = libev
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-RTTY_DEPENDENCIES += libxcrypt
-endif
+RTTY_DEPENDENCIES = host-pkgconf inih libev
 
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
@@ -22,7 +18,7 @@ RTTY_CONF_OPTS += \
 	-DUSE_OPENSSL=OFF \
 	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RTTY_DEPENDENCIES += host-pkgconf openssl
+RTTY_DEPENDENCIES += openssl
 RTTY_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
 	-DUSE_MBEDTLS=OFF \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
