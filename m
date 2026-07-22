Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D44C4453F
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB656605CF;
	Wed, 22 Jul 2026 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtAIj8z5gCJm; Wed, 22 Jul 2026 15:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23E760722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734384;
	bh=ITuB+mkKR1RgWZWNuezQ7RENoF2/ZprUZrkm7ofX2eI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kBTF8SWbnyE5s7HRk2Diu+Z0nEEgiUzZAdYNK8rizKx/Yo8Uh1R98X7ZDJVHzq+k2
	 3lMcVnNnjdPwh3qxEt4nQCetg075xQ3XhbEXmM4JRJhW/OVAcT9JbS3NFwLl7L3WSf
	 bpQ6iakb/T0RH2jC6BRa0AhVvGXG7+4FIDHjU4Kqc5JshNqzJAJ00pYqZv5mbEe5ZB
	 g8g+9q//675gbVRtkCibrjTS/lyv/U/yg2B8Ye1Grr1v28jonqsEq7KZdmlXn5QLMC
	 SGU+LxPbebXVvmWoAGK6SN9ymodLLSGjkU5CM1LWIIqflQlGgYwtU7/+En4X0qYhX6
	 oJm2jE5k6l2gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E23E760722;
	Wed, 22 Jul 2026 15:33:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6DF788
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB4B4093C
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2YejvNvU_Zp for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5814C408F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5814C408F2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5814C408F2
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvvT-1xTczk2djh-00kLaS; Wed, 22
 Jul 2026 17:32:57 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:24 +0200
Message-ID: <20260722153224.624762-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Jwbwe4y+nwepsxjnI7ycsvsPEClGvDa0be59IMagpY/lmXHrxuJ
 6LbuidEDy3Ggwn0Xntvs9w6sGj33b5rLOUS45+F78bzTGAdaRJD2xJ2MxwU/VOxhbAoOgZk
 V7SHwrpaLvANWjhutXa4qj0R5qWUKGxJGvF07t+hezNO3c3bRDJZpj+686QmnNEXeGjdqfv
 gCC5C8mDkak89j0ep40Cw==
UI-OutboundReport: notjunk:1;M01:P0:bHooUC5Nwtw=;GjR9enU5mkvlzE5v7FhtDBpbH/d
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734377; x=1785339177; i=fiona.klute@gmx.de;
 bh=cIXGQSHO0fyt5doTRHKeH9bKBZvaZJfQ919XQSKydSM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Z8OA4KV6i6pa7p9q+yR4T2Xh/+qNscFqK7tsPWkvlRMaKe7YWwG7SIvhC4DTXJMD
 43lxmUfRYBD9FFqalyanZ7cinmrBhNfC4Tn5ggkvMfWOTbEwODAMCWGLZOr7+BTJS
 iwGNu1YpCHI6qTwzL0MvK3K+fEGsD9gbGF/DP7CzBi3M+6vKM/+Sry0js1xYdQSip
 ybmGVLogdM6zGsxCzpYtJtz79sSbjVBwTBx6rcHcpwDC177d7DOUOT0XysxAcfqbr
 EnRL+1Jz8SpPNaeyILgQmLfYb7Us7ayV5csKbgDLqpXkHZzza6LByLGp5sPCznZGE
 lCjUp7gFcKTuqKmTeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Z8OA4KV6
Subject: [Buildroot] [PATCH 7/7] package/binutils: fix license information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

A few headers outside libiberty use LGPL-2.1+, too, and other headers
and some scripts use GPL-2.0+.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/binutils/binutils.hash | 1 +
 package/binutils/binutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 14fd65d4a9..9ba6689d46 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -7,5 +7,6 @@ sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263
 sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
 
 # locally computed
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f772c9cf9a..f39d24e986 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -27,8 +27,8 @@ BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTION
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
-BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
-BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+
+BINUTILS_LICENSE_FILES = COPYING COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
 # 0003-objdump-memleak.patch
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
