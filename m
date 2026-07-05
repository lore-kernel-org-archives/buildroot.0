Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7C3C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 07:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F41606C9;
	Sun,  5 Jul 2026 07:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5jiKxlzBGNK; Sun,  5 Jul 2026 07:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87F4606C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783237598;
	bh=mMHid685IOo9W2jCYO9hDbKs+Ep3JsPlzkb1eTP9/6A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=chnC7cBCgH1uyGzjEOJjmRM6KoBrWopuJVEPAl0J+UGhs5ig2oakrDfseMtkxjF8s
	 W1Pek9VWQQATyOGBNxl7+1EiTOr6e8+UALdR9yDKju99jLVBxAwKOoQJ3gJwYDFN0a
	 SdpC4qrAKnP6892eAwf4Js0uxsfTC2K29wS4/9+8soXiAX3d1+06r8MGpS0q4tpJTR
	 456GEBzcI7T4W4iDNG9WVGT/+krWCFomwhnisVSdlZsDcoLIjly+JCmT/ALXyXn0CU
	 +o3yK+w1H2j7B0t9HIRwN6pyDhKgLTqQpnJovTMdKZHwx3xJyvfOmvwjoU/RzEpmzC
	 /KKdyCbMM13Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87F4606C5;
	Sun,  5 Jul 2026 07:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3AB1316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 07:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0F5A80BAD
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 07:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG6yt22GMUcm for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 07:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DA3F80AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA3F80AED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DA3F80AED
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 07:46:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 99F16A4C1073
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:46:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40214)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgHYc-000000000wv-39wu
 for buildroot@buildroot.org; Sun, 05 Jul 2026 07:46:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Jul 2026 09:46:30 +0200
Message-ID: <20260705074630.3245449-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783237591;
 bh=acKEu/TuxjSQX+J3OOSWjUjVqJidOVUtZM4FxAPBau8=;
 h=From:To:Subject:Date:From;
 b=BfG/9itquPTzJL6qePMtm4nJnt3KXWxvWiOT1wEfFHwW2SuR4d1UsaCqK0wV8LCIx
 DMOY8pjn7jllFrLMDcNRYbdUTByhKOK+AXAIsF8np5TKCotR2H3P5Utegn20FIHFvE
 SjsvGpsBlYdhwxVTz2Rj9c6lFimUkHhUQ+9Mfzbw8fpjFmLH1/ElyUwQa8RUtUPfgp
 MHqC4eYpD5Fol90r7qO8Qi3lqnbNijVIrdyynggwtZNdcKmDfMa+8I1ToIIZHjM8vk
 X3xYnZkjENsXBLuhABr+M/IvL2Fqd4zQaE6+XrTRjzWMJl17icVqX1Yc/VAP+uWgNA
 6oPh971LWpxrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BfG/9itq
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump version to 4.7.2
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

https://gitlab.com/libtiff/libtiff/-/releases/v4.7.2

Fixes CVE-2026-36849: https://seclists.org/oss-sec/2026/q2/952

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commit/20f354488e98eda2456f670b45567c02b01e8f23
with the exception of unrelated build errors with ghostscript.

 package/tiff/tiff.hash | 4 ++--
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index ff0b698345..5c9031bfb4 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-# https://download.osgeo.org/libtiff/tiff-4.7.1.tar.xz.sig
+# https://download.osgeo.org/libtiff/tiff-4.7.2.tar.xz.sig
 # with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
-sha256  b92017489bdc1db3a4c97191aa4b75366673cb746de0dce5d7a749d5954681ba  tiff-4.7.1.tar.xz
+sha256  4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88  tiff-4.7.2.tar.xz
 sha256  0e27c2382d7b8147972bbb746e04059a1152c8d0fda9d03ef1399d1a433c4ade  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e64a6baf83..b1efa5be5a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.7.1
+TIFF_VERSION = 4.7.2
 TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
 TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
