Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D5FD2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6198126B;
	Sun, 11 Jan 2026 13:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2zufb8AjaPR; Sun, 11 Jan 2026 13:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 192EF8118B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768136559;
	bh=texoLEJH7KFuN0t26zsuHqdtG1Ok4TVDYD2nyZpw6bY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oTEoQesXa6M89rb6XpBViB5D84Sa8WtmCL/ZHPUyzXfLPsp0SVOMD8H4Y3K4FRAM3
	 /NdYkkRT+gfvcZLVeO+lWTUYvF3WvkuU7UQ7mM9bowL2K4ZVWzMcnnOhpQZSEeDsIv
	 jXr88TwsYFraM2s7qMYq33mMqlTQZgduUYOs8EJvlIEX0Rp2Pq/yuJJzuxzmIMWIu/
	 W9hz//K8oJQ6fO1cn/d8E7mSPFVYr8NBCqpUwCWCQN9BNj6Oukmh5I2cBeOQied47Y
	 RkNGB9bzPQeWpTkphpU8ZXCF9Bil54BQTwc5b8uXAqrkQtsQtMazrTY5qwUfhyeT6P
	 gbwlH2LKxbgAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192EF8118B;
	Sun, 11 Jan 2026 13:02:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56B3812E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5406F60782
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuQOJjZihM1c for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 13:02:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D4A860699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D4A860699
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D4A860699
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:02:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9668CA4C361F
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 14:02:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36832)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vev5W-0000000025F-0ylb
 for buildroot@buildroot.org; Sun, 11 Jan 2026 13:02:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 14:02:33 +0100
Message-ID: <20260111130234.3228470-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768136554;
 bh=gxLrZDlckLIlnjb2/Kst0WvfQ+gPdSDKDFKAzajlX9Q=;
 h=From:To:Subject:Date:From;
 b=BTolp4Ke2+/lenIzhWIxb+mI6MS0DjFEp0lDpfH5l6w5yYbhLvD+BJ3frmIb2LAJD
 blInAGS/lFhp11TPXg0dme4UykgbchwAUsY1tScQzCAgsmbweJywY+FpBZnI2z6l9z
 y/opHkv6bvVu0jpYSQSF39g/i0zMlJJcD9tw67ZImt+G/O974TA2BrnLq7sYzFbqUh
 EwY8pP9x0wpL0tSn2Hz3S55rP5hQ9s/58400obCWFnNCexFS7wy7Nza556wnsFfaU0
 lijLefFbSA/zdqUnui1qR4uXafCXCia4Fw6DZJD8T7dvdf059mhN6DFAjR0SwuYO9R
 ilkXT142rEeQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BTolp4Ke
Subject: [Buildroot] [PATCH 1/2] linux: select host-openssl for all
 architectures when building latest CIP version
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

This is a follow-up for buildroot commit
bba86304b0ac4ae266cfb52e54a239b0850b10ca to extend the fix to CIP
kernels.

Fixes:
aarch64: https://autobuild.buildroot.net/results/f91/f910c1e0e864055120e2deaf4d56b127cabb89bd/
aarch64_be: https://autobuild.buildroot.net/results/6e6/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369/
arcbe: https://autobuild.buildroot.net/results/9fe/9fe7b4c66ac139926e9a3686bc951af703e78b29/
arm: https://autobuild.buildroot.net/results/288/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814/
armeb: https://autobuild.buildroot.net/results/d6c/d6cbbfdcbebe985d743232070824779e790aa5a8/
microblazeel: https://autobuild.buildroot.net/results/bf3/bf3b4c61cdaf3527e9e315050bf21456bbb24a48/
mips: https://autobuild.buildroot.net/results/c6b/c6b9c82352be01dd4bab2021a223e72dfaf1f522/
or1k: https://autobuild.buildroot.net/results/231/23144a8108c5837e3a9cf26ad6ac73fa16dc740f/
riscv: https://autobuild.buildroot.net/results/31c/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94/
s390x: https://autobuild.buildroot.net/results/bda/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e/
sparc: https://autobuild.buildroot.net/results/426/42614f77be9fa1b3a596cdcb40cfb81f5496b41b/
sparc64: https://autobuild.buildroot.net/results/1f2/1f226d028d85c085d82f3890e804b39bccd2c2dc/
x86_64: https://autobuild.buildroot.net/results/7be/7be86c261a42e1a16c3d38a640be226b5f51bccb/

Supersedes
https://patchwork.ozlabs.org/project/buildroot/patch/20251101102346.109307-1-bernd@kuhls.net/
and includes Edgar's comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ca8dff1f4b..14d644ecbc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -177,9 +177,11 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
 	# We know that the default configuration on many architectures
 	# requires host-openssl, so select it for the latest kernel
-	# version. This is mainly needed to fix autobuilder testing.
+	# version and the latest CIP version.
+	# This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION
+	       BR2_LINUX_KERNEL_LATEST_VERSION || \
+	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
