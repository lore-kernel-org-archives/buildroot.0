Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D1AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 21:28:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3256103E
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 21:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA3256103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75EC360B38;
	Thu,  9 Sep 2021 21:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9smaPbTK5HGT; Thu,  9 Sep 2021 21:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1811607B8;
	Thu,  9 Sep 2021 21:28:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 865F51BF2AB
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 21:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751D584AB5
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 21:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3A1QbH_yFqsV for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 21:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDDD784AB2
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 21:28:31 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id h29so3465418ila.2
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 14:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHHaY5g7N3nqmhfQ1CSiVk92CBGPtPScN6mqLFobasU=;
 b=f0kS06gdssRPkXRfVht7xiIxWADkA5TSMQ7SxugKvCn2HN7o3OyFxUplMcIRhtGu9Q
 Owhf/8lAseoFn85Su8RdOwJJLZwIN49YO1Fyh2nt7SUYbBQqBifEgu0sNbhRJUoeKZ2Z
 RHekqAh267QIfN9gY1YtvfrhUlgVxPTuATY/2QuD5r+D/vf5ZrTuU78yPV99FJQB4Vam
 /SY0RnJuy3VGQ2rAm3FxyEnkOhJf5r/vsOvIXMIE9YVLHHfQdnMZKMM632HmcQartFQX
 rFFh87NkzsieTzeOsiO0VYcnuMf/3OkAaifskanFor/W4azDnaPCFoPnhpPmW1F1HXhD
 4lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHHaY5g7N3nqmhfQ1CSiVk92CBGPtPScN6mqLFobasU=;
 b=icCG1i1IDtjYDoR2UsoGQCRMkddCU77ZXj/G49OiwaWdlg/bSRQ2ti5b9vq8W9/U/z
 f8ZiHDc1uR6cEr8mC4FKoltklYzS8EPGOba2lu/UcpqENKgKnHZMv+T3fgMjZ6nbCe1o
 LagZIJyvduUMUDWZ6uUk01X3M1atL72t00qco6DoLdFyBzBeQEF7Z+fhWrFSWzpwHy8d
 LdD8GZmGVxAjY4pYx2TluX2lSDTFTXjf+GfmSJYq5c95HOLn7pYUyTkNdmyuzRvCg6S6
 6cEF4hd37DmBkEnTLGANnL4skUjavL4+q/l5bMCf+ccrybd0JiVLvx+NH3NPQS6TbVkJ
 goQQ==
X-Gm-Message-State: AOAM532fmxkWy4BvYwSUZ5L7MKmSFssNvr+/FPOx/ehLEO5H9iKBMFEQ
 +f/KLaUbiNqg7bAdzeOtjJfyirBm200=
X-Google-Smtp-Source: ABdhPJz76P9SlrsTyfk10LwP7LPuXMAvLXRLOhhHjpiXVoaZ6LMekBY7HisSRxgifXGxfEsflICADw==
X-Received: by 2002:a05:6e02:b41:: with SMTP id
 f1mr3037181ilu.269.1631222910668; 
 Thu, 09 Sep 2021 14:28:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id b3sm1098436ilm.20.2021.09.09.14.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:28:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 15:28:26 -0600
Message-Id: <20210909212826.2260357-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: install systemd services
 when using systemd
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 2317398088..7908712a33 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -43,10 +43,16 @@ PIPEWIRE_CONF_OPTS += -Dgstreamer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PIPEWIRE_CONF_OPTS += -Dsystemd=enabled
+PIPEWIRE_CONF_OPTS += \
+	-Dsystemd=enabled \
+	-Dsystemd-system-service=enabled \
+	-Dsystemd-user-service=enabled
 PIPEWIRE_DEPENDENCIES += systemd
 else
-PIPEWIRE_CONF_OPTS += -Dsystemd=disabled
+PIPEWIRE_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Dsystemd-system-service=disabled \
+	-Dsystemd-user-service=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
