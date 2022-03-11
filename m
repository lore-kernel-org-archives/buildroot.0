Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED93DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 615868411D;
	Fri, 11 Mar 2022 17:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZE7x_CAoNTZ; Fri, 11 Mar 2022 17:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA9D8403D;
	Fri, 11 Mar 2022 17:30:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1A7A1BF339
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 17:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88FF9400AF
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 17:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4ZJcpQVET-x for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 17:29:58 +0000 (UTC)
X-Greylist: delayed 00:16:29 by SQLgrey-1.8.0
Received: from hetzy.fluff.org (test-v6.fluff.org [IPv6:2a01:4f8:222:2004::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 767C540018
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 17:29:58 +0000 (UTC)
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1nSipR-00034a-9q; Fri, 11 Mar 2022 17:13:25 +0000
Date: Fri, 11 Mar 2022 17:13:25 +0000
From: Ben Dooks <ben@fluff.org>
To: buildroot@buildroot.org
Message-ID: <20220311171325.jwcww5qb7ao5vnpy@hetzy.fluff.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Subject: [Buildroot] error during cpio build failing to rm
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm getting the following error with upstream buildroot:

rm: refusing to remove '.' or '..' directory: skipping '/home/ben/project/buildrot/output/build/buildroot-fs/cpio/target/run/..'
rm: refusing to remove '.' or '..' directory: skipping '/home/ben/project/buildrot/output/build/buildroot-fs/cpio/target/tmp/..'
make: *** [fs/cpio/cpio.mk:74: /home/ben/project/buildroot/output/images/rootfs.c

I've temprarily fixed this with:

diff --git a/fs/common.mk b/fs/common.mk
index 45beb5ae7b..6bb993663f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)

        $$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\

	                $$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
			-       echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
			+       echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/tmp/*" >> $$(FAKEROOT_SCRIPT)
			        $$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
				        $$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
					        $$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)

It looks like this was introduced in 5e78e7e97d772124f0d31653aca33731abe5b4db

Author: Norbert Lange <nolange79@gmail.com>
Date:   Sat Jun 6 00:48:57 2020 +0200

    fs: clean the volatile /run and /tmp directories
    

Any ideas on how to fix properly?


-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
