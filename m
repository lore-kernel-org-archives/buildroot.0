Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7576C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B4E60F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B4E60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3673A605AD;
	Sat, 13 Nov 2021 13:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yII9mBGVf1bl; Sat, 13 Nov 2021 13:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ECC6605E0;
	Sat, 13 Nov 2021 13:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAD751BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8047404EB
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKRSxKPThmob for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08EC4404FE
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d24so20708039wra.0
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABGp96ToIx1t3Nv2NNeqGgqBozrBkMp0QdSpeA8ZyKo=;
 b=lB9XOpG8Hsj1jhvjmre/o0/H7pGhnsW2VT0emjgUNopMo08pzVra75O8nLdTmVv3V/
 qG8jYyzCsvhVmDaMqELlZnNVhzaktOXYEWSyzXAoc7MzlqTojbZniVAvIocsP/j7Fw8j
 lK1WCLxirHEQD044UNOGnB6KJjOWIR4+C8pjDPsDRdBN1X/553ugjuny6S1yVTK5Vzxi
 WYdS0lcc7mGuQ7efEAdkFvoNNOdyAP3vDyc4umfpJNfh+L/7fV25vx2VcIK4J+MhZmlw
 x1hXhrZ6BMrWSGKbxboM3gkuWnFtG/4Q7f+JWdF77cCX7B7tXUHHbJKIBZvYRsLhqSMk
 CU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ABGp96ToIx1t3Nv2NNeqGgqBozrBkMp0QdSpeA8ZyKo=;
 b=jUh54XgM2evPLEOMd0TCV/OF/B4O7rXE1G9Ca8Ol+Br2UBysI2MlbGYHM29JRTFyFQ
 ALirYJJULed2jjgnZPw2ufL0878FoA17b+VFls6zYLoylQ1MXTeXeTVcBYdwLMT94fIW
 ZKWxzVTDuezC0Pu0OcVhaMMIncliNgoLhWtyUdF9jd0OrAOewU6BPmrjQPfl4N38hTZm
 RUey05aEd0267zuoupyTNZNJlm4d5YHdbUZeLhJCeVBDJv7H8EogHWi/JNXy7G7vpC9K
 aiLaDV0mhauuSLfxU4yvJcBiFHTPI8n9Im5PK7WoOAWrOcrgOODBG+vmAkgbA3WSiLwx
 MoSw==
X-Gm-Message-State: AOAM5314BYRlcXOggP6PXzpHr2YBvDEj/0WGQ+eDwIzRI0qYzCIlmawp
 UmgDf0L8/1GYHcHsIv+6oA1qbSMo4nwIsQ==
X-Google-Smtp-Source: ABdhPJzaFwrEXjilMU/GjO3Cul0wrR3GMA12MCI9pbnLdfYrGXTdrtPgYiBP6LaVIwkuySRh5cKQUQ==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr27648141wro.324.1636810109401; 
 Sat, 13 Nov 2021 05:28:29 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:29 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:13 +0100
Message-Id: <4c64e6aa417bb1e78752da60063fad791c58f3ed.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/16 v2] package/kodi-*: run pkg-config at
 build time, not at parse time
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When calling 'printvars' on a just-configured tree, the output contains
many spurious warnings about pkg-config being not found:

    make[1]: [...]/host/bin/pkg-config: Command not found

This is partly because a few packages call pkg-config at the time the
Makefile is parsed (really, right when make evaluates the recipe before
executing it).

It is customary, instead, to defer the call to pkg-config to the actual
shell running the recipe's commands, like all our other packages do.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk  | 4 ++--
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk  | 4 ++--
 .../kodi-screensaver-matrixtrails.mk                          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index b78646b9a9..21def8ca4c 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = glm kodi
 
 KODI_SCREENSAVER_ASTERWAVE_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index c6dd26a89b..6f462e7d27 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = glm kodi
 
 KODI_SCREENSAVER_CPBLOBS_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ac4303a719..45d3e46b4a 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -11,7 +11,7 @@ KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi
 
 KODI_SCREENSAVER_MATRIXTRAILS_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
