Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A01CC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49C5181456;
	Mon, 20 Feb 2023 23:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C5181456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nX9RO2aGqxz; Mon, 20 Feb 2023 23:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A99081091;
	Mon, 20 Feb 2023 23:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A99081091
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52F0E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E883461ADA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E883461ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuTZZH65v3iR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C210561AAF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C210561AAF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B433D8648F; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:32:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9511fe9b1c8fbb797f50dde708f7aae50e6d6a46
X-Git-Newrev: 80fa5672da85a110e60be0d2143e85f9e08a0f4a
X-Patchwork-Hint: ignore
Message-Id: <20230220205218.B433D8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rsync: add openssl
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=80fa5672da85a110e60be0d2143e85f9e08a0f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsync/rsync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 9c7824f575..d2fa47d39a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -18,7 +18,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no \
 	--disable-roll-simd \
-	--disable-openssl \
 	--disable-md5-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -34,6 +33,13 @@ else
 RSYNC_CONF_OPTS += --disable-lz4
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RSYNC_DEPENDENCIES += openssl
+RSYNC_CONF_OPTS += --enable-openssl
+else
+RSYNC_CONF_OPTS += --disable-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_XXHASH),y)
 RSYNC_DEPENDENCIES += xxhash
 RSYNC_CONF_OPTS += --enable-xxhash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
