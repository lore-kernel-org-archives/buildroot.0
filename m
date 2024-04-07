Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0947CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B777608A5;
	Sun,  7 Apr 2024 12:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPZ1qX3W_4kX; Sun,  7 Apr 2024 12:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A83B608B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A83B608B0;
	Sun,  7 Apr 2024 12:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92B7C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EEDF407E2
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peCt3fq2CraG for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1597D407E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1597D407E0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1597D407E0
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:56:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34388753650so1516428f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 05:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712494562; x=1713099362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGO2qP6W3q0LL/HOXSPnIokMHjYQkyMvEfpRVF69yuk=;
 b=WE9yGZiSotxWjQUYg+YZNvJal6NgIiBL7sXQi4gDHka1sgcPfaKeX/Vb/m8lUAmHsd
 RXWywEyusG6lTCbPhT1OMwCt/Glcm0+j3KGOR+GVobsMEF9Y19ZqsjfDJmnb4H5HamVf
 NaMZctenOzmxfRaQ32hIwd5vfiJ7TntZCKtQbVN5hB7PI71hBIP+f832NGZEu3jty3IJ
 XLJE4fLt0kS8H76se0TyR528z8z04ZI66EhGORwefX2+N4m2gjhF6ej0HKsrwN9WLtE9
 RQt2mS6Zr4ShXWmjz5wrNeipJ9DL1FvbOZyxr26A7lrjvCzwACavfTvsCcuW4JnsYek/
 yxLA==
X-Gm-Message-State: AOJu0Yw5n5tVinT2r/fTmRttvNR+y/S0aYWewk4iibR848dpYRZFzLyW
 YT3zS2ynZ++mM2PU9lvhzSXovTNJfnQ/KTYpiPiPdorO0Idmx2N/OIMbtIda
X-Google-Smtp-Source: AGHT+IEmiqiELCLjYCk8gZAoFod67cKa4vUH1CHAbo7DWHXMddbXdFNBXEEYmQJJgz8hp282ZwsyMg==
X-Received: by 2002:a5d:63cb:0:b0:341:c996:c15a with SMTP id
 c11-20020a5d63cb000000b00341c996c15amr4699599wrw.16.1712494562166; 
 Sun, 07 Apr 2024 05:56:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5242000000b00343c0c24a65sm6585289wrc.89.2024.04.07.05.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 05:56:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 14:55:55 +0200
Message-ID: <20240407125555.1350085-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712494562; x=1713099362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGO2qP6W3q0LL/HOXSPnIokMHjYQkyMvEfpRVF69yuk=;
 b=JDOqE4TOezKCyDjuKuk43rr/btdr0Ksesp9yjmVtkTvF0aUSOkaO0xKDRd2R7mNDsl
 jNIet6Zpwf5ir6MnTJNhTkSbXvOxAUQjfaYKD9FG9QnS527OTqAmQQDhxjF0H62bPQR9
 ZBqF5ruF96U5+qeUAJXKT2GiVsOCgg3INT717X4aicsKZp9p10VaombLqcwh9D0iE/hP
 oHhxwVQaPSL2/p0LlGPtyXDW4Mo1ClfD8zVsM7cGSbG4E2nbekUmiPKQb7v0a8aV4CUy
 AeVyP8L0bdO4YF7Ur/tELtvz+oy+OCl+4UQ7ty7mF8IWkO/aIp6nH/lUgP6nBTTk+RfP
 JdQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JDOqE4TO
Subject: [Buildroot] [PATCH 1/1] package/policycoreutils: add libxcrypt
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-15/output-1/per-package/policycoreutils/host/bin/../lib/gcc/powerpc-buildroot-linux-gnu/12.3.0/../../../../powerpc-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/74c9775e5da7846b8dcff10e3966789458592450

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/policycoreutils/Config.in          | 1 +
 package/policycoreutils/policycoreutils.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 3201c8fede..499aaf531d 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Policycoreutils is a collection of policy utilities
 	  (originally the "core" set of utilities needed to use
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 3ad7e9a5b3..bcfbb7ebc5 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -13,6 +13,10 @@ POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
 POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+POLICYCOREUTILS_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
 POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
