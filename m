Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CCCC53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 16:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E43440463;
	Sun,  8 Jan 2023 16:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E43440463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qkzn71tGXQf3; Sun,  8 Jan 2023 16:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 619E640120;
	Sun,  8 Jan 2023 16:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619E640120
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90F741BF304
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CCDE60A70
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CCDE60A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zS-hk3dDvF7 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 16:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C73B560A6D
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 16:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73B560A6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B65FA876D0; Sun,  8 Jan 2023 16:10:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 17:09:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 680f28af58364f4152f3d9b582b312538fa0e500
X-Git-Newrev: d0ecb9b2803b5b0b293acd7a5a6bba1ed1e3feab
X-Patchwork-Hint: ignore
Message-Id: <20230108161015.B65FA876D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: support crun as runtime
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0ecb9b2803b5b0b293acd7a5a6bba1ed1e3feab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crun is a drop-in replacement for runc. If crun is enabled, but runc is
not, we already install an impersonation symlink, so we do not need to
force runc if crun is enabled. Still, runc is the default if crun is not
enabled.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Christian Stewart <christian@paral.in>
[yann.morin.1998@free.fr: split into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/containerd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 0e3a55ef39..e69dd6768a 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
-	select BR2_PACKAGE_RUNC # runtime dependency
+	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
