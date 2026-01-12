Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F7D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B6C96153C;
	Mon, 12 Jan 2026 08:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnc12Q__RK81; Mon, 12 Jan 2026 08:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC0261542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207512;
	bh=3K+fV7W9LSE6o7KzmmAJxhtilD0gnjju2gr+MVDFOoM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/9LSXChQf6SudgWlDzqozEc0E19O+Phmr7bO0ijn213BcwccV+iJ0EQJVlSg+O62
	 /9v5PhYiV4Ixr3Mcx23ETZxH0N9eK7X6QAMySInikK+xT7zk5pbjLmOUcsp/BFGA7v
	 K95sUyDRVJrchqUG1eZYdQChMjyFu57quaXQ3TxuF5aBgjTkK9ZfEbNjHr/zT8ZPms
	 /mqzUZHJaT39DGHDx6P4P5LMl7ek4Wkty9al2xA9C/y3tWmAkXoAwpId/v/ZnaN/6a
	 s8Gnz0TEVi6T+5/UUfba7oCoHN/gkpNOOmGkyHWJts7zKgdtZU5OsbPu/1pOvj3vfL
	 BMzAYMVj0Z9dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC0261542;
	Mon, 12 Jan 2026 08:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A90918D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CFEE84589
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjUPzxV4sRPR for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BA7B8460A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA7B8460A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BA7B8460A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6ED62A4C4180
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-0rK0
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:59 +0100
Message-ID: <20260112082950.2528445-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206661;
 bh=TuIpPegNpUQkQQhx3EbKei7xXwV61FW/ahvalxSiZyE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=i4ve9xd5/Qk5vRjr0olEhCcIPJDZzHlERV0E3KaLlVOMC1zlM+rJuccnQjdB4JycJ
 L/INNluxSPwFNc5piSVvgnVt6sLuv5/RQ9TFK6bHQ7zffW6XLLIw0Nq7fAOBIe+FgK
 18TZGYRwmOw4IYtQbxra/1CaflFQTtvBOc6ej3A69E8gk7j5it4SElP6+Wu9a2paEL
 3a6NxJIn6hRWj/eWglfhLaz6AuiOcGYhdHBUmoRtjx2AoYDwtWN/jC/CCTTEEbkLym
 yf5PGFCpIL9vn6PRXOyBIxMMeQ0IPUxX35COFA+XRzcqvquP6LNrq6dj8DTneGQBKk
 wq8cBS64hHlvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i4ve9xd5
Subject: [Buildroot] [PATCH 051/102] package/x11r7/xapp_bdftopcf: bump
 version to 1.1.2
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

https://lists.x.org/archives/xorg-announce/2024-October/003542.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash | 6 +++---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
index 0596b65e49..9e314ba000 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003223.html
-sha256  11c953d53c0f3ed349d0198dfb0a40000b5121df7eef09f2615a262892fed908  bdftopcf-1.1.1.tar.xz
-sha512  257dc9ae29f2cf1496aad91ccba534348d87f881d75431aa6611a8154cb817d17588c464ab6c6c6bc51e6060baa8dcfcb9fd8c037cdaea8d18287651fa6b7ea9  bdftopcf-1.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003542.html
+sha256  bc60be5904330faaa3ddd2aed7874bee2f29e4387c245d6787552f067eb0523a  bdftopcf-1.1.2.tar.xz
+sha512  b3dde8d73084b7ec23ea47491321d12fa8f4a0a9ce0f61f2f89460fdc98f05d135ba11d8588d9debb8c2639ac68a7434a0cf80d9d548cd7328cbcb2339b4c0a6  bdftopcf-1.1.2.tar.xz
 # Locally calculated
 sha256  a437fb5272ba507c2977b2ef623bb391270f521b2a20271ed044785f4eaa5dbc  COPYING
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index d47f5c02ce..990e673105 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.1.1
+XAPP_BDFTOPCF_VERSION = 1.1.2
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.xz
 XAPP_BDFTOPCF_SITE = https://xorg.freedesktop.org/archive/individual/util
 XAPP_BDFTOPCF_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
