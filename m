Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FF2EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 05:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A8D24057F;
	Mon, 26 Jun 2023 05:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A8D24057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBUbqTaVaCwd; Mon, 26 Jun 2023 05:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94BCE4055E;
	Mon, 26 Jun 2023 05:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94BCE4055E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA171BF392
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 05:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7486D82012
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 05:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7486D82012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwiDLfoOVglc for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 05:46:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C14738200D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C14738200D
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 05:46:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A894BA4C07E7;
 Mon, 26 Jun 2023 07:46:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47786)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDf3s-0006cZ-1D;
 Mon, 26 Jun 2023 07:46:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 07:46:52 +0200
Message-Id: <20230626054652.661940-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687758412;
 bh=vB9faj7OsXwISWe/aQnzx4QOuwqd3H5WFEcar+QMb+g=;
 h=From:To:Cc:Subject:Date:From;
 b=SORI5wkZM9oYg8uZb1KhBOfrXTZWLq8Hoi1tpsfLc8QYDl0t1ZknpDy2njdHrf/Rh
 63ZTTiT01DlFo8OgbZWfQo5ZZwrgGYPfM/p5cPRA+0JvHn9mKxJiPaLVok5UlXRVXL
 J9T+Ndhp4K/efyU+BTe/k66gaJnXYhFP7FDiRrbbH23m72vrsyJw4I1m8b8wck87wj
 XTPAfWJCDTuKpe6+g8JyPVjLNO3ig9weCksz+yoK5/ojAO0rmGJN847GbP1s8mooZg
 KwDgzGeMcUvPp6MqLCZm2VMvbJiQZ5osJ+n8moFJsP5HVqU6uPKbdj4+izQjPIURCH
 2iiVFz8PC/CmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SORI5wkZ
Subject: [Buildroot] [PATCH 1/1] package/petitboot: fix install
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
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

buildroot commit 4c8ab13b960edcd290ea5ca7a7e739cb993fb863 added a link
of /usr/sbin/pb-udhcpc in
$(TARGET_DIR)/usr/share/udhcpc/default.script.d/ without creating that
directory first.

Fixes:
http://autobuild.buildroot.net/results/778/77802098355dd99a9e7e6d9178f900a9a8fe72a3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/petitboot/petitboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 4d56b73938..8b4c14207e 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -55,6 +55,7 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
 	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 endef
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
