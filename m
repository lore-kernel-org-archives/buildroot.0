Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5ECC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:57:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3669761029
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3669761029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBFA8402C8;
	Sun,  1 Aug 2021 20:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hA4nw8dYkqok; Sun,  1 Aug 2021 20:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08E7B401E8;
	Sun,  1 Aug 2021 20:57:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7471BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 516188354B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpgdB-oK-2H5 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:57:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1F1783529
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:57:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id u15so9223805wmj.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyuwZ+8j62LrCRbVI2Yl89fSvpMqbSftAfxaZi9h/2c=;
 b=t+NwTOt30Ejcsy3vvojB+TrnkMhxpNqRfMvTII3zqEQizzm4cVmE+KY1tCLODBIYkV
 0sLgrjhzbpCi+SYM9xwMZ/vJ9FaTME25B82MhEcydAM1HEWxSbkaEM/U1LDckWsADdcQ
 +uNRe/tZJfWxxxIC6i1CUlUgh6300oRy+N5vJbcHrUjgjJm68LMfrkOksRQeA78yGIw9
 LGLfQvlp+qwn6mMxFeoNJor8B7yBN2dude+tv7woOZ/LpM6HWlYkfUlnZ081FzWfQZmJ
 UqcQjEqpURmLp4Pax+Fboud15Mh7/14TrS7jt3Sx4YH6G/v7wfMxqThXTCobIrSdjnnK
 yAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyuwZ+8j62LrCRbVI2Yl89fSvpMqbSftAfxaZi9h/2c=;
 b=cfcomHNYgmmuMnIwJOuscT/l40NiZ9HHyjw1VaR2KmB1bgERz6iZsh+trQsNvMiqcO
 bIVLwLsMuL8mKpkC0rKd0nfNkSpbkFXNJlJ/xdiH/IwPpo2WipVTZO+PYhIzvQd594OE
 TwQMIIluToePPgkg2PYexURDOAez+NIiyz0y6tkfmEXcmU7v7LovFIvD9UzFW+rQZvGW
 VgcueJqID9ur97sy/itcngHoao1z0lrYMsIyZLNTH//Sk30+S6CI24NiULoTfyWB8Pfz
 71X4FMQnODO0gQ7CyWT9B6y6I+KDSfLKv88k+p6mBsvwwrILzrY9obHhgHzho50CgiZk
 JA/Q==
X-Gm-Message-State: AOAM533zoQAFFxwvHRwgeLEnZnYecStDDC81g2hAvwboy8u4IDCCnvmx
 XL0LkHB1dnjHNMLqo/LXJa8VItDwljeSfQ==
X-Google-Smtp-Source: ABdhPJye0Nvbpg8vNUWHKaE3CvQGsVGrya2ZmkXgu64amwyMNohd2ax94M64/3xRctjrwmXLz8b88w==
X-Received: by 2002:a05:600c:3782:: with SMTP id
 o2mr1512924wmr.137.1627851469379; 
 Sun, 01 Aug 2021 13:57:49 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id p22sm8089742wma.10.2021.08.01.13.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:57:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:57:41 +0200
Message-Id: <20210801205741.77064-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sysstat: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for sysstat is added by the services/sysstat module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysstat/sysstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 8ec4966813..6948f6b390 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -12,6 +12,7 @@ SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
 SYSSTAT_CPE_ID_VENDOR = sysstat_project
+SYSSTAT_SELINUX_MODULES = sysstat
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 SYSSTAT_DEPENDENCIES += lm-sensors
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
