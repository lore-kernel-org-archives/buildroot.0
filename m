Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E64D2E9F1
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB94606B4;
	Mon, 11 Nov 2024 13:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOnW9GG_4XRm; Mon, 11 Nov 2024 13:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E68F606E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E68F606E8;
	Mon, 11 Nov 2024 13:37:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88776D8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70CE7401C9
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D57Y55ZctRw for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E6E440217
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E6E440217
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C34186073; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:35:08 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: eafb370e52e2d022987523c7f286cb6f47e90e45
X-Git-Newrev: 7eeb2c77ab66c46055914997669315215caeac25
X-Patchwork-Hint: ignore
Message-Id: <20241111133734.5C34186073@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/sysvinit: add
 version number to SYSVINIT_MAKE_OPTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=7eeb2c77ab66c46055914997669315215caeac25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Version environment variable VERSION=$(VERSION) is set in the top level
Makefile of the sysvinit:
$(MAKE) VERSION=$(VERSION) -C src $@

Build command SYSVINIT_BUILD_CMDS doesn't use the top level Makefile, but
src/Makefile instead without setting the VERSION variable, which leads to
undefined VERSION macro in src/init.c.

Add VERSION=$(SYSVINIT_VERSION) to SYSVINIT_MAKE_OPTS to make the VERSION
environment variable available in the src/Makefile.

Signed-off-by: Cody Green <cody@londelec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 954098b1423d3095112f49a6ac236ddb98236292)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/sysvinit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 49c92ec2ac..3a51483c9d 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,7 +11,7 @@ SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
 SYSVINIT_CPE_ID_VALID = YES
 
-SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
+SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR) VERSION=$(SYSVINIT_VERSION)
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSVINIT_DEPENDENCIES += libselinux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
