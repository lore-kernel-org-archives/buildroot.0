Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A292BC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A1180B7C;
	Sun, 18 Aug 2024 09:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fg1hMiKvnK7F; Sun, 18 Aug 2024 09:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5149080B7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5149080B7E;
	Sun, 18 Aug 2024 09:03:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB78A1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B5B80BC1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuD90MlocH9A for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA7E280B7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7E280B7C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA7E280B7C
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B4D69FF803;
 Sun, 18 Aug 2024 09:03:47 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 11:03:38 +0200
Message-ID: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723971827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YeUMpfjOcaJY/e012eSAFbJ5xGB0nze5pX/oIu+5oso=;
 b=gpmPp8ZH1SW5340UE0OLT0O3aHLth2rD3jQ39fcgAWqHXSD9aA6IemwiuW6+SK9H7hacnC
 PZ9pSalby/nKtGbvap4dHW+mj0K+XFidsbwun5u6S96cP3WRa1AXNt2n5YYeAZqKxpPTqz
 jqNXgRgrOdozDX7IuB21kBkbycHIc/GxI9cjsoOZwTD6Dnnkbh79n/2OgMn+5miAdcG7Fm
 HUx/+41r6+4e55kCJ2+Exj37CI7RlOnzvXDrzdjZxfEBZrkrEuyW6/FjerEXNLZnPYWK/s
 vXYEJwWTIIJpJkQ+S7K2yW+ER8PG+2X5+gf5tu9W0PjXB+v2teqGmDnWGfl/HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gpmPp8ZH
Subject: [Buildroot] [PATCH v2 0/5] Misc utils/genrandconfig improvements
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

My starting point for this series was that I wanted to create some
configurations that have BR2_BACKUP_SITE="", so that we do not use the
Buildroot backup mirror, to ensure that upstream locations are still
around.

While implementing this, I realized that all the semi-random
configuration tweaks that we do in gen_config() are in fact completely
overridden by "make randconfig", when genrandconfig is used without
any toolchain CSV.

So I thought it was time for a bit of clean-up:

- Drop some fixups related to toolchains that are no longer tested
  (patch 1)

- Completely remove the support for using a toolchain CSV file. "make
  randconfig" support has been around for quite a while, it gives good
  results, so let's use that as the default now and only use fully
  random configurations (patch 2)

- Adapt the fine-tuning logic to the fact that "make randconfig"
  overwrites everything: move the fine-tuning logic *after* "make
  randconfig", but keep only what makes sense, since "make randconfig"
  already randomizes everything (patch 3)

- Implement what I wanted: set BR2_BACKUP_SITE="" for some builds
  (patch 4)

- Rework the logging of genrandconfig, as it is quite noisy right now,
  but only with irrelevant messages (patch 5)

Changes since v1:

- Fix PATCH 3/5, which was breaking the randomness. Indeed the tuning
  done *after* randconfig was done by overwriting the .config
  entirely, instead of appending to it (open mode was "w+", while it
  should have been "a")

Let me know what you think.

Thomas

Thomas Petazzoni (5):
  utils/genrandconfig: remove fixups related to untested CT-NG
    toolchains
  utils/genrandconfig: remove support for toolchain CSV
  utils/genrandconfig: rework fine-tuning logic
  utils/genrandconfig: do not use BR2_BACKUP_SITE for some builds
  utils/genrandconfig: improve logging

 utils/genrandconfig | 268 ++++++++------------------------------------
 1 file changed, 44 insertions(+), 224 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
