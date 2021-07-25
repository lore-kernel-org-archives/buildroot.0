Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33EFC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:56:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9951760F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9951760F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 674C940122;
	Sun, 25 Jul 2021 07:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYUE1q1qomUh; Sun, 25 Jul 2021 07:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD49540105;
	Sun, 25 Jul 2021 07:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B171BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B9840105
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHbW5F7mRsc6 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:56:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4807400EE
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:56:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so99753wmd.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 00:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=snYB/RQQ6e02oE6/V3NqDE58zruAKXwE+4yDQvblj6E=;
 b=ssL2ToW67wVd1w9Bf5ioNgq6TjZEaLGSpmixKlqf9kruYhW/m4fexEal3ByB6rpl0E
 s3EGDJvUnU9G7+0BDCBs0SYilCDlCEjNN3HpHT4ksT5EpSxFVm1s8DyWjPBKNIgHPY5E
 zBcFASJ7u1VEZEU8cVCwD2xEBccYir+WZ3oZa1l1r8XU9aWRK4PrNBdDfqsUbqa+V1R3
 7zCjCDiESf7YMTXZUBn6uaPwFHvJWPz0FY1JrIls5NOFAsa+eoKKTc9POQQgpV72C+Nn
 w6NJlXxK8SyVOeFW0/5VoY3b0E9MoVkkjsdcHHUBBE/uU2lEWYhSZledG/5Ecx9n4g3R
 rZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=snYB/RQQ6e02oE6/V3NqDE58zruAKXwE+4yDQvblj6E=;
 b=nQSYF9FrEcfZDTmbJl9sfvFwPkK+UGCYQFY5Jmy+J8uWmjV2VqneTNfJUY/cb+ioar
 p6gDtx05N6818k1JxkoMNhnI+4Mq8gq/ShRm59U6Os7d9ny8wKBKV5tttK2tcNmjZRdG
 ggMQEId7fU08q1WSFWGr/tHDk09VngqAad4EcLH7ZP2J97KhHpQ6+8aarlQwdgkYU2nw
 3s7yHICdFUtm19cQkBRdkClIJtj12EZ1uDwS0DDbQ8zSEeIIC7ksJ/fjxa9t0VnnS5We
 tC+KkB5498qFOf2Hw9RZQzFYh3eu4pMEv4ayZmbpu6ftfJwQB/bFJJ5yTy2uOZsBlRqD
 zkEg==
X-Gm-Message-State: AOAM533owpO1ne+LfD2qC13m7SpOkpBV9AQVaUPf6uRC3nEIa0gJcVC0
 UJTPhHffOad8LlhE6qyM/vEWu4mKyTgvBA==
X-Google-Smtp-Source: ABdhPJywgaO3ynDsU/u7NhKfhcE/eopjzFMI2fshzo9DTuNSIDq8TXiSXfVEPCTJV+3SbqJLgmcWjg==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr9614640wmg.46.1627199804812; 
 Sun, 25 Jul 2021 00:56:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id o5sm9448001wms.43.2021.07.25.00.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:56:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:56:34 +0200
Message-Id: <20210725075634.855713-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: add SELinux module
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for apcupsd is added by the services/apcupsd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apcupsd/apcupsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 9e707e1a5a..34815ffc1c 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -9,6 +9,7 @@ APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20St
 APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CPE_ID_VENDOR = apcupsd
+APCUPSD_SELINUX_MODULES = apcupsd
 APCUPSD_CONF_OPTS = --disable-test
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
