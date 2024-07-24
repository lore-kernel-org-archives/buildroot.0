Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3CDC3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B41840242;
	Wed, 24 Jul 2024 20:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC0wAvi5EFyv; Wed, 24 Jul 2024 20:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 545E64052A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 545E64052A;
	Wed, 24 Jul 2024 20:04:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 961EC1BF283
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85F4C60704
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvx_sUkZyzs4 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADE7D606FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADE7D606FF
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:04:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8A8A87404; Wed, 24 Jul 2024 20:04:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 22:04:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3720250420d6b35bd217950d7a0648a0ecd0a2b5
X-Git-Newrev: 7d684de63f11195c024108d0da72650aafc31f73
X-Patchwork-Hint: ignore
Message-Id: <20240724200448.A8A8A87404@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless-regdb: fix crda build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d684de63f11195c024108d0da72650aafc31f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2024.07.04
in commit 213c5c0191be022671aa726902dd7dfef5899c6e and
https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/commit/?id=37dcea0e6e5effb4228fe385e906edba3cbee389:

/usr/bin/install -m 644 -D -T /home/buildroot/autobuild/instance-3/output-1/build/wireless-regdb-2024.07.04/sforshee.key.pub.pem /home/buildroot/autobuild/instance-3/output-1/target/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
/usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-3/output-1/build/wireless-regdb-2024.07.04/sforshee.key.pub.pem': No such file or directory

Fixes: 213c5c0191be022671aa726902dd7dfef5899c6e
 - http://autobuild.buildroot.org/results/9ace181735305cf8e29e0bbace1aec3796c32978

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireless-regdb/wireless-regdb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index b1ec4cb97e..fae21687de 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -14,8 +14,8 @@ ifeq ($(BR2_PACKAGE_CRDA),y)
 define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
-	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
-		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/wens.key.pub.pem \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/wens.key.pub.pem
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
