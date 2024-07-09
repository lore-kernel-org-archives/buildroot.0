Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01703C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 22:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39BF4137B;
	Tue,  9 Jul 2024 22:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xz4ctt5cAO9i; Tue,  9 Jul 2024 22:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C7541383
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C7541383;
	Tue,  9 Jul 2024 22:03:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B77641BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0BF94042E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 22:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOYgq-fJ7Nik for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 22:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D3EA405E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3EA405E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D3EA405E9
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 22:03:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2214BA4C0BF7
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 00:03:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58780)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sRIvT-000000004j6-2647
 for buildroot@buildroot.org; Tue, 09 Jul 2024 22:03:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 00:03:05 +0200
Message-Id: <20240709220307.3598238-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720562588;
 bh=E0znUjhuNi782P//dbfRnZ0TJgflcz6CG03oSj2hJZo=;
 h=From:To:Subject:Date:From;
 b=kKkZ0goqtCEE50rx7t5MTiJpc90qBR73VQZAd5Hznb9/qxJ0/vq0+ay07AYYxG4JZ
 bLnuRrNpifFExNNGn13uETThvVcZLjNUtDa6wpbWbbHdRRGb5EO8qcJmsz5pAz8Cr4
 mEnHOlQFnLDXZau2BAbJXdgaiRXd9cH0EIsk5QICUlriTzJ+KiNrBZbxd1XnrRoSX/
 uw0ByXs7LMLYqUH2HucoFZ3T842SO9jUaa8jTOA1A0EUKmI20qq0MMYpj/a+YlgjFz
 sSAEdqa3KtO9IFDb3QnsPi9kY2CVQygPSCkWoH5WdlkS5uZhYi42eqg15KbpSa436A
 ITnNxIemAGqzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=kKkZ0goq
Subject: [Buildroot] [PATCH 1/3] package/kodi-pvr-waipu: bump version to
 21.8.4-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 1198d65768..0ceb344657 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6d47012f43f9a24edb09bc249de9b14cd0adca58fe0633687cd2fc54fe1bf23e  kodi-pvr-waipu-21.8.3-Omega.tar.gz
+sha256  cd394177247bb7ad24160246e0c368e946d0205ce3284a55f0dacd2d31d51bff  kodi-pvr-waipu-21.8.4-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 2c2270f3e8..2a03bcb2c9 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.8.3-Omega
+KODI_PVR_WAIPU_VERSION = 21.8.4-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
