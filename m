Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5859CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E64416F3;
	Sat, 12 Oct 2024 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAHfPc9xM-a4; Sat, 12 Oct 2024 14:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7080D419F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7080D419F8;
	Sat, 12 Oct 2024 14:05:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB131BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 826CE820A6
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNxb3youYTN3 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ECC280EF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ECC280EF4
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D18D85C3B; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:46:42 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f104f0f9e7fbdcdaedf7c3380e907b0845665c2e
X-Git-Newrev: 6b0b1682a8a4f8b4d18385671fecce6de5435d8c
X-Patchwork-Hint: ignore
Message-Id: <20241012140529.7D18D85C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] linux: replace
 host-python3 with BR2_PYTHON3_HOST_DEPENDENCY
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b0b1682a8a4f8b4d18385671fecce6de5435d8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Commit abce4a2b3 "linux: add BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3" [1]
introduced a Kernel dependency on host-python3.

Since the Kernel does not have any specific requirements on host
Python modules, or recent host Python version, this commit replaces
the host-python3 dependency with BR2_PYTHON3_HOST_DEPENDENCY. This
will skip the host-python3 compilation if a sufficient version (3.4 or
greater at the time of this commit) is already present on host. This
will save build time.

This optimization was suggested by Peter, in [2].

Note 1: this commit was checked to ensure that Kernel v6.10.9 arm64
defconfig (which does require a python3 interpreter to build) is
working with Python 3.4.

Note 2: BR2_PYTHON3_HOST_DEPENDENCY was introduced in commit b60729784
"support/dependencies: add a check for python3" [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/abce4a2b365276a7fa081d327289e5e6d8bdca7e
[2] https://lists.buildroot.org/pipermail/buildroot/2024-September/763967.html
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/b60729784ab1c2f75dca30f924f4dd3176713ae8

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b98062f7301bc72d2a59cca733f36525405d3bb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 92035d0da9..28d0ac50e3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -139,7 +139,7 @@ endef
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3),y)
-LINUX_DEPENDENCIES += host-python3
+LINUX_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
 endif
 
 # If host-uboot-tools is selected by the user, assume it is needed to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
