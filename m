Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F6FED3CC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DCB846C4;
	Fri, 24 Apr 2026 13:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLuO44kO98Vl; Fri, 24 Apr 2026 13:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7A18468E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037768;
	bh=2SHAOW47q5OUWc1fhBDRFUPmbRm2BCXKFe3cEL/li/4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ULahtsyTDTXHKNWZkSpUbtCNUK9+nHkZgaqLwe2Ha5Go5G0sSYe8mzEqg/YwiWRme
	 JTMZrULdxTo5jkJeYrQzL1fdFKSJ0qHyJ0Zi/8xwM67nzZeNyf94FjfYBbh+6xr4JU
	 oqiqvpfGe3V+u10X9M66064mmo2omKKq1dIx78Z0s5KUuH4xmtfST0UKhErBQlH2tD
	 rMkxJ6PkSmFmaa9fW/9I67oO6dJf31iiVAHn2SnqlaCgsFu6UCIZfJxyeXGZD2xkmN
	 ZmKs04S4Q7uUnSKtKD7eL+hqY22xHwt38KpQsEyc/cMvKXS4Nz1evKBTUSy9BFC579
	 Oy3MAfRJEz2HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7A18468E;
	Fri, 24 Apr 2026 13:36:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 400B024D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26439427F8
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlMGXvMpni2V for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36BB6427EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BB6427EC
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36BB6427EC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id CCC175834EF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF8F33EC24;
 Fri, 24 Apr 2026 13:23:29 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:16 +0200
Message-Id: <20260424132326.825570-2-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTEOK750MKkVcHWK/lYm5TRZMsTOZUqF/EGLCCfdpO2S12Ik9M2ETHKxdGifB6rLaer6anlYocxITSiA6kGh2zELB+0brb9RDVM/3eQVjIn2DEGs8iI0mqnLzccA1LLjBwCkZdFSEAjBhWnq/COMkR/AVUvmOZkAaPHET7l46jF6ryyAyTFaxNWYc1RcS+nbWjxpsvRkVfzOD2x+Vc0zvFu7AQ/hxZRJunNZ18iex2AHyMbZEQXsQH3CD6OEFg/mcV+bJrVnPdFemFHm8NJzEWdvL/KTS7j1BZ8+2xVjSO32EFiA93DscM8uIcSz2QNS7PmNA/V08TAo869jAAHW0++ga6+kKSxEIEJOOS/DMnb89nQm8V2eTmuzHsbCg9TG+60aQmiXr12ApTsccTIXbvLQtS1veaCkaMfRDIkJ9huvNRHYg2pE2vB5wRkf9dZom3bpW5Kqc60AIKPBG6Rf9vo51vXBQ4wpn5LZD5gO9U3lxievtJMuPbL00KI2y25gaM5tdlsvdHGeiWyiCRM1FCF7yehVk7pHhXaAgG3MRPO6DwxGFU6YlzaC7uWwCZIIvkP32/SxU6dkYI74i0G5ijAAr2HDnt4MEn+9C7wyRZ4EsxFcyZV6aIyPy+7SAfmnqbsbuFyQHg2tC9FRawMuUwRz5yrV49xkRmnysqmaJSkxGA
X-GND-State: clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5bl42Ztq6w0NhbtR7uukt3NfMj9GiRda1lULcGgZHg=;
 b=QwdoJkw8nCzjNoLfAHjhxOXobYTzmJsBdoO4RdaqEwsoi4ZyN+wohFTWkali7a2VRc/e0H
 eQ5HGpOSjOOnixTLZoeOSpeb8zgo09C4XsdZvuzqmSZG5fd/tu6fW+KUo4DEG9cW+GpNt0
 aa1LlTTfgQFiLbJulJMx7mp2cpYH+thkWJ8MlPKseTcd+XPzm9peM4QB5RGEo31QspjUkw
 4s9p30TdAIce/RaJkposMnpR35kpqQ1K8REBtORZ7wwyTLa2vAvBHKYjWBXpmnlTL/Zi32
 AjdTp/ZWdSWnqECnCGt16FfQkrpBdpaKmoianTW7F1mG7PKH7ZClnY1nwxqn7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=QwdoJkw8
Subject: [Buildroot] [PATCH 01/11] arch/Config.in.m68k: add ColdFire
 MCF5441x support
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

Add the MCF5441x (54418) ColdFire V4e variant to the m68k architecture
menu. The 5441x selects BR2_m68k_cf, BR2_USE_MMU (V4e has an MMU, unlike
the 5208) and BR2_SOFT_FLOAT (no hardware FPU). The GCC target CPU is
set to 54418.

qemu-system-m68k does not emulate the 5441x family, so no qemu
defconfig is added; the existing qemu_m68k_mcf5208_defconfig and
qemu_m68k_q800_defconfig are not affected.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/Config.in.m68k | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 235cafacf5..b281f43a30 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -38,12 +38,19 @@ config BR2_m68k_cf5208
 	select BR2_m68k_cf
 	select BR2_SOFT_FLOAT
 
+config BR2_m68k_cf5441x
+	bool "5441x"
+	select BR2_m68k_cf
+	select BR2_USE_MMU
+	select BR2_SOFT_FLOAT
+
 endchoice
 
 config BR2_GCC_TARGET_CPU
 	default "68030"		if BR2_m68k_68030
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
+	default "54418"		if BR2_m68k_cf5441x
 
 config BR2_READELF_ARCH_NAME
 	default "MC68000"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
