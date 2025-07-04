Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD95C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A108A411B1;
	Fri,  4 Jul 2025 16:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WQbULDuYLdM; Fri,  4 Jul 2025 16:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4EBE411B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EBE411B3;
	Fri,  4 Jul 2025 16:55:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD49512E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA31140A5A
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akYlyVimFTSy for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB39940AA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB39940AA2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB39940AA2
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE6E8A4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:55:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54738)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjhV-000000006Bv-3tz2
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:55:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:55:49 +0200
Message-Id: <20250704165549.3722250-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648150;
 bh=ovgWDO762K+cGvbzJhaQbkolgDUziJcAD442qa7VK6k=;
 h=From:To:Subject:Date:From;
 b=HHiOKuojOTVFJ3I0ITvs4bLHrq2ahzSjtFlTIJGYa5FekzgZbbDpX+jQci3BoYWUi
 In0WdP4RaT/nkampijuzbcf4jNPirV2n1LgaKJPUW87hPkQW8nkCAE7bZMzqr2/XTU
 GyTjgpIe/3NtWXOC8Hj4NrpdLelY/zOdIkCgnYOS82xkaZ5PVDmvNq2jyMqdwtyocg
 UzNTmd0RxJfO65e9Cn3GPbf7G5xzNR0EAJ9y1mR5+H8WUlHAPBG7KqT6Mc0s5TXd1Y
 0oGFnH3pplCd5v0BH4Wq5MMSk/QJp5c83lkYjz0zmECzBPy9Z0Xipg5AJ3CEf6YIgM
 p7aLyKlnuGFnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=HHiOKuoj
Subject: [Buildroot] [PATCH 1/1] package/libogg: bump version to 1.3.6
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
https://gitlab.xiph.org/xiph/ogg/-/blob/master/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libogg/libogg.hash | 2 +-
 package/libogg/libogg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index 9727c1cfaa..d6a775dda8 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,5 +1,5 @@
 # From https://www.xiph.org/downloads/
-sha256  c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705  libogg-1.3.5.tar.xz
+sha256  5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061  libogg-1.3.6.tar.xz
 
 # Hash for license file:
 sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 49f9c7b6ac..e23b7b9154 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.5
+LIBOGG_VERSION = 1.3.6
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
