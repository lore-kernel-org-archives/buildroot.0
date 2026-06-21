Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F21CD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 07:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11CF1409A2;
	Sun, 21 Jun 2026 07:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-U_W0Js3zEz; Sun, 21 Jun 2026 07:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F30B7407B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782028528;
	bh=3Qn9iUTGifh8BpVxK2mG1y2d+wZlqHAhbAjxCOz1ywU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eih1saJyuI2uNNFOTREw6bygBkqOLB2typXsXptnnU35EBl6ZImPJyJRe8juRmbwf
	 +mlN2r0FcgkwHPdiyfzuirU0HNZQJuitqxJ6dUkE0oBXOqSnyhapDJ+LMA+tm8dHtg
	 7QmhhFA0JultagooadFWzlwUiKrFMBwmaSoOv5m8lkidOeXR7KTnrtm0WxKEMnTVU+
	 Lhx+FGChdv+mdF64kATal3vylLLs2alOps4J/gnmt5gR+lAquK3iNmm4e/rfIKdRxP
	 GUK3be7ro/ZAO9TYN9kzaQ2sOqK9AzZi+c53/IzY/7WjMVKda1yIB83a2S/e/+cUbD
	 KPGhq0KlTr97g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F30B7407B4;
	Sun, 21 Jun 2026 07:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C85E24D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 07:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A3F942151
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 07:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsU9AsnyVOVT for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 07:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7229841C7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7229841C7E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7229841C7E
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 07:55:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CBD7A4C0EA5;
 Sun, 21 Jun 2026 09:55:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34654)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wbD1T-0000000018q-3O56;
 Sun, 21 Jun 2026 07:55:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 21 Jun 2026 09:55:19 +0200
Message-ID: <20260621075519.924777-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782028520;
 bh=NzPcqqTxIUXXnn12+6xSICb/cLjfnM24+bxpZsHPEQE=;
 h=From:To:Cc:Subject:Date:From;
 b=T4sIsEOaTS1okNVuOERvvnSvxd5zByaauDeAaNK2w6InitK23Sl41TNYRYkDklL/G
 jburzaIOKotPT6+sHpIiO6uNstyxJxkLqyRcr25lRfnLM1Cv+xTbRo6s54QnYLjCBH
 kZJfxuddMbD0vHxswlkQIYY8zj8EHnyK/MQMHWReOih4N5aNuQDV5d8LDDd3mApSJi
 hD/uMlz93f6N3Dd7ebGl0J1gUYaSHK1WZUWKkfMpfyiyr6Ej8bG2swa6ZCcnuHkcIq
 8oSxPQwk45KYl2hWoFwY5L1ZFfFFbUYPhkcg6X7KkOC3Z++mYj0OLWmAw6WiegTVRi
 4gk7YqEGUXhmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=T4sIsEOa
Subject: [Buildroot] [PATCH 1/1] package/util-linux: lsfd needs headers >=
 4.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
package to 2.41.1 which includes upstream commit
https://github.com/util-linux/util-linux/commit/036d72749ca274294051b43fd66727061a772b9c
adding a dependency to BPF_OBJ_NAME_LEN for lsfd.

BPF_OBJ_NAME_LEN was added to the kernel headers in version 4.15:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cb4d2b3f03d8eed90be3a194e5b54b734ec4bbe9

so we need to raise the header version dependency for lsfd.

The build error was found by the Gitlab pipelines for the defconfig
bootlin-aarch64-glibc-old.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/bba1881a5eaf4a127a6580872c665fd095724b03

 package/util-linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index c63cec2a9c..3df149b3de 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -233,15 +233,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 config BR2_PACKAGE_UTIL_LINUX_LSFD
 	bool "lsfd"
 	depends on BR2_USE_MMU # libsmartcols
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # process_vm_readv
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  List file descriptors (modern replacement for lsof)
 
-comment "lsfd needs a musl or glibc toolchain w/ headers >= 3.19"
+comment "lsfd needs a musl or glibc toolchain w/ headers >= 4.15"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19 \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 \
 		|| BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
