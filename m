Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E2C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 16:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E6C81CFE;
	Sun,  8 Jan 2023 16:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E6C81CFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gP8xDtTyw9-H; Sun,  8 Jan 2023 16:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A50981CE7;
	Sun,  8 Jan 2023 16:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A50981CE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB00B1BF304
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8509A60A6D
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8509A60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4aQC-f_Ddx4 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 16:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C05C660A68
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 16:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05C660A68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACB93876CF; Sun,  8 Jan 2023 16:10:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 17:03:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d5fd84496ac0ec65e7aed73a9386ab62f2a2c19
X-Git-Newrev: 680f28af58364f4152f3d9b582b312538fa0e500
X-Patchwork-Hint: ignore
Message-Id: <20230108161015.ACB93876CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: impersonate runc
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

commit: https://git.buildroot.net/buildroot/commit/?id=680f28af58364f4152f3d9b582b312538fa0e500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crun is a drop-in replacement for runc, so we can use the former to
impersonate the latter when it is not enabled.

To do so, we create a runc symlink pointing to crun, when runc is not
enabled.

See: https://github.com/containerd/containerd/discussions/6162

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Christian Stewart <christian@paral.in>
[yann.morin.1998@free.fr: split into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crun/crun.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index fd8bfb0981..ddb96a0b33 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -44,4 +44,11 @@ else
 CRUN_CONF_OPTS += --disable-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_RUNC),)
+define CRUN_CREATE_SYMLINK
+	ln -sf crun $(TARGET_DIR)/usr/bin/runc
+endef
+CRUN_POST_INSTALL_TARGET_HOOKS += CRUN_CREATE_SYMLINK
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
