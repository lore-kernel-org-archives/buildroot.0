Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB2D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C9D84486;
	Mon, 12 Jan 2026 08:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INutFsrLpVMp; Mon, 12 Jan 2026 08:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F08B8449B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206253;
	bh=U7y1lluKnJR1Aeo/Zxpbo5PdiAphfZ+8JmkpScp7CyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0nFan6YIA+aegWqixc1wI1Sj94Kn6TNNDr4VM5lFsV22O9TVCJrCsNrhn4PzURyD
	 f9DfaGFqXWYKBECAtf3uB310PsLs6W1WprVraYh6N1dTOWQuGmk6WD6m2M+eA2bDQF
	 uMyTECljmCwcEOPzWGaMXw4k4laRyxhRQzXi7C2A0CVUQxFlQCOOCK3dhX6EZV0XYh
	 whWrQpTiYDk1gSH2eGA5ZFQKL3ZAP2qv25IitEPOghjA0PzN/BeSy2bpv6fA1xA4oZ
	 l7bNPUau6wnZbAmXc0xYIeNs84OcBmIRqCGG3dCnptgdftOnyDQgDBdyECm3IBVSxT
	 IzMo0z/xjsBVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F08B8449B;
	Mon, 12 Jan 2026 08:24:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0573B18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC66E84436
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7ww_clRc2Ly for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EF0384548
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF0384548
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF0384548
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C6B6A4C4232
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-3bGG
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:23 +0100
Message-ID: <20260112080419.2516889-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205148;
 bh=kxbHs94Td5lrRZQSVH7/i1tvcejereCJMgGBJXxkLOA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=KWJSgn0nQR8lAg95mg7GN3q/vOv19PcQQ17SPviFTWcGenju4hCA8it2UggnASswR
 OnEL4YPYM/l14gemDqIbqI5nIglq410d53Qt6nHCJlyxXoyfU291m+IOrjLnzeLayq
 lbTaHq0OUvSaUuG7cMJhrZ2j3E1Y3ZVkmJ3v20fJ08MAnnKC5+iRjh69AdWUpTSlWE
 RhzVJlODKXrnn5gyy3fh8GL/MvYPsUm8SLgLe+ebeDmpLhQQCTiQxjHBnMHRCx/q0+
 4Tr0ztKMW+NjzwNWUbmSTUOWHwtqGBkUEEW6piiAXTPDjiL9BY3cbO1n8AxZe/9INh
 0I3I/u2E+i2RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KWJSgn0n
Subject: [Buildroot] [PATCH 048/104] package/x11r7/xapp_xrandr: bump version
 to 1.5.3
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

https://lists.x.org/archives/xorg-announce/2024-November/003551.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash | 6 +++---
 package/x11r7/xapp_xrandr/xapp_xrandr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index a407326bb8..62314c9fd2 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003270.html
-sha256  c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240  xrandr-1.5.2.tar.xz
-sha512  b536e8f1e04094894aa52ae496725c58691b043860b3327c41d737b07b642a939733321b62f698032b11ba857208a6177600a3ca3295ff1be6ade4341cdc2747  xrandr-1.5.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003551.html
+sha256  f8dd7566adb74147fab9964680b6bbadee87cf406a7fcff51718a5e6949b841c  xrandr-1.5.3.tar.xz
+sha512  2096afb9040ca18005aaf744401df40bdb8e8c8c06ffc97b927e63131800a4dc40cec063bdb5f38cd74b3d24b25fbed258c16cb6c73161efea44b3065b15c100  xrandr-1.5.3.tar.xz
 # Locally computed
 sha256  0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index d6b39b51d0..563383f844 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.5.2
+XAPP_XRANDR_VERSION = 1.5.3
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.xz
 XAPP_XRANDR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XRANDR_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
