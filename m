Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8FCD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207EE6160A;
	Mon, 12 Jan 2026 08:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32qm6QNpv7Ob; Mon, 12 Jan 2026 08:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 621976154B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207426;
	bh=oMx3OKo9HWq0l5pRtJNKLFRGyXXEubql3PNJKdbOHuU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSZZQFe9TO6fbvcG84oR/zPyDfK3d2pIP3gJHak32mOuv10JYK8qRrDM52+QZlv7G
	 Zeogrvq20QYm/11THP2PzRGU5LqfoY5NwRRvXDLEkBuhHQFaAbXSx9o55TozF5df+/
	 ymBMxRkEUt/92aPE/4IkqSsOeAEDP6hyGMdv7L3EChY2hDWY923magYBP7qnOxeMW6
	 +c9vnjy+OyR8gXTQnkILpgfWiwHUWYrvHL3UqCGaUEu0p26/abMANK+8h3Lbpd2KJ9
	 1W2Pkn7Lhsvx7nQPpBPveJ8y5SzUX2/4D0DZHYXLFlYxh+XXowwLsgeaafGl/qEZJO
	 fRcApIT0SBN0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 621976154B;
	Mon, 12 Jan 2026 08:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 320C21CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1773B61535
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_7Bi4Zamc4M for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DF516152A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DF516152A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DF516152A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D95F4A4C4101
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-0REY
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:28 +0100
Message-ID: <20260112082950.2528445-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206656;
 bh=2I4LvyY8PNCIeRpSrZMWSnXyFgI27tmlPJ77g7cnLRE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=R5CfhoOGFbwi9Gk3LKY8OSGBnGC0bCyaZSt3373eb8G+qb6m5jn6097WIT7t4AHt/
 JIx95k9E4tPA5bc+zoGYU/Ziq6mX/M0rW+JV6Ed/4QAjYKwsicjhE7MK8gIE5NHnLX
 henKVLCQpuwP5nIntj236wY2AM3oXpzUCylZQ6C3BKb+33yqYeG/rVYBPcwcMww5Sd
 wSJeaX6XeY3XAru0/QG6ysat8Kv7jjV8OYBJLWEMIHbRaegS1o0FqAEuuDTh4bN+LB
 BV4F2LtK1qC/w4QtQ90954MbF73dazbOptfDodKoh0DFLoEcI80HhgccFstuZLD4Lt
 PpfRP7BX7a7qA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=R5CfhoOG
Subject: [Buildroot] [PATCH 020/102] package/x11r7/xapp_xdriinfo: bump
 version to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2025-July/003617.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash | 6 +++---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
index ce11d06977..540ef0e228 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003308.html
-sha256  dd838bae9d2b19ddd71fe6d30ed33abc7c85e19d223e79d35600db3fa44bf734  xdriinfo-1.0.7.tar.xz
-sha512  a368cf32c606ca78f3a23bc5d88fb57b9c1a3827d0fec3e48cee153703135e47cecd3db8ee0eba93f309d7f03b4306c3f2e7f46f36d0d2970671c5e5b78093ad  xdriinfo-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003617.html
+sha256  00463056435b82261c227ad0de1873fd4536101607fbc57540e28e4a0a9b71f7  xdriinfo-1.0.8.tar.xz
+sha512  36ea6a453b7f3ec7caa028282c701c98dfb45886dc833e31931d3ed6333a96a5bf7d3816bf5db51b3c359297f25e242c913eae4dd01be5de557475b4cd98d458  xdriinfo-1.0.8.tar.xz
 # Locally computed
 sha256  de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 7672dc8899..ab383431b9 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.7
+XAPP_XDRIINFO_VERSION = 1.0.8
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.xz
 XAPP_XDRIINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
