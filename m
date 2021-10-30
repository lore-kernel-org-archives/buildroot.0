Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5FAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 06:37:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F216360FD9
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 06:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F216360FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D114010E;
	Sat, 30 Oct 2021 06:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWh_UBcXpcEV; Sat, 30 Oct 2021 06:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151BF40099;
	Sat, 30 Oct 2021 06:37:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71CC01BF3FC
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 06:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EFD380E1F
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 06:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BdLklljkBF0 for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 06:37:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3200280DF7
 for <buildroot@busybox.net>; Sat, 30 Oct 2021 06:37:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso5238734wmd.4
 for <buildroot@busybox.net>; Fri, 29 Oct 2021 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8X8hGm0UwglYcxpy+UWjvEbJkQH5IrZkQD4PLDVPSHE=;
 b=lTVQH4hNRCZcdHGjJUIteBlEyHGxp8LqW3/0hsNWN3O8Fc5SsHoegLg2lUkqjTJyiF
 QHBTe2bZL97D4R+RarsOEa4ommz2krXEgrJlaRlxQhZYlHY3SiDA8BXGkINOZ4dq09tK
 fiK9EljQGMgoVgYw2hx0xWuAxkyz5G12L87nTD0XTGFTmHcdeET7IQ10HGaVGorEY6/6
 /9LjPenx4HjbFw7Z/UdpliE0oVZz+79/a5C94rumsVF2FtF/z8SKC/jYNCyMog/pEDkP
 F8kCLGYrAJQohKCk5I+41LUCcHdVw07JKbvWsU9Q24UrfcmNJs9AlJtw0hHI3+dEybDX
 P5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8X8hGm0UwglYcxpy+UWjvEbJkQH5IrZkQD4PLDVPSHE=;
 b=nT+zZWfSnLMkKz7BnPx1FFegyVJDLJWS6cdvCdgJTaC7/dWZJ15WseY2bPvvHNzShB
 M81RK0S4XcXNqMc2z78J2weaoRldU7cEnliYODRbVSZOmj35Ndt51ubXzLJ5h2JiP8iH
 3GtpsGkBmLSF4FMMz3hcP4946l1wzARthQ2+x9Bdwg7a9Zkru7lpoBQTcUK7097K0Qfy
 S2OZxXz5ZCYAmWD6l5bf3EnYs7FkH0vf89Xt5GjhNLid9j82hzn5uA2xb57wdzXoSjrZ
 148teIc+Qbpzo1wrW3iPCbeDVbkxGtwmNSxISr0enTBSwhlgxFd93ucaGbBCMBEYpN+x
 OxRg==
X-Gm-Message-State: AOAM530mXEEB8xDrsuHGEKXI56IEdmXy0h8E2rM4dVklB4a5ImBq2M7F
 1RXJpFNjq9PSfT1OnjFGP1vGVBrkDb8=
X-Google-Smtp-Source: ABdhPJwaf8IgN5gLwwKKfPH7Q5gGRFqfUDvZBy4WqocQklm0F9o8w6vnPeGsNVPRNtbad1IQ9/8zgg==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr17105638wmj.120.1635575867391; 
 Fri, 29 Oct 2021 23:37:47 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o17sm10956382wmq.11.2021.10.29.23.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 23:37:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Oct 2021 08:37:25 +0200
Message-Id: <20211030063725.1420630-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.61
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index b13c75ba3..98c182478 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.60.sha256sum
-sha256  4bb1dd859e541a3131e5be101557d2e1195b4129d3a849a3a6fbd21fe1c946f0  lighttpd-1.4.60.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.61.sha256sum
+sha256  43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432  lighttpd-1.4.61.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 1d9fc1ba8..9c18a6038 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).60
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).61
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
