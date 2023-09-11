Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6935EEB57E
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 09:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B2A408FA;
	Mon, 11 Sep 2023 09:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B2A408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-zXFHdqg0ag; Mon, 11 Sep 2023 09:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B9EF408E7;
	Mon, 11 Sep 2023 09:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B9EF408E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ADB41BF20D
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 09:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7308F60FA5
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 09:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7308F60FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7jYAYIzprRIq for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 09:46:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D3D860FA3
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 09:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D3D860FA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D19486C44; Mon, 11 Sep 2023 09:46:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 09:41:22 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 3427fa6fc6398311bc7f0e90c832ab14f7b00098
X-Git-Newrev: cdc2edd0ab04844a4b97466f6bbabce5ea41552e
X-Patchwork-Hint: ignore
Message-Id: <20230911094615.8D19486C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gcc: disable
 libsanitizer on ARM Thumb classic
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdc2edd0ab04844a4b97466f6bbabce5ea41552e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

libsanitizer is broken for Thumb1, sanitizer_linux.cc contains
unconditional "ldr ip, [sp], #8", which causes:

....s: Assembler messages:
....s:4190: Error: lo register required -- `ldr ip,[sp],#8'

Fixes:

  http://autobuild.buildroot.net/results/5e15820c5db8c4c48c1de62a0c77171aeee381ba/

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd17b3dd44363b8d47f2394cc5320b271229982c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 25cb4ce8e2..1ecbf7e9b4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -154,6 +154,14 @@ ifeq ($(BR2_mips)$(BR2_mipsel):$(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y:y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# libsanitizer is broken for Thumb1, sanitizer_linux.cc contains unconditional
+# "ldr ip, [sp], #8", which causes:
+# ....s: Assembler messages:
+# ....s:4190: Error: lo register required -- `ldr ip,[sp],#8'
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # The logic in libbacktrace/configure.ac to detect if __sync builtins
 # are available assumes they are as soon as target_subdir is not
 # empty, i.e when cross-compiling. However, some platforms do not have
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
