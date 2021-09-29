Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C07C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:26:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB5561452
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FB5561452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE0640728;
	Wed, 29 Sep 2021 16:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwD6BA3jpDiy; Wed, 29 Sep 2021 16:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A02A40723;
	Wed, 29 Sep 2021 16:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D53F1BF989
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29878421F3
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PgjWAlG5Y8F for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 16:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A0AE421F2
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 16:26:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so2210341wme.1
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUWWFoC+EkTT38fpORTAH1DolDaTMa1+slYT5NlojhE=;
 b=iEsemxtt023MwOiRvUebO//if9NE33iLolS8XBtIXnV/URwZTO+dFXW4I7VGVaNB4b
 WzptChOLjjOF2IYSkhW1YvbtkyYBXeuvdl8pkQ7vD2AKxL7zBxDtVSJewv5Vn5Bb8d5I
 RgFeFeEbr9C9gB4kdVtH9Hxefv68kM3GWMAUfi3ZLkHJXKzZMwRubWthpIJ8/Mdcgkaw
 1YwSt6K8nfq+3xCDONZgO+ODzF2IqsyqLNzpcmsucxjb4pPlmc5uXdSgsIT48DxQwfal
 aJn+TN9jf3bD5SuFjT1wnnUaTD1MOABx0pdeQntc0OvgqopSgZE1+UmLM6vmMxFs1knQ
 rfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUWWFoC+EkTT38fpORTAH1DolDaTMa1+slYT5NlojhE=;
 b=342/CFyGSgLEVuYdaAzwE76by9TppW0V4C6Lsmg/X/WzGPCxXBzlXfqdYhLb9FRyR4
 zfu4THEb3j3LPdYHhfmL3FhlozjDtyrYkKTZjdMXHeenx/1xljX/M7awgoQ4xDyGm2Cq
 aBp6dNoAEmSChok8QYzc+Vg9inE9MMzLPdUg8DyQVC5FdYbh+2dDpvwUv8YwUHd6J3pY
 0bSZTD3I3cnAEVWhoUA4a2kiQ0QwT7m5nKHRcOd/k8Tinfxq+aq0L9EFwx0Qiqu4kk5B
 pVdUfzAU9fPRfby8kdqM0d+QEik35SB9kamoJuyo8Q5omgDB3rpXsEoS8H4EQj0GRVJ8
 TQQw==
X-Gm-Message-State: AOAM53085aZLIDBbBldxm8IIMoFMYCNhDbuxsXiFwMuj8EaRlFupAoCK
 jH6b6kdoRahCNkJttGYELP+gq9V6M14=
X-Google-Smtp-Source: ABdhPJyWT+sdnFidy9B7al8Pi0prU2vFMsJqLfnZrG6L6rHUdayDSUQZiATJ37vkahgtwNJnLrG9+w==
X-Received: by 2002:a1c:a552:: with SMTP id o79mr11207669wme.170.1632932760130; 
 Wed, 29 Sep 2021 09:26:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id v10sm344483wrm.71.2021.09.29.09.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 09:25:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 18:25:20 +0200
Message-Id: <20210929162520.1778888-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburcu: fix build without wchar
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.13.0 in
commit 9cedbcf494e647371f92368014d31091848772bb and
https://github.com/urcu/userspace-rcu/commit/8b2f0590d94f6bc3f1d31bd3e0c9ea744b5b55cb:

configure: error: The compiler does not support C99

Fixes:
 - http://autobuild.buildroot.org/results/435d127728b014d565dd75861f87e18716f9fe5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburcu/liburcu.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index c0a44764f1..e29784abe4 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -12,4 +12,8 @@ LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+LIBURCU_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
