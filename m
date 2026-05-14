Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E72CD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 06:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F21811B5;
	Thu, 14 May 2026 06:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_ejEW_g7oJl; Thu, 14 May 2026 06:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C345811B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778740190;
	bh=oZ7RfvBtJkYv/rc9J+dDq4BmFIvyfl6JGTa+O3PfN6I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WAIH0UUoWEQFEHaZ7lTZu9rEocZRJvfVrCjrWJ7F5dRWGMSnnuh+gPsLAQVonFQ1t
	 u1RWzsk8kZb1EOESphtA+1DNUD5yWeqwkCuE3xbpfDOTor9zvxi5tmcPEIqoCyXqg2
	 x3gMNpo8lfZIKFmwUhVlKQFMyHPF2AbIuG7mf/zYyArxLCJWb+TAnM7B7k5G4GzkNr
	 M37YEoHAYEdV3Td1gd37UcyW7wa5+M2bW9isXVRADNBjpA/DADVoRbwHZp3DxKElhP
	 7xddmaW8jsNCE4oojYdhw/oGlxU4QiwTKLcSiOvs51FhpLcvx71JxMz7407nsjUQk3
	 +J+Z8p7YJ9bEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C345811B6;
	Thu, 14 May 2026 06:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2900636F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E851811B2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBrUY477aDEB for <buildroot@buildroot.org>;
 Thu, 14 May 2026 06:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4524D811AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4524D811AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4524D811AA
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:29:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c094.dip0.t-ipconnect.de [79.214.192.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1A16A4C0EF3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:29:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55440)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wNPZm-0000000022h-2ISS
 for buildroot@buildroot.org; Thu, 14 May 2026 06:29:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 08:29:42 +0200
Message-ID: <20260514062942.20224-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778740183;
 bh=hzj8ETVqdQmU3S5lfjITBg+xMruPFi2ZGKhngUDhrbE=;
 h=From:To:Subject:Date:From;
 b=Y6KWWfFliOGhyIwoUUsYqKo32Nl81vcDH8TwXDSstcP3LeOaM0B3mE0j/DFfMOBK0
 RkXIbYdj7pn26ESCnCOsJcn0iAQHY7utJ3njahT5TYuy1wakAVciSzOHyXfT+TbFs7
 lUe8qqOrUe5MGvPF+CigIG/EUNUIFYLnDdcJP/4EoYc+gAgnVRbozH9DdAohJAzaeh
 sIwSXJUZI+Kspe5ztGuKaE5LqCPCKwmljkbD3cQI4EF2TA2Ds7CYQNo5OYFSm1EA7q
 c4Iz7jajKfDMl0IjLQCT1gcsewQIP1/ODtoklprN909IOkd+z+w0/czceNZZ2rn+Ua
 QZBnlYrr/VBng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Y6KWWfFl
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260512
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

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260512

Fixes CVE-2025-35979:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01420.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 588cf7cde3..bb36a52fc5 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
+sha256  5a07ce745d0bd8b360a4713564d46d5e38be797316a52abedaff0761e1b02370  intel-microcode-20260512.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 321272e10d..f6fbee54b4 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260227
+INTEL_MICROCODE_VERSION = 20260512
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
