Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32438E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 16:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC997817FD;
	Sat, 20 Dec 2025 16:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agLsbsvXlF5p; Sat, 20 Dec 2025 16:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76DB981761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766249406;
	bh=ZU3nJgObQkgSXB22jw1VaKu88kQC7KPCPDEWL/mbazI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sjK3N+n09HwJo5keRjDwp7H5dAU5qE5TIJ/6AiPo3phJoaZTyP9EoV37LICs6qg0n
	 JbPznzszWM6NJCvPE5hkdIrp7CfhkTAHrdIOEITht2+vRVEE8Xr/k4ocbQUUlKT0/I
	 U16lJgRHsPKhwDGiuNzCEqwkH3YhjQva2fT5+mBiv5tdSZ6XXTr6YvkvtqWwPRyO0q
	 mxarrBRRsoRA0e4GJVgLut6Ia8EIYyFmAHb8FfnZCiGMPldVAFAyNvn17iwqGtYs1u
	 J/p+io9ApNsEtzwmgEGhv8q92SrJF739X0cUIOxhSrwqyStM73nDuKrqH0Bwotjiw+
	 uS9LcPQ8cGy2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DB981761;
	Sat, 20 Dec 2025 16:50:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE19119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34C4060DCA
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6YaEBTR5gDt for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 16:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD03260DC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD03260DC9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD03260DC9
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:50:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D909A4C3720
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:50:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40438)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX09Z-000000001TT-2PiV
 for buildroot@buildroot.org; Sat, 20 Dec 2025 16:50:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 17:50:00 +0100
Message-ID: <20251220165001.128775-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766249401;
 bh=CaKoOsRJsK6CmigLoyL8VLCLdzc+Y2XW4FEpHhtALaY=;
 h=From:To:Subject:Date:From;
 b=O6HloZvWkZxmp6+uy/WUBT24WsMcX4A8UZgqqIQrI24gUmic7ub3P28RnJoWx+91c
 ZO8oSs37Ajm3xTJpnPecDAmvPQJ1wf/Q3uNF7fjJMQhcATRsKJAe/smvTIvMuWjheY
 7qx+4em14oFwSKjXEFu0Adlt5d4LyJGHTB/ScHqpJ0DxdeakQOvxsO0GWIln8mhvdU
 E8l9E8awn1LYRCF3REYKYYshNQkY5hV8aoUT0VhntWNcHlrGZpzRWEhjSHeur0TiA/
 Pu3j7ypsFzrUdYsLEv4HU9OkvnlSc7yhS6N59BFjkbhRBfl5ajR/lg8sYKmNepjVHo
 7mBlwpzzZ8KFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=O6HloZvW
Subject: [Buildroot] [PATCH 1/2] package/libvpl: bump version to 2.16.0
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

https://github.com/intel/libvpl/releases/tag/v2.16.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 3c60fe960e..08b2de31fc 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7218c3b8206b123204c3827ce0cf7c008d5c693c1f58ab461958d05fe6f847b3  libvpl-2.15.0.tar.gz
+sha256  d60931937426130ddad9f1975c010543f0da99e67edb1c6070656b7947f633b6  libvpl-2.16.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 8dcb30f972..e9a6858c06 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.15.0
+LIBVPL_VERSION = 2.16.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
