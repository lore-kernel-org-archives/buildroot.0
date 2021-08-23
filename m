Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E6C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:53:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2311261374
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2311261374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDAD580DE1;
	Mon, 23 Aug 2021 23:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9e5yV0MHbD3; Mon, 23 Aug 2021 23:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5683880E0E;
	Mon, 23 Aug 2021 23:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42FC11BF3AF
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E75D80E0E
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y38YmJZCnLQN for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 23:53:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54B0180DE1
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 23:53:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1096729wms.2
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 16:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7SRzCpGmFEXOyRvjyoNzJEfFpspBtmetwvv+3zL3aI=;
 b=PuMlVpVxDoSE3//WzV0x5QhO8BzxCsNH+NeyonzbLaGO1dZU9J+kN0VC5abuh1GEg7
 Dk8oVhv1MnWacEGjDjQp6Qz6fjlI0hcrciFFahpmzaGmzBJFCVk/XzKkz7jfmalA9tbo
 XV2zKmPzuk6QGQ4wtRvnQdT92p5mIWSk0ldlfZV1Mub9836VS/yQuwCSe73uhCEBI3xu
 7DIHyv4JirNzojtZ3WMr4HIWbOExT0RlBnj965ry3iSh6oT4qvwQqf4YYkGGXER4k8dv
 7CYSxaikxWac/myGvAw/VqxuEcZolk4j5EhYRFgzD9XZ+US1KRzQBNFEXwGIVD5nxnhi
 ic+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7SRzCpGmFEXOyRvjyoNzJEfFpspBtmetwvv+3zL3aI=;
 b=Q2NK56EJTRvm728cKcseIXFSfLHNfBvcs29f4rJMrGN5pGbE8sZxju9muJ7OATLCVl
 Au3dcsIS7Ud3VeWf5e8tJEygiUYhNEcX/FB4aqaSAF3dyplRhNke6k5J/ZJurHlYUgMk
 hxUKytQ2If6vL36zNfVFivR7xZR4hzULpjN5wFyPTGSDl28p8jsulXzBY7EhXhwUpuio
 UvsNXIXNYoC0qIBD6o1sV4U3XvX/0vFAtCuMdmIfi8lkLAPg0xlY5cg+UhE5dcS+yNNE
 s5svv4BYxagWSjPj07R4puiJAk0OCPBNKQTQmXnD2xCtCni9I8FAjK/0mDx0OIYzinWq
 wSDg==
X-Gm-Message-State: AOAM533cXNZ/eBn5FDzdqzLLPxTBoRQ/mqKIqPjinjcq0e1Dbj/2p+4C
 uHfUjHDyC0A9Xex+nFxrWokd+DEALhd5V1lO
X-Google-Smtp-Source: ABdhPJyLdkDM0gS+U93qlpGAto4v43bZW9D5U9NfmB0cxnzqTdpagDeTbtQwJrBOyaep9HSKnSjaaQ==
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr1155368wmp.22.1629762821320; 
 Mon, 23 Aug 2021 16:53:41 -0700 (PDT)
Received: from localhost.localdomain (94-224-129-106.access.telenet.be.
 [94.224.129.106])
 by smtp.gmail.com with ESMTPSA id v17sm18800425wro.45.2021.08.23.16.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:53:41 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 01:53:32 +0200
Message-Id: <20210823235332.994567-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/mono: fix external libatomic_ops
 linkage
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
Cc: Illia Bitkov <illia.bitkov@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Problem is due to the fact that external libatomic_ops doesn't link with libraries.
It's a problem of internal version of bdwgc.

Error:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'

Fixes:
http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 ...-system-libatomic_ops-shared-library.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch

diff --git a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
new file mode 100644
index 0000000000..0a88b45515
--- /dev/null
+++ b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
@@ -0,0 +1,51 @@
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
+cherry-picked by Illia Bitkov
+
+Link to original commit https://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=02a44ee1df8176c72e75fd706d1a8f063d3196d5&diff=unified  
+
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
