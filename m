Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAE4C432BE
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 14:06:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4CC6136F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 14:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A4CC6136F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3683D403AD;
	Mon, 23 Aug 2021 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_nXMcSO54dP; Mon, 23 Aug 2021 14:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0788402C1;
	Mon, 23 Aug 2021 14:06:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8831BF20B
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 14:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07A3A402C1
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 14:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BX7AmvxM_Yo2 for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 14:05:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 257F9402C0
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 14:05:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so104704wma.0
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwG84vWEyTO9fg33xzzRSdrmTjAuXQ6/qVVRVltWgZQ=;
 b=ZNndho53aPsfqKqgea/booiBby2MsveGZYc0D2jHRfuJ2wL6B4plV47kWbWN9EPAeY
 lm+Vmz5aSxgK/bQZH0cJ8vLSaS6vIzTVMVdWNBAYXWd+nDPZ31a//FxefYaAN0sY7iH6
 Ql4ga+haglWHGJnJNxymE+5UwRbpMPEClor2f9LuRGIsbqZ1x8coiiGliAHYGa92A60a
 FJ3PXw05qKgTd4viJYhffWzer6rPMezVP885wqKoGoMO5JsqHSW+eLWfOZ19KLiRr5jL
 AcvFn1RiytQW3maaMFdZx2pq+C4bsBqd0tH2yj7kl4m9cewX408ynRjypKRKX0KF6i5t
 RtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwG84vWEyTO9fg33xzzRSdrmTjAuXQ6/qVVRVltWgZQ=;
 b=YHPYQ7uXkFfd1cwv21QPxK8ydQL0IpRzrBNH/VcMni1IKheSDJfZwsid5Q6L5+975f
 fOQHGTgrgws33rJk7a/43gE+Zfn/WZgI8GUN4h/gpJW+xthfsHE/0RAUkkTURR6rRVMe
 BMVKNkqNWaNPA5onkxixmmtbLXf5KAc84IdksBXlOsFQ59+UZblBu+Y/1cALlXkA1Dh8
 01fqN4FBKnj8WRdPRjBfQZhs6l+wEPqa0vS/O/K7Nt6LYH+7qoChtgETjFojtR/OsjIH
 eeCQb9CoOUMBD23FwJoWYRBl3hyZhW0UgJSEVeX/ml4MPX7O+pWgUDBm4CMfHxhyCUwc
 MHBA==
X-Gm-Message-State: AOAM531zu9t7dulrX+lCfQdBjsoer4rVm/4iSdq6R4qOYZoUdWWeCX+N
 1y7INMEoY4qNx0r8fu7mQFYD/LcDTq6un9ef2Wo=
X-Google-Smtp-Source: ABdhPJxJkiV/bzEoj+9CMP/EamqxapBpT463oSJobPfB8+c8goFVpS0FMR9vbkKK96rWBWMQ9pPdNg==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr16347126wmi.176.1629727553618; 
 Mon, 23 Aug 2021 07:05:53 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-81imx1fygtgsga1dgwv.18120a2.ip6.access.telenet.be.
 [2a02:1811:c06:d300:459d:a6f4:3211:9fdf])
 by smtp.gmail.com with ESMTPSA id q11sm18282831wmc.41.2021.08.23.07.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:05:53 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 16:05:41 +0200
Message-Id: <20210823140541.984086-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mono: fix external libatomic_ops
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
