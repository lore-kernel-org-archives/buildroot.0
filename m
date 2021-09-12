Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A56C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842E960240
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 842E960240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FAD140272;
	Sun, 12 Sep 2021 20:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voasZkYQO7c1; Sun, 12 Sep 2021 20:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83BFC4026F;
	Sun, 12 Sep 2021 20:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF3CD1BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B963481839
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOQfgTepE32r for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:07:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13D7B8101A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:07:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso5408924wms.3
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 13:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E3WYJOs0Jbb3wvNYMrN3UbvRNPH/8GDO/u+x9otd8ko=;
 b=TmXsERQ6DOFIPLU2IqiTqzGeFOsCjfI9QXdsYcSTU/Jjf0wqAFZgBJuMxS+B+oa4ke
 eny1f3NXe6zZ4o4IK8g74HLokSp7DEQIc8EvG66omeT2wBN1gBSXSZcfz1E+yPkORXBf
 jtS2lNyx3KOe9WOcwU4ITDx+oc8b+WuDZtwIJhdkHJxvn1yywDp0BmHT78aSF4ulSE88
 DqgeNf75IqBJytaJsPOPP2gY3oj/hlL2ev3RxLzM9RurCtFgqxeGmh3nQgleWKbdMPDN
 HbUCy2Z/gMnhlWxmrFyOxHHob3V7CK1AHo82xlnFNJaMolxMkNDudpsi3OgpV/elDeun
 H/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E3WYJOs0Jbb3wvNYMrN3UbvRNPH/8GDO/u+x9otd8ko=;
 b=LeYgPspg7zGflip8Nqbs7ysYan+FENJFDzu1EMdtsiTPEdPhnJymHXYQbiSOeduxid
 JJd9GXauGCA0Oass0mrT72At1ZAXCbJztw565rSTREh4AtcQ4oB0jFmOqtf7m2Cvk+5Q
 RaBl0ohHcurgQPYHgxprYvQllu+CfgXP33WT/rUbgr+dsu03+DyQDoix5UeczyIpcMPG
 CmfkUmERoYf2SI2fKvUWn408M9zaJMxLgA0ALoHuRvb32/7bS7cGAAM7Pr0UoKU4t3+3
 cHX4v3jy07hWEvH6AzKR2+wfa1k26vKc6yiD6fP4gFTvsFJusBypxpf2V/Iscti23gpn
 Mb9g==
X-Gm-Message-State: AOAM531Vclte2+AMf12cBbsdnXwzlqA73o2kyIV83FPSqCHSr7zwfZDZ
 pHirvEXBMQJbkdEtFJ/tyESGOtINXzc=
X-Google-Smtp-Source: ABdhPJy/8exMuE/Zc8vlaNeiXMcyDW3YuLDz4Y2utKay6+UB33T9ClzhLThxEkfuCPkjqvWtIl9Ytg==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr5096702wml.175.1631477233111; 
 Sun, 12 Sep 2021 13:07:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o7sm4768942wmc.46.2021.09.12.13.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:07:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 22:07:06 +0200
Message-Id: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minicom: drop autoreconf
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

autoreconf (and so AM_ICONV) is not needed since commit
2df32e0d4437b422175089edf1917219656fccef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minicom/minicom.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index b81ee52120..5cd1d6b8b8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -11,12 +11,9 @@ MINICOM_SITE = \
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 MINICOM_CPE_ID_VENDOR = minicom_project
-MINICOM_AUTORECONF = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
-# add host-gettext for AM_ICONV macro
-MINICOM_DEPENDENCIES += host-gettext
 
 MINICOM_CONF_OPTS = \
 	--enable-dfl-port=/dev/ttyS1 \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
