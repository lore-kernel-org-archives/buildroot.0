Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E575ECEFC39
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 17:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A736F60592;
	Tue,  8 Oct 2024 17:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pupB-JesB-sq; Tue,  8 Oct 2024 17:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED1D6076C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED1D6076C;
	Tue,  8 Oct 2024 17:52:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74E8C1BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7062E40528
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyNpLXgeUGeU for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 17:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44E2B403F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E2B403F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44E2B403F8
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 17:52:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a86.dip0.t-ipconnect.de [91.58.10.134])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63C36A4C042A
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:52:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44698)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1syENg-000000005jA-3Dwj
 for buildroot@buildroot.org; Tue, 08 Oct 2024 17:52:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 19:52:21 +0200
Message-Id: <20241008175221.3627033-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728409941;
 bh=IOrfnhxCh6MEroCjb04IKBLaP7OaxE1O1NowN4Re4RU=;
 h=From:To:Subject:Date:From;
 b=n/15qZbKJTqrJ5wD0BaXyECkwJ5c/723gfJ0M9GOc3uxgCEVHsytCiVdqbisn+QxN
 4EtItvl60B5k+ejG+pfSfFum9ty+VRdanueTgPbswhZBv/H9N2+E8x6tJrPM7R1UbS
 qzaUz9NPiz0Kbrzf7XlfxRdt9YcbPxUk6Dq9EZHZACfUdnr+dPhnOuKncJZyNZ8FI8
 Mh4WfqxISWoyVEPYJVnRLgcEN7FM8YFLGYy73sRV/f2dXf5RtE9HRYlBbsuhe25jzb
 v1lp79f/wWLT2zx6inSG/4483WTJKi78dIfQyaTsf3idVlEQJRIpEGFFwJoGTyVC5V
 3cBeHRNerVtMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=n/15qZbK
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-iptvsimple: bump
 version to 21.9.2-Omega
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
v2: squashed with
    https://patchwork.ozlabs.org/project/buildroot/patch/20240917182256.3009821-1-bernd@kuhls.net/

 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 14fad490b9..9e6e6a05f1 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  191a56c10fc3639a6d3d5dffeaac38425c70b5196afa23b623cb205d5c3be4a6  kodi-pvr-iptvsimple-21.8.6-Omega.tar.gz
+sha256  e7c880c8298702a767e91c6735abc34baf0d3deea2f2ad96ccab1ea839b6ee18  kodi-pvr-iptvsimple-21.9.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 50a221857d..5c9615da3c 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.8.6-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.9.2-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
