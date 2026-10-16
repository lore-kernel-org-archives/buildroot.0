Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C6CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 378D960AA5;
	Fri, 16 Oct 2026 13:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIZapKAzGiWP; Fri, 16 Oct 2026 13:08:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 51D8660B24
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156118;
	b=i/A3TK4EYaR7hfheaTOeYojpx7U/x3PIbyOK5zc5u1bBAnnc6VFPIgHJe+wsTNDuqBSj
	 p7Sys/ykYBlKdhQP2bq7Kbe8k0NKW372fkwrs9KhK5zZ5dG9hGD1odFv+mOIm16dR7ss3
	 hqYxsjSWSQ2UTE3TuFoMouhYpwBWw4Qks/RzYb63p4d1sWIMNuEz5NvO9+dHyinV0OKOL
	 AimqTLAd5f/HMsDwjhQG+cTotpYbOL5rKHkSdZ/2+Gjj8lVYhPDM98esXI/i/BPMyxFZ3
	 /x7f11BI1zj6OpnMUsiI97qeux370AOgsc8AuWSdIL22t13FR2j9fOwEtULlnaSxLSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZdZXpDPS144m9jiIK3YJ6/Gm3WMBA3x6JGMF8rj5iT8=;
	b=VtIuvrgaGiRQ6AVzJxgQUTgWY4n01kNEjLCmPa2OET5z9mDqlEjtzXNOwnxdndkwTjJ1
	 lIDEPVSSxlEzHmpZZh9KVzTpNi0wqaRz0tKJ4Xo/GjGEClpkVd0Ui49BguWs5qDLdYGzE
	 Jzu9Lx0yVUp3xsovaeC37tHivtRrP5CwfTqDD5Nx+uFQoIk2c9nfPW0ItKzKOVJGHqkg5
	 ubrs3vWLqxltsR/vLLtL+dkx2nPynescK+SQ9/WYDQ+u/GicMJoo0zX2T3YJu2hZI+TkA
	 Dl82N6596ghBug/VJlfDPGGeF2rh21oARQbn0qGhB8NKQM0BY4W4amP5FEk1uSMusxg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156118;
	bh=ZdZXpDPS144m9jiIK3YJ6/Gm3WMBA3x6JGMF8rj5iT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ie9bIJJhAwFVDIyjVIqqm6LkBzy5mXtAoeVQjLmgeil7AoJswzouAx2uXPFtxc85c
	 cryptYlUkxXuW8wj3cZACcHRYrMNbrvM4Q2imWbOVrgkIdGbVuA7A/ABlmmXhqK5gb
	 L56Jkxc25HnM0aVe+RbTqSr8JhY9070VxbQg0ob5f/ZFTBSnvs9GoLY2XCgpXJTbMM
	 xO7Dlz5Fq35nwDO1T33EyHGveH/rDuIG7T9uJOsvgT6UTEJL7B6/deGX9vAw8S6U8A
	 c4zAbAwOIOQ1ooGFftgrNe+NWIVpr+zT7hrepVR9fsyMbfJSkgl3nSVZsMmZcFH800
	 Q/CmH6gGXLkLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D8660B24;
	Fri, 16 Oct 2026 13:08:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 074F7F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E200E607CE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXd8ht6r7fCz for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E34EE60801
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=KxGErM5UzV53Iem4dkvgxLmq3JUDmoNBVKMEakzZWrvHY64Q8hTQB5Kj5uveldJAqUjB
 YCUL1b1hQcpZDt4TOn6OIMLn1Ow6eM4ezewD/c+L8YZKK3d46giUqAlznrCy4qF88wzyv
 Dzipkz/pzDgpThihmyiHwcRsR1tdR65JJg0iP/0JTzW1+1V2+qKvlYw/yDlAJ15HPQcjp
 JgJMvbyvguAM5Gx7tkMDpilzy+IC0up9hMTMzd/9R3bMZwVSuMqRja1LrKxT8f4+rqEgy
 PunR+7YF0qS4nHWZXHW07rN/6jOwaTmw2fJ5hq6UUKFsqQTH9F6YcC8XH2prkiK/a1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Un/+QfynLvhruLUGrxd0DABk9QTs6xiVEg/FvWqWFGw=;
 b=KfGczfNjtjWDQYC8KTFHkPgulKGpmWnBjBXO5sYEE2X/z7fKii2hRTkmoUoT7EXN8J9U
 yoE/RbviCMcgMMX7v+h8tv9A+Y1z0RZyTVEHaEZeBfCSmSCbhMFe5vAcdu6PTdLaSGi9x
 rv2xxvJLMTrqBafDss09yOQECxLscmUmLwej6Ci9J35QOQFHn1MysschLXgBdZ3Pbqeh9
 D9QZrbxhAt8VZqsSxduSNsAVpHAA2DxzyDx6Bkt9NT9BFLfAXPyj7sRs6Td7tpP3fOBuf
 E8vbTCI5E+GEEVPoyhSCq6j+zeLsXY4fi6nlssORHYDTuEAwwh9i4ApAOM6KpsB/eag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E34EE60801
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFCEB960D7; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0091727a740523d0aaa888e6a08e4611d96bfa22
X-Git-Newrev: 7acb39ec283fe02393ca469c6e8c53f442a7ad91
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.AFCEB960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive: drop
 dependency on host-pkgconf
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
Content-Type: multipart/mixed; boundary="===============5925804928641835691=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5925804928641835691==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7acb39ec283fe02393ca469c6e8c53f442a7ad91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d bumped libarchive to
version 3.8.1, and as part of this, dropped AUTORECONF = YES. This
allowed to drop the host-pkgconf dependency, which was only needed due
to AUTORECONF = YES. However, the host-pkgconf dependency removal was
only done for the target variant of libarchive, and not for the host
variant.

This commit aligns the host variant with the target variant from that
perspective.

This is not tagged as a fix, as nothing was broken.

Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit ddaa55ead5a12866363f69c562806acf297322cd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libarchive/libarchive.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 5b6aea3407..88dbf2a48e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -146,8 +146,6 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
-# needed for autoreconf
-HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \

--===============5925804928641835691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5925804928641835691==--
