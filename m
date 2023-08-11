Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AD1C001DE
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 01:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8CB841E08;
	Fri, 11 Aug 2023 01:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8CB841E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsKBD5MKN7RX; Fri, 11 Aug 2023 01:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C61041E10;
	Fri, 11 Aug 2023 01:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C61041E10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D70B31BF3C3
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 01:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6E7B60AB1
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 01:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E7B60AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcteVa3I-Hc4 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 01:40:05 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AD1B60AA6
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 01:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD1B60AA6
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A4562352BD31; Fri, 11 Aug 2023 03:40:00 +0200 (CEST)
Date: Fri, 11 Aug 2023 03:40:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNWRcJrlXwFFkUtG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691718000; bh=b8diHUHpTGDhKvP+enUz8sjUJ/cTXgJ4YS0uURr4DLA=;
 h=Date:From:To:Subject:From;
 b=HmR4M7v9q9d2iCaoB0SCPi5FrBvyX92IXPCJxd6z4jtflX7Ym7XL32OegeU8b1j4V
 sdUX+XYGGou+b36jRxxpRuAmx7PXDZmh7vBeQBhXGVNedO/K5eQqzJhB1Ap0qKqms1
 v4Zyuic2CkQC4cfHbylEeNdyX26h9Q7F9tUpq76ykvr5d/udgl2GQg2A1TFP7P5LKZ
 2gkhvFj6T2m/41+M6/8un9sVr5NMhcVIGikrEN7EgjAZL2BYQ7j2B/O3zJzDgQnBgT
 Lz4364Y7i+TLGsdvqTzgQentOuhglmIuGcXivAXI7jigukFrFRVByZfJNqv3R3+jn5
 wz+k7tTbQYTbQ==
Subject: [Buildroot] [PATCH v2] package/batman-adv: update to 2023.1
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
v1 -> v2:
 - move locally computed sha256 hash to the right place, mentioned
   by Thomas Petazzoni
---
 package/batman-adv/batman-adv.hash | 7 ++++---
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 14a92c231a..b95dfa34dd 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,8 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2022.2/batman-adv-2022.2.tar.gz.sha1
-sha1  e1829e10fc37ea674a20cb9ba1d6c1483042fbfa  batman-adv-2022.2.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2023.1.tar.gz.sha1
+sha1  e3d6e8d4db772156d7ad021b9a166832633a2ea5  batman-adv-2023.1.tar.gz
+# locally computed
+sha256  f46a7286660a5ec3506a1be7ef60b471c51ac70550597d598040479ab7b936b8  batman-adv-2022.3.tar.gz
 
 # Hash for license files
-sha256  218ffb534fead1c9b5b0d90ec1b2fba688209cdf00e861bece1cbf469fe69953  batman-adv-2022.3.tar.gz
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
