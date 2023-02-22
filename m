Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD37C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 161D9410B3;
	Wed, 22 Feb 2023 14:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 161D9410B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piJjpmCwplru; Wed, 22 Feb 2023 14:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D1C24107F;
	Wed, 22 Feb 2023 14:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1C24107F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C9CA1BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B0C60888
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B0C60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7qLBJylbn0S for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:55:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B074D607C7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B074D607C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0657866EE; Wed, 22 Feb 2023 14:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:55:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d868d09d3a0c0db2c5112964139e5ecae8b1da51
X-Git-Newrev: bd061466f90e3f17d47d4e1641590d60c07a6cac
X-Patchwork-Hint: ignore
Message-Id: <20230222145543.A0657866EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: fix build with empty
 OPENSBI_PLAT
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd061466f90e3f17d47d4e1641590d60c07a6cac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure when OPENSBI_PLAT is empty raised since
commit 9b5b7165deb91bad3cdb1ea0dd8f940eff75f3a9:

/usr/bin/install -m 0644 -D /nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin /nvmedata/autobuild/instance-4/output-1/images/fw_jump.bin
/usr/bin/install: cannot stat '/nvmedata/autobuild/instance-4/output-1/build/opensbi-0.9/build/platform//firmware/fw_jump.bin': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/8033327f090e4a3d84a7fce1f62b14fdf89dbd89

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/opensbi/opensbi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 06ec87b2c3..dd113a0bf8 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -71,6 +71,7 @@ OPENSBI_INSTALL_IMAGES = YES
 OPENSBI_FW_IMAGES += payload
 endif
 
+ifneq ($(OPENSBI_PLAT),)
 define OPENSBI_INSTALL_IMAGES_CMDS
 	$(foreach f,$(OPENSBI_FW_IMAGES),\
 		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).bin \
@@ -79,6 +80,7 @@ define OPENSBI_INSTALL_IMAGES_CMDS
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
