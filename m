Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D73EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 228FF402A0;
	Mon, 21 Aug 2023 13:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228FF402A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIrULKmKfTxW; Mon, 21 Aug 2023 13:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA7E40033;
	Mon, 21 Aug 2023 13:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA7E40033
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3DC1BF388
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6420460FE5
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6420460FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHyJApTnQOZt for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92B606059B
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B606059B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DC8385F90; Mon, 21 Aug 2023 13:02:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 14:59:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2298de68530283f329147f0da9c5acd039ff561c
X-Git-Newrev: 80b56887006cfba50833881dc31f045d494af185
X-Patchwork-Hint: ignore
Message-Id: <20230821130204.7DC8385F90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: use
 minimal.config for no MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=80b56887006cfba50833881dc31f045d494af185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

By default, when Busybox is enabled, it uses the
package/busybox/busybox.config configuration file, even on noMMU
configurations. As this default configuration enables the 'ash' shell
which isn't available for noMMU targets, Busybox falls back to
enabling the 'hush' shell, but without enabling a number of its
sub-options that are quite relevant. In particular, it doesn't enable
umask, which is used in our startup scripts.

In order to have a default configuration that is more sensible, this
commit changes the Busybox package to use
package/busybox/busybox-minimal.config by default for noMMU
configurations.

Signed-off-by: Jesse Taube <Mr-Bossman075@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 5e5c586762..3c2aa515f8 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_BUSYBOX
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
+	default "package/busybox/busybox-minimal.config" if !BR2_USE_MMU
 	default "package/busybox/busybox.config"
 	help
 	  Some people may wish to use their own modified BusyBox
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
