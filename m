Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C232D68BD1
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 20:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29490606B1;
	Fri, 15 Nov 2024 20:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gemxNfN8uTld; Fri, 15 Nov 2024 20:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 348F4607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348F4607FC;
	Fri, 15 Nov 2024 20:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EFE4BF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DD1943011
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9IlUnyeNE0i for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 20:11:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC880400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC880400AF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC880400AF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:11:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c858.dip0.t-ipconnect.de [79.214.200.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA7DAA4C33A5
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 21:11:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54594)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tC2fM-000000004fJ-0kjb
 for buildroot@buildroot.org; Fri, 15 Nov 2024 20:11:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 15 Nov 2024 21:11:40 +0100
Message-Id: <20241115201140.363683-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731701500;
 bh=D9VpmJ7Z6ojGJ1YjtSZIxUS4RWVnFgGBYaU6/9P5TfE=;
 h=From:To:Subject:Date:From;
 b=PqKVwFsFKlNpSBMmLdjlBZsOYUIdtbCWOE3rif0e/eLKGDbNpOrHhzx2ipqgyHcXI
 prR/mbZCmetCqQrykdVHMsJj4Y30RevCy+8p3DFFF0LIRRlp+5V7EGZmgFrWwP6Zkc
 QHpISxlZ0u+46+fLBzXbz3viSx03b760R/RVFqtiELjYkjQ6iGpICyPaSorsT31C/U
 LjpW8KzvDM68rdDsZlj+1/XrkuLclnP+8qpir/n6fBcIjuP9oIhUHdOmu//6+JXGRz
 H1mWlAvQBpkoRn3JGO1xFxCWys4BTcJlxCRhaQ9bBJzT0zCL/hbjWOGbXNlMWXP6hF
 MbQRNFzhxv5ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=PqKVwFsF
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20241112
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
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases

CVE-2024-21853
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01101.html

CVE-2024-23918
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01079.html

CVE-2024-24968
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html

CVE-2024-23984
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 20dfaa41b4..81a4573110 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8b7582eac7e9a691356e18b3bdcbc7b2db09494e040ec980a4a5fb6d0da261bf  intel-microcode-20240910.tar.gz
+sha256  37246208ef68039be752438c72400a688a2238df13a7f5282497c80be2d8366d  intel-microcode-20241112.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 24729494d0..17f25edc83 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20240910
+INTEL_MICROCODE_VERSION = 20241112
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
