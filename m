Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AC8C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:27:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8466B6023D
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8466B6023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9C282CA3;
	Wed, 21 Jul 2021 22:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4CHYFniBHdX; Wed, 21 Jul 2021 22:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB1A82C8E;
	Wed, 21 Jul 2021 22:27:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0161BF3D4
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EBD582A3B
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2j74PDPewBdX for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:27:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FF6282C7D
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:27:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c15so3774408wrs.5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 15:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DSIveDFbr8z3cTWJZ7sxGJthS1klJV8IGo8AGJIGm0=;
 b=ueSZ/r8kHEhKs9AJbz3UFvhGzWTa4f4dSILriUJKZP2TPj1Sq0OWoHqG55fwoIkzlV
 3G3SFrR55hObVMhweN3vykl8RbJdtGw8IY77G+D/hMu/SUoZBJkNNZyQQioRlFe/2vld
 6LhZc8PjxMPe46LWcVnXdXyUXPzAJbWa+5YBeQxsO4hwCNc4raBStmPKGpwiw4RBwzdX
 MuBVzwZgtaOdTf7Xl+p5FVBPcS7uzBI0378NEIMGAVtr3QqwZPdCb5dyvVhhX/2YwI57
 YY69W3qM3zSc9Te2LUwXufENDHCYqD7HWGcl1sI+yfpXswabsi2KZIf+u4L/cYlc0j11
 8dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DSIveDFbr8z3cTWJZ7sxGJthS1klJV8IGo8AGJIGm0=;
 b=IhT0WcjedzR6My5ZIb6cow422zRyBAFYvzQVOh5zDqPQOyZLORfnbGbH6kHcFvrvFq
 jLHm/1AgUTzd6MsE1hFS0fI/7StsfWoIV3CR0/fL6N874SBB3PhvYge86bMkkCbLkWOm
 l4jTVM8iUIzGPcKujXL35/6hu9Lx2nL79GG+Ffk0xL/3yBOrPaWyOIMDInwHgHEOMVy9
 vJ9LvoK2wXErBvvJ9ZBWJLMtrDxvZ07GFVnexpkbNTumCj2/LJ14lX4txiOC2BA58bWj
 Ed4WOBKAT9K9Ne8zCKiw4FbcdQUFWjkDhx29tHq/iHA/bw6OtbziOxGYD1iVTYJmskyA
 k5qQ==
X-Gm-Message-State: AOAM530GXTxZ/0bWQpB+Yl+Izyo12Dm+k/K8T0jHxquu27pBhOc92oY+
 Vw++vDji4Atijz6F4+qxn8RpeYalPUc8Xg==
X-Google-Smtp-Source: ABdhPJzLv9IfjdmfBD7L8wpSgfBtow01TbgLjhISfVAz3XC3eqFr8lFrGgZKHzDpEpiNXl3nZ4RksQ==
X-Received: by 2002:a5d:4a4c:: with SMTP id v12mr44396238wrs.256.1626906420233; 
 Wed, 21 Jul 2021 15:27:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id y12sm11212143wmc.12.2021.07.21.15.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 15:26:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 00:26:56 +0200
Message-Id: <20210721222656.1168861-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stunnel: add SELinux refpolicy
 module
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SELinux support for stunnel is added by the services/stunnel refpolicy
module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stunnel/stunnel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 2d066a4370..48db9e3a52 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -16,6 +16,7 @@ STUNNEL_CONF_ENV = \
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
 STUNNEL_CPE_ID_VENDOR = stunnel
+STUNNEL_SELINUX_MODULES = stunnel
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
