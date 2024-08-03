Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC18FC52D6F
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2909404C5;
	Sat,  3 Aug 2024 10:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtma_gdn14ws; Sat,  3 Aug 2024 10:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59315404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59315404D8;
	Sat,  3 Aug 2024 10:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5425C1BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F42C81ED4
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fizGJ-VR3zSe for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7256181ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7256181ECF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7256181ECF
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:47:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4440A4C0313
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:46:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48726)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCHo-000000003Oc-2V7o
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:46:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:46:46 +0200
Message-Id: <20240803104656.2574228-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240803104656.2574228-1-bernd@kuhls.net>
References: <20240803104656.2574228-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682016;
 bh=zX1wmugxSzAVmoCKedB8JeXexI/WeG2AnyCftoVmyV4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WjfzEhsLNSt5L5BFUH9mQzrmn+swr8ye6M0blzviqIEnoHVidhFKH+5zSlkOJgAon
 /O7BPEstTy8WN8l9oKoYj2E3g6MZydM9vlpcXDdlWnA2E/a/cukL4b2nxowgVHtOcf
 P5ph3QO1Orf29yNm9AYgBSvpd+OKmcl8RZU5/NhaDY4aWutog8hs8vEyvKALqFEl4b
 CINoZMFtFfXypKsJRcrdDDhWVBqt35Y86hTr48RzIYGJwp6h7nTeFE5trNaT3xDpa0
 9nPzSS3CXvA4uwvXljHrTuX7EkmleBpdE9sMibFzz9ikfsxIBsZ62CIlukQXXRjLq9
 bWVMW9NrrZ7rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=WjfzEhsL
Subject: [Buildroot] [PATCH 05/15] package/kodi-pvr-hts: bump version to
 21.2.5-Omega
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
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 3c9f7d87b3..15b790c80c 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c8dd796735d5af7dddfc6fe56c8b2d8268fd43be50098f60b8fa537ff02956d  kodi-pvr-hts-21.2.4-Omega.tar.gz
+sha256  c54c249a4c91091e47245b406210224aa4e3c5468497eb9cdeb09cd336cab4b2  kodi-pvr-hts-21.2.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 7f73c0565e..68c4d04bd0 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.4-Omega
+KODI_PVR_HTS_VERSION = 21.2.5-Omega
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
