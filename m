Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769EBC4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 18:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BCFA60DE5;
	Fri, 30 Dec 2022 18:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BCFA60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYx-YDdAFei9; Fri, 30 Dec 2022 18:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E51560DCB;
	Fri, 30 Dec 2022 18:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E51560DCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC1131BF364
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 18:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9414860DDF
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 18:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9414860DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hQdj-rNSbMF for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 18:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FCB60A97
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1FCB60A97
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 18:08:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so10180259wmk.4
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 10:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgtEDGZ9DD//cTy7k089TukBwuAukI+gHhO4n6Md2u8=;
 b=NOPTH3bBSH9Y1I2dMK+nixAztZ6NXDcsI6c76xEhiwlDGjJYcCr9tIiSySSilC3mA5
 +efS6VEngYNzYuCnDvf8PDSs2EGbRHpb35YOAMZzov2eunPztTxuHeoEV2r3lwPizHbf
 fHXiPD6tV+CeA67BavIuJXYldhEwNlVjNvve5nOmOvPCCf9ylEkcDxoQWcvox2a1RtAr
 lUAViBx0XAR3f3d5s6Q76FxFBWHanSDUqaOtEjLw1TwnJNZQlALwEJBzIkEax8H8LRI5
 ra9My2llTD2a86Qkxdmi6gTPI6mUZ+UfndcWOvK01IgvoObr3uBZfSodVpnGfhEM4I0q
 Prxw==
X-Gm-Message-State: AFqh2ko8iCnUJdOY3M8GBs0+EICqEOfQNMSavmL7EApvQca0C0DPL3/N
 h07IcIjve4l3MvkwWs9SeV68FZKKB9I=
X-Google-Smtp-Source: AMrXdXvsaUvk/S3SIQYFWS9XeeHnOBo6AkLqe3+0QQOkiHLyn/ov7WVz/ZITcROGAXYPnyHaDkYXJQ==
X-Received: by 2002:a7b:c7c8:0:b0:3d7:889:7496 with SMTP id
 z8-20020a7bc7c8000000b003d708897496mr22963296wmk.17.1672423726471; 
 Fri, 30 Dec 2022 10:08:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b003d99a39b846sm8605980wmq.5.2022.12.30.10.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 10:08:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 19:08:43 +0100
Message-Id: <20221230180843.521147-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sgtEDGZ9DD//cTy7k089TukBwuAukI+gHhO4n6Md2u8=;
 b=FeClZ0pMcC851DVLn7g+5tC9hIDOOZG+9RXpU5n2g1OgVSr6C+Rr+JCG+oegdN0DIe
 SLqtT3J0kiMI3kgQVCz9IZSfBCXF90EVlWiAd+KYtOPOyWv547eW9tyuJjIr7m+GPANJ
 v1FCU16PUnQgr6+RNlcAVJnBeA0dNrtK72LbWe66Z/I4Ezj2BJe75seRG6jUNSGPjgK2
 9tCVS7s69oeP5nTn2em1H+r04pjl47+U7PPGeX84LDZtrV9OXUYkHTmBGTJHL4YYGJVZ
 BjrFztFKxynjaBiNnFozyEFJSRa1egCcI2zkK6Fehj5HygU0aygSVenj0WgxPy/7laN4
 YwTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FeClZ0pM
Subject: [Buildroot] [PATCH 1/1] package/crun: add libgcrypt optional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgcrypt is an optional dependency which is enabled by default since
version 1.7 and
https://github.com/containers/crun/commit/dd310aaf5aee336d0f6236c1c2add7b7cb030482

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/crun.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 8c9993993c..fd8bfb0981 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -26,6 +26,10 @@ else
 CRUN_CONF_OPTS += --disable-caps
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+CRUN_DEPENDENCIES += libgcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 CRUN_DEPENDENCIES += libseccomp
 CRUN_CONF_OPTS += --enable-seccomp
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
