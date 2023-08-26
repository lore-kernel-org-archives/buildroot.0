Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551B1C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34FA81F4D;
	Sat, 26 Aug 2023 19:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34FA81F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNUe3-PcDr5b; Sat, 26 Aug 2023 19:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD6B81EC1;
	Sat, 26 Aug 2023 19:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD6B81EC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 966511BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BD85402A6
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD85402A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-EvorCrET85 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:53:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EEDE40272
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEDE40272
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A3568642E; Sat, 26 Aug 2023 19:53:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 21:51:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19da04471599cac8eba272242b43bcff8e9ee9db
X-Git-Newrev: 5acaac7122945c7588cf2328d928e1d4fb6488dd
X-Patchwork-Hint: ignore
Message-Id: <20230826195311.4A3568642E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fix powerpc toolchain issues
 with 64-bit capable cores
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5acaac7122945c7588cf2328d928e1d4fb6488dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
