Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E3CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1199E4124F;
	Fri,  3 Oct 2025 20:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KA3SKZxxNotI; Fri,  3 Oct 2025 20:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596F74123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596F74123F;
	Fri,  3 Oct 2025 20:12:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFF5F226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C668B80CD9
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aihbXK7RwSW for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C68228348C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C68228348C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C68228348C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C3F1A4C5BC6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 22:12:00 +0200 (CEST)
Received: from [192.168.1.144] (port=58384 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4m8G-000000007CP-0jJf
 for buildroot@buildroot.org; Fri, 03 Oct 2025 20:12:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 22:12:00 +0200
Message-ID: <20251003201200.2430182-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522320;
 bh=BwLQrSGflfvP9K/7D3JtMQphUQDau71YYUERXzrO1Gg=;
 h=From:To:Subject:Date:From;
 b=G5RvLOVy69C3tFRWSxc3ZFvheUFAh/S4ikf9BLO4p51QRymZ2dfLLDSQkx16mYtBf
 RwwK90KFy1tc0kYP80I2Dw2mbYSIHQsdkYxOEG/uI52SfulOLtGY7MmOKtQIq9Onxv
 TbVFqah4PeTEYE1Nr73AETnFO/mO0MvlWIrwSi7x0dxO+M8Oc+R+HQ69fZ7OGRvybz
 n6mI87yY9Tem9hoFzVuv8UfCDKkYbxtx8ZCt91Mjol02jMd5jdNgnymQsZ1Xg/cuAg
 TDmSDuuNDgYYGxBI2r8cw1vJ/X3NqlpKQOatxpiIEBGh2gnmJB2S39zbEON3th+Ytn
 Mcp5eIipp+fOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=G5RvLOVy
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250812
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
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250812

CVE-2025-20109:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01249.html

CVE-2025-22840:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01308.html

CVE-2025-22839:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01310.html

CVE-2025-22889:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01311.html

CVE-2025-20053:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01313.html

CVE-2025-26403:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01367.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 9504f7a786..735b352d1f 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  041af7d2f5791a47c1e914abd7d6255de4d4fc61b0f8e49ada6ee7014bcc3614  intel-microcode-20250512.tar.gz
+sha256  a8358422c68cc4d15c26db1ef682fbce332c3f46c4e087a79c132c437ec5f407  intel-microcode-20250812.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 1fd09e6a6d..2850dd01e4 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20250512
+INTEL_MICROCODE_VERSION = 20250812
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
