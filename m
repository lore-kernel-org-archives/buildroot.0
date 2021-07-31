Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7307C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D6060FE7
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69D6060FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3371683640;
	Sat, 31 Jul 2021 08:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAYrEBfxY5Tb; Sat, 31 Jul 2021 08:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8604A835B9;
	Sat, 31 Jul 2021 08:51:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C05B51BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC95560611
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTUdM1rVVvvX for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:51:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E250A6060F
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 08:51:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id m19so7401373wms.0
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7JiHk0/dZV2ZUa9pY9lotnE9sKdThVJDpCS9irg+vZM=;
 b=W9KC4Co8tHmM2QxdXqWszfOr+Gow89h3TlVVhESNKFZTRh4e7WkZJ/ya9vDLHXjk6A
 37skRDmUMpPO+Tq+T82Uir0ueHZDAGM36CyiC++UEBVQSvhZparjhEV1CrCUz/zfPKuK
 tJopMu87Vxns820u68p8Nc9vEGmtd2A9F2fPa73oKGs5GegQV77ZGPJRce7fUR/TDUeF
 /tQXy5dp3BqYyYtULJm1W6l7FhX0qXz2bsUzmooFXMoo2227RlPbOPAbxI0usTcpU/Pg
 lybTbY6cQ2rl0HUy53o7svzOLfgFqjGObNTgd1a5Kyn0vxOrVI7O17kdeyxxzytyxOvr
 MXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7JiHk0/dZV2ZUa9pY9lotnE9sKdThVJDpCS9irg+vZM=;
 b=K32GeonQLI8RMf/5B0D7keT7vKJYv81cstVbSZYkWzFlss9GGSDQLJpN2+xmjSMvzB
 ECwW7cOxzgfj+V/r2dSmBGM2lgAj2rYzhWizeBiBlulEVjg/7m8Wl10KdSph0Bq0PzPb
 aZvRtJxc/r1F2f6q2WV0UAZS+chkGuuscjfEXz/uQmPP2b5mcDfK3YKt6hnJSg8DHX9S
 xwhYZCED3CPfA2fVPaTmWXcixtlKIWHKqKtOWte5QdEt3X6JJGJcy9rjcACXCDFtJbaM
 /HR2PoPjcC8LwIyeK+8/V8VkeeNJFgPQKsoJIcC+Qym11LBJnE0Ue0DGrDlR2PGMXBbc
 a7og==
X-Gm-Message-State: AOAM53048MnLpR0DVRJBcAgj4LehkZsZISxgknNIDR1UJgZPvYW4JObg
 mNcSYrMegEL+Nu487R7WF1SN65u4Z5LigQ==
X-Google-Smtp-Source: ABdhPJxHQX7CdEGBeuQEfd119THb6/uUJkawasVn7axxmaapOvgQjF1M3cURaqahZ3XGpPWXLidjtA==
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr7005414wmd.108.1627721506200; 
 Sat, 31 Jul 2021 01:51:46 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id a14sm4290532wrf.97.2021.07.31.01.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:51:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 10:51:37 +0200
Message-Id: <20210731085137.624287-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/git: fix SELinux
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add apache module as for now it is unconditionally used in git.fc to
fix build failure raised since d6644c9705f7d9bc2d647b343d0dfedbe7923907

Fixes:
 - http://autobuild.buildroot.org/results/b3e243db92269f6d8c78c608202f19a957fb9200

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 3c3ad9d825..556921a9fc 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,7 +10,7 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_CPE_ID_VENDOR = git-scm
-GIT_SELINUX_MODULES = git
+GIT_SELINUX_MODULES = apache git
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
 GIT_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
