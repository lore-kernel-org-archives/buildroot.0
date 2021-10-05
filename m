Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFC7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:01:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F78E610A2
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F78E610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6088283D66;
	Tue,  5 Oct 2021 14:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPvvgfos1tTW; Tue,  5 Oct 2021 14:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A646E83D5C;
	Tue,  5 Oct 2021 14:01:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24D211BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2131E83D62
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INmgqUg7_tgP for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:01:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62F7683D5C
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A79BE9038E; Tue,  5 Oct 2021 13:58:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 15:42:31 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1e9392b8bbeaed86be74e628584e2bca4092c80b
X-Git-Newrev: 2fd8f5bd41bf79cdd688abfed683a30fceff59dc
X-Patchwork-Hint: ignore
Message-Id: <20211005135859.A79BE9038E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] fs/ext2: fix namespace
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fd8f5bd41bf79cdd688abfed683a30fceff59dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
