Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77377C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 14:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C5AF405CB;
	Sat, 20 Apr 2024 14:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNJ-uyKYtGKL; Sat, 20 Apr 2024 14:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36602401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36602401D5;
	Sat, 20 Apr 2024 14:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACD5F1BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 14:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A20960603
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 14:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 016K-LTpfYce for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 14:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02107605FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02107605FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02107605FB
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 14:36:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2FF3FB00573;
 Sat, 20 Apr 2024 16:36:29 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 16:36:18 +0200
Message-ID: <20240420143618.1809745-2-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420143618.1809745-1-ju.o@free.fr>
References: <20240420143618.1809745-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713623792;
 bh=aqiNTkSHaqkyDng2BCSwXC8NUGWBfoN27MD5WpBe6Yk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iKwKKGUzYEHfMx/BvYqdF1dhWUDpUaBvuSBipw0aegaRrvtUCzWTXFf0xb0M5iEKv
 ts6HQgy93wewWNYpW/+F96Qm2iPSwCKD4ux+f94ZlaV6clQ4u6SLby5uOHIPibDTY9
 oJXXxJ1lRld7d3XHqi/VGcUVmobcnYzdpj0Ld3l2cT1c8yPoGxW7PxouqO4/bmIqkM
 beamcQzXLXEevlFhCrOsMch/O4EfnzUjYOzOwWgf6QD6p8K3WPVfokEXzu7pOFLf+U
 BsP0CmYsakMM/laAF5bXaFIJ2HWhKM/bd7LSFoG5WGqofQpvewnAuoTGmaInn0Xgm/
 iMnUlOKsVQYaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iKwKKGUz
Subject: [Buildroot] [PATCH 2/2] package/fwts: bump to version 24.03.00
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since version 23.07.00, see:
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/24.03.00
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/24.01.00
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/23.11.00

License file hash changed, due to year update in:
https://github.com/fwts/fwts/commit/cb2014e17f3fab0b2a2921e59e6b7acaa089cffe

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 8525d47ecb6..0c0dd58c15c 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  a15e11c42856e9dfcf7ac23ed370618d2777eb996dd7843accf12d45b21b551c  fwts-V23.07.00.tar.gz
+sha256  d7f2642b1ec3697be798409decd6593d52bb1438f0d2dc697cbc85f52d19b41e  fwts-V24.03.00.tar.gz
 
 # Hash for license file
-sha256  b9e44b1f9f65178e037a59a31b051b51dbd6a531d27c8775d3438a6ce53fc874  debian/copyright
+sha256  3cd2c5d12f024ff2aa203e37d7e972c4d5ab7bf1a65e3e09aebccf71e64b525b  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index a3f91ee4959..0692121421d 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 23.07.00
+FWTS_VERSION = 24.03.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
