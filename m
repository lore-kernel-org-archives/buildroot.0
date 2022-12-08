Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A8CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E767820ED;
	Thu,  8 Dec 2022 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E767820ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7Z5tCd9IK31; Thu,  8 Dec 2022 21:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E83C820EB;
	Thu,  8 Dec 2022 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E83C820EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1FD31BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93945400E7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93945400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClAzezKhA_RZ for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:22:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A0B400FE
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9A0B400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:22:20 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id js9so1771448pjb.2
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCQIUEsUYyKpufcja9NPEdXN5Cn92FOHJIKOWejJnkU=;
 b=EySk52tvsRRJcqSFGAZdsYRu72aPu7Lr1O6sHF/NjBcE01AD+wYkRELw5wcQugIwn3
 InoeP7g1HM4MDMOF0ltTvt/+iY6JmQKnd0/Ly4qr8TCnWKzYkumeLjYt5DPpqaVk57uG
 7+xJOjxTSIwG0Rf1gmVwLNDlJPavDEC4NwML+TKyq6ZeszLHBOvyGQzE0+KGY0fMuX5O
 nSOyaIWEb0xsZz2hSnC8sOGPhzQOtSmXHPZyi6dpFjaoHp7tyev8YG7eZhai4ukmOQZJ
 mWaifPb/nGUuVhVQos3yrEg7HYiq2WJg7VMvbqfZc572+g21C8ISjrxnORqLiSnY8fwG
 DWdQ==
X-Gm-Message-State: ANoB5pnQjuH9ORTaKj0iNmT4R8C3wMYJchxtts6E6d3RV/8bq1GhAuNl
 YH8XFTofH09Dw0vBgMBtjoKIT++DPbA=
X-Google-Smtp-Source: AA0mqf5HhZOb6C2OoKAHsGB5mVN8751lc74FTd0sqjxWA3XjxWz9YHbLtRUpbwSjfgDPZaSV+1k8HA==
X-Received: by 2002:a17:902:eb8d:b0:189:89b1:ac95 with SMTP id
 q13-20020a170902eb8d00b0018989b1ac95mr3146734plg.29.1670534539910; 
 Thu, 08 Dec 2022 13:22:19 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i16-20020a17090332d000b00182d25a1e4bsm17031940plr.259.2022.12.08.13.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:22:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:22:15 -0800
Message-Id: <20221208212215.4109073-2-christian@paral.in>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208212215.4109073-1-christian@paral.in>
References: <20221208212215.4109073-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: security bump to
 version 20.10.21
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Partial mitigations for CVE-2022-39253 Git vulnerability and other fixes:

https://github.com/moby/moby/releases/tag/v20.10.21

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 153e0e5d00..d9477cf3af 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f4398ad858274605f8e4e55d4618b2f5bdff6969a4afa232842bb2417d8a98db  docker-cli-20.10.19.tar.gz
+sha256  f0f62ca1c80e8fd5b9e140ca64ef3e75dc7cf7a28040b3d10b260307128946e8  docker-cli-20.10.21.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 1fac21790b..a14edb2c31 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.19
+DOCKER_CLI_VERSION = 20.10.21
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
