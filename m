Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E97C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DA960850;
	Wed, 10 Jul 2024 20:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_smS1RHbGDg; Wed, 10 Jul 2024 20:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E416B60861
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E416B60861;
	Wed, 10 Jul 2024 20:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5B01BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA6B883EDA
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xz8NiNKBy3og for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C8D383ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C8D383ED6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C8D383ED6
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:55:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DBEBA4C2341;
 Wed, 10 Jul 2024 22:55:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38744)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sReLE-000000005qf-2a0O;
 Wed, 10 Jul 2024 20:55:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 22:55:08 +0200
Message-Id: <20240710205508.79739-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720644909;
 bh=/saNpMr05a6UtUeHKp5+BMfqBqV0TAjJAWPWYGmCtQY=;
 h=From:To:Cc:Subject:Date:From;
 b=NQ4magrgn+GLzMSe/sQyQgf6/1R2Q+bsUXt7ObLgcr51AJKBFnn0aSFmcrAat/Kfq
 qAQh76CMFUT100eB4XbfQqr0vomoLklh67dbGdz8Q3bf1PBRwG3TQ6pRwK0Bz7Im8I
 rUtClVwN4M3bzDo/j9q6k5rylGDcfgDQi2iUfhBse6RxLyCBfLlfB0HrS6E30iVjJB
 QX3x5YvV2glvFMpjAfJ8Y/mUJSbpwtg4/gNOKlrMriiu+Z28bWfHDF9EHZvsbadLGC
 75I2yQE3zBhWT/NsvFt5UgJZd6RXDOGzpN+D7bQLsXDFb5G782tZSJXJC1nbsBo6Bm
 Zpb99ZhB046TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=NQ4magrg
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to 22.4.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
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
index 66a4088257..93138bf25a 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7233037c5788966b0b356823149247e4d3bd590480103c48277191da83243d0d  intel-gmmlib-22.4.0.tar.gz
+sha256  451fbe2eac26533a896ca0da0356354ecc38680f273fce7d121c6a22251ed21e  intel-gmmlib-22.4.1.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 5260b7689c..a21c3bf1e5 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.4.0
+INTEL_GMMLIB_VERSION = 22.4.1
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
