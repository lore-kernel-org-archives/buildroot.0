Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5444CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 08:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F6C608D1;
	Sun, 24 Aug 2025 08:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWuPfSrWFSfo; Sun, 24 Aug 2025 08:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8A4B6074F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8A4B6074F;
	Sun, 24 Aug 2025 08:24:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47EB01D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38FED83D24
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdKMX1cl2Rxy for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 08:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.128;
 helo=smtpcmd11128.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E75F483C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75F483C56
Received: from smtpcmd11128.aruba.it (smtpcmd11128.aruba.it [62.149.156.128])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E75F483C56
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:24:44 +0000 (UTC)
Received: from localhost.localdomain ([95.168.107.28])
 by Aruba SMTP with ESMTPSA
 id q61puKanQtr9dq61quLZJJ; Sun, 24 Aug 2025 10:24:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 24 Aug 2025 10:12:13 +0200
Message-ID: <20250824081213.452038-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAYhhxogtFGj3FiEUv2Cmq7KLPPbn8v8DiRVTxE7h1jZOqRpJwMN2gEYuTVUKl3hWbH7HH6TBM4PS9i1oSYG9TVDPvQSUT1+6VdnA8DtZ5MLPcidRIKF
 gDmaVwegCrUQGMjPPgNAA8L1dQKmW/XZ21LpeNClN1BgGcOS4kowMA/gQ8tYpXKhaV3iUHkUO/Q6kJ5rBl6+QS8s6UAgd/OmpWIVCKYMjeUihUGm6oNRN5iz
 wh2sPdH2bj/bBE6NmvTKZFPBKw/JUmivb2DeopnVvVREu2Tv0k0FibHOhi14T2C0bL9zYO13eNRoJincP+adWA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756023882; bh=lEG8qBqK979bMoRJpsRFvZxTi59Kd+LxzWnMvC5YKSw=;
 h=From:To:Subject:Date:MIME-Version;
 b=Pz9pmtRqoh0epAFYDNnejiZXBvTNarSjUwTHC84Jvdes2duSGqlzxuFreV+OQZNPv
 yeSfMYxRW6gcjypDjchhrHVXhkT1nwUjb1SIsVzGOJn2hQaPAQgMWe0gK5lsH0VBCJ
 LqkTjWhb5yj4xZgyhwVWjDcT1WWkApqfeokjMqH+t24n1SD+VEwyMGVtSvbt/kDA9n
 NSwQAfPg+MhqVpcjDo50oE6hCgsybhPeEO9vpIpywAJ3MlztSsOIsIAHsLa2PuQNto
 j5QFrUF40h2nNGmczVOT0cYSoDxu+NVegzWnbjT+8fY6ZrqMtuH3AuOem73nnYURYV
 AsZLQ6VNL/8bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Pz9pmtRq
Subject: [Buildroot] [for-next] package/libnss: bump version to 3.115.1
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_115_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1c6b5ede18..abd550d5c8 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_RTM/src/SHA256SUMS
-sha256  ac2a47fb33bd79320159144e01c0d4af9a937a2d928c7c77ff06f5d9507861ab  nss-3.115.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_1_RTM/src/SHA256SUMS
+sha256  b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf  nss-3.115.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index fa711912b4..9e8e7d36cf 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.115
+LIBNSS_VERSION = 3.115.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
