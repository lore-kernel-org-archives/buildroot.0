Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83DCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:03:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD57761183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD57761183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88201404F9;
	Tue, 21 Sep 2021 13:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9ueR2rSMai2; Tue, 21 Sep 2021 13:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2FD14039E;
	Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 919C11BF352
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7840C8347D
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCnAwYvWjg8j for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F8082D75
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:32 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 31D6D6000D;
 Tue, 21 Sep 2021 13:03:28 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:17 +0200
Message-Id: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/8] Use gbm API features
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

This series introduce a virtual/package for the libgbm.

We also introduce two gbm features so that packages depending on it
can select which version of the api is required.

Note that we only added sunxi, gcnano and mesa3d api but other
implementations can be added later based on this series.

Cheers,
Kamel


Bernd Kuhls (2):
  package/opengl/libgbm: new virtual package
  package/mesa3d: add gbm api features

Kamel Bouhara (3):
  package/opengl/libgbm: introduce api features
  package/sunxi-mali-mainline: provides libgbm
  package/gcnano-binaries: provides libgbm

Thomas Petazzoni (3):
  package/sunxi-mali-mainline: bump version
  package/sunxi-mali-mainline: add support for different outputs
  package/kmscube: use libgbm virtual package

 package/gcnano-binaries/Config.in             |  6 ++++
 package/gcnano-binaries/gcnano-binaries.mk    |  2 +-
 package/kmscube/Config.in                     | 18 +++++++---
 package/kmscube/kmscube.mk                    |  3 +-
 package/mesa3d/Config.in                      |  6 ++++
 package/opengl/Config.in                      |  1 +
 package/opengl/libgbm/Config.in               | 18 ++++++++++
 package/opengl/libgbm/libgbm.mk               |  7 ++++
 package/sunxi-mali-mainline/Config.in         | 32 ++++++++++++++++++
 package/sunxi-mali-mainline/gbm.pc            | 12 +++++++
 .../sunxi-mali-mainline.mk                    | 33 ++++++++++++++++---
 11 files changed, 128 insertions(+), 10 deletions(-)
 create mode 100644 package/opengl/libgbm/Config.in
 create mode 100644 package/opengl/libgbm/libgbm.mk
 create mode 100644 package/sunxi-mali-mainline/gbm.pc

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
