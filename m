Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51427C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B1E83449;
	Tue, 15 Apr 2025 17:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXomGp9dlIdC; Tue, 15 Apr 2025 17:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BED183B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BED183B47;
	Tue, 15 Apr 2025 17:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F71200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45987412A3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJKEytxc2uMI for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61306411D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61306411D2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DA2F847F3; Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 19:16:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d759f8a4bd90b50b5ff839dace58fe140ed2e539
X-Git-Newrev: 50c1331720ec388e7a7cf9876ee55dadd8626090
X-Patchwork-Hint: ignore
Message-Id: <20250415172201.4DA2F847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pahole: bump to version 1.28
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============7960378451874623289=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7960378451874623289==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=50c1331720ec388e7a7cf9876ee55dadd8626090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On hosts with a recent version of cmake (eg: 4.0.0), builds involving
host-pahole fail with the following error:

CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.

The issue can be reproduced on hosts with cmake >= 4.0.0 with commands:

    cat <<EOF >.config
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_DEFCONFIG="versatile"
    BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE=y
    EOF
    make olddefconfig
    make

The issue has already fixed in the upstream project with commit
12ca11281912 ("CMakeLists.txt: Require cmake 3.5 or higher"), which is
part of version 1.28.

Upgrade pahole to get rid of this error.

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.28

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Julien: add commands to reproduce the issue in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index a2d3d044da..efa1218468 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  87223298d4f8f9ada9b3cc5cef1bedd7aeb447cd8295abc466e009a26accff13  pahole-1.27.tar.gz
+sha256  9a319c214b38554be8430a672043d85735564e8e1e78db5a41cba7a03d038056  pahole-1.28.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index ffbe4ff925..150373fd7e 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.27
+PAHOLE_VERSION = 1.28
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \

--===============7960378451874623289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7960378451874623289==--
