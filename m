Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA5DE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 108A784AEA;
	Fri,  6 Sep 2024 20:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqqYcEUPrsxA; Fri,  6 Sep 2024 20:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAB284AE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAB284AE4;
	Fri,  6 Sep 2024 20:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37C411BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EDEF61115
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7_DJPAqi445 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC406111F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FC406111F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CF2086C5A; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:23:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee95c4c3f8a8b1af869737ae14508fb80fdf27cc
X-Git-Newrev: 9ed8b8769534761b04445718acd3d3ec36c1bfdf
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.2CF2086C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: enable DHCP for eth0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ed8b8769534761b04445718acd3d3ec36c1bfdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DHCP for eth0.
This is perfectly fine even for users that are not using the Ethernet
on the rock5b, as in that case, udhcpc will simply fork to background
without delaying the boot.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 899537c001..e3c4414948 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -46,6 +46,7 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
