Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88384C4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 23:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA7E813B7;
	Mon, 26 Dec 2022 23:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA7E813B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBVpVdFzLBEN; Mon, 26 Dec 2022 23:12:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E512813B5;
	Mon, 26 Dec 2022 23:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E512813B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9341BF34F
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 23:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E8A404BA
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 23:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E8A404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErVEEErnHOHF for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 23:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DFBD403AA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DFBD403AA
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 23:12:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id h12so7094415wmq.0
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 15:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cg6jByMb/pj6E43ZT+GgFl7iN7ydo/Ss1gtzvFRprCo=;
 b=lK4MwV9+ai0hzz2CiEhHQUUJNgegX5hLo0oEq37mmiW3SMM+pIl1QUr2bs+ooxQAQl
 v4hkD1JLfCloZqFPgmB/wHDAKLOJ2cWbj455w3VVl5mZiOe+PxRATJjlFVCvZVYd0w+b
 nFCr+LiVgrbsyYYXU+wBQlXlk8zQevBfPPfR2bztiUKkx7pkfIbudWWdA/Pyfrsav4VF
 Ht5Z3bpr4Ri6uGQv770/MyzVPBIEx0xeQkZpiQsnTPXy371VcsXs+laPZtHv+1F+YkVh
 Z1RrMIVHPz+t423lwcV7HE568UMkrZm7N1hJ8Gl19zCxn6HMBVB+0yA3TeWPC+Sn7uud
 0bhw==
X-Gm-Message-State: AFqh2koRa+ZgSoBcxSAjRCoHCr1BdO+7yYHjWeG6J9IenAf6qDprOwV0
 l1cduGXscfckt18XqhaiEfY5lC0s5pI=
X-Google-Smtp-Source: AMrXdXvW4T+rLgU112B/gI0WetvKTy+VbkBu57+wfW1JhqR+74yyGF9kqTGmJPWA46DF14UJuM8lKg==
X-Received: by 2002:a05:600c:6007:b0:3cf:4ec9:385d with SMTP id
 az7-20020a05600c600700b003cf4ec9385dmr13772843wmb.19.1672096347194; 
 Mon, 26 Dec 2022 15:12:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003a3442f1229sm22494873wmb.29.2022.12.26.15.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 15:12:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 00:12:08 +0100
Message-Id: <20221226231208.849619-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cg6jByMb/pj6E43ZT+GgFl7iN7ydo/Ss1gtzvFRprCo=;
 b=EZ6gKxeEQAOOE9/ohrgdo/cjyr2ccKuRrFa1m/xORP9pBvuIjDJ1sclV6HUqUuZF83
 YWTRzYKd+mqg2q8lqJ17I+1vJiki40yvVMRpC7BRfIMI8wyVRoH+c0Fn90WKU8osueal
 j0JTg2aaa2OlqtEUROtMW4dPjrmjyY5YFj2EFIByN7lF3+LG0ORpi+vsd5LgThVKRrnJ
 OX9z0uWtKpswaz0t7mLAopucBUzWwcCbpkRaDN66UnEqD60IC8xsq6z8Cs2MeNBjlewK
 2j3xHGoUwEp+mBzjQPLSK9ogkMJfELhxYgKcM5BoJc+D42KPZgbjmIZgdFHV0biPUhpR
 MA9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EZ6gKxeE
Subject: [Buildroot] [PATCH 1/1] package/libpwquality: bump to version 1.4.5
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
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libpwquality/libpwquality/blob/libpwquality-1.4.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpwquality/libpwquality.hash | 2 +-
 package/libpwquality/libpwquality.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index 1469bc0b7a..e64fb4bf50 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff44278d276141752a545  libpwquality-1.4.4.tar.bz2
+sha256  6fcf18b75d305d99d04d2e42982ed5b787a081af2842220ed63287a2d6a10988  libpwquality-1.4.5.tar.bz2
 sha256  aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee  COPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index d4f7a47120..ae6babbcae 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPWQUALITY_VERSION = 1.4.4
+LIBPWQUALITY_VERSION = 1.4.5
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
