Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C204FE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 21:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6630B406E4;
	Mon,  6 Jan 2025 21:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeyGVuwU53mL; Mon,  6 Jan 2025 21:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9EF406EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9EF406EA;
	Mon,  6 Jan 2025 21:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 682A46B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 497BC60757
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gezodFramTyv for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 21:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0204760742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0204760742
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0204760742
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:55:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 42BC91C0002;
 Mon,  6 Jan 2025 21:55:15 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 22:55:13 +0100
Message-ID: <20250106215514.1531389-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736200515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XdjbRu2mnEcjBLgp+59seyBQRZuRPaM0+8eTmeW1Wq8=;
 b=o/UMnGRNFn0350CLn7zkzYChI2E8FMcCkY+J3/rLxz/WKgf3SuvFpTg98YYvKHaIlduNk5
 skRDaXM5QtRulXaYVytBbsqcKwnmb7dkvz0JUrDAQO5hkJFQEYsMlw5PyfnnZva5cgKPDE
 k2Ae4OnjqivA1gapGTJ+/QKceoXXfDhEj7qDRNr9u45l2BTyUpKQ9Nf7jXWUjf8C2jG2pQ
 u5B5e9NyGI9SY1irH0spf8fXZHduk+2CH9S7ds9i9IF2Kp/NM49jfRC+2o423p3MPSHvjC
 cbJDoJY6nhvgW+fPLAjQ2yf0KqLlpQmmhHQuY8C+PFrdr7zfpuU6vbs349i+hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o/UMnGRN
Subject: [Buildroot] [PATCH] package/opensc: fix build issue since bump to
 0.26
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit
1f4b4ccde7ceb379010aeb93458792202622d64b ("package/opensc: security
bump to version 0.26.0") bumped opensc from 0.24 to 0.26, and the
build started failing with:

pkcs11-tool.c:7854:45: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]

on configurations that have BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
disabled (it is not explicitly selected by this package).

Our initial fix was to simply select
BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH, but when investigating when
EVP_bf_cbc() started being used in OpenSC, we discovered it has been
in use for a while... but in code that kept being disabled from
version to version as it was broken (upstream bug
https://github.com/OpenSC/OpenSC/issues/1796), but it was apparently
forgotten to be disabled again for 0.26 (the issue is still
open). Therefore, we opted to continue disabling this known broken
part of the code, and submit an upstream PR for that
https://github.com/OpenSC/OpenSC/pull/3303, which ultimately will
clarify what is the right fix.

In the mean time, this allows to fix the build issue.

Fixes:

  http://autobuild.buildroot.net/results/ca51b3e8e3ac83e2a69814caa84d9862385b956f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ble-wrap-unwrap-test-until-OpenSC-17.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch

diff --git a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
new file mode 100644
index 0000000000..9bf601370a
--- /dev/null
+++ b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
@@ -0,0 +1,41 @@
+From 768c9bfcd91206f0d85cd4757fde48e00850a014 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 6 Jan 2025 22:36:10 +0100
+Subject: [PATCH] pkcs11-tool: disable wrap/unwrap test until OpenSC#1796 is
+ resolved
+
+Similar to ab74fae4d71d1705b77b9459141987a95dcfc91e ("pkcs11-tool:
+disable wrap/unwrap test until OpenSC#1796 is resolved"), but for
+0.26, since OpenSC#1796 is still open.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/OpenSC/OpenSC/pull/3303
+---
+ src/tools/pkcs11-tool.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index d701d76d6..871a39977 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7681,7 +7681,7 @@ static int test_verify(CK_SESSION_HANDLE sess)
+ 	return errors;
+ }
+ 
+-#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
++#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
+ #else
+ #ifdef ENABLE_OPENSSL
+ static int wrap_unwrap(CK_SESSION_HANDLE session,
+@@ -7805,7 +7805,7 @@ static int wrap_unwrap(CK_SESSION_HANDLE session,
+  */
+ static int test_unwrap(CK_SESSION_HANDLE sess)
+ {
+-#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
++#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
+ 	/* temporarily disable test, see https://github.com/OpenSC/OpenSC/issues/1796 */
+ 	return 0;
+ #else
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
