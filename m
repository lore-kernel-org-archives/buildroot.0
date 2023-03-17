Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC2FC7618A
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF03241578;
	Fri, 17 Mar 2023 08:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF03241578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zc0ZiYUaDLbF; Fri, 17 Mar 2023 08:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8721415D3;
	Fri, 17 Mar 2023 08:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8721415D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED29A1BF276
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D86423BA
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D86423BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhM94HNoIsMd for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 206DD408BB
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 206DD408BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D8F1874D3; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:31:29 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0e760462d8de2c6273e3a96f2241ac48e243b015
X-Git-Newrev: 7be1347a59583ab2c24ad7dc8e0a5e10070a898e
X-Patchwork-Hint: ignore
Message-Id: <20230317083633.0D8F1874D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rsync: link with
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

commit: https://git.buildroot.net/buildroot/commit/?id=7be1347a59583ab2c24ad7dc8e0a5e10070a898e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
index 8c7ad462ac..7a01b2a48f 100644
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
