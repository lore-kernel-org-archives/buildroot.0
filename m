Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 21:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451DE4178D;
	Thu, 27 Jan 2022 21:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sP72mz6shXdC; Thu, 27 Jan 2022 21:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 766E0416B7;
	Thu, 27 Jan 2022 21:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BD4D1BF369
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 591E3416B7
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luyLSoUx6zSp for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 21:16:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D5F4160A
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 21:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1332682753; Thu, 27 Jan 2022 21:09:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 22:15:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f791221c8616bfa6d338ce6c287353395cc2c61a
X-Git-Newrev: 4edfb8fef84d64a62d14d485e7cead3ab9e0b8b5
X-Patchwork-Hint: ignore
Message-Id: <20220127210927.1332682753@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: remove libiberty from
 target install
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

commit: https://git.buildroot.net/buildroot/commit/?id=4edfb8fef84d64a62d14d485e7cead3ab9e0b8b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In BINUTILS_INSTALL_TARGET_CMDS (target!), libiberty is installed
to STAGING_DIR.

This is not necessary since libiberty is already unconditionally
installed to staging in BINUTILS_INSTALL_STAGING_CMDS. Furthermore
the presence of STAGING_DIR path in TARGET_CMDS is confusing and
incorrect.

Moreover libiberty is static only. Static libraries are only used at
build time, not at run time so we do not need to install libiberty in
target.

This commit removes the incorrect libiberty install in TARGET_CMDS and
adds a comment to clarify why we do not see libiberty installed on
target.

Signed-off-by: Jonathan Borne <jborne@kalray.eu>
[yann.morin.1998@free.fr:
  - reword comment, move it toward the _INSTALL_TARGET_CMDS
  - rewrap and slightly reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 13f61be035..8c4a1371ca 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -103,10 +103,10 @@ endef
 
 # If we don't want full binutils on target
 ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
+# libiberty is static-only, so it is only installed to staging, above.
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
