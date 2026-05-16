Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3E1CD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 20:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3473442418;
	Sat, 16 May 2026 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxp8jg_wwTqt; Sat, 16 May 2026 20:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B1A3423BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778963599;
	bh=pydc/kV+IJKYEfNbffhcT9KI81tLpOjO4VP2Iq7qSSc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jNChsX4pXP2Px9jjt5LuTxMO3MjkGaimQbDIhxTfKKJUvNBKQo9MDeoAkhjgq4rP6
	 e9Vh1Hz+9RwjfOeBsAkDt9SM6dFUSAxiWO60XZCHjCWK9x2o3dGAQCR+4RRspmKCMN
	 2suaAcyVLyvAZxYasg7B1V5QdO4XsNT7xU/tsvIaKITNBTmWNAA1+NQ/HLburZUj2K
	 1yRARGa6lHsn8d8YWXw6fKAVgxygpK2VxemrMYbOK7LYePOYyhlNlE+WCAM4mKxHGw
	 YavnCrVOHVdxHLPYFOF9pVRZlJeLGzudn0P/mBNKpwNDkwsY0D7aLdJb2jAPgknt2T
	 /BLvnbw1Ktzgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B1A3423BA;
	Sat, 16 May 2026 20:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A4C4206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D14584C4E
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAZvwAnmlEvh for <buildroot@buildroot.org>;
 Sat, 16 May 2026 20:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D7DC84C4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7DC84C4A
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D7DC84C4A
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:33:15 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id OLhBw7uqYtpTfOLhBwoPUy; Sat, 16 May 2026 22:33:13 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 16 May 2026 22:31:18 +0200
Message-ID: <20260516203118.672513-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD54PycWLVZZUhvZmbQEktOXSDlaM01kH6BEHWguOnWwEZcmM0utQ5Tf1L71fcLzRhnm9piUx6WMEsoF+A0k3GbpEAf/yrQRep6UO6hxQbDpiqkxDLd1
 EfzhhkDjPzbuGvEHmvx2Y3N7f0KXIQ3WMrlCmpnUgx3PkCslBpMjhmXjjRp3m0Z+eyIFy4Fm/Z4Ja1EcXDhrvjPDSAhst1D8GxFXp4mvWUUy4O2mOO94Yzqf
 tSva/6PEBF8VN2RvCQYJ6VizSPw3Rn/VKrdjw1hIGwE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778963593; bh=3/0Sy6lqjXAW6PWJgqtsL85LrUXT1/c3e7Te4I7qMYg=;
 h=From:To:Subject:Date:MIME-Version;
 b=ilaP2ZqDgtNGRixqEv1492UmRbNo9tqAMILZvfwD/p0msJM+zVQZcFKx8CBu4MJw+
 pVdf/CibpJimAW0wsbiuqylMgrr22MN9xORUY9KlYs4qFG/CQ3rzKDK9cQGBJ14X1g
 BfKqjxSQAdnsa0n/+Vmg/WGshvFCKi7KWlHE8MmsdF+jsG9OQEqszoVYUhKu+6XaSF
 RKCTL9w4VTlBnSr1AWxi7dRYdTQV+7IzpTnFSHmDFcQ6dYpc5SVVfYX1QS9wFt3AvX
 BZRSsYsNNRMpqaIXuRutxCQX8iTcJBTi0KIFwQ46paZEOjj2L4GnwitYxxkcrl8BFB
 5Wco4BnzaIajQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ilaP2ZqD
Subject: [Buildroot] [PATCH v2] package/zlib-ng: fix build failure for
 PowerPC soft-float
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As suggested in this review[1], when building for PowerPC with soft-float
enabled, let's also disable both WITH_POWER8/9 that in order disables
all the possible PowerPC acceleration instructions.

Fixes:
https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/

[1]: https://github.com/zlib-ng/zlib-ng/pull/2151/changes#r2803264882

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* change to cleaner Makefile code style as suggested by Romain Naour
---
 package/zlib-ng/zlib-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 59e4e15282..448457799e 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -30,13 +30,13 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
-ifeq ($(BR2_powerpc_power8),y)
+ifeq ($(BR2_powerpc_power8):$(BR2_POWERPC_SOFT_FLOAT),y:)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
 endif
 
-ifeq ($(BR2_powerpc_power9),y)
+ifeq ($(BR2_powerpc_power9):$(BR2_POWERPC_SOFT_FLOAT),y:)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
