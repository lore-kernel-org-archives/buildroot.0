Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB53C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2092F60FA0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2092F60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7A481092;
	Tue, 17 Aug 2021 08:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNbk2jaNBr2l; Tue, 17 Aug 2021 08:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE19814B4;
	Tue, 17 Aug 2021 08:42:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68BE61BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58197607F8
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFugwoxJUBwL for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:40:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42BE607FB
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:40:20 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id E3E261BF203;
 Tue, 17 Aug 2021 08:40:17 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:26 +0200
Message-Id: <20210817083930.3718711-13-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 12/16] package/pkg-generic.mk: remove
 .files-final-rsync.before temporary file
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

Keeping the .files-final-rsync.before file between make invocations
was needed to ensure that this file will be present in case of
'make <pkg>_{reconfigure,rebuild,reinstall}' invocation.

The .files-final-rsync.before is now recreated on
<pkg>_{reconfigure,rebuild,reinstall} and we don't need to keep it
between make invocation.

This patch simply removes this file as soon as it is no longer needed.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

Changes v2 to v3:
None

 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fb219b8ec7..bb9f395f27 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -189,6 +189,7 @@ define pkg_final_rsync_after
 		$($(PKG)_DIR)/.files-final-rsync$(2).after \
 		| sed -r -e 's/^[^,]+,./- /' \
 		> $($(PKG)_DIR)/.files-final-rsync$(2).exclude_rsync
+	rm -f $($(PKG)_DIR)/.files-final-rsync$(2).before
 	rm -f $($(PKG)_DIR)/.files-final-rsync$(2).after
 endef
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
