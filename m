Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4697D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 942F5614CC;
	Mon, 12 Jan 2026 08:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l56xYfx_Qg50; Mon, 12 Jan 2026 08:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F68A614BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205225;
	bh=E/yAx1ogfqRa7WtlXb9GBwnDLFvHeMESjpyVef8ePaw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASXrqJ3U+u/R0acy9p/G0AoxCkKZfopeCSlsuGbRBftE+8dJ6mRqGT8YiUM/k3q2G
	 hMHFS/a7RvXcJqP8TuUTeLRRv+8E835JqsQ+lB80S+pkKlaFYUotUdDCYhM7xatLnC
	 tyE5tdVDyX8gE5pFlEaEfaTm1mDKTbKF3qX5mAkI0+nWZK/seSKV8IbD298bf5LNOX
	 YG1xJ8NENdb25OBMTpXe05YCxXC7Nf3kaDo0GBYmbTgXB0UpK1UM8heEpgOTq3eDjU
	 F260c8sg3CSE9W+/cVTm4d3Qhx8cSXjENhHa5ZSVgg17Vk3XQpCn14XvPK69bkj1qV
	 xMPS/6GILsTDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F68A614BB;
	Mon, 12 Jan 2026 08:07:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBF7412E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C33D341484
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbrvPXjLia3g for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA97241482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA97241482
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA97241482
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78F33A4C421A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-3Zte
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:37 +0100
Message-ID: <20260112080419.2516889-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205093;
 bh=XOA7e3BqUTbbwWHAdI7ZGAHFdk74dEc7j7aEPjkB+fE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=czEzvkzQhw93U6JoKkT27a8EU8rKD7q1lSCYlohh9O14EeqBNjA2+Q2ycDBJE3WtK
 WhngVHy2r+JrApVQ01MyZ49IK7dX7EJECW28fS0hwbSt1HC259DWe3onVAhMyRVMGl
 TSlEA4LtKbdbaE/1yUOn3q5UmIMgMCbHLsPb/4EefIBOSZqaGT1IcKyzRmPUIkPNoD
 UMXviN7MJc/1wa9xzChdahaBbNxdJfLLpJ89+YFbnF1gRsqMnei8d/l/oi5ndzsIpP
 4xh11fjYo01TNNdcMcE5yM0stBNW6zOwJE0fO3VRK5ts/aJJI/D1/0IxI7LhNWezI6
 EBqcTDz717qLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=czEzvkzQ
Subject: [Buildroot] [PATCH 062/104] package/x11r7/xapp_x11perf: bump
 version to 1.7.0
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

https://lists.x.org/archives/xorg-announce/2024-August/003526.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.hash | 6 +++---
 package/x11r7/xapp_x11perf/xapp_x11perf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
index 3370d7df53..a6c3111d81 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.hash
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003242.html
-sha256  5a0e7cea47716ad07ceca38bbd07ae06459ee4d837b9c9dfc21ccb94e3e24fcc  x11perf-1.6.2.tar.xz
-sha512  5be9e601071a42d103adbab5f30c1900a3779a5b2c06c709df99a85487c9790d36b835d43f5c6d74cc7d950cc3ad06927210d7b1f58939cfd0b4a6f3e5e32112  x11perf-1.6.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003526.html
+sha256  24f80d84b0e96171a998932ff007698fd1776da9975ed42e51d57b9cfca91828  x11perf-1.7.0.tar.xz
+sha512  de8185bfbac15fb5eb15c18ba8450d8e383e1356675e0368c9a443d4c2d14245fab87ac0aa4ddcc5ebf731af0ad1173f53c6937104c1be824bfda5b58112fd5e  x11perf-1.7.0.tar.xz
 # Locally computed
 sha256  f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 3a1d579939..82b3d9b790 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.6.2
+XAPP_X11PERF_VERSION = 1.7.0
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.xz
 XAPP_X11PERF_SITE = https://xorg.freedesktop.org/archive/individual/test
 XAPP_X11PERF_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
