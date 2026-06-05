Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CC0CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6778282564;
	Fri,  5 Jun 2026 18:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F30VJIZ1xudJ; Fri,  5 Jun 2026 18:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221ED8254D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780683269;
	bh=ihmHf0FaeIn+AszN+AcECV6Wc4lPNY6ocVZKY2a9I3I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SNsQtxDwPwHnIhUiUnbpqgEevS2dQVLOHoEm0egXoMtjaIjsMaT7Gd0b+7budEqp6
	 8+CQ8EU/C5KjFhm2hGd5pSJ/vCzEAL/j3AQPJ+Uhm37tbl5jHHkxY+TagpLQeS56x7
	 NidnmGu4qjobw1tBLJTq6nxqMrKhyQGbuj1OfDDIRs2krkN4WrcVdaNXoelJ91FgYL
	 sf0iFsNoXkeLRuAniea7eKMfnrEYQYCEITV9sNysezOYTvbSkNqdo8Y6t1VHo2RGLa
	 iD2e3h8/HIQJgX401WziD10QBgyPT6rP0/DTdRZdxYAvqDtvFwcNdJLMNSBjfvcenw
	 1QasZSml2XiyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 221ED8254D;
	Fri,  5 Jun 2026 18:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14D7826A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0639B8254A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUryCR98lRnF for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 18:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5A8982549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A8982549
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5A8982549
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:14:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso1164670f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 11:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780683263; x=1781288063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lr6ZMDpIjKFjij/2Oh7ti2rdAQc7RS5tCBkaU6VgmJU=;
 b=dr+PEvcKUkFOhKq9b6K5yMlDF1+kDrd0TO7jqwy/JcKwl97FUhJlppiYhhBhhsCIFx
 CdLf2dtrxj40eEizMq7fdFoMzPrttRGyFnT9DN0prHHA4uYkxGzk+usLMgZgqhwyiELs
 4oiA+Lsfk/yL2f9p7U7nQHS5d6tTRFyc7x7jjJp+6xfLDUwb+zv1gw0JElJ9cUFYrT+q
 XMfaJ6JcqUpKwxxk73v82qQglwzj2m6jUap/U+kJWtlgeB8oXW8yhiZJ7Y6kt8pk7zIw
 1THoiq/QSQtpcpcPbQDMFCyGS7LowL7vPeLkxWMkOjO2p/KXOIjsB33OODVeV5VxEmi1
 q0vQ==
X-Gm-Message-State: AOJu0YzU94bBLh1KOK1dQiKjwd/yphhOa5gICWsSwvZD6dGXFDgC7Wu0
 o1ORSf1e9s+gLo61HWbBwIgNAcTzS2WmddaE24fxQr1HyX+M5/nBf8JucviEbpJgs7rl/sWNHam
 iyYkd
X-Gm-Gg: Acq92OEvU4H8vjCXzjJpuyn4Tyqj8xdXMqV9R8osEG+IZ2EsUCgCwxvmCeb/DOSK7kx
 YSPRmPQH4BJ2XP9kRkyRWSfkEu2nEm6pkZXmI/rCAkq7yu0zVOTHTKd4nvr8oEr9t3l6ok50Q62
 Op93fF4XvdriAwLXmtqdHnyYA6OLyCb/HBOmXenztO8HFJ8fiSwz+ogOz7R9FaocYHqkB0cO/I9
 B0LOvjJqnl6Lp6zFbQIWhxceMyBDomaIbro8THglor24SCCmJq7NMm8OtV3Fxt+5aqbZUCj0x4z
 z4Ad6yzKVvidGE1DhGpO09MRReu3MJu5+9m1eBYurMqkucTp4Fp+YGu2LqZyspIRy3Ff2q/1l1P
 zK+gJZRBkhY0SVGZYu97a3gUnhu3bTyIkyOr4ilOnzaLJ0NMjc8nE+573EU8KktKTEsfSN6pq0x
 ezCjtjSakD6/96wdB6fuW9tNQFDG+K/Phy+v6UUPzOKSEEnINJWgr9M7qFS+cEt8xIqppxKXbQL
 W0w5/RIPINIMYuDhYq8+AZPIbiR7KAuZZq9I/vDeHpG1ho=
X-Received: by 2002:a5d:4d0b:0:b0:44b:5398:4e85 with SMTP id
 ffacd0b85a97d-46030502519mr6061025f8f.22.1780683263576; 
 Fri, 05 Jun 2026 11:14:23 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm27287641f8f.18.2026.06.05.11.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 11:14:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  5 Jun 2026 20:14:20 +0200
Message-ID: <20260605181420.383958-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780683263; x=1781288063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lr6ZMDpIjKFjij/2Oh7ti2rdAQc7RS5tCBkaU6VgmJU=;
 b=tPoqvUUU6d3FzjV/1CLjwOm3pgAB6TWETsnI48XSOcnfvHBVuX+S3R+3r1GaNW6bR2
 vYt2pAKfufM8zeXDOrD6ho4g3lARjGglOjwCSC3PR8JwsQX6NaFdKnvk8HVdPUW2xNR4
 jIab7Pi8hbV/BP2dHfLqh6p5M+Cq7ht1LZa2w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=tPoqvUUU
Subject: [Buildroot] [PATCHv2] support/testing: TestJailhouse: backport
 gcc-15/std c23 from imx-jailhouse fork
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

The jailhouse runtime test doesn't build since the last ARM aarch64
toolchain version bump [1]. This new gcc 15 compiler use a new C
standard by default (c23) but since the jailhouse build system
doesn't specify any versions of the C standard, so it doesn't build
with gcc 15.

As reported by John Ernberg on the mailing list [2], jailhouse git
repository has not seen any activity since 2023.

As suggested by Julien Olivain and Peter Korsgaard [3] backport
gcc-15/stdc 23	from imx-jailhouse fork as a short term solution.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843463

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://lore.kernel.org/buildroot/20260601204735.888967-8-j@j-ernberg.se/
[3] https://lore.kernel.org/buildroot/878q8uk9qf.fsf@dell.be.48ers.dk/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
V2: backport gcc-15/stdc 23 from imx-jailhouse fork
---
 .../0001-YOCIMX-9281-1-Fix-gcc15-errors.patch | 119 ++++++++++++++++++
 ...81-2-hypervisor-arm64-fix-strh-usage.patch |  38 ++++++
 2 files changed, 157 insertions(+)
 create mode 100644 package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
 create mode 100644 package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch

diff --git a/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch b/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
new file mode 100644
index 0000000000..15e10714c1
--- /dev/null
+++ b/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
@@ -0,0 +1,119 @@
+From da2aa3c97fe9a374709c4bddf9b55253d53e1350 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Thu, 12 Jun 2025 06:49:58 -0700
+Subject: [PATCH] YOCIMX-9281-1: Fix gcc15 errors
+
+Fix several instances of the following errors:
+
+```
+| inmates/lib/include/inmate_common.h:87:16: error: cannot use keyword 'true' as enumeration constant
+|    87 | typedef enum { true = 1, false = 0 } bool;
+|       |                ^~~~
+```
+
+```
+| In file included from configs/arm64/hikey.c:16:
+| include/jailhouse/cell-config.h:318:41: error: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (6 chars into 5 available) [-Werror=unterminated-string-initialization]
+|   318 | #define JAILHOUSE_SYSTEM_SIGNATURE      "JHSYS"
+|       |                                         ^~~~~~~
+| configs/arm64/hikey.c:26:30: note: in expansion of macro 'JAILHOUSE_SYSTEM_SIGNATURE'
+|    26 |                 .signature = JAILHOUSE_SYSTEM_SIGNATURE,
+|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
+```
+
+Upstream: https://github.com/nxp-imx/imx-jailhouse/commit/2be7793ca658015470fe0d60c0c973e12ce68d73
+
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Peng Fan <peng.fan@nxp.com>
+[Romain:
+  use "__STDC_VERSION__ < 202311L" as suggested by Peter Korsgaard
+  https://lore.kernel.org/buildroot/878q8uk9qf.fsf@dell.be.48ers.dk/
+]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hypervisor/include/jailhouse/header.h | 2 +-
+ hypervisor/include/jailhouse/types.h  | 2 ++
+ include/jailhouse/cell-config.h       | 4 ++--
+ include/jailhouse/hypercall.h         | 2 +-
+ inmates/lib/include/inmate_common.h   | 2 ++
+ 5 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
+index 518bc5cb..324eb94b 100644
+--- a/hypervisor/include/jailhouse/header.h
++++ b/hypervisor/include/jailhouse/header.h
+@@ -55,7 +55,7 @@ struct jailhouse_header {
+ 	/** Signature "JAILHOUS" used for basic validity check of the
+ 	 * hypervisor image.
+ 	 * @note Filled at build time. */
+-	char signature[8];
++	char signature[8] __attribute__ ((nonstring));
+ 	/** Size of hypervisor core.
+ 	 * It starts with the hypervisor's header and ends after its bss
+ 	 * section. Rounded up to page boundary.
+diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
+index 6d78ad6d..80f2a9ca 100644
+--- a/hypervisor/include/jailhouse/types.h
++++ b/hypervisor/include/jailhouse/types.h
+@@ -19,7 +19,9 @@
+ 
+ #ifndef __ASSEMBLY__
+ 
++#if __STDC_VERSION__ < 202311L
+ typedef enum { true = 1, false = 0 } bool;
++#endif
+ 
+ /** Describes a CPU set. */
+ struct cpu_set {
+diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
+index 17d59306..affce1c2 100644
+--- a/include/jailhouse/cell-config.h
++++ b/include/jailhouse/cell-config.h
+@@ -91,7 +91,7 @@
+  * structure.
+  */
+ struct jailhouse_cell_desc {
+-	char signature[5];
++	char signature[5] __attribute__ ((nonstring));
+ 	__u8 architecture;
+ 	__u16 revision;
+ 
+@@ -330,7 +330,7 @@ struct jailhouse_pio {
+  * General descriptor of the system.
+  */
+ struct jailhouse_system {
+-	char signature[5];
++	char signature[5] __attribute__ ((nonstring));
+ 	__u8 architecture;
+ 	__u16 revision;
+ 
+diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
+index 07574d3d..cf58a4c9 100644
+--- a/include/jailhouse/hypercall.h
++++ b/include/jailhouse/hypercall.h
+@@ -107,7 +107,7 @@
+ 
+ #define COMM_REGION_GENERIC_HEADER					\
+ 	/** Communication region magic JHCOMM */			\
+-	char signature[6];						\
++	char signature[6] __attribute__ ((nonstring));						\
+ 	/** Communication region ABI revision */			\
+ 	__u16 revision;							\
+ 	/** Cell state, initialized by hypervisor, updated by cell. */	\
+diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
+index 1c20a0af..cae2a673 100644
+--- a/inmates/lib/include/inmate_common.h
++++ b/inmates/lib/include/inmate_common.h
+@@ -84,7 +84,9 @@ typedef u32 __u32;
+ typedef s64 __s64;
+ typedef u64 __u64;
+ 
++#if __STDC_VERSION__ < 202311L
+ typedef enum { true = 1, false = 0 } bool;
++#endif
+ 
+ #include <jailhouse/hypercall.h>
+ 
+-- 
+2.54.0
+
diff --git a/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch b/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
new file mode 100644
index 0000000000..9b75b8bdbe
--- /dev/null
+++ b/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
@@ -0,0 +1,38 @@
+From bc09bd33a23f9599b0cb4596a0b7f5c601a74c75 Mon Sep 17 00:00:00 2001
+From: Peng Fan <peng.fan@nxp.com>
+Date: Mon, 25 Aug 2025 09:48:05 +0800
+Subject: [PATCH] YOCIMX-9281-2: hypervisor: arm64: fix strh usage
+
+hypervisor/arch/arm64/entry.S:555: Error: immediate offset out of range
+
+Per ARM spec:
+STRH (immediate)
+<pimm> Is the optional positive immediate byte offset, a multiple of 2 in
+the range 0 to 8190, defaulting to 0 and encoded in the "imm12" field
+as <pimm>/2.
+
+So align sdei_event to 2 bytes aligned.
+
+Upstream: https://github.com/nxp-imx/imx-jailhouse/commit/98f6f8dc23d6b3d4fe5b15045ccb3d3ef36747be
+
+Signed-off-by: Peng Fan <peng.fan@nxp.com>
+[Romain: rebase on top of latest commit on upstream repo
+  https://github.com/siemens/jailhouse/commit/e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hypervisor/arch/arm64/include/asm/percpu_fields.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hypervisor/arch/arm64/include/asm/percpu_fields.h b/hypervisor/arch/arm64/include/asm/percpu_fields.h
+index 67573fd6..118d69d0 100644
+--- a/hypervisor/arch/arm64/include/asm/percpu_fields.h
++++ b/hypervisor/arch/arm64/include/asm/percpu_fields.h
+@@ -13,4 +13,4 @@
+ #define ARCH_PERCPU_FIELDS						\
+ 	ARM_PERCPU_FIELDS						\
+ 	unsigned long id_aa64mmfr0;					\
+-	bool sdei_event;
++	bool sdei_event __attribute__((aligned(2)));
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
