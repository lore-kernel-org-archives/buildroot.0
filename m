Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D84D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC03D6160D;
	Mon, 12 Jan 2026 08:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aowkww1L6eND; Mon, 12 Jan 2026 08:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FB7615CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207523;
	bh=y+TrB50qb44lD9fNVv9puWgPSt6Dg8/yT0S8lonAM0w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KwJNJ7rsx+YJCA4kcQgWfm0CoiGI6TR2ijYp1anPGpgKNLZXuOkQBrij6c6hht9nK
	 iAiTnfv0rA2uhqWRP84zkI28/kcDBIzxv+Fueq3m7yuGEvedKGiewH5KLLh5Lh/Ezk
	 pXSkkIgojCHbWpcvUs0HTkzFZD7sfWQii1LXOvdE43KsZI6UxyZM/xBmAvOrV05UXv
	 /7wnfRsotXOtg9q30E4jWyPQKqSGSSuREVwKmyGm2dVwDm/r+iPl2d/+iqH53+vpTh
	 PYXLWYn2ZQodrb+Z7J0+wnE2i9Y40YlgqzvCNqbKAUOJDkC/LmJgrsokoiwa2c8REZ
	 kW2AlGy7c+4xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8FB7615CC;
	Mon, 12 Jan 2026 08:45:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF0B18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92425416AA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPZYF__kfZ_z for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DFC24004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DFC24004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DFC24004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0C03A4C41A0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-1oyr
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:33 +0100
Message-ID: <20260112082950.2528445-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206662;
 bh=YjY5OVlJbDDybcAdADTTfJMkcqxvPWOHcXYrFla755o=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TFVQVJ3ofF4MVAJYRslqrKLe3wLn4arEkhb53wcmuAPSXh0I2qEFVGYZbIUP7T8Hm
 psYa+n2pDetyhpQ5Jwj4g22hMuKTMrXdqXlSwsdHDFsGky99RElVbqCm75Zisxnvne
 q3BLwq+wDLshXfs9o9CrPcZN9NNQiaxGyKN/7Lt3lXLbN37jUB36z0V1Ojl0y88qeE
 ERy9bzqvcErgvof9emtZoEWpOpoMeLeYSr7tOO2jxG1idlEvJ6otBeTN+f2vbChluv
 Ej328YHvVtYeEZS329iD19Y4ey7EcDtGSn9XKO0IP163G2UX+iTR4BxxPVQrqzB9Bs
 BHtnmtk2IUmwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TFVQVJ3o
Subject: [Buildroot] [PATCH 025/102] package/x11r7/xapp_showfont: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2025-May/003602.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_showfont/xapp_showfont.hash | 6 +++---
 package/x11r7/xapp_showfont/xapp_showfont.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.hash b/package/x11r7/xapp_showfont/xapp_showfont.hash
index 7bec4e8728..9b6e0b4276 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.hash
+++ b/package/x11r7/xapp_showfont/xapp_showfont.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003207.html
-sha256  2b9b9f06e65e095ed76ce560b701b9fc47fa63310ee706b54c8787af061d0e56  showfont-1.0.6.tar.xz
-sha512  21a318519492f4ba46a8bcb3590097fc5f96fe01fdb557257ae56bae813671952a2aad6c0df8cd69659e06708571c398e6d97969224cf692e22c8a35c8e6c363  showfont-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003602.html
+sha256  8f725d641c12ef07746d16c892240823eccd045444a1ea182eddf229cc178fe7  showfont-1.0.7.tar.xz
+sha512  6c27b280976d22f35071136e139a654c7be41f5cca3b450a3aa36f8a026b151e700d4e386b0fde8deccef50f8d43338f5d105977a7d11861fccab6c05e480d70  showfont-1.0.7.tar.xz
 # Locally computed
 sha256  c32217021e0507207e2ee6da3fcee3d9e32816003a7153b3357c08cdc97934a8  COPYING
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index a805f35231..9240345310 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.6
+XAPP_SHOWFONT_VERSION = 1.0.7
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.xz
 XAPP_SHOWFONT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
