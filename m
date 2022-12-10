Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EBBC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D664EE54;
	Mon, 20 Feb 2023 22:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3D664EE54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3zTMwGtLzGW; Mon, 20 Feb 2023 22:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960514EE7F;
	Mon, 20 Feb 2023 22:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 960514EE7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 645E81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BBA761131
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBA761131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNUKyrWBOofc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3768B61149
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3768B61149
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 357D1828C8; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 16:40:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4744cfb703908eb027e479633508fc498fda667e
X-Git-Newrev: 712ee21876562b46947142f35dfe1186d88ad241
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.357D1828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/polkit: fix file
 permissions to match upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=712ee21876562b46947142f35dfe1186d88ad241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The permissions are now in sync with meson_post_install.py,
and debian.

Most importantly, polkit-agent-helper-1 is now setuid root,
but also the rules.d directories rather than their parents
are owned by polkitd.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/polkit/polkit.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 205d6aff4c..dab5d542eb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -52,9 +52,10 @@ define POLKIT_USERS
 endef
 
 define POLKIT_PERMISSIONS
-	/etc/polkit-1 r 750 root polkitd - - - - -
-	/usr/share/polkit-1 r 750 root polkitd - - - - -
+	/etc/polkit-1/rules.d d 700 polkitd root - - - - -
+	/usr/share/polkit-1/rules.d d 700 polkitd root - - - - -
 	/usr/bin/pkexec f 4755 root root - - - - -
+	/usr/lib/polkit-1/polkit-agent-helper-1 f 4755 root root - - - - -
 endef
 
 define POLKIT_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
