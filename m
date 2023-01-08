Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01222C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3BEE82BF4;
	Mon, 20 Feb 2023 23:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3BEE82BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEnO3Cf9FdGx; Mon, 20 Feb 2023 23:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE96F82BD6;
	Mon, 20 Feb 2023 23:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE96F82BD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFB71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43D9C40C21
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43D9C40C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkcGySVq35BU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D22A41732
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D22A41732
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89ED386495; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 17:09:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 680f28af58364f4152f3d9b582b312538fa0e500
X-Git-Newrev: d0ecb9b2803b5b0b293acd7a5a6bba1ed1e3feab
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.89ED386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/containerd: support
 crun as runtime
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
