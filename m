Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35C2E6F09E
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 16:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 878AC40947;
	Sun,  3 Nov 2024 16:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpWnrwsegJGQ; Sun,  3 Nov 2024 16:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4651C4094F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4651C4094F;
	Sun,  3 Nov 2024 16:04:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E60723
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97FC440235
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C627Ip9mQ_-Q for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 16:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2EF594018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF594018A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EF594018A
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:04:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30655A4C1AE6
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:04:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49274)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t7d5R-000000002vh-2fcf
 for buildroot@buildroot.org; Sun, 03 Nov 2024 16:04:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 Nov 2024 17:04:21 +0100
Message-Id: <20241103160421.41155-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730649862;
 bh=WaKSMdBuHrpvLPpercY5in+OYS2/iHLzMU6j3OMRMBY=;
 h=From:To:Subject:Date:From;
 b=TH8lzcAgmc2KPygFgnUdrOUkOfcCYnhuNPBhhi/cBAbMo43QDKG2PpHMhEKDTcGrJ
 cjjqC7GWeC0fYTeVvx7h32R7OL40OJMNpmrwB3PGauya/I1teFyo4v1+wFYduRKKHr
 Madns+gdcKn/lKSTjHTns/uD3P+JgzkobpSBI0iSJs1MfTcMJV/T23RESmEADFimBs
 OUkq13sNowO3Hdwa+BPYKlAoWmFKpkrtDrVh3J47G1iSfmw5rQqjmJm6N0SG2OmaCG
 s/lMYOsEBLnSDUetJdEP8nY/0q/hkSik3PSAQNDmpx3p53bDKAOdgFxEz3S+kbO3Kx
 oPr6cQzxrwnXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=TH8lzcAg
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.22.2
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index b9d3cc387c..aa6676507a 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  189e4bf604f8b569cd15894439a4ad0209b64184c8ccb5a2119a4f07c16da448  xmrig-6.22.1.tar.gz
+sha256  34759ca9c1b2486ecb7b6bc267c76a6f365d401b2b6de6d667e0a13ae30882a2  xmrig-6.22.2.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 83d9636643..75657407d7 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.22.1
+XMRIG_VERSION = 6.22.2
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
