Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B7FD44161
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46DB81102;
	Fri, 12 Dec 2025 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dk_0rqPhGux; Fri, 12 Dec 2025 10:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1533C81109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765534568;
	bh=KwiKU0zQAKk0t5jX44B73K7kds9sNRYR3rozOez5sok=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YRYrAbFnsyF7593Q/+LRbr2GzPC87XkxId4Sd1KGmekFILPxQtmcZW56DqID7809M
	 j9CIL8SWvVcD8cnXOGCu1/hhlP9HzXpjA3VpfYiO8WVTs6rHXOpM4Js5eBgOlVcE+5
	 3VfMmIABtMiS5RbpWPeUOJYpWUQ60196tJfD34pVQNW5g9FgIOK1zmwUMFnz8tsWWr
	 2KjaxNrRXDKMFCmj3JZeKQcFeg6VBV5WUgmrloRlnpObEnDJeIkOKqq9GANyenHjRf
	 mpW1kqX58VFKU+HlRGbFZ9Jk43Go4IdQqQZa2gP0nnHkRTbqAHflesT8j2O2DRDuq+
	 AC0D3x8pVqlbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1533C81109;
	Fri, 12 Dec 2025 10:16:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE02BE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C52B740160
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zE_2_u0zhY1 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C739C4022D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C739C4022D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C739C4022D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:16:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7142A4E41BAD;
 Fri, 12 Dec 2025 10:16:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 457BD606DF;
 Fri, 12 Dec 2025 10:16:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C3C5103C8E13; Fri, 12 Dec 2025 11:16:01 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 10:15:29 +0000
Message-ID: <20251212101533.820554-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212101533.820554-1-kory.maincent@bootlin.com>
References: <20251212101533.820554-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765534562; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=t/tLHOiFUBSejeHFxJILf/Epm9bYKoqDgrTui4lvK6A=;
 b=0YwB9nJo/TJi3B0HWQUENZpZVlQIgi1nVt6vWy4nRcnJqJWi6/UxQOE6Aj1ly2L0c+/n6e
 b1qhLO+WmMkKYhO7HGxzGVPENFL0NU5UOW2P04UzHFvpYBCIu3T0E3eRknTaVcNYGQ7pkL
 D5oJgBXtf9D2J1t4M4sV1D8sGfVTGSlTo7fnmX/4uHDtOJIWhFrJpgDmRdZ8BmhiXgAMvd
 c7Io7gcqN9ub2SFl/kgDwenLGLSxN5lUFH7AweJhE6p8usueCakMKAtncI8qqLsFrXrUzL
 99hIehfsHHxlCi9ZaRCjxTexjPsMxRVbITLcK4ecQxh7dXqcoPApko+hOrA5jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0YwB9nJo
Subject: [Buildroot] [PATCH 2/3] configs/beaglebone: Use Buildroot's default
 U-Boot version
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
Cc: "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Bryan Brattlof <bb@ti.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Switch from a pinned U-Boot version to Buildroot's default version.
This reduces maintenance burden by letting Buildroot handle U-Boot
updates automatically, eliminating the need for manual version bumps
in this configuration.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 configs/beaglebone_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b27b97916e..cf884bae23 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -20,9 +20,6 @@ BR2_PACKAGE_KMOD_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
