Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9643EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1360D60EE9
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1360D60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB57607E9;
	Sat, 23 Oct 2021 22:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1a_11IJC_j1W; Sat, 23 Oct 2021 22:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163BD60781;
	Sat, 23 Oct 2021 22:01:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDFB1BF956
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3531860781
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvW1coPlPp3O for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51702606D5
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2D76788519; Sat, 23 Oct 2021 21:57:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 22:41:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 386d3c9a5a8292e05ed6f1bbf99c591f78a3be24
X-Git-Newrev: e077b3997c0a1aabe4bec8fe9068aaed5f899fca
X-Patchwork-Hint: ignore
Message-Id: <20211023215739.2D76788519@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: fix the installation of target
 tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=e077b3997c0a1aabe4bec8fe9068aaed5f899fca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools were not installed anymore since we move from autotools to
generic-package. This patch fixes their installation.

We have decided to implement the install tool process by running the "make
install" command for each tuple. This allows to have all different
platforms Grub modules installed in the target. The drawback is the
overwrite of Grub2 binaries tools during each "make install" command. This
drawback is absolutely not important as it happens in the same package. This is
the best option to avoid unnecessary and more complexity to this package.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index e01ebb2edb..a18696b6cc 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -195,5 +195,13 @@ define GRUB2_INSTALL_IMAGES_CMDS
 	)
 endef
 
+ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
+define GRUB2_INSTALL_TARGET_CMDS
+	$(foreach tuple, $(GRUB2_TUPLES-y), \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple) DESTDIR=$(TARGET_DIR) install
+	)
+endef
+endif
+
 $(eval $(generic-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
