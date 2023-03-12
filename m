Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AEAC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 14:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FF840376;
	Sun, 12 Mar 2023 14:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34FF840376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75cqGViPbtRE; Sun, 12 Mar 2023 14:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E79740283;
	Sun, 12 Mar 2023 14:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E79740283
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1131BF868
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3A6340522
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A6340522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48m-OFhYxgvF for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 14:49:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB1814051D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1814051D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2B8D86F22; Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 15:48:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f388f0b4ca276bdcddd244454811382d447b383
X-Git-Newrev: b9a062b354953f3fbfee702bb5b5007598299925
X-Patchwork-Hint: ignore
Message-Id: <20230312144943.D2B8D86F22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: link with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9a062b354953f3fbfee702bb5b5007598299925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9eb9a92871622472b8f9eb3797aadd3651fc78a4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index d2fa47d39a..3fd2ef257e 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -20,6 +20,10 @@ RSYNC_CONF_OPTS = \
 	--disable-roll-simd \
 	--disable-md5-asm
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+RSYNC_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
