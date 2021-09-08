Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E150AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 18:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8E661131
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 18:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B8E661131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F86A40108;
	Wed,  8 Sep 2021 18:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qB6XVPqoi-lp; Wed,  8 Sep 2021 18:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9289740135;
	Wed,  8 Sep 2021 18:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A19B21BF484
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 18:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F3D840135
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 18:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjSMfUzz_OKu for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 18:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64C2640108
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 18:08:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i28so4615186wrb.2
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eS74N0LIkL7ggY6CIIm2y1N4nxziw6rv+x9FbAPlXBY=;
 b=hrqozG33Rzhmcy+LT0ncXXQYUxEHJBe7rMHp4XDidn+J2oIQeMhU77fjnh0T6iy2xm
 ZmNnrXOVRkq7yzscUpMHVEQ9zf20PeIRqshyiYXqUt++mneB2F29JL9YFSHlKWya7Ru0
 zzX5xrr2yOXlb3LWjIRMMl1T83WfCglgpHsWhpg6GgcaR9rW8qCeMnyZ7W6ncI/I+gN7
 2+upzNhjMOYME0QYPWZaO6nvl6sN2uehwtJtneW29CduHIOOEGbOxH6thqt3ltZKH+jj
 lq5uvB7HUoEgmObQ2ME3pFGfFr0wjoMcEfR63YFvEE0s8c8uImjhdyLL8kT5Sk41t2Vl
 iOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eS74N0LIkL7ggY6CIIm2y1N4nxziw6rv+x9FbAPlXBY=;
 b=brmUZukhH3eC/pgHVm1mCG9XFLDFr5W3mjR22kgj8WrgC+tl5cCNU0Yj5JhhYo2L58
 HxY5P4AG76yC96kOQtXtqkPvkhBMom+KvBwxtP0WYRYG1kg+rtiJcPWqsn309E4bfJG3
 LsHQcBGEGTWu4WwJfOo42EMT3tc1PtuRxipdo9RkXYeT0NOSYTl20+9lxcUHCNHJij5W
 zoHTsJoSfxemLT1JVQbbjAxeishBXQ1PTPqcpnJncszN25Qdr+2RDNKjhALju4Z9XVq1
 fwfExcwygyvWRGBZhfiZIdC2BTfaPQ/EI6cmhRmtS3I8rxYM9zwerbfpXvwmSiMELq0a
 /BBQ==
X-Gm-Message-State: AOAM530OqRVAY6emCkMjJgiMg9TH08EXF9f89MF7Nea7o2PshdtERhYK
 7yJF0iGXLZk35iaovMoF2xGpoRMsOZ4Vg/BP
X-Google-Smtp-Source: ABdhPJz1RbmzbpyxsKpIvT/dB5y6KXYRtoYKvIAV9Y2czLY/9U/xYw42HHwgld/oflBlwOm6bNo/uA==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr5362050wrq.340.1631124526162; 
 Wed, 08 Sep 2021 11:08:46 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id m6sm3456595wrw.0.2021.09.08.11.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:08:45 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 20:08:25 +0200
Message-Id: <20210908180825.690731-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/mono: fix external libatomic_ops
 linkage
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Illia Bitkov <illia.bitkov@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Added patch fixes linkage of libgc with external libtomic-ops.
Mono uses bundeled bdwgc which doesn't link external libatomic-ops.
Patch is a fix cherry-picked from bdwgc upstream.

Problem found on ARMv5 processors, on newer ARM processors
it uses header based functions and doesn't need built library.

Error:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'

Fixes:
http://autobuild.buildroot.net/results/ebc54e5dea63aca21a4072d294fdede41de559c7
http://autobuild.buildroot.net/results/6d10a4bd43fbc9c1d3fa26d5eef394c8023cb85f
Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 ...-system-libatomic_ops-shared-library.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch

diff --git a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
new file mode 100644
index 0000000000..66d4d8e100
--- /dev/null
+++ b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
@@ -0,0 +1,52 @@
+From 02a44ee1df8176c72e75fd706d1a8f063d3196d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 5 Nov 2018 22:50:40 +0100
+Subject: Fix linkage with a system libatomic_ops shared library
+
+Issue #247 (bdwgc).
+
+When bdwgc is linked with the external libatomic_ops, bdw-gc.pc must
+contain the needed dynamic libraries (such as -latomic_ops) otherwise
+build of applications could fail on the link stage on some hosts:
+* libgc.so: undefined reference to 'AO_fetch_compare_and_swap_emulation'
+* libgc.so: undefined reference to 'AO_store_full_emulation'
+
+So, this commit sets ATOMIC_OPS_LIBS to "-latomic_ops" when a system
+atomic_ops library is used and uses ATOMIC_OPS_LIBS in bdw-gc.pc.in.
+
+* bdw-gc.pc.in (Libs): Add @ATOMIC_OPS_LIBS@.
+* configure.ac [$with_libatomic_ops!=no && $with_libatomic_ops!=none
+&& $THREADS!=none] (ATOMIC_OPS_LIBS): Set to -latomic_ops; do AC_SUBST.
+
+Fix is cherry-picked from bdwgc upstream
+
+Link to original commit https://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=02a44ee1df8176c72e75fd706d1a8f063d3196d5&diff=unified  
+
+Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
+
+diff --git a/external/bdwgc/bdw-gc.pc.in b/external/bdwgc/bdw-gc.pc.in
+index ef4c2341..a32e7598 100644
+--- a/external/bdwgc/bdw-gc.pc.in
++++ b/external/bdwgc/bdw-gc.pc.in
+@@ -6,5 +6,5 @@ includedir=@includedir@
+ Name: Boehm-Demers-Weiser Conservative Garbage Collector
+ Description: A garbage collector for C and C++
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -lgc
++Libs: -L${libdir} @ATOMIC_OPS_LIBS@ -lgc
+ Cflags: -I${includedir}
+diff --git a/external/bdwgc/configure.ac b/external/bdwgc/configure.ac
+index 21abe8fa..9ffe81de 100644
+--- a/external/bdwgc/configure.ac
++++ b/external/bdwgc/configure.ac
+@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
+ AC_MSG_CHECKING([which libatomic_ops to use])
+ AS_IF([test x"$with_libatomic_ops" != xno],
+   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
+-          [ AC_MSG_RESULT([external]) ],
++          [ AC_MSG_RESULT([external])
++            ATOMIC_OPS_LIBS="-latomic_ops"
++            AC_SUBST([ATOMIC_OPS_LIBS]) ],
+           [ AC_MSG_RESULT([none])
+             AS_IF([test x"$THREADS" != xnone],
+                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
