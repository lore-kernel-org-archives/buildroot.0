Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8A3D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E5984491;
	Mon, 12 Jan 2026 08:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pP0SH64EO3IF; Mon, 12 Jan 2026 08:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C5AC843AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206598;
	bh=4O9GAltqZ5y3v+tZgYimI0o/luYaOQjp93YV/Q2Yyk0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bUv1SorCSLNgvkau3WqT971yF/T3AQ3KfUKYUPbpnVXaDfk9kPWQgJvfBxuaVsfdF
	 wzw0SQLVFADE9QuZGLQ6/jxxWUQctA7SFhg9c6Z2QvGucr/uwTQLX/ZAroQaNmk37u
	 53E/ervTCTAsarONAaVzQ56C3cTR3LunFdnfJMbHwLp+9OCEEaSVGJhiMTqthjWVz4
	 HuMWfUPhu/kYn2fovMBhJ4iFxVoMjMEcvlJtdPQhrnpg7OhuVdxJnPGPMvSIeHHVJu
	 a3WvYdK549muOcGM4UhusvEZifvIa3m0jb6vy0CckLaPi1hbhYu2qh6kgsUEeoXNnm
	 wOzp9UbdjoWjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C5AC843AE;
	Mon, 12 Jan 2026 08:29:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2E61CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D312A614CA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpNXrwXtjHO2 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00E7B614C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00E7B614C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00E7B614C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:29:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30EAFA4C31C5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:29:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ8-000000007z0-3cKL
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:10 +0100
Message-ID: <20260112082950.2528445-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206591;
 bh=MgS7zvzQHMrlAlZQVWNG/Ji5iJduOiBEd+OP3bAXa8M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PE6dB3M7oRuVVHYdgqFrrgU1NO06p8in6HNWR9dP4r0hOjv7GIUZcp8HTiwf10J0c
 TNQmffETXIYmG9pXDffafzVztN3x5WYNtE9CWtK3Iew4MYpm0jd632a06qIWRuw6+2
 X7xYk8kf/aq4Qa9T8Qo9FYunAmmzsX6lctU26wlrHY0/5stlyWZWyoIvWB2aw9J8Ki
 iYXv9PzoHhA6r/W7nCjLM1Ue79Cu8b/phjOJlwOG7jQsnr5grXhDnmJQapI+Sd/+2G
 0XRjFurD/8MSNPDpMwltGMhVAcveimh4/Qe7Btbv4W1wQaP7mPzkjSd6B3NTW6+aXL
 2BQVxgZbmKTOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PE6dB3M7
Subject: [Buildroot] [PATCH 002/102] package/x11r7/libxcb: bump version to
 1.17.0
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

https://lists.x.org/archives/xorg-announce/2023-August/003415.html
https://lists.x.org/archives/xorg-announce/2024-March/003464.html
https://lists.x.org/archives/xorg-announce/2024-April/003507.html

Depends on xcb-proto >= 1.17.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/libxcb/libxcb.hash | 6 +++---
 package/x11r7/libxcb/libxcb.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 2e2179e8da..b93b0ba524 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-May/003164.html
-sha256  cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059  libxcb-1.15.tar.xz
-sha512  f6c7d766b7cf9cab6abe948ee424cbae6951dbfe2f76fa58a109cdc05b0f0919dcc4e38176a22ff4b95fc1e38596115317e32ba33b24cae0035a4e30dbcbdad9  libxcb-1.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003507.html
+sha256  599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55  libxcb-1.17.0.tar.xz
+sha512  945b1f28e8b407a4d0ebf88c99ef3cbef763fd75e6eaa8e971946e44ce8dbe9b478c56ae85aaaadab7fdb25987e88570d9d4fb9ad2febd6d6bf21d644a0e10d0  libxcb-1.17.0.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 4b293f9801..393c89c49b 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.15
+LIBXCB_VERSION = 1.17.0
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
