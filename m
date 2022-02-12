Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68170C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 18:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4CBB403F9;
	Sat, 12 Feb 2022 18:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVhD-O_t7KNX; Sat, 12 Feb 2022 18:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3491403C8;
	Sat, 12 Feb 2022 18:42:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7174B1BF2B4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 18:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FA7140335
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 18:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NS4mJDTutSm for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 18:42:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B227F40327
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 18:42:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so8350941wmb.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 10:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJrVJlbovOi9oLSl2ZraPrO8cBz7aIF6BZoanrVEh7E=;
 b=BKMbxvViE/A8lWZ+F/ilIoMLsidOi8pWN7+EOxZDtQG9vF4cvdGsDwNohX4zOCVM7S
 nEfMehBUIpw2AygbCHZpLyw5CG4PtuAfvw+eCnSPiiRUisAZdJoZmdfKC1KcvE1EACIf
 //uWTeqVs2sL4TuRlJoJ0k1+rfXZoZlbejLNhmAM6H47FkNTuZ2lj+bodwzNB2FGSyEj
 j8j7+gbzwjhwLhsKyujsTMIzwx4Ab+9lHmwRhqTf3NigwrKwexqWLvsiGVdSHO2DlBon
 7p1mB1Wx2Ksbnr7Wj4977p7S7mkPOazDFTrv64NsiWuuAitYOB5JXN7PpylMQnO6kZfd
 H7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nJrVJlbovOi9oLSl2ZraPrO8cBz7aIF6BZoanrVEh7E=;
 b=K0bT0R1g6Gj8BZhjdryOVI8jj9jJoESZ6WVPXJg7fmHg8tXJ+/B38wwU7jwHFrPPhp
 tdzGaez3FxamNqfYeG9n+8/LsfgGJFpeH4JR/5AE+4wbjWG29WfCeBoKWKtY5c4NolXv
 Z5XpHhVUBThTpIhTd775oVoK3SBjl/3oAG+9UGMKv0vIOdF+8trDjMxI0e/vVE3zt37H
 nsmP0lteqQPmuAx8W8s4w8BOaI6gB42l7dPIaY5GsRkTwvIR+c2DXgSDI7hYAAi3Pwks
 MlaJ4x2MkaXdDgAR0M5egI5UtEOi5T5H2nllCCAJypvrnJIRWfjBnmHaTtzj4jKnYSKz
 QEmg==
X-Gm-Message-State: AOAM531RW7RVn1qEk1Ltli/S6pKiNJxFHuSd7fH4Zl68P9ds1OlmVQkD
 03Zc6FMIFWxJKwlyfQxqBSpyjsAIQVY=
X-Google-Smtp-Source: ABdhPJx+oFX1OatEPFcG+JOg703fGvyAr0eAS9zEeuRBPkOrLVPHPn3gHlr9qsL3hABhDQg4dtYyIg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr4979438wmj.2.1644691319935;
 Sat, 12 Feb 2022 10:41:59 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:9140:15a5:f29a:157f])
 by smtp.gmail.com with ESMTPSA id i6sm27323858wry.33.2022.02.12.10.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 10:41:59 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 19:41:55 +0100
Message-Id: <20220212184155.4188927-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/pkg-stats: fix regression after cleanup
 in show-info
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 471ecea5eeb0 (core/show-info: 'name' only applies to packages)
removed the 'name' field for rootfs (really, for non-package) entries,
thus breaking the pkg-stats processing.

We fix that by excluding any entry that has no 'name', on the assumption
that if it has no name, it is not a package.

Reported-by: Xogium on IRC
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index abd36a3dd5..c235d99407 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -371,7 +371,7 @@ def get_pkglist(npackages, package_list):
 def get_config_packages():
     cmd = ["make", "--no-print-directory", "show-info"]
     js = json.loads(subprocess.check_output(cmd))
-    return set([v["name"] for v in js.values()])
+    return set([v["name"] for v in js.values() if 'name' in v])
 
 
 def package_init_make_info():
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
