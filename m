Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89AC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727BC615DE;
	Wed, 29 Nov 2023 21:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727BC615DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIvn2SU-aYa2; Wed, 29 Nov 2023 21:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EFA615DC;
	Wed, 29 Nov 2023 21:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EFA615DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A07AE1BF377
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82B35843FE
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B35843FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vg1cD6qP64iT for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:44:22 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 762FA843FC
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762FA843FC
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b4a8db331so1917785e9.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 13:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701294260; x=1701899060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W0z2YI7zZ3hqbRhU5Cyh9w6GwoptcEo4a7usnqp/5sU=;
 b=ujX2E+eKD6cuj+/U3mDQKw0LUn3hs0EYEvGLa1QKkS4QKu8k08vXMawnQ7E/QmJ1G6
 t1Pf5S3LAzWqlqmwConO+pD8XHrHhCM1E94f0cJ+/ooBIHr+yFQ6ooV98jkHVQZJRpSJ
 zI8nmAPhq7hbVqnFyRLGhH/YURIrindQjUwihtGf7qH9CT3Rv4pMgD9g2UyHlps6EfMi
 XSLv5mrOAtxQMV4PbwcUxmhm7oRgzpQH1Ym5TvdYez5eWfFtbPtU8PP1JdBp6crCOXbB
 AIx1FOsNbNzBdm01ogUe2YhwZVkbruH+D4Y6ESdmZH9TLTl3QJ7akxkt5mP0GhyLBepE
 C3+Q==
X-Gm-Message-State: AOJu0YyeuQm8QcgQsutFSXl6IYIPQ0tPwDDAvj+ZwUS+HJT7srP1zooc
 FzBegCNwg651lXJOx9kpwghnj5jKAzM=
X-Google-Smtp-Source: AGHT+IGLaO0afuttKoRFkZQBTq7ML6BNsEr5Gg1XkN8G9Wj27BbuJxI9KkxMbVxTca9UwwICpRLyXg==
X-Received: by 2002:a05:600c:4fcc:b0:408:fe93:a2f7 with SMTP id
 o12-20020a05600c4fcc00b00408fe93a2f7mr11442810wmq.37.1701294259440; 
 Wed, 29 Nov 2023 13:44:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e25-20020a5d5959000000b00332eb96cb73sm15486703wri.73.2023.11.29.13.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 13:44:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 22:43:08 +0100
Message-ID: <20231129214308.1547483-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701294260; x=1701899060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W0z2YI7zZ3hqbRhU5Cyh9w6GwoptcEo4a7usnqp/5sU=;
 b=CFyR/1ifBGvnHU9VdKa/Rm8cCeBz27/s/gmwncrtuXFBZGzlij/wSmLUqYcPo4hCto
 KAw5/13XUWKs0OiKi+X4/kJYFrisBCoxVfuPmdp8thMF4XmGa08JpZcKq0rv6PC1DakT
 j2iYTJNfTsOnviMip0VQtzu6vrwG/rMWoPM7/Qhs9oBcS1TkNgDDB12ZGsr4c7cUewV+
 UlrjV8z90XosN7OLtPoRM/rqdk3pULb0BMdBIxWFUE+htdrgK8nzBdHqOgFpMGin79ZQ
 K45555mYM+s93IV5UX4l2Sitztql9CTwi9PaXMrAlHzMA/XlCbC4fsToV9lMGSFyBuDT
 485g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CFyR/1if
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.1.1-21
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

Fix CVE-2023-1289, CVE-2023-2157, CVE-2023-34151, CVE-2023-34152,
CVE-2023-34153, CVE-2023-3428, CVE-2023-34474 and CVE-2023-34475

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8988dad5da..fd80316ec5 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4333ef2fe63f2510988af82b726f5b1919ebd54037ea6674566c69fcceb67e11  imagemagick-7.1.0-51.tar.gz
+sha256  09402e5f17c6575ef9f010bb2e21ae1710f1f3426f115ad4317ee9129c32608e  imagemagick-7.1.1-21.tar.gz
 sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 91dd208b0d..719c6768af 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.0-51
+IMAGEMAGICK_VERSION = 7.1.1-21
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
