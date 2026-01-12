Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51856D25043
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24018614B4;
	Mon, 12 Jan 2026 08:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHtqE3fljwn6; Mon, 12 Jan 2026 08:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDE1614B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205080;
	bh=4O9GAltqZ5y3v+tZgYimI0o/luYaOQjp93YV/Q2Yyk0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhcOWRUwK56Lzv1M2Bjx7Nk+vXf8rTzJcPVSoNay1wUXZgg4qbLZ3DnXadFHx9cPF
	 tlnjsVuAuKB8qi5xMj3a8pZlwjTx9RP+RbBbwFTOeNzjaRs6bxPI/SLLgQ4NViEPLE
	 /8Ti3W2ya2uMjHPet+DvatG+4PSS5oqT+C0AyH3wc5N9GEBUK4S/4c9P9fDlvMngvv
	 dFEeVibxaRiJD55Y4wMSo0wxLDxQ/ZuOwZgrksbSJY2oYOjr2jJg7dHlWkGmwgGDyY
	 atWCOiisvaVyXkUa5POgKizGRwGl4R+mVvi3+kn2pVpHVA+eFH1L0vE5BINtDUP5dG
	 zN60FU79705mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDE1614B6;
	Mon, 12 Jan 2026 08:04:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEB3218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B102C843AC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-aEKskNNOSO for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53D5C843AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D5C843AB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53D5C843AB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:04:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD743A4C366B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-1jmn
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:37 +0100
Message-ID: <20260112080419.2516889-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205059;
 bh=MgS7zvzQHMrlAlZQVWNG/Ji5iJduOiBEd+OP3bAXa8M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PXR7/aefalyhGa49o8JuWC9MK1HtvB1wlOI6IA50QMSfnNIH3O+p8c2Mi2KEEFJCv
 xQ9d3Ifd5u9CIbzsMte5TkNuUEkdQH3n9qyLAyuxdmb+IleAGx0gdZnyGPyoqh+Pz+
 Hm6LN0Tefd2QIosFdu77pM73ryzQvLgFe30XmoHxgI/8c2vxqqOwQbyVk96d8Wd6wJ
 CqTI+JOi8h2TqNP8saCWi/nLECcB4BVqsdv4y4TL1JS3kP0P8iD4TfFq1lKdKxQIqM
 jMH9xOLBP0NgnDkOfsaubXIAppPsQOb9d62IuemUzRlPWMIOAiEvWzU0yWzlKdWNfc
 5BJ9NNQXUGAGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PXR7/aef
Subject: [Buildroot] [PATCH 002/104] package/x11r7/libxcb: bump version to
 1.17.0
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

https://lists.x.org/archives/xorg-announce/2023-August/003415.html
https://lists.x.org/archives/xorg-announce/2024-March/003464.html
https://lists.x.org/archives/xorg-announce/2024-April/003507.html

Depends on xcb-proto >= 1.17.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/libxcb/libxcb.hash | 6 +++---
 package/x11r7/libxcb/libxcb.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 2e2179e8da..b93b0ba524 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-May/003164.html
-sha256  cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059  libxcb-1.15.tar.xz
-sha512  f6c7d766b7cf9cab6abe948ee424cbae6951dbfe2f76fa58a109cdc05b0f0919dcc4e38176a22ff4b95fc1e38596115317e32ba33b24cae0035a4e30dbcbdad9  libxcb-1.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003507.html
+sha256  599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55  libxcb-1.17.0.tar.xz
+sha512  945b1f28e8b407a4d0ebf88c99ef3cbef763fd75e6eaa8e971946e44ce8dbe9b478c56ae85aaaadab7fdb25987e88570d9d4fb9ad2febd6d6bf21d644a0e10d0  libxcb-1.17.0.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 4b293f9801..393c89c49b 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.15
+LIBXCB_VERSION = 1.17.0
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
