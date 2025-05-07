Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C01C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5701961386;
	Wed,  7 May 2025 21:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnKMhqViRKDh; Wed,  7 May 2025 21:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1459361325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1459361325;
	Wed,  7 May 2025 21:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 743C515A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65B1383DD2
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTkdcAGIcEzi for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AD5783DD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD5783DD1
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AD5783DD1
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so222757f8f.1
 for <buildroot@buildroot.org>; Wed, 07 May 2025 14:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746652875; x=1747257675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxyJAb0QAdp0dCP2ucqRt+1LUnv1QBQtyvrEwbIbv1k=;
 b=v/Yz0IzHv2M/VQL9y5QmUw6232JaEuuQUqO4MGB5ScecESdouIQMU2b5WTvrUDCdaR
 0WMAT7kdtTptlqOgc6srfRfHQSWUW3B5fUB334cUBArhqOgI/QK0vw3b33jhq+NfcpzC
 2D7GTN2qee1XMOU3un4cEdb9IQKQWBUunuvvQdqFLjtAU/CzKhIepr5VmiyfVNmxzqP/
 gN1ltPPlM4eTGCIo9gR0a643arJr83BZEbC0E/yHyCK8TJ3LVrwwV6dr3OHqTqpcbM3L
 4nZlZN2yisMp0UvPQHYXIBzO7gPk2dukw5Uh+FJAXrsANkSPGXXHIBkMtbwjvcoaQme0
 iw3A==
X-Gm-Message-State: AOJu0YyXrsUVEur/Dyla5DP3tpROJrkjwZmTZvqDS50XAxAebpycdobx
 sGfVMWT8FsVTSJWiJ0/f8ELB7cxjc7ei2kqgm34rRCecONIRi5Oe2Z4L5Eg3DABCkvrI6WJQB1g
 Q
X-Gm-Gg: ASbGncslyR+ASlmBTjoQCNJnpZyVH/wvA/SzsssOFdD1rBB/r9Z//26Xz5e4YLjM19D
 kh5Z/oL1LZ0+lpUrwxDtXJfYh4o6OSL2FFPtwmegNSInljxZRC4IntY04fo14wz47aUgAngi6+d
 bk2JC7y/N/23X3CzkWhLT5gKTleqq/Wl+S+KrqMmJU6SkOPuKpU/7ZlU/zt2fFqB+C/AFHvAUFg
 Fa0A1d+cZmRbiYpHqWP47nQWW2eMbZvoVmXHqllfsAv7t2QoK6nJNSc3i34SBUCRymsOOTMXNs7
 tnstCuJgAEEh0OjRiChXkLos9SC0YQz4VyRDTK8gwgKGiMHUgE0oM/95kqsu3Od1bF52WYP1NnT
 Ob6AUhsQLMweDo21NzGvytl9uLIdzt1CXt4ytMV4=
X-Google-Smtp-Source: AGHT+IGy6hKXZ5P10GwBVoFuUS+5OMNdaumFWYhJowwad1JeU6CpZQjxi1wM5CMYkaGrV7lOx6edoA==
X-Received: by 2002:a05:6000:2512:b0:3a0:8495:cb75 with SMTP id
 ffacd0b85a97d-3a0ba0998c1mr409717f8f.9.1746652875407; 
 Wed, 07 May 2025 14:21:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm13109785e9.39.2025.05.07.14.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 14:21:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  7 May 2025 23:21:11 +0200
Message-ID: <20250507212111.748688-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507212111.748688-1-romain.naour@smile.fr>
References: <20250507212111.748688-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1746652875; x=1747257675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WxyJAb0QAdp0dCP2ucqRt+1LUnv1QBQtyvrEwbIbv1k=;
 b=BoRF7jYB601cjZBDt5KgmVajhSNRU8FuZ0bD9qtf1dL61wnqLohBYn84awc/HgjhnB
 PejJB7ju5DUqVDAK+y9a+f+hwcQ0V+TmLkG2iYU1LoF0EDXhwRULNYZ2yQDOkCw22G4k
 2FedmQzGZ0Km87k/H3mMQTBNaIVKOyFcYEwzI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=BoRF7jYB
Subject: [Buildroot] [PATCH 3/3] configs/qemu_ppc*: backport a patch for GCC
 15.x compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

powerpc kernel maintainer merged a patch [1] for GCC 15.x compatibility
that will likely be merged upstream soon.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=5a821e2d69e26b51b7f3740b6b0c3462b8cacaff

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...2-powerpc-boot-Fix-build-with-gcc-15.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch

diff --git a/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch b/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..78a4034a32
--- /dev/null
+++ b/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 2d04c5b3c5728cd5e5202176e8796ffc0085c24a Mon Sep 17 00:00:00 2001
+From: Michal Suchanek <msuchanek@suse.de>
+Date: Mon, 31 Mar 2025 12:57:19 +0200
+Subject: [PATCH] powerpc/boot: Fix build with gcc 15
+
+Similar to x86 the ppc boot code does not build with GCC 15.
+
+Copy the fix from
+commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
+
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next-test&id=5a821e2d69e26b51b7f3740b6b0c3462b8cacaff
+
+Signed-off-by: Michal Suchanek <msuchanek@suse.de>
+Tested-by: Amit Machhiwal <amachhiw@linux.ibm.com>
+Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
+Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
+Link: https://patch.msgid.link/20250331105722.19709-1-msuchanek@suse.de
+[Romain: backport to 6.12.27]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/powerpc/boot/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
+index fa8518067d38..60a495771c05 100644
+--- a/arch/powerpc/boot/Makefile
++++ b/arch/powerpc/boot/Makefile
+@@ -70,6 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
+ BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
+ 
+ BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
++		   -std=gnu11 \
+ 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
+ 		   -fno-strict-aliasing -O2 \
+ 		   -msoft-float -mno-altivec -mno-vsx \
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
