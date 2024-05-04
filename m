Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2CFC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6AF3820AC;
	Sat,  4 May 2024 19:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZmlCjlpSXTt; Sat,  4 May 2024 19:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEEF821BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DEEF821BF;
	Sat,  4 May 2024 19:54:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192F31BF836
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0495A407A5
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ow9la0gHZBns for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 19:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=contact@artur-rojek.eu;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA0FD40674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0FD40674
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA0FD40674
 for <buildroot@buildroot.org>; Sat,  4 May 2024 19:54:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51CCE20003;
 Sat,  4 May 2024 19:54:33 +0000 (UTC)
From: Artur Rojek <contact@artur-rojek.eu>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 21:54:04 +0200
Message-ID: <20240504195407.1409466-2-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240504195407.1409466-1-contact@artur-rojek.eu>
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
MIME-Version: 1.0
X-GND-Sasl: contact@artur-rojek.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=artur-rojek.eu
Subject: [Buildroot] [PATCH 1/4] arch: reintroduce sh3 support
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

This restores support for the little-endian SH3 based CPUs.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
---
 arch/Config.in.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index d3acc8ccf8e6..686789265e04 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -13,9 +13,13 @@ config BR2_sh4a
 	bool "sh4a (SH4A little endian)"
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
+config BR2_sh3
+	bool "sh3 (SH3 little endian)"
+	select BR2_SOFT_FLOAT
 endchoice
 
 config BR2_ARCH
+	default "sh3"		if BR2_sh3
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
@@ -25,7 +29,7 @@ config BR2_NORMALIZED_ARCH
 	default "sh"
 
 config BR2_ENDIAN
-	default "LITTLE"	if BR2_sh4 || BR2_sh4a
+	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a
 	default "BIG"		if BR2_sh4eb || BR2_sh4aeb
 
 config BR2_READELF_ARCH_NAME
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
