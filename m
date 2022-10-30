Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D074C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BDF60A97;
	Sun, 30 Oct 2022 20:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BDF60A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6WBi1idBZcpq; Sun, 30 Oct 2022 20:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8026F608A5;
	Sun, 30 Oct 2022 20:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8026F608A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF061BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C64402C4
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C64402C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_86lprgysRW for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:37:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9981D402B9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9981D402B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83ED487670; Sun, 30 Oct 2022 20:37:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:36:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad62fa3acb4faff72385e841af700f09985ce07e
X-Git-Newrev: 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4
X-Patchwork-Hint: ignore
Message-Id: <20221030203754.83ED487670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: drop dbus check
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 6f5f6bc dbus is selected when iwd is selected.
It is only a runtime dependency, so drop the build
dependency.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/iwd.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 297e1fabe9..002988cf33 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -15,16 +15,11 @@ IWD_SELINUX_MODULES = networkmanager
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-	--enable-external-ell
+	--enable-external-ell \
+	--enable-dbus-policy \
+	--with-dbus-datadir=/usr/share
 IWD_DEPENDENCIES = ell
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
-IWD_DEPENDENCIES += dbus
-else
-IWD_CONF_OPTS += --disable-dbus-policy
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
 IWD_LICENSE += , GPL-3.0+ (client)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
