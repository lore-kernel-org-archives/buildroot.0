Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59B6C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76BA960E08
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76BA960E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A3B4256F;
	Sat, 28 Aug 2021 20:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoslYeHyY154; Sat, 28 Aug 2021 20:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916844257B;
	Sat, 28 Aug 2021 20:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6EB1BF95A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1503C8338B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrUuXT_c2QYW for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 20:17:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6951283339
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 20:17:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 439B0866A1; Sat, 28 Aug 2021 20:16:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 22:17:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d3ab39fe09b691550adafebc02dc566929808675
X-Git-Newrev: 8132216e0ecb1cd115ec9d1a211b967e5bda3054
X-Patchwork-Hint: ignore
Message-Id: <20210828201648.439B0866A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] qt5: Fix sporadic build
 failure during top-level parallel build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8132216e0ecb1cd115ec9d1a211b967e5bda3054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When using top level parallel build, independent qt5 packages may be
built in parallel. Because of their staging dirs being hardlinked, they
all use the same qt.conf file to manipulate during configure, while
another qt5 package might already use it. This leads to weird build failures
because the folders qmake is using are diverted in erratic ways.
Fix this by actually recreating a non-shared qt.conf file for every package.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
