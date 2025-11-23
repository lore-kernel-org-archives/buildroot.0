Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D26CFC518
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B8B81087;
	Sun, 23 Nov 2025 17:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbsbKdj2lJTf; Sun, 23 Nov 2025 17:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DEB380F84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEB380F84;
	Sun, 23 Nov 2025 17:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D02FE4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83B966073D
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wq0Af0UWwIzQ for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DC0F606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DC0F606ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DC0F606ED
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:07:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcad.dip0.t-ipconnect.de [84.161.188.173])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 068A8A4C3932;
 Sun, 23 Nov 2025 18:07:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNDYX-000000001Wc-2BkT;
 Sun, 23 Nov 2025 17:07:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Nov 2025 18:07:21 +0100
Message-ID: <20251123170721.909469-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251123170721.909469-1-bernd@kuhls.net>
References: <20251123170721.909469-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763917642;
 bh=jh3J8ko2Oei8ymrb44/EURic4gP5euBFEjGFKQhqiwo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J9Ge1QMflBLquFjSuT2lps+XMt82VIRG3URePln4Jya3siBNJg9NT9Ylt2S4v5Vfz
 gVLkbxm1ARNr0L4OV4iAo7mF0TfMlH9RuhOoFR9plxeGVEiysbBrXvCPyHe6vkejiv
 UJak47y1MKpec2XAJ/+SXJ52x63MKj+14qtTHSVCUGovrc/PVignr6T3FaUWxk4Jfk
 GPCx4r5EMAiUeRcvI2TafTpF2SViYtPLV2PN+RpAluvxZUrIPylEuh1VMTlGMBtCSo
 rSqX0oVl9XVG2430QbElp+2ifDcov3CmXvAyZluGp4Ehr5l5IbeCukYV2zoY4jJyui
 ZquRjKctnNNvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=J9Ge1QMf
Subject: [Buildroot] [PATCH/next 3/3] package/ninja: bump version to 1.13.2
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

Release notes: https://github.com/ninja-build/ninja/releases

Version 1.13.0 added GNU Make jobserver support[1] so we switch back to
the official repo by partly reverting buildroot commit
227d7e0cbaaf093f509f5728f06fad5f53caed7b.

Comparing build times of mesa3d/iris between 1.13.2 and Kitware's latest
tag v1.13.0.gd74ef.kitware.jobserver-pipe-1 showed no difference on a
16c/32t machine with BR2_JLEVEL=0. The Kitware version adds pipe support
whose future is uncertain[2].

[1] https://github.com/ninja-build/ninja/releases/tag/v1.13.0
    https://github.com/ninja-build/ninja/pull/2506
[2] https://github.com/ninja-build/ninja/pull/2506#issuecomment-2659944455

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index 57c10bb287..5e099de591 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7ba84551f5b315b4270dc7c51adef5dff83a2154a3665a6c9744245c122dd0db  ninja-1.11.1.g95dee.kitware.jobserver-1.tar.gz
+sha256  974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17  ninja-1.13.2.tar.gz
 sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 805fef4541..c59984b6bd 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-NINJA_VERSION_MAJOR = 1.11.1
-NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
-NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
+NINJA_VERSION = 1.13.2
+NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
