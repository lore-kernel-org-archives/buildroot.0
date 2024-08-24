Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9017FC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 19:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A2581768;
	Sat, 24 Aug 2024 19:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWdtfGpL9KvK; Sat, 24 Aug 2024 19:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3179181E09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3179181E09;
	Sat, 24 Aug 2024 19:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC49D1BF40E
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 19:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAC4A402AB
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 19:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaXib2-FFqm8 for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 19:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51CA5402A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51CA5402A6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51CA5402A6
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 19:07:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 24CD220007;
 Sat, 24 Aug 2024 19:07:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 21:07:19 +0200
Message-ID: <20240824190720.2370919-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724526442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k9cHCNDYhRA55cxaujbv+tU688JqYGLWE5T4nqatxgk=;
 b=VHeXjpFuhlneGMeBhMsZFrsJulSx44tZDd2ltgv+y3RAO34bfj/CnY5M9vsEN8xOV2/GnX
 o60KnX347ls6iwP805Usu5Ny28qrq7QH3WTbz20Y60bkaklxPfqpXI8oE7SOLRyyw6nlLQ
 pbvNzU97eBPIgCuMOVZE/9waIEHJsqAljOBdAfjVLyMehCrlZ7a3HqoFnGK3chP/CvvJif
 8OHTQDv50/xvL1BdJRHDl4vi+bowoTPA3MzhwN7dSSwLRCMUoma8vs55Fw2Nby7KBuhzz9
 ssS6blArlJYX4RFn6xN6Y7BDQztB3+fRytbLcS+NB7cmAF83RufDxobtTPea6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VHeXjpFu
Subject: [Buildroot] [PATCH] package/libuecc: switch to a functional Github
 repo
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
Cc: Alexander Dahl <post@lespocky.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The https://projects.universe-factory.net/attachments/download/85 URL
no longer works, so let's switch to what appears to be the official
Github repo:

  https://github.com/neocturne/libuecc

The v7 in this Github is 100% identical to the v7 that was available
from https://projects.universe-factory.net/attachments/download/85.

Also at
https://metadata.ftp-master.debian.org/changelogs//main/libu/libuecc/libuecc_7-5_copyright
Debian lists https://github.com/NeoRaider/libuecc as the source, and
this URL redirects to https://github.com/neocturne/libuecc.

Thanks to the original tarball being a .tar.xz, and our Github macro
generating a .tar.gz, the filename is different, and therefore the
different hash will not be an issue.

Fixes:

  http://autobuild.buildroot.org/results/c4c24bd06bc7889c46d78e14d5bef528340d4463/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuecc/libuecc.hash | 4 +---
 package/libuecc/libuecc.mk   | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libuecc/libuecc.hash b/package/libuecc/libuecc.hash
index b72519f167..7ac5860cd1 100644
--- a/package/libuecc/libuecc.hash
+++ b/package/libuecc/libuecc.hash
@@ -1,5 +1,3 @@
-# from https://projects.universe-factory.net/projects/fastd/files
-md5  5cd543cb8e7bce83a22c07a0579c95a1  libuecc-7.tar.xz
 # computed locally
-sha256  b94aef08eab5359d0facaa7ead2ce81b193eef0c61379d9835213ebc0a46257a  libuecc-7.tar.xz
+sha256  465a6584c991c13fddf36700328c44fee9a3baff9025fb5f232b34d003d715e0  libuecc-7.tar.gz
 sha256  ec4d9fcc3a37a7998a9ea4decf38f4c0c91a44fd05bb17638c52fe16f2b12e23  COPYRIGHT
diff --git a/package/libuecc/libuecc.mk b/package/libuecc/libuecc.mk
index aad26e5aff..6251edb636 100644
--- a/package/libuecc/libuecc.mk
+++ b/package/libuecc/libuecc.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBUECC_VERSION = 7
-LIBUECC_SITE = https://projects.universe-factory.net/attachments/download/85
-LIBUECC_SOURCE = libuecc-$(LIBUECC_VERSION).tar.xz
+LIBUECC_SITE = $(call github,neocturne,libuecc,v$(LIBUECC_VERSION))
 LIBUECC_LICENSE = BSD-2-Clause
 LIBUECC_LICENSE_FILES = COPYRIGHT
 LIBUECC_INSTALL_STAGING = YES
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
