Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C307AEE0207
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0DA83148;
	Wed, 13 Sep 2023 19:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0DA83148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlVJPSnMXcAY; Wed, 13 Sep 2023 19:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F0F832EB;
	Wed, 13 Sep 2023 19:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F0F832EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF6DC1BF283
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97DDB41DFD
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97DDB41DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uL7zZc7C2-yi for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DACC41DC8
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DACC41DC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CE9786E75; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 21:27:09 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 547eb202b830dda7a56681eec17eb054ed1ead3f
X-Git-Newrev: 36f536a027b87fb7f903630268c83217f101d1ec
X-Patchwork-Hint: ignore
Message-Id: <20230913193023.6CE9786E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gcc: fix powerpc
 toolchain issues with 64-bit capable cores
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

commit: https://git.buildroot.net/buildroot/commit/?id=36f536a027b87fb7f903630268c83217f101d1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Some of the powerpc CPUs supported by Buildroot are dual mode CPUs,
which means 32 Bit and 64 Bit mode is supported, and for any 64-bit
capable CPU, GCC defaults to using 64-bit, even if the toolchain tuple
starts with powerpc-* (and not powerpc64-*). This causes issues when
building toolchains with uClibc or musl.

In order to resolve this, we force GCC to understand we want to
generate 32-bit code, using the --with-cpu-32 option.

See here the gcc documentation for details about --with-cpu-32:
https://gcc.gnu.org/install/configure.html

See here for a discussion on the musl mailinglist about the error:
https://inbox.vuxu.org/musl/20220722162900.GB1320090@port70.net/

Fixes:
 - http://autobuild.buildroot.net/results/450/4509d8cfb7d99beb4ef023f170490def1d90f92c
 - http://autobuild.buildroot.net/results/654/6545a464d49f9f3c6740a5208cfad7f09ec4cb8b
 - http://autobuild.buildroot.net/results/cf8/cf866d5320b069eb1e8b4f05e8e58de0ad2ec7b5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5acaac7122945c7588cf2328d928e1d4fb6488dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1ecbf7e9b4..3050229176 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -225,9 +225,17 @@ endif
 ifneq ($(GCC_TARGET_FP32_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fp-32="$(GCC_TARGET_FP32_MODE)"
 endif
+
+# musl/uClibc-ng does not work with biarch powerpc toolchains, we
+# need to configure gcc explicitely for 32 Bit for CPU's supporting
+# 64 Bit and 32 Bit
 ifneq ($(GCC_TARGET_CPU),)
+ifeq ($(BR2_powerpc),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-cpu-32=$(GCC_TARGET_CPU)
+else
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(GCC_TARGET_CPU)
 endif
+endif
 
 ifneq ($(GCC_TARGET_FPU),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
