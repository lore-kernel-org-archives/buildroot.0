Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBF0ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 10:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82636418E3;
	Mon, 12 Sep 2022 10:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82636418E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUTXEbP5gIug; Mon, 12 Sep 2022 10:04:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE0D540481;
	Mon, 12 Sep 2022 10:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE0D540481
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08DD71BF476
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8390E42587
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8390E42587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkQFefocSxI5 for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 10:03:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14A20425C5
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14A20425C5
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 10:03:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E8FA7CD1B1
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:56:12 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id C5EBA1C0002;
 Mon, 12 Sep 2022 09:56:06 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 12 Sep 2022 11:55:40 +0200
Message-Id: <20220912095540.957477-9-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912095540.957477-1-foss+buildroot@0leil.net>
References: <20220912095540.957477-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/nftables: support libedit cli
 implementation
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

libedit CLI implementation is supported since commit 9420423900a2
("cli: add libedit support"), nftables v0.9.8. There's an important fix
for Buildroot in v1.0.2, commit 3847fccf0045 ("cli: remove #include
<editline/history.h>").

Also in nftables v1.0.1, libedit/editline cli implementation is made the
default implementation so let's favor libedit implementation over
readline and linenoise if its package is enabled in Buildroot.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 package/nftables/nftables.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 56cef56524..9d60736d7f 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -20,7 +20,11 @@ else
 NFTABLES_CONF_OPTS += --with-mini-gmp
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+NFTABLES_CONF_OPTS += --with-cli=editline
+NFTABLES_DEPENDENCIES += libedit
+NFTABLES_LIBS += -lncurses
+else ifeq ($(BR2_PACKAGE_READLINE),y)
 NFTABLES_CONF_OPTS += --with-cli=readline
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
