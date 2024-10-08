Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA614CEFC38
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 17:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A3260592;
	Tue,  8 Oct 2024 17:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6rHbYif-YYT; Tue,  8 Oct 2024 17:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55AF26069D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55AF26069D;
	Tue,  8 Oct 2024 17:48:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50BD91BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C0BB40528
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5IVRNiPQLCU for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 17:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D493140526
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D493140526
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D493140526
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 17:48:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a86.dip0.t-ipconnect.de [91.58.10.134])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EFF6A4C01D0
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:48:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56882)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1syEJq-0000000052M-2C1T
 for buildroot@buildroot.org; Tue, 08 Oct 2024 17:48:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 19:48:22 +0200
Message-Id: <20241008174822.3625910-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728409703;
 bh=HnPVGYyEU+XyFPRGMwpAINX8DTqMKFPJ5W+WAL7Ecoc=;
 h=From:To:Subject:Date:From;
 b=fgaY42r3kLUEfrbCpKFP43J18oof4WWXcxENN6ppHNYfd+rQt2tw5NLB9ZZROvfrN
 GK8Iz5o8Q2Dg9XwZCl4T625dUckyM4fGc1Qx7mDNiDYOIE1srsZT8+TPcoSrehUkiX
 3p3moPr0tyCuHWDhTUpFgTApNwNAUouF2MA3X8T+SkG/DcsBx4Y0PdB5EEPxtTqqXm
 btI5W8WhDNIOO4OP2hAsWq6xjN7NTS6ykywMscs2n2o6pWChdz7mjCkQ0XrVzVz5/e
 m4fPqXuba131TtJTnBdIivIlkX30Fb9xVXyZxay8i+6lG4Z9N6RR3EM71jcaLvjB0J
 N3D3fIZRt1Q2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=fgaY42r3
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20240910
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

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240813
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240910

20240813 fixes
CVE-2024-24853: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01083.html
CVE-2024-25939: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01118.html
CVE-2024-24980: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01100.html
CVE-2023-42667: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01038.html
CVE-2023-49141: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01046.html

20240910 fixes
CVE-2024-23984: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html
CVE-2024-24968: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 742be5ae79..20dfaa41b4 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c29eb35fdbd39e3ed8587e6f0b1275cc03265f230c2fcaf88e2a1556451e773f  intel-microcode-20240531.tar.gz
+sha256  8b7582eac7e9a691356e18b3bdcbc7b2db09494e040ec980a4a5fb6d0da261bf  intel-microcode-20240910.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 6862565bc8..24729494d0 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20240531
+INTEL_MICROCODE_VERSION = 20240910
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
