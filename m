Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F61AE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFD48051B;
	Sun, 29 Dec 2024 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lO9OYPo0e6o; Sun, 29 Dec 2024 20:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722198052F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722198052F;
	Sun, 29 Dec 2024 20:22:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A6B0CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B151401B2
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2LIkAxJeOQY for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25C22400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C22400D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25C22400D8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b064.dip0.t-ipconnect.de [84.161.176.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1C67A4C4205
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:22:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51946)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRzo0-000000000Ic-3CnM
 for buildroot@buildroot.org; Sun, 29 Dec 2024 20:22:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 21:22:32 +0100
Message-Id: <20241229202232.1678307-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229202232.1678307-1-bernd@kuhls.net>
References: <20241229202232.1678307-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735503752;
 bh=JFypMqsB1Hb2lfgsdRWus2tCjg9i2T8BPWhmHX3lpEI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UQT3Ai0MEvZLfK44fM1mmvYWQnWm7dptfi2SBrZbZgRJb++7mET4tqpAl9siPx5Fq
 NnXtvU+MDfcB+itIAdEtdRaO7hN1wjAz/Z93zWX/QEIwehTMdgmHsqcFbATh7VDNgz
 OY3WjqCKBBBwOPBlhxSI64HwxhciP3Ab3SXXUdpOCjrqldwC0Y1dwvov/aC8OZoMV3
 y6u8jwwKLosBEuqgm+OXmvrrTzpRBFz0jMIDDf5BKV9hDtPT+B5pthC0ycEsT7YVsh
 s8l8P7O1lHxnGyhY7rHt3aJIcZ4yzjMxNzEV0A0c1kvxsDzhp1Q5P4vMQrKhURTTtF
 x2cOrEMJq/Kqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=UQT3Ai0M
Subject: [Buildroot] [PATCH 2/2] package/intel-gmmlib: bump version to 22.6.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 9c2f3526bb..9b421af3ed 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08db696071510b7e03aa2d9fb7375c6c35f7c327ecd6747424c664c622bb4377  intel-gmmlib-22.5.5.tar.gz
+sha256  2be3de25e45ed6b32d6ea173510b9e4ce141c22f9d6ed18dd5b574b33f34748c  intel-gmmlib-22.6.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 81aa1a9af8..66b0d1629a 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.5.5
+INTEL_GMMLIB_VERSION = 22.6.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
