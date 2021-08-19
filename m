Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342D6C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:31:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF4E60F4C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECF4E60F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C783C42712;
	Thu, 26 Aug 2021 22:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNUrnq2gsQOQ; Thu, 26 Aug 2021 22:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4839142715;
	Thu, 26 Aug 2021 22:31:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09EF01BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ECBC407AA
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HTu9eO-BQQq for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B718407BF
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F0F8A8DC52; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:50:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a380e058338b5fc006cb76544a4b080e52cc0f4b
X-Git-Newrev: da4d8fc407b57736e2746f236df43baa102b85a7
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.F0F8A8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/libshout:
 enable optional dependency for libressl"
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

commit: https://git.buildroot.net/buildroot/commit/?id=da4d8fc407b57736e2746f236df43baa102b85a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 46b8fb7500ecca65a79507318fd3052208559c09 indeed if
libressl is selected as the openssl provider, the BR2_PACKAGE_OPENSSL
conditition will always be used and the BR2_PACKAGE_LIBRESSL condition
will never be triggered. Moreover, libressl provides a pkg-config file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libshout/libshout.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 57d26390c5..4afb762de6 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -33,9 +33,6 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSHOUT_CONF_OPTS += --with-openssl
 LIBSHOUT_DEPENDENCIES += openssl
-else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-LIBSHOUT_CONF_OPTS += --with-openssl=$(STAGING_DIR)/lib
-LIBSHOUT_DEPENDENCIES += libressl
 else
 LIBSHOUT_CONF_OPTS += --without-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
