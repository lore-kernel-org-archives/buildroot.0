Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC1CFB441
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 10:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47DE940105;
	Mon,  7 Oct 2024 10:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z3vGokaidDn; Mon,  7 Oct 2024 10:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B0140163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B0140163;
	Mon,  7 Oct 2024 10:20:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 897951BF2AB
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 10:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7850040163
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 10:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfjqL_ZcE-nO for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 10:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=193.181.0.5;
 helo=mail.tutus.se; envelope-from=francesco@tutus.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73CF340105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73CF340105
Received: from mail.tutus.se (mail.tutus.se [193.181.0.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73CF340105
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 10:20:22 +0000 (UTC)
Received: from mail.tutus.se (localhost.localdomain [127.0.0.1])
 by mail.tutus.se (Proxmox) with ESMTP id 69962142D22
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 12:20:20 +0200 (CEST)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/linux-headers: avoid sub-make
Thread-Index: AQHbGKKCMU5fY55ugEKF8cSfShubOQ==
Date: Mon, 7 Oct 2024 10:20:19 +0000
Message-ID: <63ae167d7dd7b0b5ce48234b4d749e9250fb2878.camel@tutus.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-ID: <D4292B4AB5A9AC4D91B1AA1A289559DB@tutus.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tutus.se; h=cc
 :content-id:content-transfer-encoding:content-type:content-type
 :date:from:from:message-id:mime-version:reply-to:subject:subject
 :to:to; s=key1; bh=cNJStfN9zcLOicPvohGWJ5vBaJiCAiKKZVutuZQgrWo=; b=
 pH9KR5DbxmZe95zvU7VnFAkN0gbFqO8zvKsqH3MhES7ZgFKdWcJ557sG4VJPtkxw
 Yn/fEIqT4tBbqpfN2EUl8//gmOXUGg9Qz4Vif8Kaw7lwwAiwlFIu9XQQ0JphBHO4
 BQQzUryZcNdT5kKNUuDGI8vruA4UJi5GBFRHVDstD9tU5IC1EaBjMLlUvXFofGip
 3SKEGQjZg26ie2IAfpladm4SLnSHGh44BmoTwD7L67/SXDGBa8KBEdB1bMRXugv2
 5EDpfXm6GYUnjLFhdgMIeEYaYIXN58Xxt7gK+53052RWzEzOT3y8ZnBAMWN6PgpP
 Ovn0pJ5Y9IgDx/Dwgl5/WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=tutus.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tutus.se header.i=@tutus.se header.a=rsa-sha256
 header.s=key1 header.b=pH9KR5Db
Subject: [Buildroot] [PATCH 1/1] package/linux-headers: avoid sub-make
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
From: Francesco Mancino via buildroot <buildroot@buildroot.org>
Reply-To: Francesco Mancino <francesco@tutus.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As a reaction to behaviour changes in Make 4.4.1, linux kernel
(in commit 5fc10e76fa2a9) will do a sub-make to "reset" no-print-
directory.
Command line arguments (including INSTALL_HDR_PATH) will get lost
because buildroot sets MAKEOVERRIDES to empty.
Note that "--no-print-directory" might be already set, if buildroot has
done a sub-make itself to set umask/CURDIR/O.

Signed-off-by: Francesco Mancino <francesco.mancino@tutus.se>
---
 package/linux-headers/linux-headers.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-
headers/linux-headers.mk
index b4b5a5b47d..16ded915e1 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -140,6 +140,7 @@ LINUX_HEADERS_DEPENDENCIES =
$(BR2_MAKE_HOST_DEPENDENCY)
 define LINUX_HEADERS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -151,6 +152,7 @@ endef
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
-- 
2.34.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
