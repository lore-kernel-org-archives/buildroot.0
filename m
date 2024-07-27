Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87848C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 17:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB0C40504;
	Sat, 27 Jul 2024 17:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1ujOIhMj2dE; Sat, 27 Jul 2024 17:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0CDB40513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0CDB40513;
	Sat, 27 Jul 2024 17:48:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5AC61BF2FF
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0846606BA
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jms2an6MO5se for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 17:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77D76606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D76606B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77D76606B3
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 17:48:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05740A4C30D9
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 19:48:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39394)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXlWp-000000004mT-3TiR
 for buildroot@buildroot.org; Sat, 27 Jul 2024 17:48:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 19:48:23 +0200
Message-Id: <20240727174823.1733020-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722102504;
 bh=E8NlWQ0UTVXmsCxUTO0QzLIOTpZnW1FLE6b17YHihXw=;
 h=From:To:Subject:Date:From;
 b=Yo9c4l1c+Lm/L+rzFjcGh0EErA0NkSutWHKlfB72aLsntG+RY9LB9s0B80EIWedQB
 gD572FrR9DsqoXxKAfNJQNoD/e6LxUSGXcaR9jKBhXvd208WyGkBYowAE6nZK7rf2H
 IqGvhwuyQsftXBzaeK1pSaVm59Mh31Z7neT+BaMZVUFgHGR4s9LGdXUj4QgOQlmioe
 QDcwlwM95bJFVlW4Snew5gsSGVKYIRnubomuCz9LFF1nmTm1gcZWknxy47cDKptH0d
 W0aYdfotAgAIolVWzwTpCmrYWonJfOdN75mSrVrT5vCbvPB7yzkcHkukQTSHAondZ0
 kKQ4oEG5H/p/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Yo9c4l1c
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20240531
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
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240312
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240514
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240531

20240312 fixes
CVE-2023-39368: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00972.html
CVE-2023-38575: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00982.html
CVE-2023-28746: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00898.html
CVE-2023-22655: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00960.html
CVE-2023-43490: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01045.html

20240514 fixes
CVE-2023-45733: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01051.html
CVE-2023-46103: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01052.html
CVE-2023-45745: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01036.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 742332d552..742be5ae79 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cee26f311f7e2c039dd48cd30f995183bde9b98fb4c3039800e2ddaf5c090e55  intel-microcode-20231114.tar.gz
+sha256  c29eb35fdbd39e3ed8587e6f0b1275cc03265f230c2fcaf88e2a1556451e773f  intel-microcode-20240531.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index a159baa93d..6862565bc8 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20231114
+INTEL_MICROCODE_VERSION = 20240531
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
