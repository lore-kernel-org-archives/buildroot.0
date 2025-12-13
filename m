Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52962D5B156
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 090D3605FC;
	Sat, 13 Dec 2025 11:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gI1TTcvo3F1m; Sat, 13 Dec 2025 11:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3090560D69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627143;
	bh=CG1ALOMY1O9LVcQF2S62/1iSdjh18aHtv7jMRbRKNTY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gyd/zJ+iS6I8f2TASLyg2hLgDgJvokJMiMWp407UfNIdg93GnvHRcR91FzHCRUpT4
	 lSn+RsrsoOoZLSq/FnCZuaaC1lwT9GsxHBLKH6hUjuqmAzvSxztbsh8dYUTJenxsrk
	 SUg5q5rvQ87dbiIl0QWnp5jRkMSovSabY4q4yp0h19XVSqdSGhCWoBpr2Lh2yEoVLF
	 e12zyawVEYeh5G1bTKnQ/bt+oE7dKTZWaFaJ/fWE3dGh7EXQ5t1hEygIlx4yUK63n8
	 m905koN6YUUIR9qnEOKGE5UBg3/OzLUoNwYnHDBcYUNKbre4isTTutbt9IWUNFgdil
	 0HuyGtAZ3R5Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3090560D69;
	Sat, 13 Dec 2025 11:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F6C42C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B3840CC2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0ZvQVsM1W_8 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 314BE40C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314BE40C14
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 314BE40C14
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:59:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECBF2A4C377C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:58:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44610)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOGl-000000007Fe-2gyP
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:58:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:58:39 +0100
Message-ID: <20251213115839.1277318-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627119;
 bh=cA2kcibSMrxXqBYDWTuXnuYJ+5WGMXlH8hLQvbIREec=;
 h=From:To:Subject:Date:From;
 b=RkWN1bcCzx5otm/7ZtVKdVPTFE3jd3q4z7O+I9q/ToaK2MmfVHoXLecgx7Q6u9SE4
 /jDPdR5a80pR7BbxvMcuc0m/w1ilKhXdU8If9jDv54xhZHv7s6GmyDIvfbVHUDEPLL
 QZ+AnnW+lP2ZdI8fXsA7/dvW3ReU2EcIspPemmw6M62nIeU0xJRaTxf99aVj+wzTOn
 JtQjpDfh14JjGe1xGNYXmBzWMLOT9fZqrMJFqSSsCxinq0b84zuYfqwjWXhcHopLuM
 zdoMZF2EXE+13hpKRyuoXQvZZhgnbUCbyYSzTVzRcfpLUw7hw5yBrHziIQZ1oJNXGv
 /jHQZ3GTsIF2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RkWN1bcC
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.4
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

https://www.samba.org/samba/history/samba-4.23.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ec28ced087..363c6c26eb 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.3.tar.asc
-sha256  06cdbb27a6956978b045455fe0696d998ffbac8d24ba24de87a4ef8200813320  samba-4.23.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
+sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 439e5452af..7976e9ae05 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.3
+SAMBA4_VERSION = 4.23.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
