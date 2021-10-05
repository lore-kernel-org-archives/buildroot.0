Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162FDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:59:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75BC861502
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75BC861502
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C9240592;
	Tue,  5 Oct 2021 13:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQExtQ_se8qh; Tue,  5 Oct 2021 13:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A679540652;
	Tue,  5 Oct 2021 13:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C474E1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4BDA838C9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hljMi6RnKLxb for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 13:58:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC348319F
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 13:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 412449000C; Tue,  5 Oct 2021 13:56:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 15:42:55 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 1e6ca22285a966948be74b02818ab69c4869d816
X-Git-Newrev: e5131f94af55dba3f8fbb9d14a061901c5f96abb
X-Patchwork-Hint: ignore
Message-Id: <20211005135625.412449000C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] fs/ext2: fix namespace
 for variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5131f94af55dba3f8fbb9d14a061901c5f96abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

In filesystems, variables must be prefixed with ROOTFS_, to avoid
ckashing with packages of the same name.

We do not have a package named 'ext2', so we currently have no clash,
but it is still better that the variables be properly namespaced.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit db7d78614098fcab204a00bc767ec509ae633ca6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ext2/ext2.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 74c99bd7b1..0b797f315f 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,32 +4,32 @@
 #
 ################################################################################
 
-EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
-ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(EXT2_SIZE),y-)
+ROOTFS_EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(ROOTFS_EXT2_SIZE),y-)
 $(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
 endif
 
-EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
+ROOTFS_EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
-EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
+ROOTFS_EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
-EXT2_OPTS = \
+ROOTFS_EXT2_OPTS = \
 	-d $(TARGET_DIR) \
 	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-L "$(EXT2_LABEL)" \
-	$(EXT2_MKFS_OPTS)
+	$(ROOTFS_EXT2_MKFS_OPTS)
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
 	rm -f $@
-	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
-		"$(EXT2_SIZE)" \
+	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(ROOTFS_EXT2_OPTS) $@ \
+		"$(ROOTFS_EXT2_SIZE)" \
 	|| { ret=$$?; \
 	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)" 1>&2; \
 	     exit $$ret; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
