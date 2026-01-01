Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EA1EEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 23:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0184067D;
	Thu,  1 Jan 2026 23:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOhNVrDbU8f5; Thu,  1 Jan 2026 23:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D3B4405EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767309078;
	bh=6m2giaT5FLKWD4PqVJuDBwkwYAsFbmj7FdTphKsBGr4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pp/9R64pZCRa9KSA1DKEYBpCAO5i3EcKNRE8ouZ8Ee0iwkqL3rz/+L3nqqf2fWe0P
	 PS5P4f290yNgSIUaFrdFlk5ZSJ37fIwKRGQNSRzswgxEFkzZ6hIGL2pSJqhyaIJS7X
	 6PwWpxb3UioCZey9tB0TRUDw10KYhxZOD0gAonAfqDxdA3hSLDBJGtkU9QiCVJ4HU4
	 AAEymR7iYYHLlwMVAUS5dQVURywfQrQVudwmTNgPjc7p7q+frIf0xHwBG7OaoK/kJX
	 mDKJQC1sqIicSm+J0vU0c8jkwMHvbbbYdsXnanuX+itcsRwSf5CXTCek6jec/MtXu+
	 2aBbPik6WGnRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D3B4405EF;
	Thu,  1 Jan 2026 23:11:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F00206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 23:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EF4880829
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 23:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNss9B2xue6S for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 23:11:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9845680828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9845680828
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9845680828
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 23:11:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 207FBA4C0D66;
 Fri,  2 Jan 2026 00:10:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60232)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbRoo-0000000052v-2Hwa;
 Thu, 01 Jan 2026 23:10:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  2 Jan 2026 00:10:58 +0100
Message-ID: <20260101231058.1726375-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101231058.1726375-1-bernd@kuhls.net>
References: <20260101231058.1726375-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767309059;
 bh=plaoPbhMF3bn5fx3DWxlgN5uL87REb5dQXWPtbd1O1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UUCanktOO7hEe7bN7qjeZYGWdoUMhV4R5jaj9Fa2ZtaNpT54Cg4F1QTF0X0z1zYG/
 AGL7E8nRjXJqK6KM9ooiMvJ9EHivahIbX/FqKyEwovaPoCO1hPlLMDRAkB6E3m31Zo
 wa34eQtxyDtd3SEMyqV6U/3ewH1a6mqA/tUVGlDVojDNRsjxOKqwEx0ey2UVCpw+XQ
 Jt72cqi3mvblIRtQWlsZANkGzw/iig/3FO+F/Qi9cBCKalySWNMztyfDF7fAIpmocX
 6+uVLwvlbT5MkE1vs3JZC46KsuDCzkWnjECzLXQhVemV54Tlby8HsGGvFR0nlnVHJt
 xeAFQL8wXxh2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UUCanktO
Subject: [Buildroot] [PATCH v2 2/2] package/libdill: fix build with gcc-15.x
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

Updated project URL: https://github.com/sustrik/libdill/pull/228

Adding -std=gnu17 was recommended in upstream PR:
https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080

Fixes:
https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/libdill/libdill.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index bea9aaeecb..453031a471 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -13,6 +13,13 @@ LIBDILL_INSTALL_STAGING = YES
 LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LIBDILL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBDILL_CONF_OPTS += --enable-threads
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
