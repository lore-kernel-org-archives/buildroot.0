Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39921C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C0441BF2;
	Thu, 28 Apr 2022 21:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leXDPEOwtBap; Thu, 28 Apr 2022 21:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD21E41BE9;
	Thu, 28 Apr 2022 21:20:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E02C1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C82883E0C
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oGOWAa62sUC for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:20:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CB498271D
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:20:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 6EE3C40004;
 Thu, 28 Apr 2022 21:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YkFdFcyEb3jYMtPy46qsXgaGg8tyhOHFw02a9J0ty4M=;
 b=a5JLc8cggeR24Yp98Wls6htg7gnOuPC5mrvu7o4JPZN5imcocjKQLgwYMDzwxgcJPkbw1w
 09jaEMeEn3bDMtP+qAYe3DAVDT5QlgiXioiZaaBGcpTCJcnnG5S3qsesCjRDVOUt2DjqAQ
 kt7vvG8CcM/aMVH9v2Lla2j9Ll8F/UWVg7uqvxY0VxgaeVUWhg5TPhVleEL9xdW/3jZE/A
 R+GWUiGFLerPy0uVc6DfNom23YifDqn5jj+Hu4cVK4YWQcN5maRnMaZAxa3/IcZeSjn5t1
 nffsL9xjQTm+CtW99aVC0t5mrGkbdHQNwk70BtVz6sr3gKGRCfQk0Ped3p0jRw==
To: James Hilliard <james.hilliard1@gmail.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Peter Korsgaard <peter@korsgaard.com>,
 Kristof Havasi <havasiefr@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Thu, 28 Apr 2022 23:20:10 +0200
Message-Id: <20220428212011.534725-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Revert "toolchain/toolchain-external: error if
 BR2_TOOLCHAIN_EXTERNAL_PATH is not set"
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 8945ba49480a7885d104445ca855ef7681a374ff.

This commit is incorrect, as it is perfectly valid for
BR2_TOOLCHAIN_EXTERNAL_PATH to be empty. The help text of
BR2_TOOLCHAIN_EXTERNAL_PATH even documents it as a supported case:

          If empty, the compiler will be searched in $PATH.

Commit 392b0a26f5fd8d3aedce7e0c15f9762a79312f01 ("toolchain-external:
default BR2_TOOLCHAIN_EXTERNAL_PATH to empty") even made that the
default saying "In addition, it in fact works correctly when it is
empty. In that case, the toolchain will be searched in PATH."

A user has reported that commit
8945ba49480a7885d104445ca855ef7681a374ff breaks his use-case:

  https://lore.kernel.org/buildroot/CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com/

Reported-by: Kristof Havasi <havasiefr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
This should be backported to 2022.02.x
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c7f4175c9e..299b6008aa 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -69,12 +69,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL)$(BR_BUILDING),yy)
-ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-$(error No external toolchain path set, check your BR2_TOOLCHAIN_EXTERNAL_PATH setting)
-endif
 endif
-endif # BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
