Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A8EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 11:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11BB960B10;
	Sat,  8 Jul 2023 11:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11BB960B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoZ_xw-LsgBo; Sat,  8 Jul 2023 11:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C51360B03;
	Sat,  8 Jul 2023 11:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C51360B03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7E81BF83B
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 11:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37D85400A6
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 11:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37D85400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emFogVDaOehS for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 11:35:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6542F40025
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6542F40025
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 11:35:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 872EFA4C03A4;
 Sat,  8 Jul 2023 13:35:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38676)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qI6Dy-0004KR-0u;
 Sat, 08 Jul 2023 13:35:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 13:35:38 +0200
Message-Id: <20230708113538.927704-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688816138;
 bh=0lm3/3BfoQqK5NLVbe3W9rtd94xnEJp0/TAxyf6Bth8=;
 h=From:To:Cc:Subject:Date:From;
 b=OuY7j33HpDMaMW5j/a/e/EYbYisXyKBgyfUlBsKFNbx4ZT/DxnQ/dK6Oo0WSyseuw
 vNCVEj9xVSAINWRnIcID2f4bRVeE3ZumPYmAcW+4GwwnACdGo/KpW+LHMAx6hl3t3P
 xsVjWnFNeIJFL0KG8/ELXlVMfITmBcc+6C2vLmkC4/bVqWYiuzE6e53H4FIbltKatz
 k0LM7zOwzexJ0PO4NZ0dlE0vIwS3419HUtpcdpEIODV64dxrPskUpxC6mzqOGugjEE
 K9BVIDLDDdXCE/XxL9WCmZcogeQ5BBtygwyRM2pCYrfw2cQrQzenjxJ2c1V+Ws7aGB
 sSE/vX069+z4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=OuY7j33H
Subject: [Buildroot] [PATCH 1/1] package/dfu-programmer: link with -latomic
 if needed
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

Fixes:
http://autobuild.buildroot.net/results/e2b/e2b813fdcbb3862366609affe88551c3036b21b8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dfu-programmer/dfu-programmer.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dfu-programmer/dfu-programmer.mk b/package/dfu-programmer/dfu-programmer.mk
index 3b1589125c..707e143eb3 100644
--- a/package/dfu-programmer/dfu-programmer.mk
+++ b/package/dfu-programmer/dfu-programmer.mk
@@ -18,4 +18,8 @@ endef
 
 DFU_PROGRAMMER_POST_PATCH_HOOKS == DFU_PROGRAMMER_ADD_MISSING_FILE
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DFU_PROGRAMMER_CONF_OPTS += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
