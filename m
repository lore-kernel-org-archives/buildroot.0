Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DC2D609A7
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 661FE82919;
	Tue, 16 Dec 2025 15:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmRJ-Zeg0-MD; Tue, 16 Dec 2025 15:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00DA828DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765898128;
	bh=UxHN3ltTKK2u2vb+kG9YlN4W8ttpbOAuWo+TrUgASUA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=n+B60zw9WuL8TkNSjVeQ/YVF9exK5dW75W8hi6/hHj0RfqQj9GtNl4JDZypJkvFmW
	 j5tlnISo3j+sNMrWoGZCX0RbeURan3okcInxqbe6wJvLW0ptaCtJRzmvUlYSkzt/Mj
	 9+L9Ip/6zlzIXTNvCKcvXfb3BZBfWIYlJYGtQ2zBdbrDAri52OEEOyOHSfXzorLWP+
	 WHMek3BMwK+4hjBuYMOsOgewSD1pfiFD+oMQ85r5rJ0FdVHDzp48QIoRWpInyK868z
	 fjD89rONakrjSk4HWrYGfnNjCTTaFos7eyADdjVlZX44WDatOiTsOLQ67x7zHON9b2
	 C6WZQ49LYSVcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00DA828DE;
	Tue, 16 Dec 2025 15:15:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 509C1372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425206068C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htfHIUau_nJm for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33E166064D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E166064D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33E166064D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 28A81C180F0;
 Tue, 16 Dec 2025 15:15:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B9106071C;
 Tue, 16 Dec 2025 15:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50486119A8E1F; Tue, 16 Dec 2025 16:15:19 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 15:14:45 +0000
Message-ID: <20251216151449.395253-6-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216151449.395253-1-kory.maincent@bootlin.com>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765898120; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=jqPoJ//guzwUeo8ylE4kJJVy47M54uwyIs49RKuikdk=;
 b=j6ytGiA01oZGnUHsAILszyrSY7vUUNz+WcOAPm9DhZvEbkNrzfRUEHXxrvK3KDc9WfDKrj
 3pXhTU78SvRGF++/yezI4Ampro37Ep/1KLWG8KBfqXfNNcys6MWUxs09uGytxrufYC+k4b
 MzFonjIRy80PC53ce0vd66JiPzlYM999B9o+yYqwHUoQGicZ87AJpKnd9nRS6Xymviga8i
 2jdaolBcInWUYoEW/QdkmF8IxaEBqfkNo/jCTzPn92fI0iRN5xbmYupMkGm+c9h+iP5LwC
 TX9QqIyxnwzPnjcqZAyF7OBqGjCV3C64B15NFgSKmysPXt0EJcpfkJXeb7/rcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=j6ytGiA0
Subject: [Buildroot] [PATCH v3 5/5] configs/beaglebone: Enable AM33X_CM3
 config
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
 Lothar Felten <lothar.felten@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Julien Olivain <ju.o@free.fr>, thomas.petazzoni@bootlin.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Add support for suspend resume by enabling AM33X_CM3 config.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- New patch.
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 6a17c737d0..a8568c26bd 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -20,6 +20,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
+BR2_PACKAGE_AM33X_CM3=y
 BR2_PACKAGE_KMOD=y
 BR2_PACKAGE_KMOD_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
