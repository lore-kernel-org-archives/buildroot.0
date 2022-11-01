Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B7C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C8F81463;
	Tue,  1 Nov 2022 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C8F81463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5mRzLpCaPN1; Tue,  1 Nov 2022 20:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10168128C;
	Tue,  1 Nov 2022 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10168128C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5D51BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6698D40514
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6698D40514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouXbT6lLtIDu for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:45:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C49240503
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C49240503
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AF6886F7A; Tue,  1 Nov 2022 20:45:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 21:44:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 135685977414fa840ee58bd5c72eec7a9e4b7164
X-Git-Newrev: d0b7e11b93577bee5611be959fb4f4a9858dae38
X-Patchwork-Hint: ignore
Message-Id: <20221101204540.8AF6886F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/cpio: don't fail systems without
 /dev/null
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0b7e11b93577bee5611be959fb4f4a9858dae38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We pass all our dracut configuration files via a config dir, but dracut
insists with having one config file. Because we do not want to have to
chose which file we pass (which would then have to be excluded from the
config dir), we just used an arbitrary empty file, and /dev/null seemed
to be a good candidate.

However, some build environments do not have a complete /dev, and may be
missing entries otherwise taken for granted, like /dev/null. This is
especially the case in constrained environments like containers.

Switch away from using /dev/null, and do create an actual empty file
that we can use as the dracut config file.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828364

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/cpio/cpio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index d671c337df..061f4a18f1 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -69,12 +69,13 @@ endif
 
 define ROOTFS_CPIO_CMD
 	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
+	touch $(ROOTFS_CPIO_DIR)/empty-config
 	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
 		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
 	)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
-		-c /dev/null \
+		-c $(ROOTFS_CPIO_DIR)/empty-config \
 		--confdir $(ROOTFS_CPIO_DIR)/confdir \
 		--sysroot $(TARGET_DIR) \
 		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
