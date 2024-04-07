Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B99CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA2E608A5;
	Sun,  7 Apr 2024 14:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6odKv567yy2; Sun,  7 Apr 2024 14:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB65E608B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB65E608B0;
	Sun,  7 Apr 2024 14:30:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E01A1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B5DA4035D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNRAK87P2tmA for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EDED400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDED400E5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EDED400E5
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:30:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso2365545f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712500201; x=1713105001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SPVyfiiHMBSha45blx5PzzscfhfEDZH6CqvLrXqq6xo=;
 b=faGl+Y3JdwlTNnzZOIyAG3exoR6pm+gTLMeo1MbdWYkb2JAj29ZsOsctfwnUAV61VN
 kEWZd54q5wA4ToNn1t5HFLClNqQnlL8Djmk/LOrfCtGhBN+inPtazQkAtaci50nYD0Xo
 5mVv6p6aval2IbDANKsi31GT9bwaGD9sszQvZ00SG05jeWqsJodnbeyOiC7sEOkl+KeE
 bhxOFXCVfDSC+jPDxRaY6DSirZ9sD87JzT7IdYtcJpf7EvIAljzCDdMF6zn2Ip/q87Y4
 30YIfc4s0/QVYK6filklHBJIUfecJG1eZAXdVK/lfF2qOlkejOi0N7iaWipPf3usa7mj
 CaCQ==
X-Gm-Message-State: AOJu0YwBmyTV3tdN7q0LlgdUThEZRAhwRnGVq6R5i52CUSZocgO+WGQQ
 qJj7Tpy41v+h2NQXpu1hMOtDZ8s2+15WhxjKz0cTqIUIxywy6H5E5HfmDaHl
X-Google-Smtp-Source: AGHT+IHFSjYrgQM0ykA4wQOnw4NMtNiSkfQnWvDJKHWjxECw2FahQkLoIHCo3PQU/d0y+QdgpRMQ7A==
X-Received: by 2002:a5d:64c5:0:b0:343:80d7:6b25 with SMTP id
 f5-20020a5d64c5000000b0034380d76b25mr5565802wri.9.1712500201283; 
 Sun, 07 Apr 2024 07:30:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d568b000000b00343c9ce4b50sm6752133wrv.53.2024.04.07.07.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:30:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:29:59 +0200
Message-ID: <20240407142959.1885430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712500201; x=1713105001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SPVyfiiHMBSha45blx5PzzscfhfEDZH6CqvLrXqq6xo=;
 b=Ce0UXCpUC2Grq+5jdyaP2Re2krEFM6/6UoMY35cDZBvwQgXWtijzqsX/5Nj46+GpPs
 xj9zH3N3fEm989k7J58kP/BPuY7V8cbq6kQyKJJN394EcGBORQkKWI6mTNrrIJc23OId
 9iGbMnTs/EcKkweJ2PY+KJ9ZwQlTFabod9vOt79IxdVSFgNfiUXat9eE5aqW6lBhjIua
 ZWpz6SlziWXDuqsk+4SI7QG/vm7wuCDrnvPqQ63ol2Z617Tdy+G6p4pLO4GTPG2uu2fW
 6mkFmUl1Tru7XuApK8B4vynsMeHGyUE2T5Xe8BaOETEupmQiMmaVxzVga86I6DyblXs3
 iU5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ce0UXCpU
Subject: [Buildroot] [PATCH 1/1] package/shadow: add libxcrypt optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

configure: error: crypt() not found

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/cd97aa4ee49c3052b762deccb5aa28cd23c54f5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shadow/Config.in | 1 +
 package/shadow/shadow.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index b08b06457b..987605c7fa 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_SHADOW
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # reallocarray, explicit_bzero
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Utilities to deal with user accounts.
 
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 2092903b2d..491f271330 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -88,6 +88,10 @@ else
 SHADOW_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SHADOW_DEPENDENCIES += libxcrypt
+endif
+
 # linux-pam is also used without account-tools-setuid enabled
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SHADOW_CONF_OPTS += --with-libpam
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
