Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8935CC2BB85
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 14:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DEA81206;
	Thu, 20 Jun 2024 14:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o46MP_i9zFmd; Thu, 20 Jun 2024 14:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E61E813D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E61E813D9;
	Thu, 20 Jun 2024 14:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 362E31BF293
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22E4A43565
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tns9Yo3aVTkb for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 14:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4037C43592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4037C43592
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4037C43592
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 14:39:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16826240005;
 Thu, 20 Jun 2024 14:39:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 16:38:50 +0200
Message-Id: <20240620143853.1259543-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718894350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vWNDJkIcE0CbnT18wSH/z8yEvCJJYKQjB5olGk9uTqU=;
 b=DJADzikP46sDC/YUezFLg3bXNnIkWRXSSUb+Ks4ND1MN78TUKv0o+Xyk/edCHbE9S7u5xV
 Fr4QLaUiLyfQdTUmsJ2mvgCVGzOV+OKjJugVXmpXijSz20S3wn638G7NR3g44DcATvPdYT
 N9q/td8Fnv2dQilHB1nqngGTCc9KADDpTxuVSmr3x9Cqc5yGJvpUBerjccOh82oRiGZNt1
 fwOIakeqfojRdRE2cauPCGOL9SILLZrb4M3FkEEkqmqlsp3rFQqBgodU9o2p5NR0wwvVQL
 9a4JfbjSZ7aMOc2gDhtZuoxpft1ii3+LpWsVR3Mk2206z2cnI2E1LJUClrNmKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DJADzikP
Subject: [Buildroot] [PATCH 0/3] Support custom tarball for OP-TEE related
 projects
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OP-TEE OS supports custom tarballs, but the optee-client, optee-test,
and optee-examples projects do not. This might cause version mismatches
between OP-TEE OS and these related projects.

This patch series adds support for custom tarball URLs to address these
potential issues.

Kory Maincent (3):
  package/optee-client: Add support for custom tarball
  package/optee-test: Add support for custom tarball
  package/optee-examples: Add support for custom tarball

 package/optee-client/Config.in           | 38 +++++++++++++++++++++
 package/optee-client/optee-client.mk     | 24 ++++++++++++--
 package/optee-examples/Config.in         | 42 ++++++++++++++++++++++++
 package/optee-examples/optee-examples.mk | 26 +++++++++++++--
 package/optee-test/Config.in             | 41 +++++++++++++++++++++++
 package/optee-test/optee-test.mk         | 23 +++++++++++--
 6 files changed, 188 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
