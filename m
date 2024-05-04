Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0049C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB5C835D9;
	Sat,  4 May 2024 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbcxOj6PZSV1; Sat,  4 May 2024 19:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 333148364F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 333148364F;
	Sat,  4 May 2024 19:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 854361BF836
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EC29407A5
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nny-DaP9q4Ut for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 19:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=contact@artur-rojek.eu;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52D5C40674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D5C40674
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52D5C40674
 for <buildroot@buildroot.org>; Sat,  4 May 2024 19:54:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3D002000B;
 Sat,  4 May 2024 19:54:35 +0000 (UTC)
From: Artur Rojek <contact@artur-rojek.eu>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 21:54:06 +0200
Message-ID: <20240504195407.1409466-4-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240504195407.1409466-1-contact@artur-rojek.eu>
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
MIME-Version: 1.0
X-GND-Sasl: contact@artur-rojek.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=artur-rojek.eu
Subject: [Buildroot] [PATCH 3/4] package/uclibc: reintroduce sh3 support
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
Cc: Artur Rojek <contact@artur-rojek.eu>, Paul Cercueil <paul@crapouillou.net>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow uclibc to build with sh3 variant of the SuperH ISA.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
---
 package/uclibc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2555487f06d2..2b5fc140ad22 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	# see libc/sysdeps/linux/riscv64/sys/asm.h
 	default y if BR2_RISCV_64 && (BR2_RISCV_ABI_LP64 || BR2_RISCV_ABI_LP64D)
+	default y if BR2_sh3
 	default y if BR2_sh4
 	default y if BR2_sh4eb
 	default y if BR2_sparc
@@ -155,6 +156,7 @@ config BR2_UCLIBC_MIPS_NAN
 config BR2_UCLIBC_SH_TYPE
 	string
 	default "SH4"  if BR2_sh4 || BR2_sh4eb
+	default "SH3"  if BR2_sh3
 	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 
 config BR2_UCLIBC_SPARC_TYPE
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
