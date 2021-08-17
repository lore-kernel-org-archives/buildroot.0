Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD40C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5513E60FBF
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5513E60FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E5F607F8;
	Tue, 17 Aug 2021 08:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqaX3NVo8HCj; Tue, 17 Aug 2021 08:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2F6D607FB;
	Tue, 17 Aug 2021 08:40:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9521BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B040402B4
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p30HsSWwhOsO for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97083400FC
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:51 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id B655A1BF20A;
 Tue, 17 Aug 2021 08:39:48 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:19 +0200
Message-Id: <20210817083930.3718711-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 05/16] qt5: Fix sporadic build failure during
 top-level parallel build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Andreas Naumann <anaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Andreas Naumann <anaumann@ultratronik.de>

When using top level parallel build, independent qt5 packages may be
built in parallel. Because of their staging dirs being hardlinked, they
all use the same qt.conf file to manipulate during configure, while
another qt5 package might already use it. This leads to weird build failures
because the folders qmake is using are diverted in erratic ways.
Fix this by actually recreating a non-shared qt.conf file for every package.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v3 series

This patch was previously send by Andreas Naumann.
https://lore.kernel.org/buildroot/20210623083927.8278-1-anaumann@ultratronik.de/
https://lore.kernel.org/buildroot/b1d0c5a5-f76f-e38e-0257-1300f6a30eab@andin.de/
As this patch makes sense in this series, it was integrated in this v3 version.

 package/qt5/qt5.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index db6ccd2b42..3ffb7b0063 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -15,6 +15,7 @@ include $(sort $(wildcard package/qt5/*/*.mk))
 # compiled into the Qt library. We need it to make "qmake" relocatable and
 # tweak the per-package install pathes
 define QT5_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
 	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
 		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
