Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBE3FED3C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA648469F;
	Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2EntkT_kSoM; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2AEC84692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037766;
	bh=0zc8eIJ/rKjcbmZ3XZYMdlk33hQ1+FW52YlHaznu+OU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AXY8NnLGr9/g6N0bzYdVsZ5IFYMMg1PALCDsi6Y2FOdYzLk26dR5ro9B3mPbjoiLh
	 yphN52WJ2+5wQVooIom7QEgyldTW2/Rr2Z8hy7ebwPg/15eEoWDRoGJt2H9uCBM08N
	 SXh1ncKBCx+Nj62a/XUgr7+PqsMJVWBoXaOLpjNzgjd5Nf0KegIephwppCjPqWO0HS
	 Tubn1I17R9Ew7BW7IomyKHeIU6nKyIDYG87FxwSMs2cr3r96eupmlsl/ovok9fRcem
	 rPPld5DHInNll5MGrqGLziD5vIxDLr3ZFb6rG9mQo5UpqSC625wli5F9YUCuX04WZE
	 8NMpvcUgBmbWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2AEC84692;
	Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2470E24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A05061AFD
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PO-vmd2QNy4Y for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4A5B61AFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A5B61AFA
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4A5B61AFA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 4B4105834F3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E00343EC11;
 Fri, 24 Apr 2026 13:23:33 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:18 +0200
Message-Id: <20260424132326.825570-4-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTEC1Q4pz8nDbG5ZqSazyCILKM4MPdnfNJ3qcouBfnvj0Oe1zTf3wBAFWydUfJLGGDDf+L7+qdn24qGe3cy1ssjylhqy3qydUn3aCCPzMUGkGpgYRluzHpqwZ2m1uD/efSi/MEEHvZge9r6Wx7faTeaTpqSHPSXxFKw3vIp8MmsCHm8AR88pEizxNzLCMSyrvNFUFlDkD6D3J8RnFlAMa0Fy0/bMtgsAFNZQK928hMG6dZlMby11VEdLN+c56EwcQNwZPKxRLEQdsLiUtwI8SgkgFIXJ17YYuKkK739vC0/HCUEUCWbAXqVRue/Af6daOC9RTuuoGLjcxCM/dX0D+hYBhXPiu1qws7Tv7QC1BuITtzrh4AzoMjyrrU9HAHkrKgFbO24P844OKyN5ZmvIsw886ANeUf5fuy/Zep3TPQ6L8ihYdrFF/uLKg3MUEhTegVI/4G4xZqhz6i0pnqEqz5QspwKkrbvLEb8bgn79V7t32aQzfY6UQaTd5CNj2HGROjBrly3Z8eLTqBDmkQzsCyg1/8NyKthkO7cg3ELhQ+UkbWaxPxrfQY4pvpm/4dxcaKxAw0FDeZQZMHn/IP/XTqO3VXKKCRcxmcNjnwU/TSafA4505v3Ht+dUMiJFdxci4XTSu78iFpJBDyIZTeWecZZ8W9TF9JxqRwc4o8c6wn1Zhw
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuVgB9g1PiVKBeDt91jfc2IOvrk1zrVphSoaz99E8go=;
 b=SuOszew4y8pV+YIiBplzKw6xz0rAOKvp6aEPyYcH6xaaOqUS8mcZkefb/Odkrh2Pol4oQb
 kmo71Nhgygiug+e8OrJew5aNs9d8Lmnui+thqSHtZNNLmFkS2urBZ6jclzds+lloELLeIC
 qMn+w/UHJKbLN0NrIYUPKwYCGw3FwMObLbUipYdYywq9vj74LykXYHeToQXnlmjQIRTGqI
 W0nzrhgPBDDhpNwlrsCMiCttVXMC/YrcqPbZK+0i4S3ubjEZ8vQv4rrqXycY4wKDewt/Ni
 KdbE9xQOnlUi3Q0NbQi/MmuIcs2VB2IN64Qi3P19urO4Cw1j6hFus4+qQ21ohg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=SuOszew4
Subject: [Buildroot] [PATCH 03/11] package/Makefile.in: add global ColdFire
 workaround flags
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC's instruction scheduler on m68k ColdFire reorders memory accesses
in ways that break code assuming sequential memory ordering. This was
observed in uClibc-ng's elf_machine_relative and in OpenSSL's internal
state management after fork().

Additionally, ColdFire uses 16-bit offsets for switch statement jump
tables by default. Large functions such as pcre2_match() and nftables
rule evaluation overflow this limit, causing assembler errors.

Add -fno-schedule-insns, -fno-schedule-insns2, and
-mlong-jump-table-offsets globally for BR2_m68k_cf, alongside the
existing -fno-dwarf2-cfi-asm workaround.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/Makefile.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5ebb5f9ba8..42dd79118d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -211,6 +211,10 @@ TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 ifeq ($(BR2_m68k_cf),y)
 TARGET_CFLAGS += -fno-dwarf2-cfi-asm
 TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
+TARGET_CFLAGS += -fno-schedule-insns -fno-schedule-insns2
+TARGET_CXXFLAGS += -fno-schedule-insns -fno-schedule-insns2
+TARGET_CFLAGS += -mlong-jump-table-offsets
+TARGET_CXXFLAGS += -mlong-jump-table-offsets
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
