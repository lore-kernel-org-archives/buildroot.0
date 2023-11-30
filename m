Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29467C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD356F4B1;
	Thu, 30 Nov 2023 08:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD356F4B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joZPy1maLWkM; Thu, 30 Nov 2023 08:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B956F51D;
	Thu, 30 Nov 2023 08:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B956F51D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 853951BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A11E40490
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A11E40490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DP8LrapMa9jf for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06051400D6
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06051400D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9C3C87601; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:17:04 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6af0375dd60e1e051bce7c7a95cb21035296343f
X-Git-Newrev: 819a4ba019020780142d71c6ebebdb091d3ed173
X-Patchwork-Hint: ignore
Message-Id: <20231130083133.E9C3C87601@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zfs: fix zfs
 autotools cross-compilation
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
Content-Type: multipart/mixed; boundary="===============2366646503840769973=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2366646503840769973==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=819a4ba019020780142d71c6ebebdb091d3ed173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 7fe685c510578435b8b7c0448478e71a3db4d9e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/zfs.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 43a10a0de9..aa2e72b2e0 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -57,6 +57,14 @@ else
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

--===============2366646503840769973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2366646503840769973==--
