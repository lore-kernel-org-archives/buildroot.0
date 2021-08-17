Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB8DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:41:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FAE60F41
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63FAE60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD2360859;
	Tue, 17 Aug 2021 08:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzYQDNEOFjQB; Tue, 17 Aug 2021 08:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D69B060802;
	Tue, 17 Aug 2021 08:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83F491BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73B8A80E5A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WVCux8LRRjn for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E35F480C2B
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:52 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 81A601BF208;
 Tue, 17 Aug 2021 08:39:50 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:20 +0200
Message-Id: <20210817083930.3718711-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 06/16] package/pkg-qmake.mk: Move
 QT5_QT_CONF_FIXUP to post-prepare hook
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
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

QT5_QT_CONF_FIXUP tweaks files for per-package directory build.
This is typically the kind of operation expected to be in
post-prepare hook.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v3 series.
As said previously in
https://lore.kernel.org/buildroot/b1d0c5a5-f76f-e38e-0257-1300f6a30eab@andin.de/
This patch moves Qt5 fixup to <PKG>_POST_PREPARE_HOOKS (old <PKG>_PER_PACKAGE_TWEAK_HOOKS
mentioned in discussion).

 package/pkg-qmake.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index a77286fe3a..deb033c1d6 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -56,13 +56,14 @@ $(2)_DEPENDENCIES 		+= host-perl
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
+$(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
 #
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
-	$$(QT5_QT_CONF_FIXUP)
 	cd $$($(2)_BUILDDIR) && \
 	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
 endef
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
