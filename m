Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD95C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 17:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342B483F0D;
	Thu, 17 Feb 2022 17:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5vP7T60HxTR; Thu, 17 Feb 2022 17:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C2A83EEE;
	Thu, 17 Feb 2022 17:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 912751BF322
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BC494042B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_eFhiAjHEcB for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 17:26:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A459140223
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 17:26:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x5so5421455wrg.13
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vtFy6oR+H+CgZYdvTLqeJzJLazJ+dHh9K1s8jHNVzz0=;
 b=I6tQd7oLfBfLmfEpBq+0Yh9mh0rrReSafNeScyOy+H9eYayUvx6uhZY8ljFSqLZsRL
 1AbmAB1HfPydAfpbeZWz1jhVdDwoz5poVkMiglL7JPUr6+LWxhq1euO0NbkLhB9etaZD
 HDEn4mpSujT3UNPflE1KydJCfUucz5NqzMOGM6UANbT0ezC2KdiC0oCOq9mL2ouTHHId
 fQ03+js23NMjZNeYrK8S93CtIAmaOr6H0ZjkTenqbcalzXfpnd7TQ1KsGdVJIjCLMpdq
 gTeNxazaGMEyNlOhp8ms/FQoFmEbJDP1YReXcx6EsTwEb9GFpFJGoG84VnPSHKW9yoWQ
 hlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vtFy6oR+H+CgZYdvTLqeJzJLazJ+dHh9K1s8jHNVzz0=;
 b=NcS6dtMSrpIynzsAqyg3Nxxy2eURlcj6m5/sqCrzwxr7S5NL/wSSboTjR2R1WKtzrq
 fX97a7f2HSM5AYlzjcRmKmUdnx+nabbv7IiiNlFtMxeV6GxFe36YY0CPwZx9YkzDoqSa
 ObxugnISyGr3vvDXMdjuzIK7sVcYLCpaYPzKXqGNm2eQq9Sbwhnwn2E3gwi9mssp61QV
 DznOZirjI/WdQhukxCy9UspM5hqnpWutG3jk3IfGOa9sxiJ2Ccoa2f3roLzlfU1TViu+
 BXkP68TBlDptpijTAW56ZV+ZCMRPNWjgS5ZyhxDTPOElBCJr3Wn9xEUoUkhWPOJ7LNVu
 W7gw==
X-Gm-Message-State: AOAM533/2GmNi9/WqwCgK5MleM/hx1d6pUFrFVq9o9zQCpXRtmT7StcG
 RgYRh6WUPcMwWDFjgrXir4kGvTsGvvU=
X-Google-Smtp-Source: ABdhPJyRuy5j2JzemU7Yiy/0vxcI0M+qtL6zLPXn88cAhbrNwjIl6CfOKs//kLZWjgCsSFnQvj1lGg==
X-Received: by 2002:a5d:5750:0:b0:1e7:448e:da6e with SMTP id
 q16-20020a5d5750000000b001e7448eda6emr3047496wrw.0.1645118787384; 
 Thu, 17 Feb 2022 09:26:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p16sm2054690wmq.18.2022.02.17.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:26:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 18:26:39 +0100
Message-Id: <20220217172639.553025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgsasl: don't override
 LIBGSASL_CONF_OPTS
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

LIBGSASL_CONF_OPTS is wrongly overridden in a conditional since commit
c4ff6bf2272df54e8d4594a19fb76fe33e980da2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgsasl/libgsasl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index e813a354a1..b1981dea3b 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -11,10 +11,10 @@ LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-LIBGSASL_CONF_OPTS = --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBGSASL_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 LIBGSASL_DEPENDENCIES += libgcrypt
 else
-LIBGSASL_CONF_OPTS = --without-libgcrypt
+LIBGSASL_CONF_OPTS += --without-libgcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
