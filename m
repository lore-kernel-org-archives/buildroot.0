Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE77C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 11:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DAB60EDF;
	Mon,  8 Jan 2024 11:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DAB60EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rtnN3I7LHR3; Mon,  8 Jan 2024 11:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D5560B70;
	Mon,  8 Jan 2024 11:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D5560B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E827C1BF303
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 11:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10A260B70
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 11:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10A260B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSgGdcmOOkKa for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 11:08:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7996605E8
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 11:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7996605E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0BBD84AE9; Mon,  8 Jan 2024 11:08:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 12:03:55 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 92f06caf4d89cf2a2395f0780fbf8bf203bb9621
X-Git-Newrev: 9519bde956934fcafdc0835a4ad9a05258149060
X-Patchwork-Hint: ignore
Message-Id: <20240108110838.C0BBD84AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] configs/rock5b: add hash
 for custom kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=9519bde956934fcafdc0835a4ad9a05258149060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit d344ffe6245b (configs/rock5b: add hash for custom uboot)
explicitly noted that the kernel was retrieved from a git-clone, so the
sha1 of the commit was enough to get what we expect.

However, that does not account for the fact that the upstream repository
can disapear or be temporarily unavailable (maliciously or not). In that
case, the kernel archive will be looked up on the backup mirror.

In that case, the download is via wget over https, which protects the
transport, but does not guarantee that the remote server serves the
expected archive.

The hash file was dropped when d344ffe6245b was applied; restore it.

Since the defconfig now has hashes for all its downloads, enforce
checking hashes.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9ebbfeff38770876e48a4d38741dd9fffc001a42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/radxa/rock5b/patches/linux/linux.hash | 2 ++
 configs/rock5b_defconfig                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
new file mode 100644
index 0000000000..95ad749554
--- /dev/null
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a5eca7b8f929a1918125e2e4fbd7ab4ea5b3910b5ae4547e81c794b47373ffb5  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-br1.tar.gz
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index eed656ef5f..2e72b386b1 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -6,6 +6,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=""
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
