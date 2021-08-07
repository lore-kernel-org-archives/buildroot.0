Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DABC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:59:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1BE60C3F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C1BE60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8AD660687;
	Sat,  7 Aug 2021 20:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2GaKoOWlAib; Sat,  7 Aug 2021 20:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F8A60656;
	Sat,  7 Aug 2021 20:59:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E91EA1BF28E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83418291D
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uN2IjbfjSHC7 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:59:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E438F82896
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:59:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C6DBA8CB62; Sat,  7 Aug 2021 20:59:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 22:59:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0744eef34d836bc8ef086ed657377bc15ed753a9
X-Git-Newrev: 5108554dfe0d4815c9c84f75b118298c147ccd33
X-Patchwork-Hint: ignore
Message-Id: <20210807205936.C6DBA8CB62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: filter out long make options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5108554dfe0d4815c9c84f75b118298c147ccd33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since qemu started using ninja, they have the following fragment in the
Makefile:

MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
NINJAFLAGS = ... $(if $(MAKE.n), -n) ...

Buildroot's generated makefile in the O= directory invokes make in the
base buildroot with --no-print-directory. However, make's placement of
the --no-print-directory in MAKEFLAGS varies between the versions of
the host make; make 4.3 places that at the end while make 3.82 places
it at the beginning. As a result, if building on a system with an older
host make, qemu's makefile invokes `ninja -n` which does not generate
any outputs.

To reproduce, on a CentOS 7 machine or docker image:
  mkdir /tmp/br-build && cd /tmp/br-build
  make -C ~/buildroot pc_x86_64_bios_defconfig O=`pwd`
  make menuconfig # Switch to glibc, enable "QEMU" and "QEMU tools"
  make all # Build succeeds
  find target -name qemu-img # No binary has been built

Pick up the fix commited in Qemu upstream.

Signed-off-by: Alexey Neyman <stilor@att.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../qemu/0004-Makefile-ignore-long-options.patch   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/qemu/0004-Makefile-ignore-long-options.patch b/package/qemu/0004-Makefile-ignore-long-options.patch
new file mode 100644
index 0000000000..2d14b70c03
--- /dev/null
+++ b/package/qemu/0004-Makefile-ignore-long-options.patch
@@ -0,0 +1,41 @@
+From 14833e24dea49303ebc2464813601054b6cdfcac Mon Sep 17 00:00:00 2001
+From: Alexey Neyman <stilor@att.net>
+Date: Wed, 21 Jul 2021 19:08:46 -0700
+Subject: [PATCH] Makefile: ignore long options
+
+When searching for options like -n in MAKEFLAGS, current code may result
+in a false positive match when make is invoked with long options like
+--no-print-directory. This has been observed with certain versions of
+host make (e.g. 3.82) while building the Qemu package in buildroot.
+
+Filter out such long options before searching for one-character options.
+
+Signed-off-by: Alexey Neyman <stilor@att.net>
+Message-Id: <20210722020846.3678817-1-stilor@att.net>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+---
+ Makefile | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6c36330eef..401c623a65 100644
+--- a/Makefile
++++ b/Makefile
+@@ -129,9 +129,11 @@ endif
+ # 4. Rules to bridge to other makefiles
+ 
+ ifneq ($(NINJA),)
+-MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
+-MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
+-MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
++# Filter out long options to avoid flags like --no-print-directory which
++# may result in false positive match for MAKE.n
++MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
++MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
++MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+ MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
+ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
+         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
+-- 
+2.27.0
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
