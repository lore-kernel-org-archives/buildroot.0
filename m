Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA80C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9239960AE4;
	Sat, 15 Jan 2022 10:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lF6V20Amfvlb; Sat, 15 Jan 2022 10:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B6460AC0;
	Sat, 15 Jan 2022 10:39:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60B131BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F1E0826D5
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUUk57bWz7TL for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:39:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C28C826C2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:39:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id v123so10723505wme.2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21avlzowxuK/WG9HIYQibfZPjhYmzl4T7zLN6Mt92uY=;
 b=UPQsyuICWcqocXgX06jPziqTdvVy8RVrCyfc3pcwu6ZeyviYXo9b+73lSxMxl2sBIG
 nbaUv5IQalQSPaA9/nuJY0l33CdPs6//VK+QxMRH9RjE57GzEFlY1UX0oHh52fGBZ/WW
 7VGeax4U0EKSW+SXgjlam4pvqOr1jYxuH5z22+ARaPzfToCcOQP6JHRLA0BL2++z/aff
 M3qSdAxoon0bwLj83Aud7ISdPT5Y5IK2HNnCYu0PzeOgQY4fGJCIy7kaMJjiarvkeMTh
 2Vt+W6OLCxH7Hlu3IpX92O8C0WGUFiRxzGd4u1jljbAV1RBbxwzvnHE8EMmEg4nZg5yH
 b9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21avlzowxuK/WG9HIYQibfZPjhYmzl4T7zLN6Mt92uY=;
 b=wI9FfHxh2nQejT+res8B5iuUvgPmEnALLcPlCcqss7JyvK1yMCys+df0e6FNmxKlH4
 7XlTRNfITBUmgMtTmi2b/KJYWgMoGicT6XWR5tlkj7yqJz9AkSvmWLaiuAsWV5ZRTJ9i
 o+M6rT8AjWjSmnSZflJXOOm+hOupAYW+ON5aXdW2PyBTJPXrlYQ9hEqcOJxr+m8MJXhl
 YIWNyNSchYRIoBkeRQQ2n1n14LTuj2Pcfas3A/6rCZRVFQ1hlSIea3D5+LwModTinJy+
 0VcF1pWmta76IBsCaQ3Awnl8KL/CWLbKvODVxFACygmOpkUllIxginUgzhxw6jjb4td4
 CQTg==
X-Gm-Message-State: AOAM532o3IppiSZ03DH8bNg9bB5tCrD2G9NVCDClF1HzBaYySKlHyFY3
 wr8hrFmTz9nhwjYEXFdZhwnL4iniqpU=
X-Google-Smtp-Source: ABdhPJzO/hlmFlao0tkMv0w79fGq0c5vPrCUMuBFepkJfh1pa7/0hGifnVan9fU/kJooJ4JcBjA2nQ==
X-Received: by 2002:a5d:4201:: with SMTP id n1mr11756584wrq.239.1642243166588; 
 Sat, 15 Jan 2022 02:39:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id g12sm3733wri.104.2022.01.15.02.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 02:39:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:37:54 +0100
Message-Id: <20220115103754.1759593-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: enable all features except
 python on host
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

Enable all features except python on host variant as suggested by
Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20220114171847.634174-1-fontaine.fabrice@gmail.com

Indeed, host packages have no way to express their dependencies on host
boost

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2d2a8fb311..ad071ed206 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,13 +12,7 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
-# keep host variant as minimal as possible
-HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	contract container coroutine date_time exception fiber filesystem graph \
-	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random serialization stacktrace test thread timer \
-	type_erasure wave)
+HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc --without-libraries=python
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
