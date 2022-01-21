Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29955C433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17B760EB0;
	Fri, 21 Jan 2022 15:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTjEXQsG1yn8; Fri, 21 Jan 2022 15:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A3660D7B;
	Fri, 21 Jan 2022 15:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59C4E1BF423
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4893A40231
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzc6qUT7OZ1X for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:43:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7611440207
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=83x7U1tlSihqX/oPPCjBioKCheM80pF9zZD/ZGIrjnU=; b=UdmUhxN+7Ab3GRuLBbHvZx0/Sm
 3d3UXinjbmvIrgPYesaGgoQ4EqMJvMhW27JpvDHtR8RkTkQu65p/VVfHPTyLCftWziWppeAuW4h6D
 /5sj8H7CqJ6/mBdoOZEDcYxPDFl8ShsSFg5EeVhb4MUdalRai1gPRK2rfRxtjcoBGlMjXbxA7gg5x
 5Cc8R7I7IRkMmEtPXT57O5JgGwtDK5n4eFGw5yaH1DvL7pHbwzhawtF4jRy6DSD2im815nFht4S1R
 uU0y2jKnXcYi4VM4TIUJs7vV4k7Hw6nLnLZJroQY+jIvckrIn/ctG7JsE1/dMp5O9NyPx4zIK8vgA
 z+coQnXw==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw43-000BCn-Pm; Fri, 21 Jan 2022 16:42:59 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id aa6b3313;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:32 +0200
Message-Id: <20220121154235.798255-5-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154235.798255-1-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 4/7] package/mariadb: use
 HOST_MARIADB_NINJA_OPTS
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, Samuel Martin <s.martin49@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace usage of HOST_MARIADB_MAKE_OPTS with HOST_MARIADB_NINJA_OPTS.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Tweeak to use CMake+Ninja infra.
---
 package/mariadb/mariadb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index db967ca3ed..d24174dd74 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -101,7 +101,7 @@ HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
 # -DIMPORT_EXECUTABLES=$(HOST_MARIADB_BUILDDIR)/import_executables.cmake
 # must then be passed to cmake during target build.
 # see also https://mariadb.com/kb/en/mariadb/cross-compiling-mariadb/
-HOST_MARIADB_MAKE_OPTS = import_executables
+HOST_MARIADB_NINJA_OPTS = import_executables
 
 MARIADB_CONF_OPTS += \
 	-DIMPORT_EXECUTABLES=$(HOST_MARIADB_BUILDDIR)/import_executables.cmake
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
