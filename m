Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830C6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 05:57:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE6861152
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 05:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFE6861152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3E8342553;
	Thu, 30 Sep 2021 05:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Shayn3xERu5A; Thu, 30 Sep 2021 05:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A47942565;
	Thu, 30 Sep 2021 05:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5D821BF2A7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 05:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4E1B402C6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 05:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMyTG3gUfj2x for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 05:56:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53E794020D
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 05:56:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso3394126wmd.5
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 22:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48MUybFbg5X6N/xDWiUyamx4zL834bYaDdN5t74iDhY=;
 b=Qw2bu55iHTDJo/JE27YWUVQkwL31Kqm0W6760Z/n8F33CAkhtRIF9402A2XrnL8ySk
 Uh82Jq324sS0MpI8BiGCZQCBNRMAQbfU6upoPpC1ie2O5NKvWp4/MLqNG6PCxWEO5Ugd
 q5qx01JZB83mzf6IN72iXEcA4DzDh5bOiqD14k3msZOXss1SRPO6PclZjPPGKSRmYn8F
 LkXueAWdGsG9GZy6KeTs4pKtXowVEdr05VulZRM1CThXCG+dA8rKgW9nzcd73DK22ih4
 kvGeMqVjpk+1q7PFTwHD2qHV7sqBOz/TW9n9VdcxHfvYdMtXzspOh5v6XGzHpOV/XBEM
 xlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48MUybFbg5X6N/xDWiUyamx4zL834bYaDdN5t74iDhY=;
 b=a56tR1/YqxJWclPdkVL8BIxxRbLQHjbR8iO7hBx8bKH874wbeEB3BRhgzsjMQg9Sof
 iFVs4OiMiuli7Z2c63AUT4tOURfsHxQzYX+yNbtcMWPtBdYz+9XPjMJEcr7kcqYjS4fD
 rNo0Y/YfENJvOf/kGNAKRBst5allW7hEzV4x+1j9FavNKNUoMyQoa+Dwnj+wEX2rBPne
 BK8c4CifOtdZxoiHg4ZmIMHhdNqc8RD5pTD1aYLrd8OH+ehw0V7MfcNOx/MTVfxC0utx
 EXCPPXyevfN0+wIz22P9l1IdQPwJTPKCCXXrBIO26OxyyTMf39fFnvgrrEMk4CwOsYdV
 oQXg==
X-Gm-Message-State: AOAM531YEB4hOEOfWdDnvjuKLuSStIb5q31m33p0q/v4kZb4KcM1Maiw
 iPngEWedz7W0mm3fMX17Z5oxLEDjjZk=
X-Google-Smtp-Source: ABdhPJzpmx9TbSJRMHvBSMKForomP0wBmOat7XSgZvm1qwksgRB7V37z964S9gJ8eCmstnWom7bpUQ==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr14163542wmq.91.1632981417118; 
 Wed, 29 Sep 2021 22:56:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id q3sm1751738wmc.25.2021.09.29.22.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 22:56:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 07:55:29 +0200
Message-Id: <20210930055529.1929991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdbm: needs wchar
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

wchar is a mandatoy dependency since bump to version 1.21 in commit
60add404db424e2652673a7b6a3ba2bc80380b42 and
https://git.savannah.gnu.org/cgit/gdbm.git/commit/src/datconv.c?id=0019677be7b751eb2d9b7e9ab25994cb696c7822

datconv.c:18:10: fatal error: wctype.h: No such file or directory
   18 | #include <wctype.h>
      |          ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b35ccdf734a02f0866fba7d86d44a8b452601607

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdbm/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index debe5660d7..7c8fcc4e5a 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_GDBM
 	bool "gdbm"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	help
 	  GNU dbm is a set of database routines that use extensible
 	  hashing. It works similar to the standard UNIX dbm routines.
 
 	  https://www.gnu.org/software/gdbm/gdbm.html
+
+comment "gdbm needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
