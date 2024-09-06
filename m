Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9516FE6FE49
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 21:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540C740879;
	Fri,  6 Sep 2024 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RFEIMFrDB_J; Fri,  6 Sep 2024 21:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2330A408CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2330A408CF;
	Fri,  6 Sep 2024 21:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4A91BF37A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B39460646
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz7jcUCkSTdk for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 21:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 112E660638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112E660638
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 112E660638
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 21:56:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc3e.dip0.t-ipconnect.de [79.214.204.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2638FA4C0EA1;
 Fri,  6 Sep 2024 23:55:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1smgvp-000000005ny-2n1J;
 Fri, 06 Sep 2024 21:55:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 23:55:53 +0200
Message-Id: <20240906215553.1737885-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906215553.1737885-1-bernd@kuhls.net>
References: <20240906215553.1737885-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725659754;
 bh=1J28/g4s71pjJ3NCg5pPQ0z4Zsum6O2Y9BKqD8AaGUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OYCEQpMCQOvSntXwCwxePhCMbSV19Bn+agh98HGcq5gpogdgnQAi9BrWMxomc5dqb
 MpO3nw8QLOIIeXvued3h2KFtATmfj/7LJhicmmadAb7wkssv9Qzz5gyxvFelJhSxek
 msgo/R9ePj0bqNff6SUJwkCn9XaDJkUwg7za91GmEYCA4HFADIdFrSsICyU7+KoCpT
 wADhZuLq932/q+NcHKbg33dcE1nj5qwXvvhkKDrdQTNO0g/O/OYB324SSUx86DyjMA
 Pd86Bh4QIOfUJtatFCO5bxKdg8EddnyaactkVUv4iIfez+FoVSMB1ovrzsw2IoMdgT
 Tyw4jnKZeEOJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=OYCEQpMC
Subject: [Buildroot] [PATCH 4/4] package/intel-mediadriver: bump version to
 24.3.3
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
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 109d90c428..16f02c1f12 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98702b946edb24454a3b780f8dd5b3091c6c795478467c1c00fe4d16c4371291  intel-media-24.3.1.tar.gz
+sha256  5eb35a1dd601c75ccc3af3c5b21acc82b245ae79ac8d7264f99215be8d064194  intel-media-24.3.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 5b802e32e1..3424d7168e 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.3.1
+INTEL_MEDIADRIVER_VERSION = 24.3.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
