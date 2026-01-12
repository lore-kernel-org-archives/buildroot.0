Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87862D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEDA6142B;
	Mon, 12 Jan 2026 08:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzzWikpFzQBl; Mon, 12 Jan 2026 08:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DB346151A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207584;
	bh=G4gmoTih6tIgIQOR9WUebBoUFkyHzoUKgwB+dFipSxs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pc9Mz2xZLqeXU6pTsGrl+Li4rQfjiK4OSTyYntdgWy2w/P8vVD5GrNIJFscuC/xBh
	 qtqnN86JFAy+xSBd06V/ebbMUrfjzhR4OTkpsP4re+MJRSPcO7rRao+eiVv/pUKi0V
	 BhoRwmiQAWoav7RyolGjRRo1riiWAmvUm2wSvUCzAhG2YrHOwuKjNKrmvHvnata1d4
	 2fb413pC6WXMMgx2taM1sDEDU5xqROjsO5rSb3Rr7pWfI/NAN9wqCyd96Uphhn7cxM
	 L54cAoppNDoQt6HfRqDL9wAyw9cJgeKPxxAN3BzdOe5q+zjXcYAJl/l5zc44Lue3Jy
	 BEibt/p42vnvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB346151A;
	Mon, 12 Jan 2026 08:46:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 069D918D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED93041573
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1_DaF2LyfzT for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB91E412F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB91E412F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB91E412F7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC266A4C4213
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-3kGc
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:40 +0100
Message-ID: <20260112082950.2528445-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206664;
 bh=nyIq3wirc0qCvmcsbLNgb6oD7ulaZfWpmamgtiT4JS0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=B0T32Zdnpe03jkwjXeY6ZkfS+m0MGYBtNi/8UJJrLW47AQ4BacBmYRnN81hQ3qlS8
 zP1Ehw83aPDR8BXMkxDIZGXjLjza8jA65rRY7YHtpfiSjH00OibSTh5AWpuGu0MKE7
 sdwH0OJWEqMHdHSiWnltksSDNXlSPLEvtoWmO0hEEaWeAISkeBZbmG56Y5UCcV5GlS
 CBZ5hdXeVM2fWhrTt74YvNF2ZchyExF0NgR8RIFciPCQ0BqWsakYBPYYGxq1cgv3wP
 sg9WIniCWPleWm4Qdfia6tV5gL6oBhggPJgSS+aj3J3FgramD8WJHV4u82DUEBaK5w
 l0xjXmqkjBJOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=B0T32Zdn
Subject: [Buildroot] [PATCH 032/102] package/x11r7/xapp_xhost: bump version
 to 1.0.10
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

https://lists.x.org/archives/xorg-announce/2025-February/003581.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xhost/xapp_xhost.hash | 6 +++---
 package/x11r7/xapp_xhost/xapp_xhost.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
index fea2588c6d..a807e5957d 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.hash
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003301.html
-sha256  ea86b531462035b19a2e5e01ef3d9a35cca7d984086645e2fc844d8f0e346645  xhost-1.0.9.tar.xz
-sha512  d281a0df0a036d693ce7dbe0d1d53839110d203f42454bf4d33a49fbfddec078149969b6ad76641e40e207ddc8317ea563088c59025fc57d8245e5ed27f79818  xhost-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-February/003581.html
+sha256  a8afd70059479c712948b895e41c35a4a8bfcede3ba2d5a4b855c88bbb725be1  xhost-1.0.10.tar.xz
+sha512  65467b0a096455dae681f8397f5b8b0490a2f80db5cb9f92757cfff8d7822b43833202a275eed8467c6a6aaf3b02e0a7b1a069c5d587d32e56b1893297903051  xhost-1.0.10.tar.xz
 # Locally computed
 sha256  d3106697fb05dea4e9899b9e782ae7c3c17086d5b3dc7966494fc83fda9e468e  COPYING
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 55f7ca5cc7..80336f2955 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.9
+XAPP_XHOST_VERSION = 1.0.10
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.xz
 XAPP_XHOST_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XHOST_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
