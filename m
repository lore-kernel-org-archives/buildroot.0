Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC90CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 08:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E17784EA7;
	Sun,  2 Nov 2025 08:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4pDTrTXsIkd; Sun,  2 Nov 2025 08:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46DF584EB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46DF584EB0;
	Sun,  2 Nov 2025 08:31:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 236502A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156784036E
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AX9eK1fIeF5 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 08:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE00840F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE00840F73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE00840F73
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:31:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0741CA4C5CBB
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 09:31:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48920)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFTUK-000000007n6-0CTQ
 for buildroot@buildroot.org; Sun, 02 Nov 2025 08:30:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 09:30:59 +0100
Message-ID: <20251102083059.4649-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762072260;
 bh=+qh935PZY5XsfTQK+KMFqbEMQzTXWug16hXxOK549C4=;
 h=From:To:Subject:Date:From;
 b=DxISgBGv3zhyn0VdQ1XoTvF+3cHLyO4oPYfWURS3V2W32K7TAZkq9aEcdE4BH1kc/
 n2pAdNqOWeF3wA6xb5eQmKrJ/KIu3hZTey73KLHOUjGGdABlaTR/HdZuTxyOf1UGyX
 GiHUfB5tXbkG4cdLSrLurfVw6f46baa2ORkZKlB8LXwn6qshKEuCAxDl0Q/M+yHVR9
 UwNQMseWZt6CC9VTOowIsziEPhosloolipiSeBVGto4Cz0dE2Pmm4YKm4k3IbJ0Eye
 7fKGyw1Fb0Ur/FQInNYIDqmnT/PZS3KKWwLkjuyTxKo1woGBsjCl4Imd4SEIbtpaId
 CUzgsRkMMDyZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=DxISgBGv
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.5.1
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

Release notes:
https://blog.clamav.net/2025/10/clamav-150-released.html
https://blog.clamav.net/2025/10/clamav-151-patch-version-published.html

Added variables to fix build errors:
https://gitlab.com/jolivain/buildroot/-/pipelines/2088905409

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 5f83d57661..807c8fc2ea 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d874cabf3d4765b35b518ef535658a1e6ec74802006a1d613f9f124aa1343210  clamav-1.4.3.tar.gz
+sha256  64fe4a16a5622c1d71efe9ed7f2c2fbd37f8f237da9f11ff66b73038df71db91  clamav-1.5.1.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 93ddfaae5b..bda714ea65 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.4.3
+CLAMAV_VERSION = 1.5.1
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
@@ -45,6 +45,9 @@ CLAMAV_DEPENDENCIES += musl-fts
 CLAMAV_LIBS += -lfts
 endif
 
+CLAMAV_MAKE_OPTS = \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
 CLAMAV_CONF_OPTS = \
 	-DCMAKE_EXE_LINKER_FLAGS="$(CLAMAV_LIBS)" \
 	-DCMAKE_SKIP_INSTALL_RPATH=ON \
@@ -54,6 +57,7 @@ CLAMAV_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DHAVE_SYSTEM_LFS_FTS=ON \
 	-DRUST_COMPILER_TARGET=$(RUSTC_TARGET_NAME) \
+	-DCARGO_HOME=$(HOST_DIR)/share/cargo \
 	-Dtest_run_result=ON \
 	-Dtest_run_result__TRYRUN_OUTPUT=ON
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
