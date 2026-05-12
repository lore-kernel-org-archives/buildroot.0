Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55975CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E1A41070;
	Tue, 12 May 2026 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUmOUjJr6tyZ; Tue, 12 May 2026 20:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EEFE4105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778617068;
	bh=NP14/nUyodGdP8jEt6LKjqMTJI24IYgfA7Bc6X6nQrs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WHkQ4qlp7hqGiW8hluN9HbvsYxiK5+GhhO/AFCW71vB4m2fJgAZNhEBRD8oJgkLWf
	 CBVcKDuM5fwt7PbgYzGy++OMv7B2GrkviyQ/dWGvjv89tqss4Eit6JNXz6qpruUIsz
	 EMrtNtipUJygxKXAlqzro7zqSNwbczvchQk6CvBUbX1zz53vnc0q2QkjVyrFJTunOq
	 E/X7TiYdCrtHkGlwL1cgx/bIcBUErLxA+NkH8OvOncrDDnhnmf3nrsSUVv4dNrCbRx
	 BB7FpZp8QVxm7Nc6khGhhoeGMDw2G/y2CCd8tLwS0pAX04CxTlX/Y9P628xcjzw50C
	 /bnOEEbT/ArBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EEFE4105F;
	Tue, 12 May 2026 20:17:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A6715F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2327841028
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9ojOmEp10ar for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B6F4105F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B6F4105F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:17:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12B3E85FCC; Tue, 12 May 2026 20:17:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 22:14:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bebe8f567a15015d53557f79e609ad63265f5e4
X-Git-Newrev: ba604325c4329f637834ad4e9b9feff14054cc9f
X-Patchwork-Hint: ignore
Message-Id: <20260512201742.12B3E85FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_file_capabilities:
 Fix build failure
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba604325c4329f637834ad4e9b9feff14054cc9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] updated the Kernel for this test, but forgot to
add the "arm/" prefix for the dtb path. Since Linux 6.5, .dts files
have been moved to "arch/arm/boot/dts/" and the test was not able to
find the file anymore, which caused the build to fail.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955524

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/74e7e07f83d6575f369295d17199ea488d87d233

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
[Julien: reword commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index ede7b48555..f57a7cee69 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -17,7 +17,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         BR2_PACKAGE_LIBCAP=y
         BR2_PACKAGE_LIBCAP_TOOLS=y
         BR2_TARGET_ROOTFS_SQUASHFS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
