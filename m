Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20D7C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 17:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C3E40DB9;
	Wed,  7 May 2025 17:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9KFQn8iR3-j; Wed,  7 May 2025 17:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B438F411AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B438F411AE;
	Wed,  7 May 2025 17:17:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BE9A950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D300410EC
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUrvXlTFr6Cm for <buildroot@buildroot.org>;
 Wed,  7 May 2025 17:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE92A40DC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE92A40DC9
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7B7A8635E; Wed,  7 May 2025 17:17:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 May 2025 19:16:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da69e45341226510359f0563dd459c6e0b8f2e63
X-Git-Newrev: 74c4dd41502384a797829ae16167c28f50a24e3e
X-Patchwork-Hint: ignore
Message-Id: <20250507171729.A7B7A8635E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_r3s: fix host
 linux headers custom version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74c4dd41502384a797829ae16167c28f50a24e3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its introduction in commit [1], the
friendlyarm_nanopi_r3s_defconfig is failing to build with error:

    Incorrect selection of kernel headers: expected 6.12.x, got 6.13.x

The error happens because the defconfig has:
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
and
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.4"

This commit fixes the issue by setting instead:
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216429

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/41734e00c0cc36f4df2f492e72b535a0716d4048

Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/friendlyarm_nanopi_r3s_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 39e21c74fd..4219147033 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
 BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r3s/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi r3s"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
