Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3445EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 07:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2CD817EB;
	Tue, 22 Aug 2023 07:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2CD817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reRzqSEF2-Rb; Tue, 22 Aug 2023 07:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D019817B0;
	Tue, 22 Aug 2023 07:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D019817B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A565C1BF20B
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 07:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE4C817B0
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 07:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE4C817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EP4OpbydQ2ct for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 07:45:16 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 125F0817AA
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 07:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 125F0817AA
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6A5603520C26; Tue, 22 Aug 2023 09:45:12 +0200 (CEST)
Date: Tue, 22 Aug 2023 09:45:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZORnh9dzTr/VmBfa@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692690312; bh=YO50wtNbafJDVYqIr6ZqHYYdOK86ubllmo5UMXpWpks=;
 h=Date:From:To:Subject:From;
 b=YQY+6V5QIIB4mXpcOk8ZiDqb9yXLDRJxm1MMyckKbc36gJqay2uO3FvXS714HntDw
 655W2NLRnU/N2Cdg9uQ5u/UNpI1lprtmU28mf/12ek6vx0qbXWbfUDeUkq8bjVoni7
 7mUo9feln4XKnO1zUr6Pl+MZ8fqpYkY/KU0/tghqy3egglUuwdl78P0PNu8FTuxSm1
 52mOKMW56Xs8r6701M8DMGJuNHwBu+j0L6LnS9JivUNQRCKtTsQCPyuvWekiuPf4xa
 2MIaSwB8+G621Y5mwgebGZ8E184AcAKejplpydzkJuWL+7svTjyXvvWysl74teiWVZ
 xfwJHdDcwo2aA==
Subject: [Buildroot] [PATCH] package/gmp: fix compile error for riscv
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 87b2a30319394c2cc79efae1af7833cad8c62b32 gmp got updated
to 6.2.1, since then the compile error exist.

Compile error looks like this:
tmp-mul_1.s: Assembler messages:
tmp-mul_1.s:55: Error: unrecognized opcode `mul a5,a7,a3'
tmp-mul_1.s:57: Error: unrecognized opcode `mulhu a7,a7,a3'

Patch should be backported to stable branches.

Fixes:
 - http://autobuild.buildroot.net/results/2f2/2f2112bea73adbf49eabb62fe6cda6a9cd5d0567
 - http://autobuild.buildroot.net/results/566/566a4945555b781ed127997176f73b3c17ecab5d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gmp/gmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 9b402767fd..3b732dfa71 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -23,6 +23,11 @@ ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CP
 GMP_CONF_OPTS += --disable-assembly
 endif
 
+# GMP needs M extension for riscv assembly
+ifeq ($(BR2_RISCV_ISA_CUSTOM_RVM),)
+GMP_CONF_OPTS += --disable-assembly
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GMP_CONF_OPTS += --enable-cxx
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
