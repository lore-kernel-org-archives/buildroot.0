Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B0CEACF3
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8BB0605AD;
	Wed,  2 Oct 2024 19:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XA2U1oEC5b0w; Wed,  2 Oct 2024 19:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF2B7605E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2B7605E4;
	Wed,  2 Oct 2024 19:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E30181BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2ADD81DD8
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kzWaKDh23vh for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FEC818D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FEC818D4
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9E56845D9; Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 20:27:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d835ffc524e2dab66ce1421240b9eb93c8f8f6a
X-Git-Newrev: b2fdc16c479b7d430cda57df10371c80dddb56ca
X-Patchwork-Hint: ignore
Message-Id: <20241002194306.A9E56845D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: default to old
 kernel version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b2fdc16c479b7d430cda57df10371c80dddb56ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, there is no default value in the choice for the custom kernel
version, and the latest version is at the top of the list.

This means tha a defconfig that uses the latest version does not get the
symbol written in it, and thus when a newer version is latter added, the
defconfig is then incorrect.

To kinda-workaround the issue, make the oldest, pre-3.0 version the
default: this is always going to be the oldest version, we're not going
to add anything older than that, so defconfigs that use that version
will not have it written but that will always yield it back. Conversely,
all other defconfigs will get the kernel version written in them, so it
will stick even when we add newer versions.

Reported-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 067c3b96aa..eac93ce1ce 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -113,6 +113,7 @@ endif
 
 choice
 	bool "Custom kernel headers series"
+	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
