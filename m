Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99883CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 15:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B467A8447D;
	Wed,  3 Jun 2026 15:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCotYS-6K_1l; Wed,  3 Jun 2026 15:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3231F84475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780502028;
	bh=0Xqp87UwkCaemh8R/mQsKBPxHlyh64Nhl+nnvwLOQCw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wd5Td+Bg8NkSdhhyT/BX7qdrwbXI7B2FCUMOn73tVj/VcIKtZ4cAT4eFCbxwifofT
	 RhxqlBifieG7W3JHhaHlhpcR8FqO+wShhTECu/o2gFgifSdORuEWXU1Yylx90ejqhH
	 fVIdmhIw8FZPdBXU2nXxRA1JAm76b6EROR4AXFFUzRUTtEYhU4NAYmeCSYtRF27GcO
	 BpJLAn+nI8Tdw6OFI0lRzc0/SfO+kaTbYlxLxlZOjbHBSF6kumrtfQjS4Gcxw/tB8c
	 GmfzXyYmbJ1Sl6oWd14Q9NzEejL0b1MLPI8UTEvYoJpvGF42lz4EG3r+NlvSnvrtvH
	 0FPvuTcEP5T2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3231F84475;
	Wed,  3 Jun 2026 15:53:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFB2372
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF09D42688
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yahk8raab5e for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 15:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CF7E42687
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF7E42687
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CF7E42687
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:53:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DEEAA4C3867
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:53:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56114)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUnuZ-000000003XC-3VRu
 for buildroot@buildroot.org; Wed, 03 Jun 2026 15:53:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 17:53:43 +0200
Message-ID: <20260603155343.3504802-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780502024;
 bh=e098NHN0tfRQ/Q0iLfpt8UYxOwA55+SD/GdZebJORZw=;
 h=From:To:Subject:Date:From;
 b=rUrfMiRuM7oOsNbLbmimWj8Di+wSr/tza/38DrZmVtk9PbQEhnARlXIH2Dx8S9vbD
 MLfBEBnjgVB+cWe/Ny579QjdaqjWVH1tocVxdKaz8Ub35BEtmMVdm6SW6O91lhoheD
 VFHpfxGLlBPGMa4Wr2+72dY5gFXwGgyWW/Cu51jHSKLtYIXJ0j+bWWESmbfw3S2ncK
 aKi+788C0tgYfSjtAJOTHKNGXIhogDf2tV922Xlhrwo4N9XfdMo2dNgWr1IDytR1WD
 nrQNB6ALBMIy9wcA7oQwCKAnIfyQynCNwUCrhgvNXjgBccJXFc6HLmaB7BB0ClWgSb
 FbjN0/yAId81Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rUrfMiRu
Subject: [Buildroot] [PATCH/next 1/1] package/transmission: bump version to
 4.1.2
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

https://github.com/transmission/transmission/releases/tag/4.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/69c6b4ede20aea3edf2deff3178bda09eefda9de

 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index d554f8034e..45a3863dca 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  e743283ee03a42c4d0b08fed2bd52b554aa6c9f65b4d4d45b795c32d98762a79  transmission-4.1.1.tar.xz
+sha256  4c6070bdfae264a629cb2b0f1eaf567cb9c6208f9218aa446c0aee883eb0f1fc  transmission-4.1.2.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index b7e204dfce..c811dcd6e5 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.1
+TRANSMISSION_VERSION = 4.1.2
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
