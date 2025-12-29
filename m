Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD03D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B18F7403A6;
	Mon, 29 Dec 2025 07:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxfUeqEhlF6t; Mon, 29 Dec 2025 07:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F6B402F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766994960;
	bh=VTbGde+kjqiKdKWPGZI+y0DkBo4vXYjxe880zkCW+1o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n2ikedouZJaW7YCwcPhesqDOE6gDBblWsT5WZzuKWJ607hiFQnFwI99JIAubspsmu
	 5wftck3ANwv56Y0e396oQHWBdAilmKJxk2KVY8DWIi3JRfjppJHBZd7CB3Av+AqzjT
	 V/yzhvqrt9j2TlzKy3EHEDjhmZJX6fbgBpG58MRzTROw8Ox0SxDMUNbI2JysmmI6cC
	 f7Xiv7KTaFxoCMdCRFWrdNj1kzKBgWglL4TE4cXrqv8cuTletL9E3OP8CikdPTh1CL
	 vUlbMKIDrD7k7ljaBUd6cda1PFnOFQeG7bhhuvQNp4MvoGJbdrYdDrZLreU9tw8D7c
	 Y50hUAAu63cRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F6B402F8;
	Mon, 29 Dec 2025 07:56:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE229B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C032A60AE1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezh38tAavMXJ for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 07:55:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 994C160ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 994C160ACD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 994C160ACD
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:55:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C4D0A4C1A26
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:55:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60750)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va86N-0000000027L-2axo
 for buildroot@buildroot.org; Mon, 29 Dec 2025 07:55:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 08:55:38 +0100
Message-ID: <20251229075539.516207-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766994941;
 bh=t3WrE/m8aDjRJ6ECpFpOfVyk5FcthCL2u1cXGgjnTS8=;
 h=From:To:Subject:Date:From;
 b=kwdLwHyNnrCse73XxE6picW6/VcgeZqH2wGrTVU1sATN1nSILrsJ7pcTJdLUoYly1
 qTfJ/Lq1x5ZBz1TPJoCr4eMMbygUUhhYCfBj0OQvXJJP5m6COS847Wl/fOcCdy/MaN
 9dWX7ewbAjIpxJRlCoLIqxgd3Fm5vCr0b0vWInCmTAYRTHAuNDVitILhZt829zAUtC
 SzSFbSXczyZmbz3f1cgkirTyXPP/O2cL7gSLpOsyMmi78sO8JeW0+HhgSOCRijdsQ8
 r63O36qbuMmbGOmlO12Mcdte/YHiI7NJe+y5RisoQObrIkMSyDPeDtU6fOJglRwedC
 94BejcyB8lClg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kwdLwHyN
Subject: [Buildroot] [PATCH 1/2] package/utfcpp: fix comments
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

Buildroot commit dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454 added this
package as copy from the taglib package but forgot to change all taglib-
related comments.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/utfcpp/Config.in | 2 +-
 package/utfcpp/utfcpp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
index 19e1f21688..3a3fc339bd 100644
--- a/package/utfcpp/Config.in
+++ b/package/utfcpp/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_UTFCPP
 
 	  https://github.com/nemtrif/utfcpp
 
-comment "taglib needs a toolchain w/ C++"
+comment "utfcpp needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index d3d7896813..4e17364e0b 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# taglib
+# utfcpp
 #
 ################################################################################
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
