Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B3BC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 22:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09FB96FBD3;
	Fri, 14 Feb 2025 22:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1sy4KDwh6IP; Fri, 14 Feb 2025 22:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A056FC47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A056FC47;
	Fri, 14 Feb 2025 22:36:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9378BDF
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CE7C4086E
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNqoEDp9HkhF for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 22:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E886400EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E886400EB
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E886400EB
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:36:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id j4I0tMPqTFcEPj4I0t4VZf; Fri, 14 Feb 2025 23:36:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 14 Feb 2025 23:33:18 +0100
Message-Id: <20250214223318.2670223-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI4Oqfr98Mguo1OWaFChefBDj5LBsqhgjm4LQHcVBrXFhhYgt7DaMxoW/yUTWKsdMwXdtFXECdDURJATzEHd2c/zjN9f49he86qhVqKEadOZhJzdd69J
 fRRlDemWxfgvFYsYc9XAdUNWbI7dwPM5nFI+Re3aEQrRYaeR9dZwkTh4w+4wGV+jsOVsLFFzWbL5rtJg2FpD7GOFgVFDEHL6nBk60cequdVWc0F1mmeAvJWH
 gtAr4j5RMiBM9nwk5wNrp9OxKADOA5OBivW7xZPmeec=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1739572564; bh=jyN1ZCBGhdH5PBXZdq06gOaA+Hx2+rMlg0nObSkHF4U=;
 h=From:To:Subject:Date:MIME-Version;
 b=kwfXc8xQyUtAFIoIGiCJVMtzhhrvwXiuaC7lnVWQwIIstNJJo8EpS+SDDgnl9zL5a
 k+lIjL4DdGrRg5bO8Es3pYuD2Gb5yUgv3jbZlu2cLraZszy1CvFRqXHvzxsHkIlZR/
 cdpX13JzGIpcAik/qarIzrv7/OLzfcADJG152i5849Sw29e0Q36qPDvAhvN6dNCek/
 8lOVhVulRNTKF/77M292YSNSFM4HKFhZxGOyWZPugSuyi/yBByeeIv2RR6z/XoXK1Q
 vIGim24hdXL89P7ioKUWVpv2rKp5Hwnr9+KtkCS3AQM0TB1Ufu8sdc3rhC3bV/mJYS
 KLZAbJB99/Seg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kwfXc8xQ
Subject: [Buildroot] [PATCH] package/libblockdev: bump to version 3.3.0
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

For change log, see:
https://github.com/storaged-project/libblockdev/blob/3.3.0/NEWS.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 1466c88451..dd6f8b1a27 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  318b9e2cedfdfe88161f28079fcb63239aeb5592223f4485b861cfc6ef11189a  libblockdev-3.2.1.tar.gz
+sha256  c4738e1abedefffe886521f9f0e7a9306c6f50f7691d88e011438c88608bdfa7  libblockdev-3.3.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 4cac905666..265cee2e28 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.2.1
+LIBBLOCKDEV_VERSION = 3.3.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
