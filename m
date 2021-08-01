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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6AEC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A366108D
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6A366108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 871FA4021C;
	Sun,  1 Aug 2021 08:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ta1hpoNy1NV8; Sun,  1 Aug 2021 08:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 964FA40172;
	Sun,  1 Aug 2021 08:45:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 425751BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B0F81CAF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQGNQyiGN6qV for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E80A81C81
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:45:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d8so17598061wrm.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w+AGGQdPkeytYWUUV9WzQ8gmKV6dCXuYwTCivf63x8U=;
 b=HRq/esgBxV46RePG+0+/5GEWDxhvDkN+wDRQsi2vnF0qTHQIMViD0xO7SD18hwjpT/
 YiQ61pdvQIG2/Fp1ep5OXg8rA7A57r7AuKxQTbriHmdn5hf+AlTmEASQ0ImcnHawCJ5c
 mqVMG3KXqA7rpkHEN3tZxr7c3Nm9zt4a1u/ATf32DpZnUJ07+06TGceuoR4L6mj4gM1a
 mSPUT3DIkkeXUU1+orOJR1RKPV7O7YnUyT3LST/wANmYFs8AxGNf6rs53ukn4H4AR9H/
 U8FhKm4qi95ICUiybUQLPBWO4tHpE6LwSUOBv40DT+hOHo0KUHknQTerW6wZYnMsszHM
 CbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w+AGGQdPkeytYWUUV9WzQ8gmKV6dCXuYwTCivf63x8U=;
 b=ackhLYwTA/oQluafHLGc2jnWuyaY79fExJW7s/Q5duBZyynGGn3BxfnyKySox2yQKy
 39g+zI8iKdlasVxFr84/LnYdooqKLqC36P9fpYdLcQUITVG1fVsoO6Z/vrz9KRaije2V
 3CAEKxLDEZ2bhlRUQAGiSfuEo9vFCyema3CunkPuuHo5xe0q/VV2jNB0RQQXa890VMBI
 h5MqmlXslHkv+xj4WbJ4GOu2RBWUrG+/w868FVXJxCWjLwOeGl5rEOR23cUxfOnr2VTl
 O9KeCoJU7V7vOpIvJC2HkFmGyE6wV85tarrA8gV/WpvulaYk8KYFyQjXF2bDsstm0+EQ
 bAiQ==
X-Gm-Message-State: AOAM533kE6+ageAgz1jMcU8zu/XOi0nIq5KQqfPeXXvOnnX7aCibmYb4
 P6fdAZoYwuJxkIPW71bhcvP2nUgxycsLmg==
X-Google-Smtp-Source: ABdhPJxv9l8Fy4pLYooNWlcpbNTMQFXbbwXnNCOZCjLYLj2ztSBfBRvab2tZZkqSVADFsRdkJaFx7A==
X-Received: by 2002:adf:ed0a:: with SMTP id a10mr12006076wro.30.1627807528351; 
 Sun, 01 Aug 2021 01:45:28 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id h25sm6808855wmp.33.2021.08.01.01.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:45:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:45:24 +0200
Message-Id: <20210801084524.2762514-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for rng-tools is added by the services/rngd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rng-tools/rng-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 46688b2d9e..e7fb998df6 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,6 +9,7 @@ RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
+RNG_TOOLS_SELINUX_MODULES = rngd
 
 RNG_TOOLS_DEPENDENCIES = host-pkgconf openssl
 # From git
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
