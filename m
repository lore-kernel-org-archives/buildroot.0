Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E5FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14687822E7;
	Mon, 20 Feb 2023 22:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14687822E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoOD3Y6Xa0de; Mon, 20 Feb 2023 22:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52AEC82301;
	Mon, 20 Feb 2023 22:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52AEC82301
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4161BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 838104171B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 838104171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpJMHSnS97nn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5AB3416DB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5AB3416DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A521086496; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:32:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 83a3744c73d5630ded3f85dc801fe3827ab82889
X-Git-Newrev: 9511fe9b1c8fbb797f50dde708f7aae50e6d6a46
X-Patchwork-Hint: ignore
Message-Id: <20230220205218.A521086496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rsync: add lz4 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9511fe9b1c8fbb797f50dde708f7aae50e6d6a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsync/rsync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 7a32c4f8b1..9c7824f575 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -19,7 +19,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-popt=no \
 	--disable-roll-simd \
 	--disable-openssl \
-	--disable-lz4 \
 	--disable-md5-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -28,6 +27,13 @@ else
 RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+RSYNC_DEPENDENCIES += lz4
+RSYNC_CONF_OPTS += --enable-lz4
+else
+RSYNC_CONF_OPTS += --disable-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_XXHASH),y)
 RSYNC_DEPENDENCIES += xxhash
 RSYNC_CONF_OPTS += --enable-xxhash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
