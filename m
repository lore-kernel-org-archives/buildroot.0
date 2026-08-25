Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F57EC61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 09:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 398DE60618;
	Tue, 25 Aug 2026 09:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glO7qyHCKXPR; Tue, 25 Aug 2026 09:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787650458;
	bh=wKQW4yGTDMQ3jXSjEB9vsRTMujgEI3aC7OAohcgTUKc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LSJxaAQrw6Jh2ns49fhjK3+1bK2aiZFs8RFbEYP1PD05XNltl+bwxE+zWPKVvjw8P
	 kDy13WjUoQTvRn0rY7QTzUMWo1SKxgnwronNldbqUfe3GTKtsvsGuUGvVFjuzQH1eJ
	 WjdCyarNuHzNpvS4qbx9Oe6Ilnr/jXhSKTYjcPAXAnbOpG+c2hKuj0hlHM6GohM+8v
	 5Mvih8fDKYo8dbF9DnqIPJGxTYcSiS2b1yz8R42DTeia137ZYtsMVuODsRhSonM/Z0
	 gKF+pBazlRKpaTraXDE/PrgL4K94LAkGFR8g/S3atFZCirjs2fJDGWuoGJK2372JD0
	 wgIXKIUC8QVQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E466060B;
	Tue, 25 Aug 2026 09:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49078396
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 269866060B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_i3bxW3E3xn for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 09:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WArG+iUL
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 073D560604
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:34:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so3490466f8f.3
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 02:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787650454; x=1788255254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qD/lMcKJF75PcUSQi8PTVnVuQL6nZp3RT3kh6evIZlA=;
 b=WArG+iULvaIAD86u6rdimRF2dIg9rwripTJHNyQt+0PhhVDEzjlt+YoQpWqQ6FKO6K
 hOlPkSxJwiFoH4fFmIYrwK/XSRhx2HnLVCdnmeTGm21T9rkWzHFuEhzq/gL3fJURvDCj
 9WVuXT8ydoOJkZfmrOhl1BA0C/iq+NRE8Q5Vqj6WuOc+oDAkSzResLgrKXKLl+HatirK
 Wcx6Vs+K1lShThKi4t8vTlydB3S64HXXmonWDcWBkonA0daHg0EKAZKLfEkC3//Zkpzw
 G+BmpgpiiyoFup09pn+gal74gfZSpbV2gMYzcFx0KZcQQFE6NKehtwjHZ9ABfeOa0wGo
 +Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787650454; x=1788255254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qD/lMcKJF75PcUSQi8PTVnVuQL6nZp3RT3kh6evIZlA=;
 b=TY7Ia1obfn8mYsrKv2y3edwteW4i6DMPp3NQ8BvZyAk/LNdkZxxJct6XDM6AfZUV47
 6OCDlpiSQ6V67j/XGNW93cETmDMXetv8wovPSIEmVeVIezHsqqApVPnExRmFPrNi2Cq+
 km6fPZDbic3CFG2H66L0ykd6GvBqslulnJZv/Gel4ItU8swENJg9heEF8z13K3HxPhG1
 9Qb+V6gsafd7qbDUa+bSA6AsQ6ILMzug3BvAHTsomU5SpyQbfLDCWT5jgZYEqKGT9MxK
 lDw8QTqWx2AJr21EOGhTPMsOOjBFxoBDhYZbQFPyY5UrfMYCDEyy/DYT6d7wti9LMDXj
 zHQQ==
X-Gm-Message-State: AFuF++lze/MEVpaOHiKrwbmAA8Y8AFtKVFGN4hy7l3bu29ZGg9JhNFC1
 G9uNjeNBAvcK9uetgl4oupzGo2Mdx+cG5/eIrTYEuADP6kVsSWTcpbi/xKUQcA==
X-Gm-Gg: AR+sD11l5NEiwSIu6hUaHJV/fHm7ubkc+8tW+Dkr6k4yeKZKg8Vw51FAi7zK7YGwl2w
 pRk0+geeaxRFuHybzlvHVs5rfs+lxU2BZQlSW1881kzTonOvJY212cUELBusyUAvOeVb0Pc2QIt
 fi92u8kNDF0jbUlS5RW/LefUA8CUHZIrnXsAvc7VqIr44KN4+FMApniR07x9tVjyOWX0YzgacKV
 fmEozzYM5ua7qz1OUTwfJ/ocg2463zWcFX94XAgWgdi3/ht65Q4HbEB+vL6biNZ1JAj+L6nzT7M
 Ye3N69Xdnhn0J6NDgffFB2zvrvKYD1/E7fvY0/Iv5MTvun/4JlcJ4oIXgHEzABZ0d5IUWwOVSGG
 ZcBDX0pIRZFosDScnirSxORXv2eXfqHZOug2qQaXbGNxzxrvmDCU5sGd6YDrK+96cKoR8jriAXs
 pESeLQeL2OneYKqF6VhY+0z6k0fySQ9SVC5unyI3BAlTvufGCBKeUL6cOb0bFqTMmkFY8uozhJw
 7JmSp6SOTKWQF6/YHCtDN4qmxRNgSINvmrOOTqS3H8bt7pdkP/NP2WiNTsCfTOvNUSepeeo04K1
 e5ZMam1TgQXGcOsoc2feE2Em2C94KL+Rigc3EoVyUDrRCAE7r2bFOw==
X-Received: by 2002:a5d:5e85:0:b0:47f:9176:da23 with SMTP id
 ffacd0b85a97d-482d9e803eemr5368865f8f.0.1787650450024; 
 Tue, 25 Aug 2026 02:34:10 -0700 (PDT)
Received: from KORLIN40066.barco.com (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-482c9bfd2c6sm11131772f8f.24.2026.08.25.02.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 02:34:09 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 11:34:06 +0200
Message-ID: <20260825093406.1932342-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/expat: fix no high quality entropy
 warning on Linux <3.17 or glibc <2.25
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xmlparse.c:150:4: error: #error You do not have support for any sources of high quality entropy enabled.
For end user security, that is probably not what you want. Your options include:
  * Linux >=3.17 + glibc >=2.25 (getrandom): HAVE_GETRANDOM,
  * Linux >=3.17 + glibc (including <2.25) (syscall SYS_getrandom): HAVE_SYSCALL_GETRANDOM,
  * BSD / macOS >=10.7 / glibc >=2.36 (arc4random_buf): HAVE_ARC4RANDOM_BUF,
  * BSD / macOS (including <10.7) / glibc >=2.36 (arc4random): HAVE_ARC4RANDOM,
  * BSD / macOS >=10.12 / glibc >=2.25 (getentropy): HAVE_GETENTROPY,
  * Linux (including <3.17) / BSD / macOS (including <10.7) / Solaris >=8 (/dev/urandom): XML_DEV_URANDOM,
  * Windows >=Vista (rand_s): _WIN32.
If you insist on not using any of these, bypass this error by defining XML_POOR_ENTROPY and be vulnerable to hash flooding;
you have been warned. If you have reasons to patch this detection code away or need changes to the build system, please open a bug. Thank you!

This is caused by the upstream commit "Autotools: Stop using /dev/urandom by default"
https://github.com/libexpat/libexpat/commit/d30eca113a44562137d59835cf2255ea32d11ba6

But since all Linux systems have /dev/urandom, we can just enable it by default.

Moved config options to multiline layout to fit within the 80 characters.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/expat/expat.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 7645edfd52..a82be75a4d 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -14,8 +14,16 @@ EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
 EXPAT_CONF_OPTS = \
-	--without-docbook --without-examples --without-tests --without-xmlwf
-HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
+	--with-dev-urandom \
+	--without-docbook \
+	--without-examples \
+	--without-tests \
+	--without-xmlwf
+
+HOST_EXPAT_CONF_OPTS = \
+	--without-docbook \
+	--without-examples \
+	--without-tests
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
