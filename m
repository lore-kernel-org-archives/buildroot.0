Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5D0CA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 13:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 991D881A30;
	Sun,  7 Sep 2025 13:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxquveqNEW08; Sun,  7 Sep 2025 13:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D0E80378
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4D0E80378;
	Sun,  7 Sep 2025 13:14:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C3B9E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 966A98471C
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kyj8kElW-RR for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 13:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8411984709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8411984709
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8411984709
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:14:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 76827C8EC5D
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:14:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CF4466061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 13:14:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 73A01102F28DC; 
 Sun,  7 Sep 2025 15:14:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 15:14:11 +0200
Message-ID: <20250907131412.3406724-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757250856; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=fHG64xntvOGH0xPOUgyUt9cWM1N090558X2FlLeQ8qA=;
 b=q6YbzInkxMVnxHwOilS7EeMXvKLHrRHghID3mNzcFKB6kkI1XP4qR1uE41TlMkAk0WSQgP
 vGNRc88Dpt2QlcpVOYWstgT7trO0s0jp3uBERBpxsJAMNrGAR15VU4LHrJNevkCFAOMa9n
 NYkEqcPmSikX2BJbWwGQz6R8oS4zBLaEwYSrLvuzkV9uQNM7sY/YPVg5SAel4rTnhlrbn2
 UD+T+zIjnJK9R6P7+I/tVVLs1OC80bAifjP3LCKXgmHXpm3EcJQ9AsWTyZTYg8MphRt7cB
 NZEUzXcFGFyjkFfAIPu3gjjBtdiqPORORZGa6rvyuCW/Ls/4GOdmz3BxQTrnLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=q6YbzInk
Subject: [Buildroot] [PATCH v2] package/bctoolbox: disable mbedtls support
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

From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>

Since mbedtls was bumped to version 3.6.3.1 in commit
3481a9643fc7223e400ed877f08ade34d44e6b78, the build of bctoolbox fails
as its mbedtls support is not compatible with mbedtls 3.x.

This issue is known upstream:

  https://github.com/BelledonneCommunications/bctoolbox/issues/19

and is not fixed, even in newer version of bctoolbox. So for the time
being, simply disable mbedtls support in bctoolbox.

Fixes:

  https://autobuild.buildroot.org/results/7af784cb60b0ec5e5bd0e0915ce6827f69f4bb97/

Newer versions of bctoolbox have fixed support for mbedtls 3.x,
however:

1. They require mbedtls to be built with the MBEDTLS_THREADING_ALT
   threading model, which is incompatible with the
   MBEDTLS_THREADING_PTHREAD threading model with which we are currently
   building mbedtls.

2. The bctoolbox project itself has been archived, and merged into
   linphone itself, making the work on bctoolbox version bump not very
   useful/relevant.

Disabling mbedtls support is therefore the most immediate solution to
fix the build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2: improve commit log to explain why this patch is the right
solution.
---
 package/bctoolbox/bctoolbox.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index ac9361026f..db545311fd 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -12,25 +12,23 @@ BCTOOLBOX_INSTALL_STAGING = YES
 
 # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
 # shared library.
+
+# We have to disable mbedtls support even though we have a mbedtls
+# package because bctoolbox is not compatible with mbedtls 3.x as of
+# version 4.4.8.
 BCTOOLBOX_CONF_OPTS = \
 	-DENABLE_POLARSSL=OFF \
 	-DENABLE_STRICT=OFF \
 	-DENABLE_TESTS_COMPONENT=OFF \
 	-DENABLE_TESTS=OFF \
-	-DCMAKE_SKIP_RPATH=ON
+	-DCMAKE_SKIP_RPATH=ON \
+	-DENABLE_MBEDTLS=OFF
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 BCTOOLBOX_DEPENDENCIES += libiconv
 BCTOOLBOX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -liconv"
 endif
 
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-BCTOOLBOX_DEPENDENCIES += mbedtls
-BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=ON
-else
-BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=OFF
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
