Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FD5C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 16:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDA1607A1;
	Wed,  9 Aug 2023 16:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDA1607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls-S3bPq3Mtz; Wed,  9 Aug 2023 16:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE816073F;
	Wed,  9 Aug 2023 16:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE816073F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDBED1BF5A3
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 16:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A98656073E
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 16:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98656073E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5gqu1SQGdZb for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 16:53:22 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F33860F3F
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 16:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F33860F3F
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A339D352BD78; Wed,  9 Aug 2023 18:53:18 +0200 (CEST)
Date: Wed, 9 Aug 2023 18:53:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNPEfiHai0qCigGR@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691599998; bh=Mo8h+nWUmcEls1e6Ssez62tqtKf+4mewOANySI3nvJI=;
 h=Date:From:To:Subject:From;
 b=hJAjTvH3HSFYrxGzILrpSuPb6tpsoTs6fC0dp0Ze2qr0vzkq2HH7bLL9RsxvnaEvd
 c4EcQdGH5RYffSV0+cMVXdxKI+nl6jLBxr9IIWo/boK2CLcztCikYihJfWb142Db/2
 IdsndyYiHIUCfs/cA/Rkze45Eyi7QNp5LFUdRuopf9sTmnosAsCNonR9VNXTo1R39u
 lt6XpA1SFB2P2Bk90l/Dk2EXSWJsLg+cJCsMgUISaCkQgwOBzvwhP+Vn9VvUfl/IN7
 9HIGWOrJf8c1KrmYXXYiUxPib7rtDWYXF4cvAMcobKwJQ8cN8v5lcfYGS++WMXaIno
 /4oFL76aXeQjQ==
Subject: [Buildroot] [PATCH] package/batman-adv: update to 2023.1
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

Older Batman-adv versions fail to build with kernel 6.4.x
with following error message:
bat_iv_ogm.c:283:18: error: implicit declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'? [-Werror=implicit-function-declaration]

prandom_u32_max got removed in commit 3c202d14a9d73fb63c3dccb18feac5618c21e1c4
from the Linux kernel.

Fixes:
 - http://autobuild.buildroot.net/results/205/2055ac3805d1941c148f1681a224570055dd83cd

For other changes in this release, see:
https://www.open-mesh.org/news/112

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/batman-adv/batman-adv.hash | 6 +++---
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 14a92c231a..6996d41561 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,7 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2022.2/batman-adv-2022.2.tar.gz.sha1
-sha1  e1829e10fc37ea674a20cb9ba1d6c1483042fbfa  batman-adv-2022.2.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2023.1.tar.gz.sha1
+sha1  e3d6e8d4db772156d7ad021b9a166832633a2ea5  batman-adv-2023.1.tar.gz
 
 # Hash for license files
-sha256  218ffb534fead1c9b5b0d90ec1b2fba688209cdf00e861bece1cbf469fe69953  batman-adv-2022.3.tar.gz
+sha256  f46a7286660a5ec3506a1be7ef60b471c51ac70550597d598040479ab7b936b8  batman-adv-2022.3.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 75b8292ee1..5b50572d11 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2022.3
+BATMAN_ADV_VERSION = 2023.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
