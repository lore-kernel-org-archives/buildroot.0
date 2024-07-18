Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA32AC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D5460E85;
	Thu, 18 Jul 2024 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8xHtiYRvKPG; Thu, 18 Jul 2024 21:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48213607AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48213607AD;
	Thu, 18 Jul 2024 21:00:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02B411BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3CEE40754
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC90Y2nW7H9C for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B2940730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11B2940730
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:00:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68F2186193; Thu, 18 Jul 2024 21:00:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:58:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1d3b7f97a080a0a278fdaab7f28f9fbbc82a743
X-Git-Newrev: eb519ad7cc716347dbf0f9707ff282a97b21f623
X-Patchwork-Hint: ignore
Message-Id: <20240718210043.68F2186193@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: promote using fixed version
 for kernel headers when contributing a board
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
Content-Type: multipart/mixed; boundary="===============4192829775915933243=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4192829775915933243==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=eb519ad7cc716347dbf0f9707ff282a97b21f623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the default (newest) kernel headers series changes the build can
break. Example error message:

  Incorrect selection of kernel headers: expected 6.8.x, got 6.5.x

In the above case the defconfig used:

  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.5.9"

The kernel headers were not specified, so the build defaulted to using
the kernel sources as header source and the default (newest) header
series. From .config:

  BR2_KERNEL_HEADERS_AS_KERNEL=y
  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-board-support.adoc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-board-support.adoc b/docs/manual/adding-board-support.adoc
index 9501262086..be7699668d 100644
--- a/docs/manual/adding-board-support.adoc
+++ b/docs/manual/adding-board-support.adoc
@@ -32,7 +32,11 @@ Always use fixed versions or commit hashes for the different
 components, not the "latest" version. For example, set
 +BR2_LINUX_KERNEL_CUSTOM_VERSION=y+ and
 +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE+ to the kernel version you tested
-with.
+with. If you are using the buildroot toolchain +BR2_TOOLCHAIN_BUILDROOT+
+(which is the default), additionally ensure that the same kernel headers
+are used (+BR2_KERNEL_HEADERS_AS_KERNEL+, which is also the default) and
+set the custom kernel headers series to match your kernel version
+(+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_*+).
 
 It is recommended to use as much as possible upstream versions of the
 Linux kernel and bootloaders, and to use as much as possible default

--===============4192829775915933243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4192829775915933243==--
