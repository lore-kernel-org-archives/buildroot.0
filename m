Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EE5C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6048A406F3;
	Fri,  4 Jul 2025 16:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BVxlkv95Exj; Fri,  4 Jul 2025 16:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0FBF41198
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FBF41198;
	Fri,  4 Jul 2025 16:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3467912E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD4461630
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bWZd_dhKQnn for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 452E561624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 452E561624
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 452E561624
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65548A4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:55:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53648)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjhG-0000000069B-1IiC
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:55:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:55:33 +0200
Message-Id: <20250704165533.3705065-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648134;
 bh=vUaw4HZ555CwnuyhGQ/3f8U6Tbw6T7YKrufVbmfLxfo=;
 h=From:To:Subject:Date:From;
 b=y6DapeNDLlC1B1s2ayWn3wFmMQaJ4hlnTp1yv5NCSFvqQpLIWZ4bT4hna20+zmYcr
 c3LMzeQVo2H+Kn2cd3vYJkJTeLqqf15yz/D7ubODzgETt90EDqLWT/Ad3MyqUJPTmx
 0etqc+gBucBkpH5NhGhvq4ZDWZSeIAZegDE+mHdxwp1WIFzNkULrL5MNqlnxD9Wvdf
 W+GEtyAvrWercTliPjU1FtZN7+RKce6FlDlTG4HWHu8g4CRR+TCw5jw59Jo6ZC4Uu4
 YYd5oDuMsTBIWXRLWLU7OfVI707TNFJ8ic8FurUZoLlslWbjt+nTmZOT83dL1lqDga
 blIs7zlotjPxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=y6DapeND
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.15
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

Changelog:
https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 95cc14c490..b5cbc3d737 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  9338bb00e492878d3bbe3cd2894e60db35813634c208db0b20f5c7ee84da69b1  ethtool-6.14.tar.xz
+sha256  9477c365114d910120aaec5336a1d16196c833d8486f7c6da67bedef57880ade  ethtool-6.15.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 654fc401b7..4e60cadbf6 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.14
+ETHTOOL_VERSION = 6.15
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
