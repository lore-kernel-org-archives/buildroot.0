Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67859C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 19:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C7641E4E;
	Wed, 29 Mar 2023 19:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C7641E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9mBMmT4bn3x; Wed, 29 Mar 2023 19:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1884241E47;
	Wed, 29 Mar 2023 19:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1884241E47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB5A71BF339
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 19:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A243084182
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 19:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A243084182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCGygL4E1smv for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 19:05:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D45018417C
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D45018417C
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 19:05:28 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id z10so9909840pgr.8
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 12:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680116728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4RwIlkZEo6VYUUAx5TWLM56kP1n7rhnuJ68CfoRh1k=;
 b=C6NOZ6TjBk1xbd2EWbqffANAvsomjAREpos/A9EwfujnvJfQIhTtuVfkdTyeN1iC4a
 2XxoMsDxCmCdNliSqkVZDnoVSH0eiVhKu0KGrqP/wsOgLTiZv2kIWW6BkQTwbuaOdT1K
 q5t0/a3t7u6HOWLr9BC+ujTCPmN3K0ObV2prlB6bV/Wq5XHpypiM1uNckcAPTtZD5bpf
 PjJoQJfbsebiw4uDLK9Gl79NDsQYOW+NSZitjT0GO07dx8rLf37IXwZPnTVa+rzgBFjL
 Mlw+TyaKQ9SLSVphh6+SfT+hacCiT512kyDGhwyXeU5NueRpq8oQVULSgIuVuZ8y2sM/
 vOuQ==
X-Gm-Message-State: AAQBX9crKbE0Dgnffgzlak2j8eG/VUmzZVNZoNBQ1QVRf+PcIiI0Yh6V
 2rJ8DYzLFmDDTyeSgCPvMYiTp4xbZAs=
X-Google-Smtp-Source: AKy350aLG2sJOYdHliAaQTnnd5tOSE2AiwuWMMUq6UNvovnL4i8B6b5ryWI2uEZV+hKn3yleNWVV5A==
X-Received: by 2002:a05:6a00:438e:b0:626:9a1:3731 with SMTP id
 bt14-20020a056a00438e00b0062609a13731mr3257469pfb.7.1680116727766; 
 Wed, 29 Mar 2023 12:05:27 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 a17-20020a631a11000000b0051322ab5ccdsm9939898pga.28.2023.03.29.12.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 12:05:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 12:05:25 -0700
Message-Id: <20230329190525.936628-1-christian@paral.in>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/docker-cli: bump to version
 v23.0.2
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

Bug fixes and enhancements.

https://github.com/moby/moby/releases/tag/v23.0.2

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 9b231f03b1..a8ee6c7a34 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  37bc1c71a782fc10d35aa6708c1b3c90a71f3947c33665cb0de68df25dc14d94  docker-cli-23.0.1.tar.gz
+sha256  bef4fc68b9f81ab2ae8bb2605e16a0965a3c4a82f0c0cf9d9f5d2cee8e95415d  docker-cli-23.0.2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 38d903150c..5473edf1ef 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.1
+DOCKER_CLI_VERSION = 23.0.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
