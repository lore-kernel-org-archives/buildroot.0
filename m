Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CEDC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 15:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3850B400F2;
	Mon,  7 Aug 2023 15:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3850B400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9HuCf5UVuio; Mon,  7 Aug 2023 15:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C8740A1E;
	Mon,  7 Aug 2023 15:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40C8740A1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60C361BF276
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 15:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D54D80C04
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 15:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D54D80C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4X1sYSbF7Vv for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 15:32:37 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF16B81388
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 15:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF16B81388
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B269D352BD47; Mon,  7 Aug 2023 17:32:33 +0200 (CEST)
Date: Mon, 7 Aug 2023 17:32:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNEOketbv2Ba6O5N@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691422353; bh=s59V+CraZefCWrpLHAH7Sv9rt4Fv6HYonXZnudegJJs=;
 h=Date:From:To:Subject:From;
 b=RKLH0oq96pzibFydSKARkITwX9y/LpVvRZvRyoSUlgyUEr+fJ6tKfIChLVcNEWaGU
 wv7ozZtbva90KPmj7oxPMCHj+fUJbyt0F/hg48p7bX+8MmTq0pIze2Xtwmw1rmWWSr
 4IyAq7nlRIdyyMXCYhrjPdvmTAl/I4h3O4NvE7b4EIvnaevvUJyBndU9uVQev3jHbq
 GcDxMLuzifHx9ia42pIdykt6Ibm5EdT7tcgFV5yzprOMZkRcsSm4Zu1/Koi6HSwuNX
 SH2XLGSqb0QTlDqSBd6O0MJ8ZdUpPcUr9f1NEoUYJUJFxuT5yOWBnvjDeoJtAWitpU
 AdT3el4sR6HFg==
Subject: [Buildroot] [PATCH] package/check: fix compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the tagged version of check.
See here for details:
https://github.com/libcheck/check/issues/303

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/b10/b1087e9a67ff0382632b73f280fabe92cd863593/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 543e78f317..3d7538b2f2 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a  check-0.15.2.tar.gz
+sha256  998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e  0.15.2.tar.gz
 # License files, locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index d3977154df..dab2b76911 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CHECK_VERSION = 0.15.2
-CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
+CHECK_SOURCE = $(CHECK_VERSION).tar.gz
+CHECK_SITE = https://github.com/libcheck/check/archive/refs/tags
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
