Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF83C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 16:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8510783BD3;
	Sun, 12 May 2024 16:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89lT7CT_HtgC; Sun, 12 May 2024 16:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A410283BCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A410283BCB;
	Sun, 12 May 2024 16:32:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD8A1BF3C6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4836341DA5
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3zNZds-LpdY for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 16:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A362341D92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A362341D92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A362341D92
 for <buildroot@buildroot.org>; Sun, 12 May 2024 16:32:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 99C7CA4C100F
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:31:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45556)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6C7C-000000007Ix-3RIB
 for buildroot@buildroot.org; Sun, 12 May 2024 16:31:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 18:31:59 +0200
Message-Id: <20240512163159.999251-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715531519;
 bh=VpRgGX0WvyuAlzGgYB+lNYAQDuh+2WsK9ui/7/D/ECA=;
 h=From:To:Subject:Date:From;
 b=UR92jbDR9fNPngbNuMSZ2te83PeG+O4nsKJdYQVkyRZSg8b4cfCTulncVgbqybaA9
 HTXCzPX60apuozpTgvLRLzoN4+1IYlJhp+DESFXWiZVBzNXmy+jkS3dUqLgME3oKBE
 mDCP1J3LRq9CZAGY/RwEw4K6txdZ8Bb/CBkp7wIkf3Xi7KJLwTv+NfuyscKcEd8h4x
 yKQSaZzJi7WQ17ClqK0O+TwLswUfyPyoFnEgrVB1rg5g47XmgxGaHBE9omZ3zNPc/p
 nrNQ2k4Q5Q0/FnrQQxA2acoZVoHxAo8ZsBK8/IHhPCRGlr390H+xSP0eu1YcSbkKtW
 +wWo/TOCgObHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=UR92jbDR
Subject: [Buildroot] [PATCH 1/1] package/kodi: remove libatomic from linker
 flags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Kodi added detection for atomic/libatomic with commit
https://github.com/xbmc/xbmc/commit/1673f476b802da1da942cef256cae6272fdf9a4b
so we can remove our own code to handle the dependency.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/kodi.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 62463b731e..94cab237dc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -217,11 +217,6 @@ else
 KODI_CONF_OPTS += -D_AVX2_OK=OFF -D_AVX2_TRUE=OFF
 endif
 
-# mips: uses __atomic_load_8
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
 KODI_C_FLAGS += -std=gnu99
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
