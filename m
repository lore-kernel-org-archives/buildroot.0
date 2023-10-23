Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC56AC25B45
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82437423EE;
	Mon, 23 Oct 2023 17:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82437423EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpExipwM92YL; Mon, 23 Oct 2023 17:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6E342275;
	Mon, 23 Oct 2023 17:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6E342275
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46F131BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BDB941802
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BDB941802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vfveSP8FtPA for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E8A40012
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11E8A40012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F015B85E89; Mon, 23 Oct 2023 17:27:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 19:17:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10e644996474158f2ea700452ba8714a7401a2d6
X-Git-Newrev: b3dd46344251f822560624873a569c0a3e5ceb13
X-Patchwork-Hint: ignore
Message-Id: <20231023172716.F015B85E89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: move related code together
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3dd46344251f822560624873a569c0a3e5ceb13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit d31db334c3ad (opkg: Add gnupg signature checking support.),
the macro definition for the hook, and the hook assignment, got
separated by the then-newly introduced GPG handling.

Move the macro definition closer to the hook assignment. Since this is
a post-install hook, it is but logical that it comes further down in
the .mk file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 9b1ffb3c74..e167ba4fc4 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -12,11 +12,6 @@ OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPTS = --disable-curl --disable-zstd
 
-# Ensure directory for lockfile exists
-define OPKG_CREATE_LOCKDIR
-	mkdir -p $(TARGET_DIR)/usr/lib/opkg
-endef
-
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
 OPKG_CONF_ENV += \
@@ -27,6 +22,10 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+# Ensure directory for lockfile exists
+define OPKG_CREATE_LOCKDIR
+	mkdir -p $(TARGET_DIR)/usr/lib/opkg
+endef
 OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
