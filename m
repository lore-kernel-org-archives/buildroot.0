Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC82C43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8CA54161B;
	Sun, 10 Jul 2022 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8CA54161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XZHPozgBZBn; Sun, 10 Jul 2022 21:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9B9415F2;
	Sun, 10 Jul 2022 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9B9415F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 485291BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 224E2415F2
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 224E2415F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjtnjM12zUNl for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81ABC41572
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81ABC41572
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:23:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bk26so4738870wrb.11
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qh/v6nxlliLhmpZHy8uZfrN/9XSPCdjFZuiHfQTZJiQ=;
 b=qtVwatXENx3RZhVlHeYVLov+RIVVHTSb+4GVJ1ok7YcTAQkG7z67WyF3pGXr3Zqn84
 N9s/Q6y1iwwbmhUMVHJOBr4lAaXiMVwSC2uhiYUUnoaNA3J3fH+7H/KuSDnQW+tPlr0R
 V3/oQOPf3TyDXWR72WsWETzV4Asn1spv/TicoltHdsKnObfhtnl+tnjVAGngTUHCnGyn
 J3Kc7WaaiEvBvSX4bRlZ7qkkagpQNyxyAHCuzZwq6Tb/dIkRJfqlwRV4krZ1ZgllRZsk
 6RLGxGMET95KR6vus46ZedgzujKMKxH5XU5HYHiN//uB+T+mEtAMWfo4wagiWRV6lWnO
 Cy2g==
X-Gm-Message-State: AJIora+KphTN+HuloZUI7T7vmAIq1AaZBg/AFoVtFDZ7i4itZobRUnfQ
 y7eRM81K4zu2ATq5wab2EWjvhJhYSpA=
X-Google-Smtp-Source: AGRyM1sgXl5KICPLbVA9aD2fzMGYIe7fD3agsJL0VVsuuweotjS92ZM4Gx3nuXJFR5Id310rwSsYhA==
X-Received: by 2002:a5d:5244:0:b0:21d:866e:2409 with SMTP id
 k4-20020a5d5244000000b0021d866e2409mr13628417wrc.400.1657488231530; 
 Sun, 10 Jul 2022 14:23:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a17ab4e7c8sm8498191wmp.39.2022.07.10.14.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:23:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:20:53 +0200
Message-Id: <20220710212053.860593-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qh/v6nxlliLhmpZHy8uZfrN/9XSPCdjFZuiHfQTZJiQ=;
 b=AkvMuSldxTmcJ9JpUxJTssbwJ0+uZKvODj9EwfM1AJ3ATDCcqlFkW6O8aB9s5gg2cm
 pJgAoUBUaBquJ8VW9qY7f6jy6dZcSAml9NChKeHmd2SbxK6oxovGYf46fj4uMTwEzQyO
 TRR2xiunzyMEyU8EVoQGgZNxC4LIxnXKdyGdbHRuT1ssG+vmsvo//iltYZyrBUwla6cC
 WfumxbDqIEEk7ZR3ifwosjU0SSM+Q76JiIyRD5Qqx7bsO9iKHgUcGwVzaH62rrPII2yE
 iZn98Vf3hI8Jsx9SX08npCKr8sHaMIPu0XHwOepbLsI+MnSVhtXVpbNmZla8baZwhJOa
 dTWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AkvMuSld
Subject: [Buildroot] [PATCH 1/1] package/libidn: bump to version 1.41
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

Update hash of COPYINGv3 (https URLs are used since
https://gitlab.com/libidn/libidn/-/commit/d66411c378a248dcbd6e610c71c16076169c5ba3)

https://gitlab.com/libidn/libidn/-/blob/v1.41/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn/libidn.hash | 4 ++--
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index c6cd668bbc..837424d93e 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  de00b840f757cd3bb14dd9a20d5936473235ddcba06d4bc2da804654b8bbf0f6  libidn-1.38.tar.gz
+sha256  884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945  libidn-1.41.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYINGv3
+sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYINGv3
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 4a400d195d..e1a357de1b 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.38
+LIBIDN_VERSION = 1.41
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
