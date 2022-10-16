Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE48DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 22:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C34A409F1;
	Sun, 16 Oct 2022 22:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C34A409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pwGfmUzMNzE; Sun, 16 Oct 2022 22:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E795409AA;
	Sun, 16 Oct 2022 22:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E795409AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C82181BF385
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 22:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A258A409DB
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 22:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A258A409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rc9jXuaSBrdm for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 22:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F3A400B8
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95F3A400B8
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 22:42:37 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r18so8935502pgr.12
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eLvtg1rX1Uk+mE9Aw2w8frQpmsptJzRn9g2qrjcjOdo=;
 b=nPIlGEBDhmmBts1LypkE/SRmTkL7Myf+6GVoLQrKcp4MZXHliVnU+rM//3n1a6uj++
 e6xQ5vMBsOhsDpA3OR0LghQ+kLunTwtl7F9lAkTFCyBLIHzSyhlxrQeApNSnjkOEYYcJ
 3S1cnuSR1LXk/VCBr5304Nz9sKlrljxsfDiUexSLlMt4x75PZaEqSd57zrRahDdjoa0M
 a/nzJvfMKh7qFJ8Ca10Gk0KiNorjlo7jaM4+6dTCIr2e1dMMvNwlyn3Y8UXEoLenWys3
 iC6Vs0nX+o2wJc+v4v1JwrFSEx3PcBtjOmgWp21MW8+hfe3axdfP3TRHGE7xENxcu7Pz
 WdYg==
X-Gm-Message-State: ACrzQf3mXoTWyxr6H4V4Z7T8v716eny5OE0MAc9d7ktAZWZoaKlaGinD
 24Yrn9XLBdx6F4kvHKd/JShZxCvIdFW+DA==
X-Google-Smtp-Source: AMsMyM4FZP5NAS51vlBiKrI0P8w+bsDYiAjx3YmWUJo2Fya2wizDVL/nQlii+GpoJdVWewKrCZgGWg==
X-Received: by 2002:a63:86c3:0:b0:461:a261:eb42 with SMTP id
 x186-20020a6386c3000000b00461a261eb42mr7961640pgd.603.1665960156375; 
 Sun, 16 Oct 2022 15:42:36 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b00561cf757749sm5575936pfg.183.2022.10.16.15.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:42:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 15:42:32 -0700
Message-Id: <20221016224233.237038-1-christian@paral.in>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-cli: bump to version 20.10.19
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

This release of Docker Engine comes with some bug-fixes, and an updated version
of Docker Compose.

Builder

    Fix an issue that could result in a panic during docker builder prune or
    docker system prune moby/moby#44122.

Daemon

    Fix a bug where using docker volume prune would remove volumes that were
    still in use if the daemon was running with "live restore" and was restarted
    moby/moby#44238.

Packaging

    Update Docker Compose to v2.11.2.

https://github.com/moby/moby/releases/tag/v20.10.19

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 8af47adc63..153e0e5d00 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  87ba64f76d3bb98666fa44552c3eb0b1c10e5e9c43010e8dbc180ba22690413a  docker-cli-20.10.18.tar.gz
+sha256  f4398ad858274605f8e4e55d4618b2f5bdff6969a4afa232842bb2417d8a98db  docker-cli-20.10.19.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 707069512e..1fac21790b 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.18
+DOCKER_CLI_VERSION = 20.10.19
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
