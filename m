Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321C8C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 08:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0250B6084E;
	Sat, 27 Apr 2024 08:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmEj92S2eY4x; Sat, 27 Apr 2024 08:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18CB860835
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CB860835;
	Sat, 27 Apr 2024 08:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1981BF29C
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 852F041F1B
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB91eO14hV8G for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 08:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E03941EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E03941EFB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E03941EFB
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 08:40:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0289.dip0.t-ipconnect.de [91.58.2.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DBDEA4C0991;
 Sat, 27 Apr 2024 10:40:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48374)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s0dbX-000000007lf-28Kg;
 Sat, 27 Apr 2024 08:40:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 10:40:18 +0200
Message-Id: <20240427084019.13312-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1714207219;
 bh=rKzCEPPZkg3J9AWyKYROYVSWe/uZCGt2RK6b92J1mWA=;
 h=From:To:Cc:Subject:Date:From;
 b=Ho11nvCHC9ezxYjqlhG7NS5QobWnbtYSTUAEYqlpuoTJN2JKqSXZFI4uP8z7BWKB5
 exWRLtAhMuMYv9sf6MGo1hX8pmZBNFJRDhnJUI1tEG0t7uAmTGrDSzGeoIV4XDSRiB
 UacD5TvC+tg/vWDvAouDueLRJIwHPwqUOzThlYu8SrpuIlrTx2wDlc/gq79e0T2fRK
 G7EXyZuWxYDj91heLUizJsBdsaWZUTBOLnL5zsKpJ9PlCjFnRacEWTgK4EExPUqWwG
 3tPnXI6ClqoyUWspxFHc7fBZk8wQ7BgW2x8e7g8xIC/wMa8iYh6LetjVaH3cDsY07V
 trIHy4v+ehSCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=Ho11nvCH
Subject: [Buildroot] [PATCH 1/2] package/onevpl-intel-gpu: bump version to
 24.2.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
index e2b1eaf032..59b1c5a23c 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  34438637670b13140153c8a6be6b32d755ba72f68b2bbb01a8ec630c3e453900  onevpl-intel-gpu-24.2.0.tar.gz
+sha256  b261d87d91a56a6a462f6a129ddd97945a49637995ee6aa67ebd9b26c0a3c1a0  onevpl-intel-gpu-24.2.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index a9dcda8014..a68e628182 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_INTEL_GPU_VERSION = 24.2.0
+ONEVPL_INTEL_GPU_VERSION = 24.2.1
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
