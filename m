Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05800F94CA5
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C2941410;
	Tue, 21 Apr 2026 18:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebvBE0NKgPqF; Tue, 21 Apr 2026 18:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B0041418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776797317;
	bh=5DI7ckQnQX4oFe95NL9caTK9/vk7BUPb9YCHCPT/m1g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HdQB/bhSs+MslJ21WNptyKRGcuM87i6C2sXjOZd/WFTsRwhNZ/VPqdelvx5xsVW9S
	 ENYTlqSOYSWQz3eCtF5yrCGC8pFTUGMV1LbBKsUK554vM4PDTynuOucG366wzcGPsB
	 3xCcO4iJ9KZlPNz+Q8YovL+4pzBw06NiP9MqmEYCM4XSOkxUsYkRmGU9Sm/P4pOD2U
	 2Yc0e400Wxj7ySbWUCQmFUHZ8bxdxDAN9tojYcsi7h3Cf+e4KaDFeRMNtqMbywWEW7
	 RYLZwea8GoNopppdj4IhkMyJ6SnyYboUtWT3sJhh7MUc1kD6oI8IMheFAExKcHoYGp
	 30m0dIAfVAZWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B0041418;
	Tue, 21 Apr 2026 18:48:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C72EB183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B929041418
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWpPD5xG6wRk for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 18:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5CC441410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CC441410
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5CC441410
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:48:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81D5EA4C0602;
 Tue, 21 Apr 2026 20:48:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFG99-000000001Di-0WUc;
 Tue, 21 Apr 2026 18:48:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 21 Apr 2026 20:48:29 +0200
Message-ID: <20260421184831.2576691-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776797311;
 bh=6dHn5i2QwCv6EgxvVYj5+2pPrVF6qYFF5dALrpDz42M=;
 h=From:To:Cc:Subject:Date:From;
 b=QUydXSHcMhyZrqM1jv8OnguQKqvQ1fVfCBh9RtUXmYLeXiCx7ld+M9Hr9JFVuSF6F
 oIr6MHUbQcVZ/T4hJ/2e+fDF0GUUDfuCKtlh9VKkeDLfF/tfdpWB0HdNm9wnfZkw66
 YPkmLjDEuRzuTj7wdfChpdCVZn4kY/oAEvk8STOSWogp/Zl+nJjkkO2Kttx8XIB3HM
 ag5ifVABIy3E3efxUlagAE+HazW56V/BmrxEfIaWnk6XcwttH3reM4tNRpLcnnaC2B
 mz9Mx8KLh811lmYKFnN4NOzd0xTzgVcH6n62xnIiWaT6y9E4CsEyqkjjtc1ntjkOds
 4VX9O2xBT/DNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QUydXSHc
Subject: [Buildroot] [PATCH 1/2] package/opensc: security bump version to
 0.27.1
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

https://github.com/OpenSC/OpenSC/blob/0.27.1/NEWS

Switched to sha256 tarball hash provided by upstream.

Removed patch which is included in this release.

Fixes the following CVEs:
* CVE-2025-13763: Several uses of potentially uninitialized memory
                  detected by fuzzers
* CVE-2025-49010: Possible write beyond buffer bounds during processing
                  of GET RESPONSE APDU
* CVE-2025-66215: Possible write beyond buffer bounds in oberthur driver
* CVE-2025-66038: Possible read beyond buffer bounds when parsing
                  historical bytes in PIV driver
* CVE-2025-66037: Possible buffer overrun while parsing SPKI

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ble-wrap-unwrap-test-until-OpenSC-17.patch | 41 -------------------
 package/opensc/opensc.hash                    |  4 +-
 package/opensc/opensc.mk                      |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch

diff --git a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
deleted file mode 100644
index 9bf601370a..0000000000
--- a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 768c9bfcd91206f0d85cd4757fde48e00850a014 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 6 Jan 2025 22:36:10 +0100
-Subject: [PATCH] pkcs11-tool: disable wrap/unwrap test until OpenSC#1796 is
- resolved
-
-Similar to ab74fae4d71d1705b77b9459141987a95dcfc91e ("pkcs11-tool:
-disable wrap/unwrap test until OpenSC#1796 is resolved"), but for
-0.26, since OpenSC#1796 is still open.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/OpenSC/OpenSC/pull/3303
----
- src/tools/pkcs11-tool.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
-index d701d76d6..871a39977 100644
---- a/src/tools/pkcs11-tool.c
-+++ b/src/tools/pkcs11-tool.c
-@@ -7681,7 +7681,7 @@ static int test_verify(CK_SESSION_HANDLE sess)
- 	return errors;
- }
- 
--#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
-+#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
- #else
- #ifdef ENABLE_OPENSSL
- static int wrap_unwrap(CK_SESSION_HANDLE session,
-@@ -7805,7 +7805,7 @@ static int wrap_unwrap(CK_SESSION_HANDLE session,
-  */
- static int test_unwrap(CK_SESSION_HANDLE sess)
- {
--#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
-+#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
- 	/* temporarily disable test, see https://github.com/OpenSC/OpenSC/issues/1796 */
- 	return 0;
- #else
--- 
-2.47.1
-
diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
index e12d2d4bfa..b24a6bca98 100644
--- a/package/opensc/opensc.hash
+++ b/package/opensc/opensc.hash
@@ -1,5 +1,5 @@
-# Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
-sha256  837baead45e1505260d868871056150ede6e73d35460a470f2595a9e5e75f82b  opensc-0.26.0.tar.gz
+# From https://github.com/OpenSC/OpenSC/releases/tag/0.27.1
+sha256  976f4a23eaf3397a1a2c3a7aac80bf971a8c3d829c9a79f06145bfaeeae5eca7  opensc-0.27.1.tar.gz
 
 # Computed locally
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 11d1507d45..dbc83c2b0e 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSC_VERSION = 0.26.0
+OPENSC_VERSION = 0.27.1
 OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
