Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E598C001CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE4E6130C;
	Thu, 11 Apr 2024 21:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UgYPKVJxCqZ; Thu, 11 Apr 2024 21:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 099166130E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 099166130E;
	Thu, 11 Apr 2024 21:01:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0861BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E7340298
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LENbhTq5tdDj for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86CB340291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CB340291
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86CB340291
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:01:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60E89A4C3057
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 23:01:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55630)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1YI-000000001I8-2Nwi
 for buildroot@buildroot.org; Thu, 11 Apr 2024 21:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:01:47 +0200
Message-Id: <20240411210147.2127938-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869307;
 bh=4DwQhIdrmL/iwZG+8OQWUM0yGWY7YpiP+C5gSmBfPXA=;
 h=From:To:Subject:Date:From;
 b=p+L2C0nFzYXby/SPVqJqkQeN2XJ6ucSOmX/O5JiNLVdrYb1x42pMmbX/gHdnqLtbD
 0GVBH9SnXVSLDyfSYoqbD1qiRKI+os9UBmiS+uMSV1NxKzh6+9ZmOGPZmsortBDMW8
 8X6DbfcWf7SJuMo4ji4V0sprLFWNvSd/rauSl6zKpI2YY+REwU/l238JkIvLoxnWK8
 AZNZkuW4dhp6AdBOwd+UxvG7WT7hKe9HtACO1Vf80InfyUWQ7Cp1S4nY+NqaEqVyrD
 Z579+iYjkxWq/5wxYQrrqwsNZ6y/a2c1/4nW8jAydJfnA7iuDInh9dcW81KtJ0ddp6
 GbYW/FVtFPRTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=p+L2C0nF
Subject: [Buildroot] [PATCH] package/libminiupnpc: bump version to 2.2.7
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

Update license hash due to copyright year bump:
https://github.com/miniupnp/miniupnp/commit/e370f25e911d7e37d57c07d62ba1f3e24d1479ab

Changelog:
https://github.com/miniupnp/miniupnp/blob/master/miniupnpc/Changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libminiupnpc/libminiupnpc.hash | 4 ++--
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 21dac02dd3..4f7e7c7aa1 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  37fcd91953508c3e62d6964bb8ffbc5d47f3e13481fa54e6214fcc68704c66f1  miniupnpc-2.2.6.tar.gz
-sha256  e143c6e207d0bb874c4be76b57689ffa408063a37a735c6dcec3dc600cb522c5  LICENSE
+sha256  b0c3a27056840fd0ec9328a5a9bac3dc5e0ec6d2e8733349cf577b0aa1e70ac1  miniupnpc-2.2.7.tar.gz
+sha256  7480ae23b082c05ad9823896163d78f3a96f1beadce51f29c96cf898545c27e5  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index dddbe6f81b..3bd4ee6a9f 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.6
+LIBMINIUPNPC_VERSION = 2.2.7
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
