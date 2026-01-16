Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3DC982F1
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 18:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269726103C;
	Fri, 16 Jan 2026 18:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0Imjmpt66gD; Fri, 16 Jan 2026 18:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E503E60FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768588123;
	bh=iIefWc1Edczu90Ts6xw/b3nwzmukqW8cBzkcu4OQOQc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zgw8UEcWkaMzJmnyZQR6WRt4atK/zDVulxYwM/bWOvyjyR8NXdBeAgzbRmIV3I2OF
	 yBlpEE7FpFgw8HOFGgNR/YQG3X4tMGdtAzEPEtAW0oh610z69f7l8DnDNHuGy7xnnL
	 ubIFN0j7IYL1ey2efyLlVrqrMFizMInCf2g77HMH/3ZqsL4SbD6ChDHPbvYxu8tCJJ
	 3bk4tIaFuNMvQfOorCMRTNo22ZTZUa9OagNF2ANupMvv9w2PKKRR0SkiEi7Qi+taJQ
	 u3OBeR42RL9Zq3u5P87U26TaLkXP1pmuKPfBwe382tcsV0mq8DT1tBh37avs/r40Ay
	 zPYk8s62NyVdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E503E60FDB;
	Fri, 16 Jan 2026 18:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D5C2CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 270FE40A7C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2R9yaDHPe_5d for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 18:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B781409B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B781409B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B781409B5
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:28:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6A8AA4C322F;
 Fri, 16 Jan 2026 19:28:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57936)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgoYn-000000001Db-1ZfH;
 Fri, 16 Jan 2026 18:28:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 19:28:37 +0100
Message-ID: <20260116182837.376097-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768588117;
 bh=4UgcU15CwJQefzE7nAzku8Lxyy9UcXUyTyUW+k1pMoI=;
 h=From:To:Cc:Subject:Date:From;
 b=FGIh9ceI1UXAmIXOHsWRmqKrwg5q+47nmcJ71A8bvNTxS/JwLAHHmYjqL3zR6pzoH
 dVD4rH4HyQAB1u1F8aP9CUp7PPjyz8L21sjwm+uhS0F9AQQs6Kn7qBwMvb6aBMbYPg
 U1Le6rzySE7eDy6uq6o0YnkKb5BXiS7FHJmKAbQAVFj4zmrYHm0rIpHpad/zFabiNe
 nwdd4uUc2S9mAFXl2YHn3X36GTSj4CvnPlxL4Uvr3JE9GRFo9a9ifxCEnSSrW+VVcX
 mXac1F54vGtTMH8j4+umAICFf/TNQIzjjfXpIXaacTOar4MMshYq+lBu8sy28kDa1s
 XYN2owIfsrjUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FGIh9ceI
Subject: [Buildroot] [PATCH 1/1] package/php-xdebug: bump version to 3.5.0
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

https://xdebug.org/announcements/2025-12-04

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 9470a7d4e8..9149545a6e 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24  xdebug-3.4.7.tgz
+sha256  f6daf55a5c7adadb07dd2af25ff78b1cc9b1c58d6cc442a463eba015b678aabf  xdebug-3.5.0.tgz
 sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 272d331f7b..85a00d10fb 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.4.7
+PHP_XDEBUG_VERSION = 3.5.0
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
