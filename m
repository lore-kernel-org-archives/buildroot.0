Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114D0C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 04:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA411848A9;
	Thu,  6 Jun 2024 04:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPeE8_FcU4tm; Thu,  6 Jun 2024 04:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A8A848AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A8A848AA;
	Thu,  6 Jun 2024 04:51:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213C01BF955
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EA11610E7
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWKKJgrZ_A9A for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 04:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFA28610D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA28610D9
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFA28610D9
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 04:51:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1364B614A9;
 Thu,  6 Jun 2024 04:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E82C4AF09;
 Thu,  6 Jun 2024 04:51:21 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 07:51:04 +0300
Message-ID: <20240606045104.21332-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606045104.21332-1-jarkko@kernel.org>
References: <20240606045104.21332-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717649481;
 bh=7UMaDZvgckeoF4NrkB7K7SKlvINgRD9wBwo+QRU58mU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=luN9rVvNAHO5DYXsZP3t8Uqko9ikYpjUypAMdd7bTFCKDbG9Fktx3y8DEYNlg2AV3
 0tJDbyhY+mDkGfsqk4mrVm8zTciLZklbNVmDmCOSO6QuTHu7cQRfPNHgmREAWkO0MW
 xBc9K4LQpcBaGxkeodDlZjRDQmomQVWXQuGoyUb9xFPfJupyjYoukaUvx7vry+N3LI
 pp6jlch6hGlIuGJqNZSc/pBC2CO57FC6hcJT69xFietgp983GOFb8m7MrBYY+S9F7H
 Z/og/GxTyLGQ7dGf0f+jFqVuU/oVBd1XM5qO+uql3iP5eRCcrq0aIW1/sy/sDI+Gs3
 yVgLOy2bmTUZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=luN9rVvN
Subject: [Buildroot] [PATCH 2/2] package/systemd: bump to version 255
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <who+buildroot@cnackers.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last version with System V init scripts and cgroups v1 support. After
this version the upgrade will take mostly a longer period of time.

Link: https://github.com/systemd/systemd/releases/tag/v255
Cc: James Hilliard <james.hilliard1@gmail.com>
Cd: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index f999d0d34e..190e326e57 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  26ac73c2108132b1d11ff939e8b1bece42f1c1da03fdf4a242af5a7cf3ac34f1  systemd-254.13.tar.gz
+sha256  a3eb766ee96eb9f4cc25c2a6c933f3299e1b7ae22e72507dade0a5c86d92534f  systemd-255.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6b3553723c..e74eb9e830 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 254.13
+SYSTEMD_VERSION = 255
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
