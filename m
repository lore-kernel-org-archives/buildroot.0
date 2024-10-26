Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097ECD10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEDEB40227;
	Sat, 26 Oct 2024 11:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJusr-MAZiYc; Sat, 26 Oct 2024 11:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9110E40260
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9110E40260;
	Sat, 26 Oct 2024 11:51:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF945C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D2CB40227
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbq_LmRHbuZ1 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 830354027E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 830354027E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CED7839C9; Sat, 26 Oct 2024 11:51:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:51:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fdaff237669eea5576ee8cd452661898ee7a846
X-Git-Newrev: 954098b1423d3095112f49a6ac236ddb98236292
X-Patchwork-Hint: ignore
Message-Id: <20241026115153.6CED7839C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysvinit: add version number to
 SYSVINIT_MAKE_OPTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=954098b1423d3095112f49a6ac236ddb98236292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/sysvinit/sysvinit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 7f37cea131..e05a6dee38 100644
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
