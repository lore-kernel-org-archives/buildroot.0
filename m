Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D9C43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 11:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D51B8186B;
	Sat, 11 Jul 2026 11:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gRtsSAi7Tny; Sat, 11 Jul 2026 11:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B96381362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783768669;
	bh=e5xhFV1ewQOMgSy0017bTVaZh5/DRAJrKlPkCeSuiGM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QiIUzwGrOR10CrrUp6KfPgN3z/sGVO8jyhQSKo5fENyUeJIKc1tdSl+H+ftyuMscq
	 EhbpS9tN4zLcDyb6Iua1Urhr08Os2O6/7MSuAgDFmDpgmD9mU+iKb5mR6HQHZgzXDV
	 +xe+RMVeX/BLQAxCItgse9uJvmtMilkTOPDEbQESCh+h+YFgaVv1+iQj8o9xKBALzP
	 PztHvpi6jvK8UYuc929soc0BtDrKXUnqjA7j343m/aKrZ1P9JVa2e2fYwBDBgkvIsw
	 1JKKdqGC2QzrUnF70Vtpvvxg8Zf1goA7t2cvD2cur30aEwvzv4PL0HHGtWKxCFwKZR
	 8c80BpvSAEwxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B96381362;
	Sat, 11 Jul 2026 11:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BA812EE
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD6D181362
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mh0zwXckEfv7 for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 11:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 026D5812B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 026D5812B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 026D5812B5
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:17:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F92AA4C0F25;
 Sat, 11 Jul 2026 13:17:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56980)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiViK-000000001Df-0fnM;
 Sat, 11 Jul 2026 11:17:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David du Colombier <0intro@gmail.com>
Date: Sat, 11 Jul 2026 13:17:42 +0200
Message-ID: <20260711111744.877250-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783768664;
 bh=sE2780/J998u9sTRXAGdXxvOVVy4+gf8WQwDNaBDzPI=;
 h=From:To:Cc:Subject:Date:From;
 b=L3aqsf+MJPS72p93msTzuwZ35XKGkVCb+suJgPELpS8v+kS55xIOgjgTQxXbPsBPu
 nDmlW4NX+aS4ZxHrb891kTl2xlpXGD4mEk4X2E85L17/YDA1H3Mj6OlipEQzIRXEY3
 P95WgegyfUhv/aDD46Sb/nfb+FgCEaG5jlO3+Lqi6jUQk0j/nQhYU+A1JvXupp3Pc9
 Lmk3bPMxkPnWbruUnp0s8Oo+w7Q4xmu537X9ummporSqULqb4Xnj94nctXny4tCJWR
 zcU3wAYpvOQfEfiMjEDDhG38CXr5sw/BjwT/DKedNFT7XZ24K/JyDZ8mZRtk7EC1kf
 0tZ1PaBKOo10A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=L3aqsf+M
Subject: [Buildroot] [PATCH 1/2] package/x264: disable asm on i386
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

Fixes build errors

In function 'x264_predictor_clip_mmx2',
    inlined from 'x264_8_me_search_ref' at encoder/me.c:231:30:
./common/osdep.h:455:13: error: 'asm' operand has impossible constraints
 or there are not enough registers
  455 | #define asm __asm__

Fixes:
https://autobuild.buildroot.net/results/3db/3dbc13972fe0c31584cbc9d9f928ea0d13a1ad4d/

The oldest build error of this kind dates back to 2022 with gcc 10:
https://autobuild.buildroot.net/results/080/08011e939f9d2ed949392656d744c53b1bb07117/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d59ef84f5e18a4f05c04061dcbcea691479d3045

 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index e96d993017..858486af54 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -13,7 +13,7 @@ X264_LICENSE_FILES = COPYING
 X264_INSTALL_STAGING = YES
 X264_CONF_OPTS = --disable-avs --disable-lavf --disable-swscale
 
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_x86_64),y)
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_PIC_PIE),yy)
 # libx264 uses large amounts of non-pic assembly code, resulting in text
 # section relocations, which are not supported on musl-libc's ld.so.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
