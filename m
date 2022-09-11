Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F17ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4A841634;
	Sun, 11 Sep 2022 12:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B4A841634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CE63uzdst4dP; Sun, 11 Sep 2022 12:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE89A40BCE;
	Sun, 11 Sep 2022 12:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE89A40BCE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4F2D1BF373
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 12:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 802F26FBBB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 12:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 802F26FBBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKJERsjt9Kzy for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 12:55:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED8F6FB50
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED8F6FB50
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 12:55:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id az6so5292268wmb.4
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 05:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=G83f8bK2D51PLf/03jVYlr0tn6g4Hfm3loY1TlShwLI=;
 b=XXHw8rOC4siQcx+kqZOF6OJr6iYZ4ZegMmPM3jd5qwUHroDj2skTh+OEt+NCVgVGwN
 Jrl9rCMlF0nV93jI1Pa9iMMq3VvfmLu3WcZ118vzO2jKMjCOZ9n9itJXXqqV0Y8klcWB
 tz48iy4HdamdA2UNVbt+jxxbwdJCrVx8nk716WdT1wbTYOljpz3DNZ04OzlDF+7a8j5S
 /ygnKfx9Ffmx53ATsK9cYYzusjNrYYjq8j4Uco6nriDYWAQJLvBjwa4bN87tdftqO1Yo
 1PfSLJDHmlMtsj2v8NBM2uSZCZMSKqgXtN2rTqtqQlRAwqQWgrQaS/rPKezBdEEUpwg8
 Ikpw==
X-Gm-Message-State: ACgBeo2yCpdyuHfs9/9wDu62Zma4qF/wybKeKpEHW4ta7Hns+t4khydZ
 ETEVwgaAhcX/gYqATCoyqmBxMqGQRX8=
X-Google-Smtp-Source: AA6agR5GDdyfSg8k8NS1LzmIVbjhIO/LUlA1rVF7HkGqjFZFTwGPSWnZdmo/hQrYg0s+53cvTrjjdg==
X-Received: by 2002:a05:600c:1c84:b0:3b3:ef37:afd3 with SMTP id
 k4-20020a05600c1c8400b003b3ef37afd3mr7234805wms.155.1662900941661; 
 Sun, 11 Sep 2022 05:55:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l16-20020a5d5610000000b0021e43b4edf0sm4879223wrv.20.2022.09.11.05.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 05:55:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 14:55:33 +0200
Message-Id: <20220911125533.29246-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=G83f8bK2D51PLf/03jVYlr0tn6g4Hfm3loY1TlShwLI=;
 b=VPnXFYPbzzGqQn2bfAvlPJjquBIcwtcH3hWbwxgHrMLGWH2Scx2RcOXGhMsHIYEArU
 +0cYP6DtTJ7PWtUkmhgIR1pXGnFkHbrjTHDzQDe2e/8IfbyDTxtxCektNVZfu26xeS4S
 cB5TeUmLwNPISzOU4xvteKuYPZR3ZQ0Kh/MAEd8a400/xPKMJPrTWVrC/Cn818+sPk/A
 gyhAWYkRkOj7Byhv09KrjZltB0m2fkoEsgUfiwD1wjhoYOlOuFyovT0+RvfGiPUXbUTD
 AdzrmHLH/yLNKaNUkJwUY11I/brVIauy/I/B/7dhe7XgCQ5fK3MMkUinbJXgshku9KmK
 tOzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VPnXFYPb
Subject: [Buildroot] [PATCH 1/1] package/rhash: bump to version 1.4.3
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

https://github.com/rhash/RHash/releases/tag/v1.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rhash/rhash.hash | 6 +++---
 package/rhash/rhash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index e0555af3c2..355b5c275b 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.2/
-sha1  fdb0b0c16f3ba3eba734b3adf9f2fc4c427ff987  rhash-1.4.2-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.3/
+sha1  6e698e6d5b13aeac55076d6a53dc4dab55f2114e  rhash-1.4.3-src.tar.gz
 # Locally calculated
-sha256  600d00f5f91ef04194d50903d3c79412099328c42f28ff43a0bdb777b00bec62  rhash-1.4.2-src.tar.gz
+sha256  1e40fa66966306920f043866cbe8612f4b939b033ba5e2708c3f41be257c8a3e  rhash-1.4.3-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 02af0aa57b..8c33de1862 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.2
+RHASH_VERSION = 1.4.3
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
