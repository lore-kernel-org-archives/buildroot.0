Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94692C001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 16:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F2260D58;
	Fri,  4 Aug 2023 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F2260D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzLiDXeRap-t; Fri,  4 Aug 2023 16:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F47660EE5;
	Fri,  4 Aug 2023 16:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F47660EE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D8C1BF27A
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 16:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FDF3835A6
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 16:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FDF3835A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPXywWZuuTuN for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 16:11:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8242680BC6
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 16:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8242680BC6
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02C79A4C068C;
 Fri,  4 Aug 2023 18:11:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58084)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRxOb-0001RP-2K;
 Fri, 04 Aug 2023 18:11:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 18:11:21 +0200
Message-Id: <20230804161121.1033315-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691165482;
 bh=5XGR4iLqFAmZKwBDs0DvsW5YNnCtfvMMiKhrjHyR+OQ=;
 h=From:To:Cc:Subject:Date:From;
 b=UJiCjXFJs93ftjPV/sY9pWJfr4/oBv3ZsDnmgAoeqA7VEcgJ+fcSSXSJmCJWm5WpV
 lnSGcqhZJdOH3eGnkSmQBSyvC4AFJt84oCwECJpNe8ak6btL+wkIzQ6QmB9//cRH2E
 Q+0IqnyDCHRz8GgZB4tUhmBnxBhp1a0sPZPa0avpAgsLhDTVWVjIQ5f58mZr9yEOcX
 5pqJV+QG5sqBEO1aDHsEP8fdR2QNLIluE6SZ1KHsKEYGSZ78jOBpN+nAKdw8E9w7Nf
 cy0VOJcuh+Ab44Pj6px7Q984DofcDjDG884lkAPF1xc5cBkBgzYfZT2N6YjD9kBWNn
 89iezvT9K/cbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UJiCjXFJ
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: needs __sync_*_8
 intrisics
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/992/99235aa2aca1afe031a088baebbd46057fe75fcd/

/home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:253:
 undefined reference to `__sync_lock_test_and_set_8'
/home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:81:
 undefined reference to `__sync_fetch_and_add_8'

The build error was introduced by the latest bump of tvheadend with
commit 67cbbbfe6e9632deacd0784bdbf51496ad76701d.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added comment about commit which introduced the build error (Thomas)

 package/tvheadend/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 3d21897c6d..fa06f345e9 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,14 +1,14 @@
 comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
 
 menuconfig BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
