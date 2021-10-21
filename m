Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C7CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 14:33:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AED460F50
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 14:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AED460F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2230C407E3;
	Thu, 21 Oct 2021 14:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVQRqzQqJDVf; Thu, 21 Oct 2021 14:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED1C407DC;
	Thu, 21 Oct 2021 14:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2FC31BF30E
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 14:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1400406D6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 14:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7thSSq3ulfr for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 14:33:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF6924022A
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 14:33:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0825F88279; Thu, 21 Oct 2021 14:29:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 16:31:31 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 3de74dc334abeab58f51e69d6de8feec9e9ba4c3
X-Git-Newrev: b8bc852f63a71f977a4eadd67e30d0a1242fc982
X-Patchwork-Hint: ignore
Message-Id: <20211021142955.0825F88279@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/edk2-platforms:
 fix installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8bc852f63a71f977a4eadd67e30d0a1242fc982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

There are currently three issues with the installation step:

 1. it does not ensure the parent destination directory exists before
    copying into it, so if /usr/share has not been created in the
    dependency chain of edk2-platforms, the installation fails, which
    may very well happen easily as edk2-plaforms has nothing in its
    dependency chain (except the toolchain et al.);

 2. all our dot-stampfiles and .files-list are also copied, as well as
    the Readme, license files, and maintainers file. All of those are
    useless on the target (and the .files-list introduce
    non-reproduciiblity);

 3. of a lesser importance, the construct to install, and specifically
    to reinstall, does not match what we usually do in Buildroot
    (removal of the directory to copy).

We fix all three in one fell swoop:

 1. create the destination directory if needed;
 2. copy just the directories with the actual platform descriptions

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dbf381c19932d0c9f27165e711f5899b3de44876)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edk2-platforms/edk2-platforms.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 47e6b1c51d..430791ae3e 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -15,8 +15,8 @@ EDK2_PLATFORMS_INSTALL_STAGING = YES
 # There is nothing to build for edk2-platforms. All we need to do is to copy
 # all description files to staging, for other packages to build with.
 define EDK2_PLATFORMS_INSTALL_STAGING_CMDS
-	rm -rf $(STAGING_DIR)/usr/share/edk2-platforms
-	cp -rf $(@D) $(STAGING_DIR)/usr/share/edk2-platforms
+	mkdir -p $(STAGING_DIR)/usr/share/edk2-platforms
+	cp -rf $(@D)/*/ $(STAGING_DIR)/usr/share/edk2-platforms/
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
