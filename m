Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07794C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E4660AB3;
	Thu, 17 Feb 2022 20:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id criEY_PRely8; Thu, 17 Feb 2022 20:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D96AC60625;
	Thu, 17 Feb 2022 20:39:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D11461BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCDD141753
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llF18jyM-mdf for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:39:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4FC40442
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E1C76837A1; Thu, 17 Feb 2022 20:32:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:39:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 908e514de4919dfcde6891cb2395232e4f2846be
X-Git-Newrev: 9badf18d97485724fc99421ab28eddd512a675c7
X-Patchwork-Hint: ignore
Message-Id: <20220217203208.E1C76837A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: fix build failure with
 libgcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=9badf18d97485724fc99421ab28eddd512a675c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0001-Add-check-program-for-symver-attribute.patch, introduced
in 683e8387d05c, touches a autoconf relevant file which causes a
configure --recheck in the make step without proper CONF_ENV.

Running autoreconf prevents this.

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
[yann.morin.1998@free.fr: add comment,  add commit reference]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cryptsetup/cryptsetup.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 2e06047c56..bd8681d5ff 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -17,6 +17,10 @@ CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
+
+# 0001-Add-check-program-for-symver-attribute.patch
+CRYPTSETUP_AUTORECONF = YES
+
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
