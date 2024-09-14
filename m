Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04793C021AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AA3605FE;
	Sat, 14 Sep 2024 18:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULfZhOrGsA88; Sat, 14 Sep 2024 18:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6D56076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6D56076D;
	Sat, 14 Sep 2024 18:50:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 837791BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7208B40600
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oebd4XRu-oZY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B454405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B454405FD
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B454405FD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:50:43 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pXqysjJrrqJRSpXqzsiMQ8; Sat, 14 Sep 2024 20:50:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:50:39 +0200
Message-Id: <20240914185039.2757610-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD9N6Wc5nYjFGhT+YhhEim64g+aOr8TIIxCXbMJ7OFq8UAnEHGI+aTvryXU5kUsiVhvzl0/tNqOrAVgIvhyQoF09DS+6Yl+zT5Z3z/MfRSey2CXBLCnw
 ha/OFywI/9t0uYeTH5pw6EFL7PISjP2dXc+rrhjdpm5KBmB9ggl//0pg0XNS7OihZ9U0ltJ9Cwx7Y6M3euzlC5/Cz2XwOarbfLPLWGf435NEwiBFEAqUykoq
 x+gUWE/DSZ7y55LUDFjTHfXkE3zFdCzdzixowu90Y/rsXHclsKMXKHKKc6glvqKsh/ArfndZz/SxyqJjhv7UZg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1726339841; bh=nYpBEDvBv8CvYfI+Xkd2zh2MyrcQsnelkyN6zcTdlEI=;
 h=From:To:Subject:Date:MIME-Version;
 b=mWXgp1QGVLiAA4HMSJbQVD93BpT6v3jhqe+Bts9vkzofUg9VV685KcUxAfCJzVfEL
 S8SzKMM5xkwLodZClJzPchHy8jzFpfWUL5QlPaO3YLCsZL0OKbf7No3X6bNNVZHx85
 kidso/r87jUsCgsxaoeSnT1Ydeixi6WEnovWrbVgcu2ci5KSTbNJgf6Dg47Pci0Zpb
 Z4JvRX+/V5ofmDMgaZL+iGYzfsARgluPQxA6PksGYnS6Eo8GqSfrvTEFqx4e2FBSGf
 5OX9By+XxakkMGRtgYrn9rsEb2ZOQQ5wTYD+/OJRAWVlkFfl9sTF7KW3qAJhaxp6lx
 qPlCfx/IjFPsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=mWXgp1QG
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.104
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1370b6ad0d..e92a6fee25 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_103_RTM/src/SHA256SUMS
-sha256  7b4ab657f772dc7520c46e8d481940b292dcfc6a4c90150a7c26672384cee962  nss-3.103.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_104_RTM/src/SHA256SUMS
+sha256  e2763223622d1e76b98a43030873856f248af0a41b03b2fa2ca06a91bc50ac8e  nss-3.104.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 06038c2e55..0fd9858647 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.103
+LIBNSS_VERSION = 3.104
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
