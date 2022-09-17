Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE35C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87B824105B;
	Sat, 17 Sep 2022 13:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B824105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoQdxaOl4ZuW; Sat, 17 Sep 2022 13:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9843C405D1;
	Sat, 17 Sep 2022 13:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9843C405D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA121BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D968F405D1
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D968F405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slhYrbGtVqWC for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FF0940AA8
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FF0940AA8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D24184337; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac4d85b467e39fc675de5cb66ed0ed84a24baa09
X-Git-Newrev: 76d29419a7b17276755b7f75ef60d0a5110be95c
X-Patchwork-Hint: ignore
Message-Id: <20220917134415.0D24184337@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: support libedit cli
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76d29419a7b17276755b7f75ef60d0a5110be95c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libedit CLI implementation is supported since commit 9420423900a2
("cli: add libedit support"), nftables v0.9.8. There's an important fix
for Buildroot in v1.0.2, commit 3847fccf0045 ("cli: remove #include
<editline/history.h>").

Also in nftables v1.0.1, libedit/editline cli implementation is made the
default implementation so let's favor libedit implementation over
readline and linenoise if its package is enabled in Buildroot.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
