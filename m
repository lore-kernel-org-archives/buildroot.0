Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C02AC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B404F351;
	Tue, 21 Feb 2023 00:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B404F351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBr82juj4Y3X; Tue, 21 Feb 2023 00:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A114F383;
	Tue, 21 Feb 2023 00:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A114F383
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAE591BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FF3F6FB40
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FF3F6FB40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOJgPISMDdDQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8267B6FB18
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8267B6FB18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A534828C8; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 17:03:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d5fd84496ac0ec65e7aed73a9386ab62f2a2c19
X-Git-Newrev: 680f28af58364f4152f3d9b582b312538fa0e500
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.7A534828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/crun: impersonate runc
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
