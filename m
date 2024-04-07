Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7769CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B034940760;
	Sun,  7 Apr 2024 13:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDhrje6ya71V; Sun,  7 Apr 2024 13:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F774076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38F774076D;
	Sun,  7 Apr 2024 13:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B52B31BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A093B608DE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKsHFNDvABrU for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 212D1608DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 212D1608DB
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 212D1608DB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:45:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41639ec6fa4so7122375e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712497539; x=1713102339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VZFtpwjybke3pTYk597BoHJ1Yq2WAqMBoi5NMaw6wHg=;
 b=kMk505hIv8+VIGqfMCrL/yEOaE6mV5EJJanwoazmTFf4u8XLTQvUVC+5qLhrGqIbW8
 DU59Mfz9d8atsJDR/6JiaDnCGhJeK5kWaDKmy9iGg9+vLwPkKTgaZwZ98lecre+59K+F
 sU5dPvqnEED1/lX3ueySo9Z7S1dFKqBY5hBb3KMxdobbXidtFSXk/dYP8/WG5ny+BCmv
 mgMEqp0CH4qxcqmJ9CUJSUJHeEZYuNk7luDGau11uJ9Xmf8FmG8IxjsWPQxQOnMSAvDk
 0MpDHH34qHoPEFAisTTZ3XxQ7J6Y+tmm1EeB+5TJtyPpce004D+CNP6D4fcmTxwjK5/P
 XIdQ==
X-Gm-Message-State: AOJu0YyFFzNeWy3ErGy089vW0LlquZmmtMYEDWhq5P+ES/fh6zveWvae
 eTPAPlw1bmYGFacHxTeqPlQbzWhVBP3FWVU0NH/mP4tjJ1YZzxywDCrR4X1K
X-Google-Smtp-Source: AGHT+IHe5Gm+RjNe/9Wu4eGzegb+xikwfPcJ7iDQUFg7iphiBiTlprxMIimZvAzmWmwu2ZG6cbEePg==
X-Received: by 2002:a05:600c:502b:b0:416:7082:e04b with SMTP id
 n43-20020a05600c502b00b004167082e04bmr157960wmr.17.1712497539553; 
 Sun, 07 Apr 2024 06:45:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay14-20020a05600c1e0e00b004146a304863sm13706590wmb.34.2024.04.07.06.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:45:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:45:37 +0200
Message-ID: <20240407134537.1837928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712497539; x=1713102339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VZFtpwjybke3pTYk597BoHJ1Yq2WAqMBoi5NMaw6wHg=;
 b=LfpPXEIhtsaqe6tA7nDjffJ4hGLnkGwQwQ4bU+U26ov8HwyeCk/6/ELQg+vbXLjem3
 wALIRo6OaEKxDyQkDQvEUg6olB6vspnWwuwXqjotNc19oHp57uafLRvFNbEzJ8kdz95o
 jyq705D2Y3fDa/c6HeB+uqkKkF0l8dawOdETGG+feMWH53RMfZkxh3GikS4+2yCixnm8
 lo0XcDrjm3cyfSA7R9H5ImKHK5mLDJQwBmsHaJOQKYEhDjtfwrAZubVtqEaJuumPvtHs
 cedvS0Pm+ad31DcQJ2uY3IJOMFWHBU55hzLUhV+qiqP4XErMW60k9jQsscAgMaIDPW93
 +Wog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LfpPXEIh
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: add libxcrypt
 optional dependency
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

src/lib/missing.c:31:7: error: conflicting types for 'crypt'; have 'char *(char *, char *)'
   31 | char *crypt(UNUSED char *key, char *salt)
      |       ^~~~~
In file included from src/freeradius-devel/missing.h:60,
                 from src/freeradius-devel/libradius.h:71,
                 from src/lib/missing.c:26:
/home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/unistd.h:1162:14: note: previous declaration of 'crypt' with type 'char *(const char *, const char *)'
 1162 | extern char *crypt (const char *__key, const char *__salt)
      |              ^~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/dc45f1291245a0dadd382cea2ad41573ad976d60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/Config.in            | 1 +
 package/freeradius-server/freeradius-server.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
index d51d92714d..e99778ea49 100644
--- a/package/freeradius-server/Config.in
+++ b/package/freeradius-server/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBTALLOC
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  FreeRADIUS is an open source server which implements
 	  a protocol for remote user Authorization, Authentication
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 1e8ada6bb9..c64ae79918 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -119,6 +119,10 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-pcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+FREERADIUS_SERVER_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_pam
 FREERADIUS_SERVER_DEPENDENCIES += linux-pam
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
