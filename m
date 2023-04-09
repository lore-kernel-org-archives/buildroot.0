Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C910C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B46AF4049A;
	Sun,  9 Apr 2023 13:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B46AF4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ft0600DefiAz; Sun,  9 Apr 2023 13:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC59404DF;
	Sun,  9 Apr 2023 13:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC59404DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1405B1C2E2E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E085D4168F
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E085D4168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpYh_l2szSMh for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:44:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F504168B
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F504168B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF37883AC8; Sun,  9 Apr 2023 13:44:56 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 15:42:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be44dcf6957210b88fb2591817bd76eba14ee7b0
X-Git-Newrev: 0385719706433fa9aa560c775d46179b42c9080c
X-Patchwork-Hint: ignore
Message-Id: <20230409134456.DF37883AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: install udev rules
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

commit: https://git.buildroot.net/buildroot/commit/?id=0385719706433fa9aa560c775d46179b42c9080c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mdadm contains various udev rules to manage RAID assembly and create
symlinks, install them if udev (or equivalent) is enabled.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
[Arnout: use MDADM_INSTALL_TARGET_OPTS for install-bin as well]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mdadm/mdadm.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 0a2eb4e5bd..c61937306a 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -21,12 +21,15 @@ MDADM_BUILD_OPTS = \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0
 
+MDADM_INSTALL_TARGET_OPTS = install-bin
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 MDADM_BUILD_OPTS += USE_PTHREADS=
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 MDADM_DEPENDENCIES += udev
+MDADM_INSTALL_TARGET_OPTS += install-udev
 else
 MDADM_CXFLAGS += -DNO_LIBUDEV
 endif
@@ -36,7 +39,7 @@ define MDADM_BUILD_CMDS
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(MDADM_INSTALL_TARGET_OPTS)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
