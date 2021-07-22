Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5349EC6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:33:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D8D61264
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D8D61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A298740168;
	Thu, 22 Jul 2021 05:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GsR2_JyGDqb; Thu, 22 Jul 2021 05:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB57C40134;
	Thu, 22 Jul 2021 05:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAEDB1BF865
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4DCE6084A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fM_s8UwW8gyL for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 05:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E10F60804
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 05:32:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 14-20020a05600c028eb0290228f19cb433so822397wmk.0
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuKGkovT3P1VeQp7QlmX8HOc48nGQQneaBd8PJ80QX8=;
 b=TcQUds9u6amdXhElpxFgmjOx2++3wnkcG/zfTb6h7dSn5Vq3VURNbKEgWemRxjOA49
 /NuU6UlOw+1D2mUcdiIV4aBXtxLGkUC/0N/E3mhyf67AxYuSUSUOPn7lOCT1PWX9D5nH
 7880SM9GJ6xdsQC038y95Y2jad2oYowmik3EeewsZUQoqXgEKncJ3T+w7/3+biNc53D3
 +k63YUZnjjcp5elo8F4OP+CQXfDaL4FyoAeeFdHKshnreWzLp71Pmlqj7leUMGw8EFBO
 1QF8hiw2wEu7OMPF5rLgzyNJW4xqUmfP3aIcd1vXaLfRHIUtIkvYtq1nfGJj6rTHpS8n
 Fngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuKGkovT3P1VeQp7QlmX8HOc48nGQQneaBd8PJ80QX8=;
 b=FuTMvxXYaam5XOUBoKwnj4WgXEhAmhWnikz1wS8C0Rq3AHPpLH26yMI7jZKqHf84dA
 7/ofx2YZAMpMoLdkmo6/4c6ia67xn2esv+nytdwJLplNACIv9ns11ggdm15fV20dshFh
 BecW09Qc64eGhVy370pJpGn00aOl5ZT8NgVckZ0jwRE2RWyUTk40N+5XYoHHUNlP9HOr
 M9fdPxnXWh/t11oHcqdprSy+2kSZkUV3ZzhJ5X8U0X5OOLn19vhrNoMZJTHX6JnORgey
 bVt8doqRvTCQQ5xkqtOTUOI0iiG6sLHFiq8ZykQlPurl+Xxp6xUbWMDFpllEFShNG8iW
 80qQ==
X-Gm-Message-State: AOAM531FijDjJ89IMuRYkQsa3IpOCTcqToSmueWmbRj+tONWdIqX23Dj
 lc1plj8CjV868QUAeztqhZ9uJVrEXrT7UA==
X-Google-Smtp-Source: ABdhPJwC1qgFBX/V7laK0V3+weUTJQ2dBfxAd+QMtNMAGN2YLuh5Z3ISBJyYKCsAcVR7vpsD39uNEA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr39953721wmb.167.1626931977487; 
 Wed, 21 Jul 2021 22:32:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p7sm23864053wmq.5.2021.07.21.22.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 22:32:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 07:32:48 +0200
Message-Id: <20210722053248.1199668-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/alsa-lib: fix static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure raised since bump to version 1.2.5.1 in
commit af19131543926879fb6676a3352c63ac0b2038bc:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../src/.libs/libasound.a(control_symbols.o):(.data+0x4): undefined reference to `_snd_module_control_empty'

Fixes:
 - http://autobuild.buildroot.org/results/a8fd791ba4c289cc4fc744a8ff9615bacd9558f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix title typo (; -> :)

 ...3-control-empty-fix-the-static-build.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/alsa-lib/0003-control-empty-fix-the-static-build.patch

diff --git a/package/alsa-lib/0003-control-empty-fix-the-static-build.patch b/package/alsa-lib/0003-control-empty-fix-the-static-build.patch
new file mode 100644
index 0000000000..3f5013af3a
--- /dev/null
+++ b/package/alsa-lib/0003-control-empty-fix-the-static-build.patch
@@ -0,0 +1,29 @@
+From 81e7923fbfad45b2f353a4d6e3053af51f5f7d0b Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Tue, 15 Jun 2021 23:21:42 +0200
+Subject: [PATCH] control: empty - fix the static build
+
+Reported-by: Jan Palus <atler@pld-linux.org>
+Fixes: https://github.com/alsa-project/alsa-lib/issues/157
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+[Retrieved from:
+https://github.com/alsa-project/alsa-lib/commit/81e7923fbfad45b2f353a4d6e3053af51f5f7d0b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/control/control_empty.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/control/control_empty.c b/src/control/control_empty.c
+index 49d1026c..c9b048c1 100644
+--- a/src/control/control_empty.c
++++ b/src/control/control_empty.c
+@@ -30,7 +30,7 @@
+ 
+ #ifndef PIC
+ /* entry for static linking */
+-const char *_snd_module_ctl_empty = "";
++const char *_snd_module_control_empty = "";
+ #endif
+ 
+ /*! \page control_plugins
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
