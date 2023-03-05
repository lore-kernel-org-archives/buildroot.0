Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8D1C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 225F840A00;
	Sun,  5 Mar 2023 17:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225F840A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doraN3zi2Pel; Sun,  5 Mar 2023 17:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 248DF410DC;
	Sun,  5 Mar 2023 17:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 248DF410DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6421BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1280960E1D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1280960E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FSWYrzIIjOR for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C55660BE0
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C55660BE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D14386561; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:23:24 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9f019825b801223d654c814cc8e987ef803291f8
X-Git-Newrev: 8c0a59f6fe8a7d39c7ea5c3a92d3acd65337e292
X-Patchwork-Hint: ignore
Message-Id: <20230305174058.0D14386561@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/opensbi: fix build
 with empty OPENSBI_PLAT
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c0a59f6fe8a7d39c7ea5c3a92d3acd65337e292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure when OPENSBI_PLAT is empty raised since
commit 9b5b7165deb91bad3cdb1ea0dd8f940eff75f3a9:

/usr/bin/install -m 0644 -D /nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin /nvmedata/autobuild/instance-4/output-1/images/fw_jump.bin
/usr/bin/install: cannot stat '/nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/8033327f090e4a3d84a7fce1f62b14fdf89dbd89

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd061466f90e3f17d47d4e1641590d60c07a6cac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/opensbi/opensbi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 8e055633a8..c99dc8f674 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -70,6 +70,7 @@ OPENSBI_INSTALL_IMAGES = YES
 OPENSBI_FW_IMAGES += payload
 endif
 
+ifneq ($(OPENSBI_PLAT),)
 define OPENSBI_INSTALL_IMAGES_CMDS
 	$(foreach f,$(OPENSBI_FW_IMAGES),\
 		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).bin \
@@ -78,6 +79,7 @@ define OPENSBI_INSTALL_IMAGES_CMDS
 			$(BINARIES_DIR)/fw_$(f).elf
 	)
 endef
+endif
 
 # libsbi.a is not a library meant to be linked in user-space code, but
 # with bare metal code, which is why we don't install it in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
