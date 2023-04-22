Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0298FC6FD18
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 20:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73C183B28;
	Sat, 22 Apr 2023 20:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73C183B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6xnYx1KexL3; Sat, 22 Apr 2023 20:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F046283B42;
	Sat, 22 Apr 2023 20:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F046283B42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6C2E1C2B8D
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 20:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFFA561035
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 20:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFFA561035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTvr0fVle369 for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 20:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5E1861008
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 20:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E1861008
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9206A83DBB; Sat, 22 Apr 2023 20:06:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 21:59:35 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d9c4e693a13f1d349e4a6c66dd39fa1f59f63b74
X-Git-Newrev: b649f233eafc8c7e610f51ee817c605aaaf4cb20
X-Patchwork-Hint: ignore
Message-Id: <20230422200643.9206A83DBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mdadm: install
 udev rules
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

commit: https://git.buildroot.net/buildroot/commit/?id=b649f233eafc8c7e610f51ee817c605aaaf4cb20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

mdadm contains various udev rules to manage RAID assembly and create
symlinks, install them if udev (or equivalent) is enabled.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
[Arnout: use MDADM_INSTALL_TARGET_OPTS for install-bin as well]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0385719706433fa9aa560c775d46179b42c9080c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
