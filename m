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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810E8C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4D46103B
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B4D46103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D531940286;
	Sat, 31 Jul 2021 08:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSZohskou04J; Sat, 31 Jul 2021 08:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA4124026D;
	Sat, 31 Jul 2021 08:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECAD1BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C9D6830FB
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmA5Ex9M9t7Y for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:38:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49357829BB
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 08:38:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id k4so3605094wrc.0
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1PCl1k1qzbfJBwDHkbJrLFPD+PyP8sglSUPnb97vBfc=;
 b=Zp/rS7ZaosMMSsWYgayh3tTEAbnR7a/VpepXyJxNcldrHwh/feTHf/qkR4dNYijQHo
 NvcNJZcq9mVxoA1Trkytqj+E7cMa/B3jNrDiSuCHjuzQBN1+bdpc6SRmad2oyryKQL2D
 DSG8MWb5EpJKVXVkyHVDjNjaOXu8nisvpgb1QmpYKOl6j3mQkscVaPKad8ComtPteyi8
 eE/IxhRHPCyRd627INPeuZ8uECUI5xNlEYSs8IDt52e5q0gt08f1oTJ8RQ+ny3Ri6Wvc
 Wso9NtH2YiPR7+hxQNt2NJfph+NlKOzclspXSt2XWhRK21KI2FXJMW9j2FTgum+tW5N4
 XGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1PCl1k1qzbfJBwDHkbJrLFPD+PyP8sglSUPnb97vBfc=;
 b=QtuBs3xanITDoRh2XpWCpdxCJZL4w8CiOZHTQCU8c8n+ruTtJH8OjluSjyhZrAiKta
 v2S3WFjWu4cXfRT3kPgiS5T3QImdlbD8fNoJdyzZ8tcmIy3SQWbIxha88i4UXMAJHb1z
 T/AJVoIOjZI13avxdqmKjv+0qQUjUrROzbvica11+xfSwMl/Plu6HtyqGWbn4FJMhlXR
 yydsVOM/UoGOhcT0//h4E5pE86x8Egp66qBv/kUumR7lDyAFFi3go1wPCledbvfZOfcW
 a0roh0/WzqrZL+2aDmznVPR6LnsK+sIviE13ws4adJ9E7FuM35zlU+qZXiFwjqOlrlqC
 9+Ag==
X-Gm-Message-State: AOAM532vqIXQOO9ZQLSdWwNq6kIwyWgSOxgYg4K21p2w7INWpgNGUrEQ
 smEvQbywYV5XxT30Q1VcF11VSKz77BOGAw==
X-Google-Smtp-Source: ABdhPJwdMxEx6iJyNAhnj0h43zgtgZLU6Vg2Zv7Gu+PTRPC5sXCIN0M6v0hL6fXWUh8sn3+t0uvjKQ==
X-Received: by 2002:a05:6000:1818:: with SMTP id
 m24mr7283423wrh.49.1627720687195; 
 Sat, 31 Jul 2021 01:38:07 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id v15sm4281318wmj.11.2021.07.31.01.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:38:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 10:37:59 +0200
Message-Id: <20210731083759.623465-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: fix SELinux
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

Add apache module as for now it is unconditionally used in apcupsd.fc to
fix build failure raised since dc8b2905f1161918b856a9aff01a0607a50184ab

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apcupsd/apcupsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 34815ffc1c..502d1b7152 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -9,7 +9,7 @@ APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20St
 APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CPE_ID_VENDOR = apcupsd
-APCUPSD_SELINUX_MODULES = apcupsd
+APCUPSD_SELINUX_MODULES = apache apcupsd
 APCUPSD_CONF_OPTS = --disable-test
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
