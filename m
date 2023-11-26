Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75DBC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 16:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79F7460888;
	Sun, 26 Nov 2023 16:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F7460888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ponahu2v7FjB; Sun, 26 Nov 2023 16:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5DF607C7;
	Sun, 26 Nov 2023 16:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5DF607C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66D4F1BF3FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE23607C7
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE23607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_UfW653KnKl for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 16:21:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76DB0607BC
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 16:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76DB0607BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A2C2873D7; Sun, 26 Nov 2023 16:21:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 17:20:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c3946fcb45b07db5cc88cdc944745aa1ef8fa04
X-Git-Newrev: 7fe685c510578435b8b7c0448478e71a3db4d9e4
X-Patchwork-Hint: ignore
Message-Id: <20231126162140.5A2C2873D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: fix zfs autotools
 cross-compilation
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
Content-Type: multipart/mixed; boundary="===============7544812206741664374=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7544812206741664374==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7fe685c510578435b8b7c0448478e71a3db4d9e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit addresses a long-standing bug encountered during ZFS
compilation in cross-platform environments. The issue arises because ZFS
autoconf triggers a `make modules` to detect if the kernel can compile
modules [1]. The problem occurs when autoconf uses the host environment
instead of the cross-platform environment.

To fix this, we export necessary environment variables to ensure that ZFS
autoconf utilizes the cross-platform environment correctly.

This patch resolves ZFS cross-platform compilations:
- http://autobuild.buildroot.net/results/ebeab256101bcba38c35fd55075c414e62f92caa/
- http://autobuild.buildroot.net/results/03b9f12a106bf100eec695a92b83bf09b22c68b0/
- http://autobuild.buildroot.net/results/c2da90337463607c2fadfeac7ad72e5c3899a61f/
- http://autobuild.buildroot.net/results/465a249f92d2f5db7ac4b61b4111e6cbaaa15688/
- http://autobuild.buildroot.net/results/7e2d3277e26fa5b0c8073a0e8b9e82f47ade9697/
- http://autobuild.buildroot.net/results/a8fb87336b09fef8787a7889dfcccf14fe1215b9/
- https://gitlab.com/kubu93/buildroot/-/jobs/1522848483

And fix a few emails:
- alpine.DEB.2.22.394.2108181630280.2028262@ridzo [build zfs into buildroot for raspberry pi 4]
- https://lists.buildroot.org/pipermail/buildroot/2021-August/621696.html
- https://lists.buildroot.org/pipermail/buildroot/2021-August/621345.html
- https://lists.buildroot.org/pipermail/buildroot/2022-July/646379.html
- https://lists.buildroot.org/pipermail/buildroot/2023-June/668467.html

[1] This is the full callback, you can just check the last link:
- https://github.com/openzfs/zfs/blob/zfs-2.1.12/config/kernel-declare-event-class.m4#L7C11-L7C11
- https://github.com/openzfs/zfs/blob/zfs-2.1.12/config/kernel.m4#L883
- https://github.com/openzfs/zfs/blob/zfs-2.1.12/config/kernel.m4#L868
- https://github.com/openzfs/zfs/blob/zfs-2.1.12/config/kernel.m4#L668

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zfs/zfs.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 6ea3d22ba5..c7b0ed0407 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -58,6 +58,14 @@ else
 ZFS_CONF_OPTS += --disable-pam
 endif
 
+# Sets the environment for the `make` that will be run ZFS autotools checks.
+ZFS_CONF_ENV += \
+	ARCH=$(KERNEL_ARCH) \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+ZFS_MAKE_ENV += \
+	ARCH=$(KERNEL_ARCH) \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
 # ZFS userland tools are unfunctional without the Linux kernel modules.
 ZFS_MODULE_SUBDIRS = \
 	module/avl \

--===============7544812206741664374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7544812206741664374==--
