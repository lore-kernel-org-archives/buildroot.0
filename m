Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B6EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFE76073D;
	Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1b26sBFzz-N1; Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207486074E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207486074E;
	Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99CD21BF37E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85D1740576
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nbEiXAvc5Eg for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 12:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EF3B40129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF3B40129
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EF3B40129
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 12:06:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 258CA1C0003;
 Fri, 16 Aug 2024 12:06:41 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Aug 2024 14:06:27 +0200
Message-ID: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723810001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5ru67e2tsn4o+5j+yILgPVQVw5LcDe98sHXw1j5xaoM=;
 b=NnxwaE0TwFCfEqW+0sj243EQIX3U5zA1A5/8Tr4CJiJqXBsZwIAAwfPDVdX9yIiXCaTuJ2
 Rd7+meBFaKaQAxxzM0nBuoDn32/SB9lHM2jcfZ2/NFUdEgNauXMnrBEgplqFkZ34UuoOtu
 2GtsdVMeTP3TyWDYB3T32VhQxWg1+8r5dNJdHqgPjbkrUczxVyAN226L03PySRP++6rnCw
 0svqGDDkKQYGXvJJSraCiUo32klM/b48M3nJUZpVbI3QpipOaZ90+R+IFufzK9gjLB2sZO
 LXdlJCsxGqcf4MX6S+JVUhcFjlFINuNdhJEHxsRQjI6nyZPW1gooYEr0rblHcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NnxwaE0T
Subject: [Buildroot] [PATCH 0/5] Misc utils/genrandconfig improvements
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
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
