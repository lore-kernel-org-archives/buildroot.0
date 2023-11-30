Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0177BC10DC1
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFAF660674;
	Thu, 30 Nov 2023 08:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAF660674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9xVPqEZLA2u; Thu, 30 Nov 2023 08:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1ED1615C7;
	Thu, 30 Nov 2023 08:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1ED1615C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1D91BF990
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5532B84489
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5532B84489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfzKhmphHbvu for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5263184449
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5263184449
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4047F87603; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:16:49 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 76699a7770cbee6e35a417e3cda0310a832af434
X-Git-Newrev: 29e2700bda27f0156f17d4dfe1293f4c7fd1efb1
X-Patchwork-Hint: ignore
Message-Id: <20231130083815.4047F87603@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/zfs: fix zfs
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
Content-Type: multipart/mixed; boundary="===============0461683700476540345=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0461683700476540345==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=29e2700bda27f0156f17d4dfe1293f4c7fd1efb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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

--===============0461683700476540345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0461683700476540345==--
