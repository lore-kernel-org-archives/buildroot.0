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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A52C6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3592661279
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3592661279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82D64027D;
	Thu, 22 Jul 2021 05:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmzAVmk72Rc1; Thu, 22 Jul 2021 05:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 008B540323;
	Thu, 22 Jul 2021 05:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65A7F1BF865
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6006240156
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8KbRoZ7MJgt for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 05:15:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A4FA400A8
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 05:15:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i94so4488298wri.4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1USoS0EavXoLLI2ZW6FwRzKRaYDJm+BBmQ7RK035d/0=;
 b=ETunfF4++K1uIp0onaB8a5S5+J2qwqi85yZ3VFqmGFKaODlqwzkcaDP7swSy+x4WwB
 Lgap3BYtOGleLFqIe/dTbnijTPJ5aA4jzXmlJ+tTT7W34ApS6Rho7xGEWf5VGoznc1D/
 3fGdjZQTzGXd94GqAqTu7YQ105LwnxvMT0aI3xeHv2Z6WQtO0DtZzGvkzEzJlP0u4adw
 vt0nTIqqif83yHIyV9bg+OHM0IJDMYIi1TmRJ4FGTeXCCEBQDohv8x8sIDGNaE85CyVI
 G/YyZ7LZhLd5pFhIp12pEhwyRCqIHrAMGghfhSoZ+5uwzyHX1NnF5xOyrUtA5wWRFGEY
 0jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1USoS0EavXoLLI2ZW6FwRzKRaYDJm+BBmQ7RK035d/0=;
 b=cm1SM4OIVCX6WMqOPLPkdx3v+MSM7V0WTugptUoWDCwiYyLsfAXdHVFdbZsRiSYrOo
 pYsNLz1MoOf0LI5lmg1zYC0HnJ3nC9Udsb7BJvG9WrUDNMr3ztZ3Rqh6cP8kxm92TUSO
 ysg6By1BcbYmit3rO3PFxiICBe4CvToXsGlWhQcouTHwC6pQ8c1ail4svh2TrEDthzj4
 qPc/lwyRsNBIb8CC7F1Ni/C2kOoBe715u6g9gJJWOBPxuLnTHddRTWCgkhwcp6juiPNP
 WH1W3DE+jnVLddeA4sO3ljimecW05Mpx/o1xquG0P/MK9MYqzh302JqIf/uIrXluWGuJ
 RpQQ==
X-Gm-Message-State: AOAM533Vp5YwiFJf4BU2GNUY4lwiHeqQMOi9Dc7jNnLVIqnIlEiJpj0K
 j0czcUt5HOsB7RpcKeERp6ya2vEA1+9uOw==
X-Google-Smtp-Source: ABdhPJxbLhVVxBu5Qpx5jyuMBVz6zo1fksTxLfb4+3BiG9F9rwv/H36nYjp+fOjRMpuhxpPzSzPw8Q==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr46751580wrp.353.1626930946429; 
 Wed, 21 Jul 2021 22:15:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id j3sm20470310wms.30.2021.07.21.22.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 22:15:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 07:15:39 +0200
Message-Id: <20210722051539.1196554-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib; fix static build
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
