Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE30BC6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 714514188B;
	Fri, 17 Mar 2023 08:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 714514188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i41LLUbqCnVG; Fri, 17 Mar 2023 08:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8D0418FD;
	Fri, 17 Mar 2023 08:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8D0418FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 193681BF97F
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E326401BE
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E326401BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V71Jd6d68s34 for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A62154184E
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A62154184E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80606874F4; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:33:50 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d9a6f6a6e8b7179fbeef2c7a7d7238c7e2ae20e6
X-Git-Newrev: bef793ae124c1843d5bfaa697d17559e5e713d43
X-Patchwork-Hint: ignore
Message-Id: <20230317083810.80606874F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsync: link with
 -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=bef793ae124c1843d5bfaa697d17559e5e713d43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
http://autobuild.buildroot.net/results/9eb9a92871622472b8f9eb3797aadd3651fc78a4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b9a062b354953f3fbfee702bb5b5007598299925)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 9dd66aeb8c..22584f6039 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -24,6 +24,10 @@ RSYNC_CONF_OPTS = \
 	--disable-lz4 \
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
