Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC5CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0E3F6178C;
	Sun, 31 May 2026 06:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjLaAKnCwsBo; Sun, 31 May 2026 06:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FF56179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208327;
	bh=WLP5BXEcHibc7/xZg4MWTZbbP93M+hSKab1lrzxXWnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uwbj8hiEMMUdNNhAKkBINW+mkOoOY1pIfihasYDs2zZVL0p07fiwviXjGXzxNgMdz
	 A8EgC1rGY7idQyAx3u7q0e5ttgaiV3SoMEJj7GpvmfHbpx3VGKExrtc8TPElJBAEBA
	 KHhC+Izs32lk7SQBD+DOnVPzKOVJFwp8/gwkKcyNiJLLXsuriSSX2G4oVF1HhsHZck
	 l3p9oZAJRsq18Po0ug1irgFHZwq1eGUJa9CNHhyyn7FK5LYIg0J13nKoGmUcU3BIx7
	 8efcS/yc5q09j5l5SpgyYAfNUuOSFSD4rz5Wg8+9HbAQUE5rfZPusvxzfpvKRBCASP
	 qCN2hNt2wUVzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8FF56179B;
	Sun, 31 May 2026 06:18:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A94D9257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B6866179B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHY7dQHqSY-3 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:18:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E73D46178C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E73D46178C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E73D46178C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:18:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F3674A4C115A;
 Sun, 31 May 2026 08:18:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46944)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTZVR-000000007Sk-03Ua;
 Sun, 31 May 2026 06:18:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Sun, 31 May 2026 08:18:40 +0200
Message-ID: <20260531061840.6748-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780208321;
 bh=W7KrZmgSWsbqcbCH0AbVeYgb3v+YWumHEkU7TXdUC9E=;
 h=From:To:Cc:Subject:Date:From;
 b=JTuCruEFrHzn8rGEx5AFtoiM/8v3IUftLV5FhzvYD2/Av5JrmTJdIlg0exWksdT7F
 i2eTn442xoZPs02oRMvdQ/8glEW/X/WURQNTdKmAPx00eer2aGWDM6a5MMsi1ey2eo
 11tzPIpzKltxyl2w5xSFIAdlupK/pWo2gO/Xw4O6SHlKozAqV7j8XzzjDf6GJ4aZfo
 srMrbBSw5aPEMZc6Mbf9wWjFsJxMX5GYvlKMJZCflN+MMxIKAaTGIWwpJdSItkhRKH
 SMCLfv/rgFaDgFIxUGTwMAEEfl4l8BF9wyK+j5rAuXDPuE6RZe1DnQuS0q85ihjFCC
 nHQuFDaPAK41Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JTuCruEF
Subject: [Buildroot] [PATCH v2 1/1] package/crucible: needs NPTL
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

gcc_stack_unix.c: In function 'x_cgo_getstackbound':
gcc_stack_unix.c:28:9: error: implicit declaration of function 'pthread_getattr_np';
 did you mean 'pthread_attr_init'? [-Wimplicit-function-declaration]
   28 |         pthread_getattr_np(pthread_self(), &attr);  // GNU extension

Fixes:
https://autobuild.buildroot.net/results/e07/e07198d7864331027d21cd2109054d86e7ac1c3d/

The build error also occured in Oct 2024 so a backport to buildroot
LTS branches should be considered:
https://autobuild.buildroot.net/results/ebb/ebbd051010c27f97fafc0b203b22c8b0af7e5ccd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b600aef918fe6b2f9c65b6fd267426f7ca70f76d

 package/crucible/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index 1e1b29c3df..e18e393a05 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
 
 	  https://github.com/usbarmory/crucible
+
+comment "crucible needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
