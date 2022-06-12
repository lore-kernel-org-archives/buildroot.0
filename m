Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ABBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 20:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B59560F39;
	Sun, 12 Jun 2022 20:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1VQFYxOmK5k; Sun, 12 Jun 2022 20:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49BF60F33;
	Sun, 12 Jun 2022 20:11:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6669B1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 20:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53E83416EE
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 20:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJY2nHxtkGG7 for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 20:11:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1939A416E5
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 20:11:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q15so4790373wrc.11
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VWE5L13bfimtn+vsgdjSgjUPg4W6jvFeFwGS3sU+Bf4=;
 b=aUTAFyRJw8pmy1QNKGU8UFklsd3JVBrnwfT0GLMT5EcbtbHYT25YNWkmVRi5EESRfR
 wPCer6B7me99ebPZ07siD52QhUATUyv4Jsvc83687FHgNwlTgUIBiA/8Bk+HhV7NCFnX
 oCGHvCnl2sZuJ5PrsdJl9QObW+NhRXMLDxQlK+wpAXuFOIxCZGuA8cCA4nWmi7VKml+8
 Vypn7HmOUvEMtXBIwfIc25WMhoq9cnCD8cC4wvnxIsHStsJKIgP/CGa+5H2NuUaL2mK4
 T2TokTestyGo9cL23Fhb9SFmCbAABFxzXKBPBHflznIhC+VsAINoNGEwptKu9e/Hh9C4
 TjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VWE5L13bfimtn+vsgdjSgjUPg4W6jvFeFwGS3sU+Bf4=;
 b=c0bpyIIOps2rFpPX/iT+/QTd/KyXgVmZHVbcUzsN8mKBzXhIGXGI9HEdXJg1Ko7Hwj
 5/BV3oHE1pIly2HObwxlzIWc7py0lEt+VNuen0nwnBMM1pM+rQQwkOYqJK2EjbQoHD3n
 nkMoTop+dx7QkL5lntTcFX4lYcFhHlQiiyhqMpLY87343msNwK+ewGZLfhwLNQGTPyLa
 6Ej02/Y08Kt+Wewyk1U+ZdiYaZSFSAYD8eWZr0mPC5q9Hk1q2UBMbOwLG/E7jeSKCi78
 zlhOMjLYEcXdO1Sm7X9/OCjNFmnx8OUCAt3ubzdFyKcRuax2FdB8Gx4Zd3oo2yLt8cZ0
 eR/g==
X-Gm-Message-State: AOAM532TwaaSo88047TndZcy0tlnO6gmJPmDnBnYG+azTeHBzwCz61eF
 1sBqj7MuiiZz75/2MoE+4TG2hVkZIXo=
X-Google-Smtp-Source: ABdhPJySazgfOiF+URvPWj65RwJxvKOCpru6dRNygUIT62ieiO031FUvy1r5D7PAYmciidEVDSXl1w==
X-Received: by 2002:a5d:648a:0:b0:217:3552:eb2d with SMTP id
 o10-20020a5d648a000000b002173552eb2dmr40880749wri.78.1655064710829; 
 Sun, 12 Jun 2022 13:11:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000008400b002102cc4d63asm7615198wrx.81.2022.06.12.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:11:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 22:09:04 +0200
Message-Id: <20220612200904.2783767-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zstd: pass _GNU_SOURCE in CFLAGS
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

util.c: In function 'UTIL_utime':
util.c:173:27: error: 'stat_t' {aka 'const struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
  173 |     timebuf[1] = statbuf->st_mtim;
      |                           ^~~~~~~
      |                           st_mtime

Fixes:
 - http://autobuild.buildroot.org/results/dd944a3bd4ac0c94b2bec8ac209100daaf43903d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e8f6315222..75eb6ecc07 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -36,7 +36,7 @@ ZSTD_OPTS += HAVE_LZ4=0
 endif
 
 # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
-ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
+ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"
 
 ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
