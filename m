Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2598C54EBE
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 10:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5915D418D6;
	Fri, 13 Jan 2023 10:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5915D418D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceeqfItWT2tf; Fri, 13 Jan 2023 10:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C87E418C7;
	Fri, 13 Jan 2023 10:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C87E418C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74D291BF32C
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 10:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F1A14189B
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 10:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1A14189B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnXWTzqUO9XJ for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 10:06:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DECA4174F
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DECA4174F
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 10:06:01 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso23922282pjf.1
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 02:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5+/9bGu3pZUVvBitbhmzc0a6t9f9ct4lDxeej1OQoY=;
 b=boqB5kncExE1xsI7DuQwT6W7XgeQ3mZpMrE+oWmplHdWjcb7c5lpC8eEE5isFUcokS
 grBnUaAKSthbzmwvbnrySnv7bGBrJAL60gHpFIY5R6VzcSFygi3YHqTbnVmnCCAVSWeV
 djFZfHZiOEBUH1dQMiq6rpSDR45ZXHCQh89KGC7XFo5J/h4PzyIby7rZ8VOx3/+BC5Zj
 PMi3CyZP7gpfZ5Tfj/+E4ApEPN01AmiTVw4paCt+3saRfoRqmHdL+0C5397QsY81sbxg
 UQCM0cQCOIRk8vs8UUBacIv6fYCHDdbXGcNh5C6C1SxHrNxHQSTRwDhnP68ChCiv1mry
 CXZA==
X-Gm-Message-State: AFqh2kp12vb4DpB8WQbiMabgx6EgtzMYEdZ7vKilGsUJbzklabjrFVdR
 iMT1/Slp6lho/s1gVajpgXB6AH1VEF65Pw==
X-Google-Smtp-Source: AMrXdXvMntv58BRsM2DHhjvHFPR1cCzbUcWXIEKp820dq4ioVMb4qhwoHPqt5h41jr8vhgKT/2QeHw==
X-Received: by 2002:a17:90a:558c:b0:226:1189:ad3e with SMTP id
 c12-20020a17090a558c00b002261189ad3emr58121316pji.27.1673604360492; 
 Fri, 13 Jan 2023 02:06:00 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o33-20020a17090a0a2400b00226463cd239sm13894262pjo.15.2023.01.13.02.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:06:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 02:05:53 -0800
Message-Id: <20230113100553.2836256-2-christian@paral.in>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113100553.2836256-1-christian@paral.in>
References: <20230113100553.2836256-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to 20.10.22
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

https://github.com/moby/moby/releases/tag/v20.10.22

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index d9477cf3af..c6db95f9b3 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0f62ca1c80e8fd5b9e140ca64ef3e75dc7cf7a28040b3d10b260307128946e8  docker-cli-20.10.21.tar.gz
+sha256  84d71ac2b508b54e8df9f3ea425aa33e254fd3645fe9bad5619b98eaffb33408  docker-cli-20.10.22.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index a14edb2c31..cb44c68c1b 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.21
+DOCKER_CLI_VERSION = 20.10.22
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
