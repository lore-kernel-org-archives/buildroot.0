Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0583DD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1ADE614F7;
	Mon, 12 Jan 2026 08:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1_JSZYwLuHM; Mon, 12 Jan 2026 08:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA7C861164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206667;
	bh=cmAYIXIL3Hy+/jQigqdttnlP3raMeNiNr9zXsNzFQnc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQFJDpA/wnUxKGBr3g7h/aZBEqCBCSdZqv7CDnAou+zCfuxZYFjPLQelaV8z7amBx
	 GFOhBc6hZGHTRSFVFVZfInCpT4/dQZkYnJclxkIOxXpDshFV7YokGe56RsouMywi9t
	 nXul6V8HhKPxCly77NA/CuZyJ54y1Asgnm3aUoPZajrWWmbkFIYPJDu1ElF2U/0rlK
	 ysoQA6DrJm7hlNxTxaI8yt+sPWVnvvOfYcdK1XOYDsyHnxacGR+AQgTWIv8ulmnvSi
	 HymmdkX4vrlgBBjNPP1McLbxhTGv8JB3tmXhmz71ZOP+865IthWgJKg1lo7jwubWSi
	 ksUENPnHA7ZAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7C861164;
	Mon, 12 Jan 2026 08:31:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E1B18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D125240D2D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ky8Kp7NY2FgT for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:31:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF6F940CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF6F940CFB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF6F940CFB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3129A4C3AF5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-2KLr
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:04 +0100
Message-ID: <20260112082950.2528445-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206603;
 bh=wK5yyftVclXYRPo7tBrr+qARke59FE8nJL5ErdghfgE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Zvp7D8vNEq+j3Y4eyOZV9SU17Ks9VOWuL4FzGQ5lul87bqBY3UTc2z0INEYswuD19
 q3szWHF+44k3ZZsMBgG0QrtoHmZzaTwEi8KkFn4wva568MKc1oBi5oabIuV/oZosSz
 lmyT2lgTS0tx+Ft1vUzhoHBM/XBME0J5HO0nZ6k0n3Yih9Ssq4rxEvYWMTL5UwaMB+
 ZKo8G/vTQdsexg+yAjaqSE94s/v3qbyDzacr6IRo3nLeCIRNTyxEf8LZJiUFPzaY/j
 erAog3ZkGLBFow18GnD8vgU42CzEgxRwdl3RTfaG51wwYLBtY7oI2ZebdXtbhh34zI
 wT/i9m2XV/1ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Zvp7D8vN
Subject: [Buildroot] [PATCH 056/102] package/x11r7/xapp_xmag: bump version
 to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2024-October/003536.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xmag/xapp_xmag.hash | 6 +++---
 package/x11r7/xapp_xmag/xapp_xmag.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.hash b/package/x11r7/xapp_xmag/xapp_xmag.hash
index c0cfbcfa68..abd564dec8 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.hash
+++ b/package/x11r7/xapp_xmag/xapp_xmag.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003191.html
-sha256  009936cc5a2706084079127b26cf55c713767650a34cb69e5682d60e33ce7461  xmag-1.0.7.tar.xz
-sha512  d35ac5d977b9f3bd03fb919bf178f68bdbc6ef2a57915b407d836fce0582f5cb78d0b79043bb6f8d015464ca113deb09469c3b724aed03901a4c3fc4a9982984  xmag-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003536.html
+sha256  326d3c583d795bb53ac609d144e7f7fb1499baba7eaec14b8e6cd232ea069532  xmag-1.0.8.tar.xz
+sha512  d4dbf6bf60a5a3ac88309cdc8f07284a20bd3b044795cd54e002ee5956fa317a09e5f21a9469a6fd9a786f109d8592d8b8e5128ac86850391a6445ccc1f7a11c  xmag-1.0.8.tar.xz
 # Locally computed
 sha256  ef8744e617719339c4934579f8558ee4a5aec4396bebd6af02562b63a7c16d27  COPYING
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 0e8831d25b..5e7e2c7688 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.7
+XAPP_XMAG_VERSION = 1.0.8
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.xz
-XAPP_XMAG_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMAG_LICENSE = MIT
 XAPP_XMAG_LICENSE_FILES = COPYING
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
