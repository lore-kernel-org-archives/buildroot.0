Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2A5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 22:34:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B030961267
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 22:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B030961267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 776FD400BE;
	Wed, 10 Nov 2021 22:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhKdwN1JH1M7; Wed, 10 Nov 2021 22:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72D9D4011F;
	Wed, 10 Nov 2021 22:34:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42B8A1BF322
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 22:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B9180FFA
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 22:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VH-3owBpdE7a for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 22:34:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DD0E80F75
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 22:34:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso3102465wmf.0
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 14:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiLXN/9nSeS+S69xk/OK4XVJkMDwk1HtAV5+oLJseAg=;
 b=LPC7ohY2Cn1UxL70icmVcWzvJkYQ40dO7p7JRi4I3R/SNl+JXu0dozPHaZMeWQNrPx
 C3aBY2B/AttslFP+21lmCoazuN3Z/Lp4E98Y11bbnVvOU27c/VzvTEq2jpTeb7uJms8y
 PxBxRKWhVR14ILO4CDQJf79ILMeSpv6EF9Zg2MAfwv7V6C+98tPawOVlWEvXlYPg2eXk
 k51KF4pRR+3dKkcZluFcWUeE0wKkG0du/uGdicvMNLhkPKp4x6xaRhu1BQ31KMb71W8v
 hcCSG8xj4b28W1mSNYfB6ZGnvhS69jSzBJTrTTDagjob+jdpDR238XV4BJdvp0LGrn1M
 wNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiLXN/9nSeS+S69xk/OK4XVJkMDwk1HtAV5+oLJseAg=;
 b=F9JuKBPXeylhWCWZQS3LnOw9tD7tHeYvrZaBHE0/nw8HPU+ZcVBXnYPukASPctN06W
 UPcxOBzXpRCGhDxYyDhPcMt3kQ7YsVI3+M0LCiKC3A/BjFWioptUhPx+cjvIX29+shj+
 H2FTiWAg7DALGNt091fWyTTZrznyPR6h3QMP+ihVhbeKdd/rpM+q4ZuCu8LAEB278hlZ
 vwvbzRUrXaOYCfq64Jimklht8ygqhySTUIcbvtJN4bJ/+maPMYC5gw5MtdVfxD0HIbdq
 apRsVT85qeLuXMvBYwFGUgUP2cfL4l4zxb9pL7J+0uTw4qKz3jGREEHEDgIKspnkAlfh
 r7ZQ==
X-Gm-Message-State: AOAM533tvHQvGJYYlBSRylXqjZNAeKS07OzzqVL5Hn5fsusR4j1AF8hL
 QXGYRPW0LeHMgCVZN+euy3sT6tdvOsI=
X-Google-Smtp-Source: ABdhPJzEAx6xREDM5zHl0hlVYO6LWsJ7+tECej88HZ2Ds3bBORN4sB8FB7JiInHPjM1Qwj0/SHwr5w==
X-Received: by 2002:a1c:43c1:: with SMTP id
 q184mr20427776wma.153.1636583683987; 
 Wed, 10 Nov 2021 14:34:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t9sm1160792wrx.72.2021.11.10.14.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 14:34:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 23:32:44 +0100
Message-Id: <20211110223244.2116243-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix musl build on riscv
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since gdb 10.1 and
https://github.com/bminor/binutils-gdb/commit/bf84f7066626c78884436e1c39fb60f04c665f21:

../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
      |                   ^~~~~~~~~~
      |                   ELF_NGREG

musl fixed the issue with
https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570

Fixes:
 - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../10.2/0007-fix-musl-build-on-riscv.patch   | 60 +++++++++++++++++++
 .../11.1/0007-fix-musl-build-on-riscv.patch   | 60 +++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
 create mode 100644 package/gdb/11.1/0007-fix-musl-build-on-riscv.patch

diff --git a/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
new file mode 100644
index 0000000000..983f3b30d0
--- /dev/null
+++ b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
@@ -0,0 +1,60 @@
+From c3fdbc0a24c83246f951ba79c7167547da979ae5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 10 Nov 2021 23:14:54 +0100
+Subject: [PATCH] fix musl build on riscv
+
+Fix the following build failure raised with musl:
+
+../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
+../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
+  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
+      |                   ^~~~~~~~~~
+      |                   ELF_NGREG
+
+musl fixed the issue with
+https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/nat/riscv-linux-tdesc.c  | 5 +++++
+ gdbserver/linux-riscv-low.cc | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
+index 837b1707e0f..667c013006a 100644
+--- a/gdb/nat/riscv-linux-tdesc.c
++++ b/gdb/nat/riscv-linux-tdesc.c
+@@ -31,6 +31,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* See nat/riscv-linux-tdesc.h.  */
+ 
+ struct riscv_gdbarch_features
+diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
+index 8bf97ea4aa3..1142dbc7b16 100644
+--- a/gdbserver/linux-riscv-low.cc
++++ b/gdbserver/linux-riscv-low.cc
+@@ -30,6 +30,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* Linux target op definitions for the RISC-V architecture.  */
+ 
+ class riscv_target : public linux_process_target
+-- 
+2.33.0
+
diff --git a/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch
new file mode 100644
index 0000000000..983f3b30d0
--- /dev/null
+++ b/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch
@@ -0,0 +1,60 @@
+From c3fdbc0a24c83246f951ba79c7167547da979ae5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 10 Nov 2021 23:14:54 +0100
+Subject: [PATCH] fix musl build on riscv
+
+Fix the following build failure raised with musl:
+
+../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
+../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
+  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
+      |                   ^~~~~~~~~~
+      |                   ELF_NGREG
+
+musl fixed the issue with
+https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/nat/riscv-linux-tdesc.c  | 5 +++++
+ gdbserver/linux-riscv-low.cc | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
+index 837b1707e0f..667c013006a 100644
+--- a/gdb/nat/riscv-linux-tdesc.c
++++ b/gdb/nat/riscv-linux-tdesc.c
+@@ -31,6 +31,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* See nat/riscv-linux-tdesc.h.  */
+ 
+ struct riscv_gdbarch_features
+diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
+index 8bf97ea4aa3..1142dbc7b16 100644
+--- a/gdbserver/linux-riscv-low.cc
++++ b/gdbserver/linux-riscv-low.cc
+@@ -30,6 +30,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* Linux target op definitions for the RISC-V architecture.  */
+ 
+ class riscv_target : public linux_process_target
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
