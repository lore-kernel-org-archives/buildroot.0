Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31A3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19BE960F6B
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19BE960F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E9C607E5;
	Mon, 27 Sep 2021 09:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROb7NdncDV6x; Mon, 27 Sep 2021 09:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A8BB607C3;
	Mon, 27 Sep 2021 09:56:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9D451BF2F1
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8E32607C3
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KPd0_GgHbhrv for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 09:56:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FDB9605A1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:56:05 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id y1so11372671plk.10
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wE8sdVWo/JdWcV65VTuo+d86aomss3Lpq1RdOb20ITk=;
 b=Sp8vkQIHHFxO7f7OgsnmeGqrS1zGxw5pEYtwZMVBMviiOgNOe0rBFnC2rAWpD2lhsT
 XQ0RHbWC1KWyzb+e0kFUUJIXrThynQ9SIV7YlS1vb9/W8HBiuzvP1PuwfQMfG1ivNRsR
 CJUerKn4+NzU0CZIUeltgLSOwTCAbAArfLElha7tu6w8hbUZ1lswiYpVT2BSOrRYIzDE
 GPko7d8ND+WNUGirD8sn2rK15QbNICQBLNAXv7ETj14b/L35eG9udCTIsKZwdN4pyk8v
 LhJKv6p5wYU+QeG+vPOv80NyVtiGtTJpfrAP1aYNj9m4L9TbB3B3b+l6u0/AVLDZp99W
 iBHg==
X-Gm-Message-State: AOAM530pU3ZgShGsONAaGzjjSBc0paifu3504EfXDrzKwldFBFAMVfFO
 fZvl6OKAVqF4j8wN+yZw97Yu8ZjnYVcNtQ==
X-Google-Smtp-Source: ABdhPJwD1EpGpBgeXkzzgFhpQRUR5Fu3DDE6C4zxlNQIHE6l/aWkVZLKbpevrKj/chaUQ9aVADPzMA==
X-Received: by 2002:a17:902:7ec9:b0:13d:8e79:8e37 with SMTP id
 p9-20020a1709027ec900b0013d8e798e37mr21350746plb.48.1632736564939; 
 Mon, 27 Sep 2021 02:56:04 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id j7sm16528470pfh.168.2021.09.27.02.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 02:56:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 02:55:57 -0700
Message-Id: <20210927095557.360485-3-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927095557.360485-1-christian@paral.in>
References: <20210927095557.360485-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/docker-cli: bump version to 20.10.8
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes:

https://github.com/moby/moby/releases/tag/v20.10.8

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 6d380c2fd8..9021362c98 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0a7848b1b5031483de075433506d0448ddf834368d9c73770e453e0b89b49747  docker-cli-20.10.7.tar.gz
+sha256  cde34bbefd70fa27b44dfa904c40db84b89abf237e5267dcd08603b459a89253  docker-cli-20.10.8.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 24fd26a8c6..10776a4e1e 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.7
+DOCKER_CLI_VERSION = 20.10.8
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
