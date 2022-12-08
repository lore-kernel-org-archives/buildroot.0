Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C3AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACDCB81E6A;
	Thu,  8 Dec 2022 21:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACDCB81E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhcFEPFkoT_6; Thu,  8 Dec 2022 21:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA59B81E0D;
	Thu,  8 Dec 2022 21:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA59B81E0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3408B1BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8A060B0B
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B8A060B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6sT9kiBB8J8 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:15:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4CD260A8A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4CD260A8A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:15:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so4434451wmb.2
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSuT8Y80psRyru0zeyeVXy8A/7ntTBnnmBaBk3x3TKA=;
 b=qv91KDPcvDjjBb5+cc1qBT8ZTDr7HIozndQePkE9DVXslq1uKzUDUrGawmyqxrx1i3
 KZt3aAoj5ht9lgDj+/0HKiFH01yBcioEcCSwiyJ2pYfCRWWApCd9AQ5VWUrPhVx/+rE+
 1gIOu/v1Wm3F4ua83+z8xlZQBM4kWpZK/EiBHnh9Ai9GDAt5aPrnDvGaYZ57TtiwoKza
 kAtnKI0CxhkdiWfH7OSpk1iUtIEvmgZsHN+kpimskfjSdGcAlTy3BUvzPijpOOVHCShn
 bNEQUG9nZfeTUAk6kQtFFNHTJR+W3bEwGWrKROtTIk+LgkHfzoQZSJRSHSVPfurpNsIv
 Gm+w==
X-Gm-Message-State: ANoB5pk1iD5Ssazr+rnFv8l7E2Q9jsOSTeKkRH6nGPEzMj+vvGLyKpXQ
 wwBA8MG1m4VBffVsEh2t+wyRb3ZYXEE=
X-Google-Smtp-Source: AA0mqf4ktSXwaXJxZFGwj9oHE0e+I7kce7rmqAKlzDRTxbk5O/ChjkISaZfq50oE8gV9udcgZzTB/g==
X-Received: by 2002:a05:600c:538b:b0:3cf:8d51:fae1 with SMTP id
 hg11-20020a05600c538b00b003cf8d51fae1mr3082514wmb.0.1670534124631; 
 Thu, 08 Dec 2022 13:15:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b40-20020a05600c4aa800b003cf6a55d8e8sm5944054wmp.7.2022.12.08.13.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:15:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:14:49 +0100
Message-Id: <20221208211449.53938-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eSuT8Y80psRyru0zeyeVXy8A/7ntTBnnmBaBk3x3TKA=;
 b=oSe69xoZKEttKCLhLKSu6nGLf0bzoA7mrWbC5Jgobt28UwZJIagG+WMPDDa3tfgtZ+
 uFnVss3TUiRaM5qe72WidyOYbP+ey8eagFwPVX05BqRIeQpvHcUKcJPhcb7iI/HS0FVr
 jGsvRIXiQOm9mogosCqjKe4ilIxqykZxsowg5D0V7yVIk5rEeFjyZ6FMPwZFrATUoNA0
 443okpOX/PhlvOU8ef4af4ffa4ZcQeXfhhRMxy3okk/GtPYHQwPaTSv2xYXyxBkXCnyq
 nb07rPMChDxljtdWWlKB1SHW7ZxicPWWeCIbWuXxQTkt0YNXLm5IBmWxgoa3TmXMpDBV
 KOlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oSe69xoZ
Subject: [Buildroot] [PATCH 1/1] package/psmisc: bump to version 23.5
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

https://gitlab.com/psmisc/psmisc/-/blob/v23.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/psmisc/psmisc.hash | 6 +++---
 package/psmisc/psmisc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index 47e44f6921..fe146f90c9 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
-md5  8114cd4489b95308efe2509c3a406bbf  psmisc-23.4.tar.xz
-sha1  a4c34111e570c43967efb2bbd8a4f31d94d22e0f  psmisc-23.4.tar.xz
+md5  014f0b5d5ab32478a2c57812ad01e1fb  psmisc-23.5.tar.xz
+sha1  a16073f459a19288c1ea2b413a84e1b996cab595  psmisc-23.5.tar.xz
 # Locally computed:
-sha256  7f0cceeace2050c525f3ebb35f3ba01d618b8d690620580bdb8cd8269a0c1679  psmisc-23.4.tar.xz
+sha256  dc37ecc2f7e4a90a94956accc6e1c77adb71316b7c9cbd39b26738db0c3ae58b  psmisc-23.5.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 8b92be11e8..3229184459 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 23.4
+PSMISC_VERSION = 23.5
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
