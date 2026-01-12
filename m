Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED345D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7B2A610F2;
	Mon, 12 Jan 2026 08:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8vxhDf2t0A1; Mon, 12 Jan 2026 08:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB1B7614E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206728;
	bh=E/yAx1ogfqRa7WtlXb9GBwnDLFvHeMESjpyVef8ePaw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ms0RUP0KvTtdAR950FrmCij2XU3qpO2n7HDTY0v9WnkOOVhmbqCO2ktV3WiBW++f4
	 hXfVCimL02SEy22h1QtKhAaLP6/Bkg8ulTTxNFwRmtywXG0D8iUTmGA0yQHkKTdXc1
	 pisNGL0nECSaI6R+dsefGqNWT+3YVhdkODClociJGDoNpsatPQy3UfCJ3O8g4zFwYK
	 D5z4XLTp5/r63Yp1vaEphH5jv8UxN6ST3z4a6OStUAT3FioTI3cYrGlF6PZm/U/NXU
	 i4NK2tQdjTuVvZN7DZfODqKyJECweTtaw5bqBQzv20r8sYjc7eOSMXHxj6Ip7uqlTf
	 FSSCeqBclN48Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB1B7614E7;
	Mon, 12 Jan 2026 08:32:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D28618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5414F4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1IuiyjkcV-M for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DDA840052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DDA840052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DDA840052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83734A4C3B3A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-3jQ8
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:09 +0100
Message-ID: <20260112082950.2528445-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206610;
 bh=XOA7e3BqUTbbwWHAdI7ZGAHFdk74dEc7j7aEPjkB+fE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=T6sLx4qaF2UenFpB5DoUU+f2LGu8Tmi3ikegsJ/rkYPb9iw7sbnAj4AXqqHeCA1ej
 blGnX8mwUJHLkrbUF8pHsvoCR7zbxVXOtMPQTLUqCqYUi0OvegF+MzliBtlj47oerJ
 rtwiJPoL0TyvjgEcHHZqQFU/bkvXFkwgWUVEPNItvB1ELlffUUuxn0UF64QdB9BDuu
 wppm0nWfHmvKrA0g09seM3ZMSKuVVPWY762qYEgXjR8U1huOzPNThZfXIqzSCuPTyK
 dP2L/AdFWUid3uN+eoIu/a/9sbKbp5tX8yIhH7gx62md9Os2rkXRp5EsE+qLCIc9hG
 DzsOGXg4jBEVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T6sLx4qa
Subject: [Buildroot] [PATCH 061/102] package/x11r7/xapp_x11perf: bump
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
