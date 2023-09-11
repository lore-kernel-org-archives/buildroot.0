Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A072EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 09:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A33408F2;
	Mon, 11 Sep 2023 09:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A33408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lynsfzpGl1-m; Mon, 11 Sep 2023 09:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72A5408DF;
	Mon, 11 Sep 2023 09:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72A5408DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8983B1BF20D
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 09:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6401540C99
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 09:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6401540C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zSh3-sGEDB3 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 09:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E08340CB6
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 09:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E08340CB6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77C3886C42; Mon, 11 Sep 2023 09:45:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 11:24:00 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cd3b0fa07d7e0431923cdcee06b10d45f9d5a5fb
X-Git-Newrev: 2625ea6bf2f77b0292811432ea627c44b81f9ee3
X-Patchwork-Hint: ignore
Message-Id: <20230911094509.77C3886C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gcc: disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=2625ea6bf2f77b0292811432ea627c44b81f9ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
