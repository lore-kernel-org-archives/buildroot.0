Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD7DCFA779
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 11:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BF9840BC;
	Fri, 21 Nov 2025 11:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q18YFGxFsj_M; Fri, 21 Nov 2025 11:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571C181C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571C181C26;
	Fri, 21 Nov 2025 11:22:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47857158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2643F428D3
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NQBHHweSjpU for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 11:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 552DA41EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552DA41EBD
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 552DA41EBD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 11:22:22 +0000 (UTC)
Received: from localhost.localdomain ([79.7.167.199])
 by Aruba SMTP with ESMTPSA
 id MPDXv75PI3pJ0MPDXvBAAF; Fri, 21 Nov 2025 12:22:19 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 21 Nov 2025 12:22:13 +0100
Message-ID: <20251121112214.640511-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK4XRXgsv/eUmvYS+7RvVZXhuAf9WBczAEPQraLiSdISlQQ4+VXrPP5HXU+MhydaNLa91NmZg3uW50KoSv5cUJ2J3o6gTP5gF/ZxaJ5yNGFlFc7e4Nfy
 +b1KuZB/HL7pLJU3XU43ZDgkayFic8PDJL4vk1jNSWg8s7BVuJK0N4nX7SE4PU8hAWggAvoYJ1b3X7LayzagsqiHlOLChk43lJEBAyndSbHGwWjFr14QSube
 dNdtjKYqE2S8o2QrWpTq5LajmlQ5I5bZ7I/5pUpN129NdHsPdsZTcS85k2IjVhP6w1RHIzLTTjrbjSYt5Fb+Vg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1763724139; bh=lVoZSOyJ+vAiMq43dAwSR0SuKJK6HCTXxVrQereqsKc=;
 h=From:To:Subject:Date:MIME-Version;
 b=MQZVnOXcec2lZv6YnnXLDCVQ4jSA5wQpCyuVcjXk2fVH0bjn5nxHxGxtMlYy4K/4W
 qRZwK/oMr1Cg8O6iaVKsoxFIE3aKv+kDrnNKKDEmOCEh5vkby8oqExb1uEKWE9gmVZ
 osFhXQ2ULlfIsHrhvzq7pmHu7JZ/5DFivx6abpWexj4NIGif/89ytIrODSOd+lLHje
 Pz+A593zsoVCLQk/DNLLLCn9S+9aJT+9GVFP8M1YFMAcxPsObwXVOOVK4o06Xba/mP
 Moc0/n7a6VprH5DaYLMGEJLUddrk4T96574jNfhEGhJU9cPCfPhmo/Ezq2bui4j78s
 W5O88VGK1AMTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MQZVnOXc
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.38.2
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 172778540e..9148cf393e 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.37/src/SHA256SUMS
-sha256  5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa  nspr-4.37.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.38.2/src/SHA256SUMS
+sha256  e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105  nspr-4.38.2.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index a045140743..3c7351c2d7 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.37
+LIBNSPR_VERSION = 4.38.2
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
