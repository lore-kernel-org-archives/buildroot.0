Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C422E9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 10:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B190182255;
	Thu, 19 Feb 2026 10:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcoPk_fL-6Sl; Thu, 19 Feb 2026 10:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD75682237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771497426;
	bh=ydFa9B0WRaOBQH8AbrjEuDFpxxGaurkqhOCl7Nv75kg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GR4ONdcoNT2UBy9HMEOIZeL4rosVuneAedpUbxQHaY2J/LfZ2d0Majz3JAjCy8UaA
	 KUqxTlQmvqAFHwfly6jcFl+Zzi0dnA3nzjjpokBkSLpbYvP9oh4gxJXRHbqTOulAKt
	 mzHXy+5e2B8Ejw58Z/l4x/LvzDwTXjI6CVDEd82K/iMuQ/v245uNL+K//V5Dv0qhPq
	 6uz+9V7DqXdgssxSfh3n8tb+4zyIe9SaiINEe2xHb134H3PC2jlrcEpiPob1AV3THd
	 Cs2FDjFnY6T/YV5H+E0bT6kFSPX4weuFWWXVgudpERCbJytxVbN+Bb/ucrNCzmkb6X
	 d2o9rFOqB7CYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD75682237;
	Thu, 19 Feb 2026 10:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 052671CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB4360C08
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GaelR_-lDty for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 10:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 166B660C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166B660C0E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 166B660C0E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 10:37:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C2B5E4E4052B;
 Thu, 19 Feb 2026 10:37:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93F1F5FB45;
 Thu, 19 Feb 2026 10:37:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03E5A102F175B; Thu, 19 Feb 2026 11:36:57 +0100 (CET)
To: buildroot@buildroot.org
Cc: julien.peeters@eove.fr, Kory Maincent <kory.maincent@bootlin.com>,
 thomas.petazzoni@bootlin.com, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Thu, 19 Feb 2026 11:36:47 +0100
Message-ID: <20260219103651.753932-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771497419; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=DbbCMQd09AD+nnMQEPWagf91tUo9tZf6V1GJUTttqMg=;
 b=BCw94M+SyvmHujy7eEyoUhTcQx6dUO6nHSFdeK4dx/+oX6Y7gsRPrijEIYpfO5N2aBNuTP
 M519JVLlBmacN9BUXtjwL+yNDetoWXjYuRAhIet8HKHk5InqdQ+/n35X970hraWvO5z72F
 edUx59ASEfrpePwNtkyb+fISpWbWpVtfueDJH5xp01S2jvngIGUmveXbPYkIUZsR6yNUwu
 k/gVybUvNq5VmCowmVEcOUp2cjifd6W7yK7b14BxQFO+QBz35kpVc1ITKEtZAyBrwt/2Hy
 jrU3nmPEQIk0XBtPiwdZPbl6/SQ9wTFnR9mSpBPW1wBO+lVSBCtzEpwdW0h0Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BCw94M+S
Subject: [Buildroot] [PATCH 0/2] boot/uboot: enable binman-based boot image
 assembly for iMX8/9
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

iMX8 and iMX9 configurations currently rely on the
imx8/9-bootloader-prepare.sh script to assemble the final boot image.
U-Boot's binman tool can handle this natively, but requires the AHAB
container image to be present in the build directory under its original
filename.

This series adds the necessary support in two steps:

 - The ELE firmware is installed under its original filename, with an
   ahab-container.img symlink preserved for backward compatibility.
 - U-Boot gains a dependency on firmware-ele-imx when
   BR2_PACKAGE_FIRMWARE_ELE_IMX is selected, and the firmware is copied
   into the U-Boot build directory before compilation.

With these changes, binman can produce the complete i.MX boot image
directly, making the imx8/9-bootloader-prepare.sh scripts unnecessary.

Kory Maincent (2):
  package/freescale-imx/firmware-ele-imx: install with original filename
  boot/uboot: copy ELE firmware into build directory for binman

 boot/uboot/Config.in                                       | 3 ++-
 boot/uboot/uboot.mk                                        | 5 +++++
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk | 3 ++-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
