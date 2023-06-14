Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B6AEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 15:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A4E160E5F;
	Wed, 14 Jun 2023 15:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A4E160E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCWQGNkpsncv; Wed, 14 Jun 2023 15:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C98B61341;
	Wed, 14 Jun 2023 15:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C98B61341
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF9151BF303
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 15:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86D5A41B1B
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 15:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86D5A41B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_OLZXq6LBDd for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 15:26:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C701E41AEF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C701E41AEF
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 15:26:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f8ca80e889so7705805e9.3
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 08:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686756396; x=1689348396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ssAl043Vsbmi3SO4Kn0fEiOPc+tZjseJPfMYahZSGgM=;
 b=fhKy6UwKyyr8+QYUfYGkX9s1FzBzhhPeenLvVUoLKdoUdMKDmcfCVua0ZntSpq0Egn
 jLtPk9432P/LHHkoN3x5f1hIgq9wCgfqkgJowsGfO4YfWh0lg63TncoC6dQxo+9gYuH7
 /4reKAZE6D5xzPv3AzPG9rZhs14tKOmH1rmc3/11jDxfVQqzEGciiavM65nB5jP8JzBR
 c+0MlogR9PSqciGX0OvdoKOOcLbcx8dLKd5HsysmXA5wKUKYXymNByxy9a+S9iSQj1bt
 C+o1nlFamXoEpjIdJJnv/vFw2KbeMYEGZoBU+/wOMpJyLznbigiHE77nOkn8DFygFuZo
 q7pw==
X-Gm-Message-State: AC+VfDzvnCgaFU1QH/HHXcmh4cdRpxBQo+d+rLX09IaHGPSH7FO5SoF6
 kHVZQERrpz1mFREJbBNqJ04xxyRALWbxmK+47xw=
X-Google-Smtp-Source: ACHHUZ78qHV0tXoscDtmxCIrHk9VBo6WE9k1igHwnfAVkghX72aaRmkq618sftpUU5F0a143YaybqA==
X-Received: by 2002:a05:600c:2212:b0:3f4:23b9:eed2 with SMTP id
 z18-20020a05600c221200b003f423b9eed2mr12155214wml.38.1686756396585; 
 Wed, 14 Jun 2023 08:26:36 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c211a00b003f42314832fsm17745721wml.18.2023.06.14.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 08:26:36 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 17:26:34 +0200
Message-Id: <20230614152634.23608-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686756396; x=1689348396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ssAl043Vsbmi3SO4Kn0fEiOPc+tZjseJPfMYahZSGgM=;
 b=up2z049sEQ50iYxWzumXjNhZaRHz0m3ZSk2/yg9423pXCPDj1FkaaJ/Ievp/crCDKZ
 IdEGgELpAfGi5fEJLzRkqdPrrazII0Bb6Lbd3Jr9tsVRVsD4sot4s7Fj/43g3rP7NonG
 /tNifklmObLiLAeSY8zqT7IiPEhjvOMkEYeoq0uNiI5yW8S47RhsnZT4/dcQLqBOExal
 fVPGEtsa3QM0yMAyqVHRPkMcNkiCxSSGarn+U77la1TMDUg52Ip3hMep88KfuwIQN5fB
 sJbGN9ZD1vrD01Ycn7F3OqSzYal72cGvj2DKcMV8VCUjTm0jZTlQK92RhVjaM3hdGuw4
 0/Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=up2z049s
Subject: [Buildroot] [RFC] package/qemu: fix build on mips* and powerpc*
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

linux/mman.h define MAP_SYNC (0x0) as legacy / undefined architecture
specific flags to be ignored by mmap handling code [1].

But MAP_SYNC may be undef by musl toolchain arch/<arch>/bits/mman.h
header [2] when targets (mips*, powerpc*) are not using
asm-generic/mman.h to have MAP_SYNC defined.

Fixes:
http://autobuild.buildroot.org/results/dbd/dbdba73b0adeaeebb97da146e7df6c2cd0b48422
http://autobuild.buildroot.org/results/287/287b4e8e77914a6181cab2b632b7e3412c3b781b

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b6fb293f2497a9841d94f6b57bd2bb2cd222da43
[2] https://git.musl-libc.org/cgit/musl/commit/?id=9b57db3f958d9adc3b1c7371b5c6723aaee448b7

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
I believe it may be a musl toolchain issue when MAP_SYNC is undef from musl's
bits/mman.h header. I'm not sure that qemu (upstream) should handle this issue
from util/mmap-alloc.c.
---
 ...-alloc-fix-build-on-mips-and-powerpc.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/qemu/0003-util-mmap-alloc-fix-build-on-mips-and-powerpc.patch

diff --git a/package/qemu/0003-util-mmap-alloc-fix-build-on-mips-and-powerpc.patch b/package/qemu/0003-util-mmap-alloc-fix-build-on-mips-and-powerpc.patch
new file mode 100644
index 0000000000..528ba3dc78
--- /dev/null
+++ b/package/qemu/0003-util-mmap-alloc-fix-build-on-mips-and-powerpc.patch
@@ -0,0 +1,52 @@
+From e244dbccc229c9973b900f1ca4b8c3b61f5305b4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 13 Jun 2023 23:27:07 +0200
+Subject: [PATCH] util/mmap-alloc: fix build on mips* and powerpc*
+
+linux/mman.h define MAP_SYNC (0x0) as legacy / undefined architecture
+specific flags to be ignored by mmap handling code [1].
+
+But MAP_SYNC may be undef by musl toolchain arch/<arch>/bits/mman.h
+header [2] when targets (mips*, powerpc*) are not using
+asm-generic/mman.h to have MAP_SYNC defined.
+
+Fixes:
+http://autobuild.buildroot.org/results/dbd/dbdba73b0adeaeebb97da146e7df6c2cd0b48422
+http://autobuild.buildroot.org/results/287/287b4e8e77914a6181cab2b632b7e3412c3b781b
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b6fb293f2497a9841d94f6b57bd2bb2cd222da43
+[2] https://git.musl-libc.org/cgit/musl/commit/?id=9b57db3f958d9adc3b1c7371b5c6723aaee448b7
+
+Upstream: not submitted
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+I believe it may be a musl toolchain issue when MAP_SYNC is undef from musl's
+bits/mman.h header. I'm not sure that qemu (upstream) should handle this issue
+from util/mmap-alloc.c.
+---
+ util/mmap-alloc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
+index 5ed7d29183..a3994b8610 100644
+--- a/util/mmap-alloc.c
++++ b/util/mmap-alloc.c
+@@ -25,6 +25,14 @@
+ 
+ #define HUGETLBFS_MAGIC       0x958458f6
+ 
++/* MAP_SYNC may be undef by musl toolchain arch/<arch>/bits/mman.h
++ * header when targets (mips*, powerpc*) are not using
++ * asm-generic/mman.h to have MAP_SYNC defined.
++ */
++#ifndef MAP_SYNC
++#define MAP_SYNC 0x0
++#endif
++
+ #ifdef CONFIG_LINUX
+ #include <sys/vfs.h>
+ #endif
+-- 
+2.40.1
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
