Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCECEC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C8240191;
	Sun,  7 Jan 2024 16:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C8240191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OmogywxTCkvZ; Sun,  7 Jan 2024 16:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A1EA401C2;
	Sun,  7 Jan 2024 16:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A1EA401C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C113F1BF863
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A11C682305
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11C682305
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UEXxFgjPjf4f for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:53:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4AAF822F4
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4AAF822F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0D0D847BA; Sun,  7 Jan 2024 16:53:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 17:52:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c740676c51de9ee66e32cb41bfeed5e6a446ceed
X-Git-Newrev: 9501bc80f5c34cd04bdc686cd74324beb452649e
X-Patchwork-Hint: ignore
Message-Id: <20240107165313.B0D0D847BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liquid-dsp: fix build without neon
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

commit: https://git.buildroot.net/buildroot/commit/?id=9501bc80f5c34cd04bdc686cd74324beb452649e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without neon raised since bump to
version 1.4.0 in commit 2f7f8f381394207bfb029ec395f5ced5695a0a2e and
https://github.com/jgaeddert/liquid-dsp/commit/c821187dd9af2758c8e3c82e95eaf041b8ac81a0:

/home/peko/autobuild/instance-0/output-1/host/bin/arm-none-linux-gnueabi-gcc -std=gnu11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=2  -ffast-math -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4  -Wall -fPIC -Wno-deprecated -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -Iinclude  -c -o src/audio/src/cvsd.o src/audio/src/cvsd.c
In file included from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/features.h:388:0,
                 from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/stdlib.h:24,
                 from src/libliquid.c:25:
/home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29: fatal error: gnu/stubs-hard.h: No such file or directory
 # include <gnu/stubs-hard.h>
                             ^

Indeed, upstream considers that NEON is available on all ARM platforms,
and their configure.ac contains that code snippet:
  239     arm|armv7*|armv8*)
  240         # assume neon instructions are available
  241         # TODO: check for Neon availability
  242
  243         # ARM architecture : use neon extensions

Fixes:
 - http://autobuild.buildroot.org/results/36b3c2220c462e7a20262fd1b9064d9aeb6c9ec4
 - http://autobuild.buildroot.org/results/881826b4b6c141e59a0da2d7d1ad55d3709fdb95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - refactor with LIQUID_DSP_SIMDOVERRIDE
  - add comment about --disable-simdoverride
  - extend commit log with upstream code snippet
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liquid-dsp/liquid-dsp.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index ed0edacd94..eb4cda67a5 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -37,7 +37,18 @@ endif
 
 # disable altivec, it has build issues
 ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
+LIQUID_DSP_SIMDOVERRIDE = y
+endif
+
+# Upstream expects NEON on all ARM CPUs by default
+ifeq ($(BR2_arm):$(BR2_ARM_FPU_NEON),y:)
+LIQUID_DSP_SIMDOVERRIDE = y
+endif
+
+ifeq ($(LIQUID_DSP_SIMDOVERRIDE),y)
 LIQUID_DSP_CONF_OPTS += --enable-simdoverride
+# Do not add an else-clause to pass --disable-simdoverride, as it is
+# non-functional, and behaves as --enable-simdoverride
 endif
 
 LIQUID_DSP_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
