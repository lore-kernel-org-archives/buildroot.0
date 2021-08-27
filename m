Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F30C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:55:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16AE60F4F
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C16AE60F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B4C427EA;
	Fri, 27 Aug 2021 20:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Has0lti6Ixaa; Fri, 27 Aug 2021 20:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09486427E2;
	Fri, 27 Aug 2021 20:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBB491BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB21D4029F
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE5J39q9Lhqw for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 20:55:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF8BC4028E
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 20:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 06F388E9CE; Fri, 27 Aug 2021 20:54:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 22:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f9d65fb460b030597df21bbff94d9cbcb36d321
X-Git-Newrev: 3830b8441db0b9d9765b1c27e6b6008b88e83707
X-Patchwork-Hint: ignore
Message-Id: <20210827205420.06F388E9CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: make ubihealthd independent
 of ubifs
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

commit: https://git.buildroot.net/buildroot/commit/?id=3830b8441db0b9d9765b1c27e6b6008b88e83707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2.1.3 ubihealthd can be enabled without of ubifs-utils.

This also fixes usability of enabling BR2_PACKAGE_MTD_UBIHEALTHD.
BR2_PACKAGE_MTD_UBIFS_UTILS is a blind option. The only way to enable it
is to enable BR2_PACKAGE_MTD_MKFSUBIFS that selects it. ubihealthd
dependency on BR2_PACKAGE_MTD_UBIFS_UTILS makes enabling it unintuitive.

Cc: Markus Mayer <mmayer@broadcom.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/Config.in | 1 -
 package/mtd/mtd.mk    | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 57ad01971d..d0ca3ba663 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -146,7 +146,6 @@ config BR2_PACKAGE_MTD_UBIFORMAT
 config BR2_PACKAGE_MTD_UBIHEALTHD
 	bool "ubihealthd"
 	default y
-	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 
 config BR2_PACKAGE_MTD_UBIMKVOL
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index a37594b164..6385b9ee0a 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -40,6 +40,12 @@ else
 MTD_CONF_OPTS += --without-ubifs
 endif
 
+ifeq ($(BR2_PACKAGE_MTD_UBIHEALTHD),y)
+MTD_CONF_OPTS += --enable-ubihealthd
+else
+MTD_CONF_OPTS += --disable-ubihealthd
+endif
+
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
 MTD_CONF_OPTS += --enable-tests --enable-install-tests
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
