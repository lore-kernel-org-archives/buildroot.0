Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C00E9D3E8
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1288356C;
	Wed,  4 Feb 2026 14:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hmT6xBNTfRm; Wed,  4 Feb 2026 14:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A0983595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770216060;
	bh=hJyeqte3BLE6KB/+ptao4haaAXUiN+TyqqQSvdmDP0g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Frs4Ins6MgAGa6XRpz3/sfZu/lvNCMAi3ZHZH9Kz6Fw8dP7qEDufUe2vDCxB0Qd8m
	 1rHekPJaoTSq0L9vG3YOOfTalmZuor6rS5C6QEBa+10KFggrnuT/VshHLqFdszCBGX
	 Amo9BFg2q4RWaKFJ1AUcRmINdOCXmU1x3HIqPCr4J0taOYpMmOBM1wlu5P2MalxKT7
	 o+llcNnnl4waXECaLUgyTdD9ElNLaZeXbDkKBMYSR3GGj+97e9cl1eoBpoahk1Cd42
	 SlMevRp+Wcpw1ePrK1a8YebuxxSgS0YxNOsXQZEtpN57o8erRdOohWZYfpxDhEiDzO
	 uhc08+Q+pBpIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A0983595;
	Wed,  4 Feb 2026 14:41:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 284F7F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A764065F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzzDcLd87PTc for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 707C7401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 707C7401DD
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 707C7401DD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:40:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1883F1814B9; Wed,  4 Feb 2026 15:40:54 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 15:40:20 +0100
Message-ID: <20260204144024.2336976-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770216054; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=AuNrG4kzex/+P8WbIx/mkUwajH7xnKTxDzRIo/CTPuU=;
 b=IlqNxUT/qbdERIHEahnLJZMNFQyDJ6Gx55p7oZBgsw2/fPlaQNo3XMo3Q0PVx86K0gd/tk
 FS7UHECc65U8Y1I99mMMpP1oifasQMnmGLVH5j4bZ8nsaNr7G6JRy8/R4IUx5AK/Sg/mU7
 rmQ6nhsKDEezLBesr9u1ccqnAQ+zYeg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=IlqNxUT/
Subject: [Buildroot] [PATCH] package/azmq: disable tests, drop Boost.System
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: RJ Ascani <rj.ascani@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When bumping to 819b24035cfa5b73081e21f5867445f2344f680d two things
were missed:

- the parameter to disable tests was renamed to AZMQ_BUILD_TESTS
- the commit [0] was included. It removes the need for the Boost.System
  library linkage

Fixes:
https://autobuild.buildroot.org/results/2e7/2e7fe61cc349b843604091190fa7346f95dd0d56/

[0] https://github.com/zeromq/azmq/commit/b8b2a1aac47f8da70bc4d2d1c2f5d9a9ceaec748

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/azmq/Config.in | 1 -
 package/azmq/azmq.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 7bdd07ebf8..75cbeabf53 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_AZMQ
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_RANDOM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  This library provides Boost Asio style bindings for ZeroMQ.
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index 99fb3212df..bb918bd529 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -15,6 +15,6 @@ AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
 AZMQ_INSTALL_STAGING = YES
 AZMQ_INSTALL_TARGET = NO
 
-AZMQ_CONF_OPTS = -DAZMQ_NO_TESTS=ON
+AZMQ_CONF_OPTS = -DAZMQ_BUILD_TESTS=OFF
 
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
