Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6155ACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342ED41F39;
	Fri, 29 May 2026 08:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guM6VyYH0oab; Fri, 29 May 2026 08:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 493CD41E61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043178;
	bh=yic6kXXecJrPJEOndPMXtHX+/wNZVTs6WW2tDiiirBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FKdDyX19Z4k5Dr42k00bt6q8EO1UkFq0wmRGWzWxp7zLz8vR8W7E1MuALXfALNNsX
	 hGXJl0FwmERepyO0CuEU15eDn0VBX2N4DqSZcZbwmK3SjEF+ONRP1B314ZRrPaZ53U
	 eF1VtPW2q9nj4cVhpZktUnq7U1Sk6DwO0R9xr7g+S69ko/0hF2G/jrtmr/gvT1SpTb
	 p3hV6nY2zQOy8ec75Zl8ODn31+byeFdBi+ZkED4rvK9B9l7A25kgpovRRcElCoO1ha
	 SEsvG8ERUZ2D2UYO3rppwRNpViX15Yl9XyGB4BaBc1gxJk51NbwK2fQaKS1P2YMaia
	 jQzeYigY4JyJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493CD41E61;
	Fri, 29 May 2026 08:26:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0713B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C50DA41F8C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgyjHzSMkW1U for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1356641F6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1356641F6D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A747B870C6; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:29:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fa40ef1d96e50685f08f3f2473130304bde2d240
X-Git-Newrev: 1dbaf66ebc2a9a93fa4214fb87d484874851a624
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.A747B870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zlib-ng: fix
 build failure for PowerPC soft-float
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1dbaf66ebc2a9a93fa4214fb87d484874851a624
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

As suggested in this review[1], when building for PowerPC with soft-float
enabled, let's also disable both WITH_POWER8/9 that in order disables
all the possible PowerPC acceleration instructions.

Fixes:
https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/

[1]: https://github.com/zlib-ng/zlib-ng/pull/2151/changes#r2803264882

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 668b47bdab0bf4010a95187fed48b1489bace5c2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zlib-ng/zlib-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index c9d022da3e..ec61ad6c0a 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
