Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CD8CD8C88
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BF460DAA;
	Sun,  7 Jun 2026 13:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQOlpO-RlGeB; Sun,  7 Jun 2026 13:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 209C460C0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837350;
	bh=pqdQ1RNcqCoKADCvxBT7yobR4q5cfFtxlqsIHRnDGDo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L1Cba4wwhUWzezzSOexpzKrvF/1ZVtsggBTRjs0Q7a0fC2fmzWarGuWmRl7VH2WN/
	 qdUKw4ynk6g4NqH8/ObkbamugbodrSmFlD+GmNW0wYCYOz0J8gPGgdooWvqWawVbjb
	 oYBQLvRmkipufHZ6r6fAU7JVCArmPV1hWtZYUmj/1wWM9TKb6KSA4ahzGb8gm3spJx
	 iuQ/Ux8rApjyGqACijJftpLTDEmnVTvVBH08m1ls+q2ZVPaJVr148B/2gJrG4gzhDP
	 b84nbaGf9W8jSNl0bek6perMUZyCFVRXNicNf1EKh4tCOXkjChbw6rY8ti1knq+fad
	 2MmeHgz1yq7yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209C460C0E;
	Sun,  7 Jun 2026 13:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C04F32C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE33A60C0E
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WRjvGutSpWY for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA97A60B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA97A60B0A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA97A60B0A
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2975F3ECC0;
 Sun,  7 Jun 2026 13:02:22 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:12 +0200
Message-Id: <20260607130219.1350128-2-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTF6ZuMkpEt+Alv83M7SSgieYFOUd0bcSr+5BSYrpGi2zjRvGX7AG3gWEt4kA9GLoIQohjRMdIZrK5kIRe2Fq9BFWs2+vt/Hsl3qhiwoGlmrH1WhyKdBTu/tCo2Xk5HFlbhoKCJlY5TqQd10v6lk5/7a+aAyxh0+AWG8yhXSQXxA7kwg5f1fsBdy54QEUzX5Wwow43SbqFbDlXehp91TjqJe6uvaPq+reh0eE+GP4YYBAMByZVVxKNtQne8A3H3XfRwt/Om5SGG2rvEdPMg6aG7pxPnNMS/JJvGm2HxfVtJMk34w9z4/rjGplfP5z+KhZQm4rG4TZ/IoFWF4mVtgOnHdRkMgm3i6cdO3o28ujl5HqHeH+WC5a7AW5A0NMHP/FeQM/doCI47fXCsyU1XTu+SDrVhcMmGFAH1znZdAZ7GIxh9M4E6jJoemxUjt+nzGsOF7tCGjI7PrbpviS8DnoxGqM64uRDxaxyiDRcO7+0L9Yz34blcGBIvehQnJKxQC6CmBs/x39fieMPTpTk31+4MgVUw+XJqHS3Bhg3UB4ZZLOyjFvxus5gpAm7zd7TmoZchozVAV6CcPZ4p0/ASg6KYY0GNNPCwFtt9ffmjw1UqW61Uxs6RD0PRHozwpTEBc2pCJaJZO5nFKtmvPL9zg77XZwOn7Felk6rx1RhlpTjpTbw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjAxOvBLQ8CEE1VppsEeEWz2LC4ZysU7B9sWIqP9ihk=;
 b=lWhwwhY3dOXPpYQ+vlij4O38A+yI2/tN6TGBU8MO0OQx43jtAxGMaOIP+8Xo5DkaH5LEm9
 MQzmdQzDVlEl1xyrPcVrkofdASxas23+DelfQsYhqUJ2LUoC8C3aYxeaRpcIvumClUZpHh
 uXFY3RRwYLwezY7Y1oVCUmf1Mcyark43hFPgKKooJHSCf5TKgKwyla7WoECq2K5O7ak8sJ
 zOMEhdRGqikDtp5lAspB00cgCE9iKYKKkNdxWZavfyjXWKLsgtBYvOKngBI8EPPqWOai1S
 6AihTg37IupE0HCjY5RzUxsoLnE7Rj6GIRQOY6yhjH94xFeavAu5S5qds2iVpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=lWhwwhY3
Subject: [Buildroot] [PATCH v2 1/8] arch/Config.in.m68k: add ColdFire
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
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
Changes since v1:
 - No change since v1.

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
