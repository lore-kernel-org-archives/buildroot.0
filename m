Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7379AC7EE23
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 16:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D040260C2E;
	Fri, 24 Feb 2023 16:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D040260C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnhWvA9aWJtx; Fri, 24 Feb 2023 16:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE2460B6C;
	Fri, 24 Feb 2023 16:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE2460B6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA1BB1BF33D
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D75402B1
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2D75402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXRi0loe9ivo for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 16:57:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C54040285
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C54040285
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 16:57:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id p26so81452wmc.4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRHnTp3pg+7QZNfAEnlr6R3MR8cedEEVXh7GMc9kX2g=;
 b=VjG1IvgSKdKdVymPf6Cxv0sYnAVdY2rOi0jvuK45Z+v+5nO0vI8Qcsnyt1rISe3TGD
 bxRtxn5HE18RcfHXrq5PcyPQ059dMeISCp9cTgHTmsHNa0BOpqu5xEvJ6PMM8mtRSQOh
 mQvNextk9TnytEpv8myBu7wL8YafojR+9m8AaB9dKhFJXpxOVmoEzQ6zyGj/hHvPWv+W
 X1cYgqL5ufmeU9U3TH8Ny8KX2OgowQm0WWC4ystyX3N+dFG42PL+NiLxfkOPLU/hesMe
 WeqWHSjjImUPjSw1TmBrqcYjzS4Hc8b+MhgFaSVDieXzGri19y2w8bxINO7Vuf9HELkt
 oSRA==
X-Gm-Message-State: AO0yUKX2P/GydJFuI0drq0qP4JZy4oTQNbzsfENWPLP7TNTBcDz/n/nc
 GgscxiCk+kTzKjcwmGvgBSYvundf8Wk=
X-Google-Smtp-Source: AK7set/QykFsek9wxWoNetvAWYSAQnFociTQB5waD05XnBfmPwpJklP3RzaalqBkLFCTvE3mRjlB3Q==
X-Received: by 2002:a05:600c:1895:b0:3e1:fc61:e0e5 with SMTP id
 x21-20020a05600c189500b003e1fc61e0e5mr13914325wmp.33.1677257875861; 
 Fri, 24 Feb 2023 08:57:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c4f0400b003df7b40f99fsm3880032wmq.11.2023.02.24.08.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:57:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 17:57:53 +0100
Message-Id: <20230224165753.64394-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LRHnTp3pg+7QZNfAEnlr6R3MR8cedEEVXh7GMc9kX2g=;
 b=mgubcaBlk4rDsBgHoPF9LpnjjIN5kH2ogtZxcdCP/c18+xsqmCrbUL+Zs+CJs3JCH2
 Gz2R2Q+tHH/CMZBtNNEL2IlZQBU4EeblAaW8yqL+5nJLJ7vRGa38CPdfm88VOhHA1pc3
 qrnueTHKyYobCwfPq73ILpUTMVlyPlT7Ys2K0R420UFWX7M42j+g3Mw5ZYoHP5m8GaCN
 orn8pcpR8u+Aqv5jbq/WGnCBvyFWA7qRbwpZPgyXv017u8rEIpYS88usC/UZw4GvXHe8
 YJIjaE7zulqcJ26ckfjsFrbKm8sANpNdYL3VCFRDMxipo08eQVjq1HDthiWtxkV5VQsl
 yFZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mgubcaBl
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: fix CPE ID version
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

CPE ID is wrong since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a, the correct CPE ID is
cpe:2.3:a:ntpsec:ntpsec:1.2.2:*:*:*:*:*:*:*, not
cpe:2.3:a:ntpsec:ntpsec:1.2:2:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntpsec/ntpsec.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index c7fa2f85a8..e612e982ec 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-NTPSEC_VERSION_MAJOR = 1
-NTPSEC_VERSION_MINOR = 2
-NTPSEC_VERSION_POINT = 2
-NTPSEC_VERSION = $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_POINT)
-NTPSEC_SOURCE = ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2
-NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)
+NTPSEC_VERSION = 1.2.2
+NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
+NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
 NTPSEC_LICENSE_FILES = \
 	LICENSES/BSD-2 \
@@ -20,8 +17,6 @@ NTPSEC_LICENSE_FILES = \
 	docs/copyright.adoc
 
 NTPSEC_CPE_ID_VENDOR = ntpsec
-NTPSEC_CPE_ID_VERSION = $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)
-NTPSEC_CPE_ID_UPDATE = $(NTPSEC_VERSION_POINT)
 
 NTPSEC_DEPENDENCIES = \
 	host-bison \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
