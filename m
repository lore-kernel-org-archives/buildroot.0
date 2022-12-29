Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B33FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A8314085B;
	Thu, 29 Dec 2022 09:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A8314085B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kom1q9HihO-H; Thu, 29 Dec 2022 09:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D6C4047D;
	Thu, 29 Dec 2022 09:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D6C4047D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 670F31BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB1104010F
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1104010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlkCD2n4-e-a for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBF7640584
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF7640584
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAB298705D; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:32:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9511fe9b1c8fbb797f50dde708f7aae50e6d6a46
X-Git-Newrev: 80fa5672da85a110e60be0d2143e85f9e08a0f4a
X-Patchwork-Hint: ignore
Message-Id: <20221229093420.CAB298705D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: add openssl support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
