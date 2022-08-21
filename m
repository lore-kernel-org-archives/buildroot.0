Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28027C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F64F411C6;
	Sun, 21 Aug 2022 09:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F64F411C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPopdUHWra68; Sun, 21 Aug 2022 09:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AAE410C3;
	Sun, 21 Aug 2022 09:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08AAE410C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4FB61BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 09:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE79781A3B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 09:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE79781A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjXAwJRdGv9V for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 09:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A568B81A50
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A568B81A50
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 09:29:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l33-20020a05600c1d2100b003a645240a95so2170563wms.1
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 02:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=crTyxOT7HzkEnQ60zmGurT/7B5XFZZ6jWa3s3M5wVSc=;
 b=gFGyrtOlZmEID+D17XXiAvuCLPREntYo5vXXaupHg95dKSGklOC8Jj6bkhMX/9SS60
 vIlRD38YNIy32khGhT3kH7OTadyG7BSEpBc3BeaUHOraWXhI45YclTJXPTdI8f9dsh8a
 IIGABuQKhHjOKqGr0C1CTk7APpBMV3+aar6Opsa7cWuTtaf0SGVwT8O7xTSArq6fniP+
 vJur1JFTFnh9dO52959c71H8kySEEMdrNgqPZQskgNO+HONjK6IKLaV/n49KNLPqo4Q7
 +dDanNRSOeQbIhFdELSlmzb6Je84IMnxwIEi/sRkID0FnG+sBfLLACMOr2fBmHkj1Xsg
 /c+Q==
X-Gm-Message-State: ACgBeo1fYnaFV2H2S2kMq6zGdQtUvN72LVr/S2jD1dWEalSbT+LYzA8Y
 2kIMRyUnxE33vK1LUlts+ewSeW5FKBc=
X-Google-Smtp-Source: AA6agR6VDCsEQqQjwps5ujTH/qwpNKS2q7N9VLbBzukeu/NKgkiMsPdjCgXbTFUfVri/HIbWgA1New==
X-Received: by 2002:a05:600c:1550:b0:3a6:1d8c:247e with SMTP id
 f16-20020a05600c155000b003a61d8c247emr9300625wmg.63.1661074175766; 
 Sun, 21 Aug 2022 02:29:35 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c2cc800b003a6632fe925sm770476wmc.13.2022.08.21.02.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 02:29:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 21 Aug 2022 11:29:24 +0200
Message-Id: <20220821092924.1620008-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220821092924.1620008-1-francois.perrad@gadz.org>
References: <20220821092924.1620008-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=crTyxOT7HzkEnQ60zmGurT/7B5XFZZ6jWa3s3M5wVSc=;
 b=JscP1TgLypf1ZvUS2ePT2OlZohMzVzE4O/14gNJOxuAa6tblsd5bPPnHgx5B6rdACm
 CX/7o6YU0ItzHWQvSbpzn/WwrqTB8gXQ3uu8mbAmTywSxJQm7CWvEcVpBeHFhJ248Xi+
 uzhAaKwvVGJuYAZqbG/KL1OMQlGIDi8IQQmv96Z8x75+2r+ourE6XO0VP9WXhvvl0kYv
 X/EgU6hsxipyIfsUqnVUTV0DRdcwoJWhwU5iL6qAON0N69vONRkrS4DRiMPohQQp+7X8
 7tJvvc2bbS4WLvlToVM6nQ2CF05lJTMFety/kXvQXrHTQyiU0F94hG+/fIlDszOrgYst
 Bfkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JscP1TgL
Subject: [Buildroot] [PATCH 2/2] package/zic: bump to 2022c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../zic/0001-remove-dependency-check-on-version-file.patch    | 2 +-
 package/zic/zic.hash                                          | 4 ++--
 package/zic/zic.mk                                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index 62adc59c8..64587bc0d 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile b/Makefile
 index 1b714a8..00d2c09 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -593,7 +593,7 @@ INSTALL:	ALL install date.1
+@@ -609,7 +609,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 9e17621de..c9c749194 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
-sha512  87b0335129ea41c5f42f687f548712e5da892baa8494cecf5d34851beceecf6ae52f22104696ed187713cf9e502570eb2041e277dfd3c043c11d0253bfde685a  tzcode2021e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2022-August/000072.html
+sha512  3373fa16a12007415c3dc3a75c4a0d61d6ae54968eeecedcdf4bcfd7f554020a15c4687dde107b90462b75d848eebe1e200c33322ebe0d3f1ad11bc769cade06  tzcode2022c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 13f3a83bc..bb5cd3c91 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2021e
+ZIC_VERSION = 2022c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
