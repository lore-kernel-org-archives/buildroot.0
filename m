Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037CAEDEBF0
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C472660656;
	Tue,  3 Mar 2026 20:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cOGuYxyizZB; Tue,  3 Mar 2026 20:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB8106065C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772569657;
	bh=u+0RszYmO4yZVQBTUKpUJxMbTqRvkFjTOMCbFEHwDGY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i0BGj5sXgjBFpro4c2CFP+RTS5dh8LhrVico+l1YE2Pnlh5ffdD7IGR4l5dqsH8Ni
	 +8wRfURgfWZ0Zih15kWyd+L5ysJU6X6inzYFZNxKJGCHdOA/7LtRYWWEN7uE/Krp6m
	 ltyQMy8k9yJRgHUXYMSkC0/zCK10jF2b73U7x/YPIYwf64vQZWeeJRZ41NG7I7uli5
	 YfvplBgYszh1JUOIZiZQz0w+YxjnNSa4MZvVXMHQ8ef08IMDAbUWb4/hIaKFSNU2W5
	 RHhxvyZm2AxWUBfm998+O6vUscJtMv5vLb9+vDJwVF3pK56/E3THUHHbAZP5lnwDtP
	 kFv3rqfXwNA9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8106065C;
	Tue,  3 Mar 2026 20:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD8725B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A396065C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5HCp07Iw6Ej for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:27:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A78D60656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A78D60656
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A78D60656
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3FA4619F57E;
 Tue,  3 Mar 2026 21:27:30 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Mar 2026 21:27:05 +0100
Message-ID: <20260303202708.2065406-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303202708.2065406-1-ju.o@free.fr>
References: <20260303202708.2065406-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772569653;
 bh=9c7BG66kJtMMnUAeN+vtahtjJ1FlvNP7mq+PboOwWFI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mdMvz+XQVjpHEpaF6hra2qjhksmfyldV9Tk8EhbyEjDSg6FcQm7uIUaO27h2DHyua
 fl0ngCytFARc8Jwcxv0D7NSCwRzM07FaIgNPMbLkYUbfNBOius6g3Owzl6OVX34mUC
 9oSFFOx9g94BwGtBRlWYss+tZLgAsn6cT/9kIrtkhnM4aR5QbgnaTrW3NVsfkkCTfA
 uc5g/438tHhh+CBpJ3cTvadVon0d0BTKbx4kOq+yYQDvX4ZVttHvqsaiR7CswRydYG
 g9LCyoHcF7Q5dPaovOxBMnF5DoGNU/llHDsKcNUE20X+wStdMJsML6CEqXGvA05U3G
 l3GmuP5sYmqdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mdMvz+XQ
Subject: [Buildroot] [PATCH next 2/4] arch/arm: add the Neoverse-V2 core
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the Neoverse-V2 core, which is an armv9.0a ISA.
See: [1] [2].

This CPU support was added in GCC 13. See [3] [4] [5].

This CPU supports Aarch64 at all exception levels (EL0 to EL3).
It also supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code. GCC has the support
to do so. Since Buildroot recompiles a full system (ATF, Kernel,
user-space) this support has limited value. This is why this
CPU is limited to 64bit builds only.

[1] https://developer.arm.com/Processors/Neoverse%20V2
[2] https://developer.arm.com/documentation/102375/latest/
[3] https://gcc.gnu.org/gcc-13/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-13.1.0#l184
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=14d4b4fb12041dde1511262b926662929196c3fe

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 16911f5b95..e9f3c53e0d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -524,6 +524,12 @@ config BR2_neoverse_n2
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_neoverse_v2
+	bool "neoverse-V2 (aka demeter)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 
 comment "armv9.2a cores"
 config BR2_cortex_a720
@@ -929,6 +935,7 @@ config BR2_GCC_TARGET_CPU
 	# armv9.0a
 	default "cortex-a710"	if BR2_cortex_a710
 	default "neoverse-n2"	if BR2_neoverse_n2
+	default "neoverse-v2"	if BR2_neoverse_v2
 	# armv9.2a
 	default "cortex-a720"	if BR2_cortex_a720
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
